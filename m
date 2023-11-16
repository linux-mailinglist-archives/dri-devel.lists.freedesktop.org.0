Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 030CC7EE7BC
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 20:56:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72DF310E692;
	Thu, 16 Nov 2023 19:55:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2087.outbound.protection.outlook.com [40.107.95.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B361410E691;
 Thu, 16 Nov 2023 19:55:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aeUXWiiQFEwH70ysSeH61pfC5nEIJSCtkzjC6i9JOhXEdNgpqpXrnT9TQgKWEam15cJxD7UrAxnRRH4MvRJ/wDYZONzWsowBgiAeQuE8s06mezWqj55H1VHgHCx1IdV7Lp+DtuWcz2WEv7nTHAsOtsV0vVlnMdHOiif13gAAXQNkcMsD2dPJAOfHqwQJfKG8/iv/KtMfT9MNEnCgWgThYmlrC1/IwFLxfdN5V6r7gAO7XmJZePn20uHj1ikyAKw467BbCzpLXdpapVV052Iito/rmgWgBWqcMq7fmRAqmtohUb5L14/5cNL3gnjIK31Xccr6MfRlzpxs1ic+rDTX7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hoOFnbJItGvmHZtw8KN0XrgAUM9OSZ0Ok91CuWr5+iY=;
 b=BGxyxvIN+X06vPow25q3WudFicS2DsawodMmFEqw/wEuW+D0PMmcIvem+772JCCGqEKt465pn8Yw4RmWHxvZlUzkFEcJqD/NeVpPsT/ft9nkSZFydWBULzxqpk+xVpCITvzmF9qRMpwjucvtVSHgV3ATEZyVmOnMGarEj6UtHY4I2TzgFUms+/LoWYGJ9orTWXTOjiL1kR+73yGBdKdJ8Sef+5tlmdBe1hMEMysl2igBlGFv44fDOW+kgIhfhJi+/rh388cs+wISCzgic2ao4OKZ3qQd/nS0sWLMs6VlzR5fvycx0GF0WxsErN5dEGspbPY2kx7LIz2HDg6zh8QnKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hoOFnbJItGvmHZtw8KN0XrgAUM9OSZ0Ok91CuWr5+iY=;
 b=neMNNd6D/TDpTKJ6FZpMjLA//yWCDbntQBulQyvp/YTJL7eflY1sztCoKq3ukskYAKMwEpbVri1ZcFgzqcosBgR+zI83ax7NEo06QpXkMpxcE6yVYrVOHjz5BgV3LNKEN1dScelYeNbwsVk2LHqZcCg7BIcSJ9dV1H5AJe0h/pumlamawMitaUWo+rspLRLh4fwB2S1W4opi5jYu2XVJcMIecX3DtW4IniAq5QNSyb3ZBthiKUk9P62up/5lw76nV9q3u5fNNDXFAVOYM/gDE7LeoPjKOS9jx5KZcPL1L0TPXYLurMspJoJZg4U4gUXdNcmnTs9GcqPUSUnejMtZ2A==
Received: from SN7PR12MB8769.namprd12.prod.outlook.com (2603:10b6:806:34b::12)
 by SN7PR12MB7912.namprd12.prod.outlook.com (2603:10b6:806:341::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Thu, 16 Nov
 2023 19:55:54 +0000
Received: from SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::6799:dc7a:e121:1af6]) by SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::6799:dc7a:e121:1af6%7]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 19:55:54 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@redhat.com" <dakr@redhat.com>, "gustavoars@kernel.org"
 <gustavoars@kernel.org>
Subject: Re: [Nouveau] [PATCH][next] nouveau/gsp: replace zero-length array
 with flex-array member and use __counted_by
Thread-Topic: [Nouveau] [PATCH][next] nouveau/gsp: replace zero-length array
 with flex-array member and use __counted_by
Thread-Index: AQHaGLhk0tg241wav0u8A6kt0NXJMLB9WXwAgAAC4oA=
Date: Thu, 16 Nov 2023 19:55:54 +0000
Message-ID: <6517a6a41eb72d16596c913dc56467e0390287a3.camel@nvidia.com>
References: <ZVZbX7C5suLMiBf+@work> <ZVZxXiXYIzEwUE3N@pollux>
In-Reply-To: <ZVZxXiXYIzEwUE3N@pollux>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8769:EE_|SN7PR12MB7912:EE_
x-ms-office365-filtering-correlation-id: 361e3613-a0c6-44d3-7a16-08dbe6de0aef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nOoQ8OoAWS7vF+DPsPmwk2aUyGWg5G8iM68CkhtJx3l1qNNtZmMjpVj+vVCK7Jpy5It9X+bzK0Z7QnxDh0V9LSsG1a0dqu7LcIHw1e3inlJClYCWFzdAVnL9VARxLsmBnwMBc3cj0DbJCyP/WpMaPN9R84XSP8P7tG4J+oV2LEpDbcIfqeCBWoimzcqVZ5IO3yCDktSGmoG9JroGJ83DRGsbnAY16xhraj59DHDZ3nKL2FUwtXZ0vOK0mK+kf85sihx2PJ+0VAP3jbMfcRCiAWF6fx9pCgthw6LP/xbx8kl7uSh1QECzWeZtjLDWY9wRlEwbuo2HLa3JVz5wAHROlw3Bo+NIid2gEwXtExY95MJ6cr3yZRWLgTnrNDAuYbnwQVaUvlIXXkM14S570Fhb6CtdLWHQU5GaMFU3N+sJS1VzK7RoofLz08aQfbfzldJHj/9/ApglHrJXDuAz8JGkNQ5cOWQPBW6JVzy+LrFr1x1VLT9kdrSG3S5B5SnyyhxfdPLkLwqZ+ur33PaohDnaYfu62AEv3tmaGSs3HGxo4yWwr0nIdnKxq1eZSsuTs0+kNNhO+plvPmosPesMQbknKRPmhDv6llWDioqyIjcbZsYgaDZ8oQq0nHocy2OOY1YV
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8769.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(376002)(39860400002)(346002)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6506007)(91956017)(2906002)(2616005)(71200400001)(8936002)(36756003)(6512007)(26005)(4001150100001)(5660300002)(8676002)(4326008)(478600001)(4744005)(316002)(6486002)(41300700001)(66946007)(66556008)(76116006)(66476007)(110136005)(54906003)(122000001)(64756008)(38070700009)(66446008)(38100700002)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?KnKaf+/6jXQ7y8309b6zVHZvkJZkFrBwdu1OaF70hbg3GJn2sjZA+gMApd?=
 =?iso-8859-1?Q?zlc7Dnv0ZMcf3UhOt3YmPnw6VZUQhEQ5OlUnFCCzEiFQeSd3wVyoZ0tqQp?=
 =?iso-8859-1?Q?FRJ7O4ujn2E1zyUGD54+VWjBYB0UUjJ6zoDwwHI4bHO85d13GGBEcDubfc?=
 =?iso-8859-1?Q?NwYHBpseiK+hrViPsa1ZBv473afmukOITqWsNVM6DojgKDrmAtiuEyPoBQ?=
 =?iso-8859-1?Q?OHZHnrXGqZpWOfXFIaA5xDMS1bl5cdnsxPl8mqYZqmytM3ArfEJ/fNpnpl?=
 =?iso-8859-1?Q?kpyFx/ai0voT9rOa6tSDm39rdQvDJQ0LtFDzF1N3e/b7wvsq2Pybr0u3NZ?=
 =?iso-8859-1?Q?xxpgJkXXw8UvINUyuwtBJC5nMUhpG2tWjfmoGH0PgtN4hLRrWmWgfRF9C5?=
 =?iso-8859-1?Q?c4yEB6b2EhWdFHRyOAQdpXoiK9hKeT5uv5UzjXK+4JEAbzPF/ROE6dg2Dk?=
 =?iso-8859-1?Q?VoxNSP9jRzIWwh5xDNoR5npTxVVffh/UKpUO7ySxxO9d5Q1g0oDhO+FYEh?=
 =?iso-8859-1?Q?uNq4HgILKv4HGpJbDGfLdH26EUP8RTlfSgfxPvSOXaxX/T3NOAMxdsRQBI?=
 =?iso-8859-1?Q?k8CIG55wcfR0dhD2gFdlgHyDBarHmxOKp6H71zEV6TW5EHdl4p8B/QrP0N?=
 =?iso-8859-1?Q?UNBokphK1P32L5m4tueaZidKfHK7QjBoiuuu3PsnOSalRrz5MXr796GocK?=
 =?iso-8859-1?Q?rVyIDhgxDYiX0MlZBLoG3qfu+PXAuh14GZ/4GAm9LfmTalqbpP0+Offy7w?=
 =?iso-8859-1?Q?QbIpU2VVN1zxtKhpBGJojz1C0gE/4XkE8BNJVge4iuyQAHKZYtNqsBbSsQ?=
 =?iso-8859-1?Q?8GX7C32H5aWPkfTgloYX40hpmSJ7/OSZv5hPawWXqfXUnX5s778bhe3EaL?=
 =?iso-8859-1?Q?wGcjtVAJlRolizFeZor7AFcrz80e8yXTxoUdRYIsYSbUoK+rfF4rUnzyrA?=
 =?iso-8859-1?Q?W74o1fHyNkZUq60JNjhLf/J08Ixf0LzybIKr+D5AZijDjN3mBq3lh/v3AU?=
 =?iso-8859-1?Q?SA12hfHK6Ha09KgNrnd3mdImSYiUc7oeYoMKuv8oXy7OKk3HW1/xIT5w4Y?=
 =?iso-8859-1?Q?HK1B8PWhlMgLDMoK7qjwhdpK5B7LJvrDSKtGkR67PVT7g6xOjjaY70SezT?=
 =?iso-8859-1?Q?P2lZIx3d/zjip/D7Es2U8MNUmnDIICzXcNO+FXd1dDvg8x7Kso6WFwD3xu?=
 =?iso-8859-1?Q?wmE+o7tm+E4Q0ERBQ75HWYq811+K/7Fdu2lsXxccKjlRfIc4rZqJGGOemo?=
 =?iso-8859-1?Q?j3hBxDdHLhFAzfMHxAA7VRG4NFDmUkPx0blRDbbTX5v5OB6ltrRAKhKQLW?=
 =?iso-8859-1?Q?R0kHRazzpkmhR7tPGIObZNo+BMtx1CtOuB2JQqwfXTorZBAV9Gt+EGSB4N?=
 =?iso-8859-1?Q?cC96XMiBwtlyCzDXzCjmMLU+mKgUK4Fc/7GpJSRt0APmSzmG69SgaTQr6I?=
 =?iso-8859-1?Q?WCJcyt2kIyaXT7IWMRlbkHM4tIh2nn9edyARqZndeVC57AN5Mqt1VKpk+g?=
 =?iso-8859-1?Q?OIAMT82rL45oSU+tV85CVjU+FlhBgcTSL7DzBYQRXIDRWDWTcT2RzI4uXz?=
 =?iso-8859-1?Q?Cac2v2WLcCwqoLLlcs5s7IDhu3j8cbw13u6WrKRUDFg1t97CSo8AQ/fmHj?=
 =?iso-8859-1?Q?7NyMrWH6YbCguvkJSnS1eMwnKQDBb4g8WR?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <C355FBBF27F44A49A1800CE9B90D8F11@namprd12.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8769.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 361e3613-a0c6-44d3-7a16-08dbe6de0aef
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2023 19:55:54.3283 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yLL2j+o5j+hOPs4ZmCG812Pmiax8Q5lH/pv7SHVy8rnnNRAU/wtAdikYW1xatPjXura63UPkyLrmEhesiIXcmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7912
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2023-11-16 at 20:45 +0100, Danilo Krummrich wrote:
> As I already mentioned for Timur's patch [2], I'd prefer to get a fix
> upstream
> (meaning [1] in this case). Of course, that's probably more up to Timur t=
o
> tell
> if this will work out.

Don't count on it.

Even if I did change [0] to [], I'm not going to be able to add the
"__counted_by(numEntries);" because that's just not something that our buil=
d
system uses.

And even then, I would need to change all [0] to []. =20

You're not going to be able to use RM's header files as-is anyway in the
long term.  If we changed the layout of PACKED_REGISTRY_TABLE, we're not
going to create a PACKED_REGISTRY_TABLE2 and keep both around. =A0We're jus=
t
going to change PACKED_REGISTRY_TABLE and pretend the previous version neve=
r
existed.  You will then have to manually copy the new struct to your header
files and and maintain two versions yourself.



