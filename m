Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJpKCJEjfGnJKgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 04:20:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD276B6C99
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 04:20:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDDB310E1BD;
	Fri, 30 Jan 2026 03:20:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="E0JjRDE8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011020.outbound.protection.outlook.com [52.101.62.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D72910E1BD;
 Fri, 30 Jan 2026 03:20:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sOydIawRvz3G2bo2Uphkrd1mLNbpvx9RR61CCli5ZEQrVsoqP3Rww0MFjNApqyy9Zjhpm2ntFKvd9+eszzbx8br9+Ef3MBWVvBhRChtadSBRyYCZFC1yzB13sycerX2wQ+PGVekoFjtQV1xfYt+YmfgcFOqZyC/gV8yduVdzH7Guvl3ZlTvdW9t/ezjq/gQ8oIowgAJ7HL4m5McK6X1WNdm4oN9tK0BJI0TNtltPTuchT2PB/efj3QQJJCXtlqc2WptK4EeL5L+9ylPODSIt89DXa9XT9aFcO8EyFUvV1qB8kNhoZXPJu4UkY5CeiL8aiEkbByzmDFMLgFy7EEFGVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBg53NjfZW88xEkymGH88ASkxh+nBFYlEvrDdZ0DUP0=;
 b=V8+S0x/Ik9vJdjjcVnYlY7doiQN500yU9/So1A/SKj1D5c3iec1770ryxBGPKuwQJZhM5nn/GEKUvEmncbghwikxFc8OCgTW5jlzmgr8O3M6ipI97Kilim3T8PQi4d1XtbQ92zDzeRO9nTD8FgM0KCAxOkSA07gSYCAHQ0I2p5NDhC4bq+VfHvNOOriV4xq0G4wdThX3LVnPV0TgNHT1GmbWXZzwCtyXjvNJVDdUzcQTcximxWRZ+fWHDUJ61lCPkDHQNyqeilRPOWRgH6P52tEcxg+Giy5Bs8hJq3HonKf5jixTPsi9oPR3JbGSRNPSEPust6ED8t5v/XVLgcNFGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBg53NjfZW88xEkymGH88ASkxh+nBFYlEvrDdZ0DUP0=;
 b=E0JjRDE8s4dAxdZ/MGe2B8DQYSb5ID2ZSNE8vSG18OdSrc83jS+y7KZM8Feyk+N+hmQZy/dEhxPdp/BS2TpjrWUURGDevXDjLCSRLvUghctKX7iGt6gqi1kYmLEQ8UZH5UCP7HoqpNcFgFayNIxTn2wv/QiAX4mZoEAdaL274pw=
Received: from PH7PR12MB8796.namprd12.prod.outlook.com (2603:10b6:510:272::22)
 by BL3PR12MB6426.namprd12.prod.outlook.com (2603:10b6:208:3b5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 03:20:39 +0000
Received: from PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::716d:8670:35b1:27a9]) by PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::716d:8670:35b1:27a9%6]) with mapi id 15.20.9564.006; Fri, 30 Jan 2026
 03:20:39 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: Zilin Guan <zilin@seu.edu.cn>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
CC: "Koenig, Christian" <Christian.Koenig@amd.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, "Zhang, Hawking"
 <Hawking.Zhang@amd.com>, "Chai, Thomas" <YiPeng.Chai@amd.com>, "Xie, Patrick"
 <Gangliang.Xie@amd.com>, "Yang, Stanley" <Stanley.Yang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "jianhao.xu@seu.edu.cn" <jianhao.xu@seu.edu.cn>
Subject: RE: [PATCH] drm/amdgpu: Fix memory leak in amdgpu_ras_init()
Thread-Topic: [PATCH] drm/amdgpu: Fix memory leak in amdgpu_ras_init()
Thread-Index: AQHckPo7fSjG5Pkk2Uiyusd1buw1T7VqDGOA
Date: Fri, 30 Jan 2026 03:20:39 +0000
Message-ID: <PH7PR12MB8796F7F06A2F1DEC1FDAD683B09FA@PH7PR12MB8796.namprd12.prod.outlook.com>
References: <20260129083515.886112-1-zilin@seu.edu.cn>
In-Reply-To: <20260129083515.886112-1-zilin@seu.edu.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2026-01-30T03:18:57.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB8796:EE_|BL3PR12MB6426:EE_
x-ms-office365-filtering-correlation-id: 5a059d94-219b-4dfb-ad29-08de5fae8b39
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?CL82UdRU729CsQ0oA2YiAyW0X4ID+PSJVl9+CggMbSN5NFuo85aDpnVw+621?=
 =?us-ascii?Q?uDdRJPoSdamFFFgOZleI5HJQJ8znCJqSTJjtcGc2bMq6BaP10snGOxO5Rq7R?=
 =?us-ascii?Q?9p5FY933HjnwHG8d8d4db/am5Vz6yiVqZdy3ccE4csBZsy7EFkTM2HBClzLu?=
 =?us-ascii?Q?AlyYPCdrraMS2ZsYEmUVW+pQgO+64LMVPlnjXw1wBayLwhalVOYKj+jPS3bk?=
 =?us-ascii?Q?K0UG9VmGWzi2AEIifEsHlm0slFU/zjxsaRWN2pQ1kXxjNNxV+v+YwoPz7dQ+?=
 =?us-ascii?Q?RuqysbN0IdixT4HdqM1e+IJt/XgDxTSDUX30Xc31WL7I0/MdqFhngt/7Je9t?=
 =?us-ascii?Q?Q5Y/Cmzm24rSGAbZGrJmh12I0dhas2blINdA4hC1WEafimdeuZtehrHxzDRs?=
 =?us-ascii?Q?K/tLqp5ZmmpzBxp5aPdsXBNIVOT6e0A8Sy5OEBoISbUn1V6frNeCABJk3PC8?=
 =?us-ascii?Q?1OsDqXmgRtXbfwRPs6Pd4WgTRMGdVOB+EeaW+TPmevXgL2uGrbtr0ieK9E+l?=
 =?us-ascii?Q?dTZgJ3GMOkUW66RGscYksnq3KynYPB6mJUFYi/M+Vbro7btB1XXsBUgPDQXn?=
 =?us-ascii?Q?pJ9DB1pq2EAcb5MJNc1Fu4V/H5CGfsE0GPQ3Z//v5sUNO/99bcvN5m6MgnFB?=
 =?us-ascii?Q?NjV8FpL1Ejlz89+gbBVKTbBjVcQTKW8Dk2vp2pZc/M9QDwp11Zq/19Z6BJja?=
 =?us-ascii?Q?z/tf6slsEOzXaoljUd+XUkBY1vT9wW1w7F0vVFgwSiLW8RrnITNhhEsM976C?=
 =?us-ascii?Q?05/2I0OnLPLaDyBWYTOn+s/4+/Yb97c2MnGOwZ5OGdzLYMNp2igK2kIL0k/A?=
 =?us-ascii?Q?yyuW46HgCVRkK+RHTr3b0OREQ0ZA1pvpPhaBILFeer1zSrUuzCEBR0P0FdHh?=
 =?us-ascii?Q?4qucnJvX1EfyxNaWhOZ6QAjj3G6ZWlCMydcX5HF2Qqf41y4aJRJ0iJ6XJhwO?=
 =?us-ascii?Q?2ft4EIYsDC4c7EV8iX5+QwABysbWojlHFreuSbBs0qM5F2g1o9tNgq49wxdb?=
 =?us-ascii?Q?daQLGO6wvgsRbLbD34xNVRfX8xgpFGNdn17cGWj0HiP69ImY36ppk9dRpfmn?=
 =?us-ascii?Q?lDjTtcqC1/QfilA4CKWYcpMojHnpPPU+pbTURPITIXuoJIFHDJ1Zgctl4FL3?=
 =?us-ascii?Q?7HiD4K2qhDYNjYtoZFAwSe6awAHzFFk6owuFUc4nnxZWBSttBEYEM+jY2NgL?=
 =?us-ascii?Q?OOFfaslJ7kVQSTWqce/nM+1iZrCYNn9PA88DzJE5aFNFQlpeeJfKZuk24+aD?=
 =?us-ascii?Q?s4sZV9V74D489lgAi3IhXJAu/kwf9YXi9XcVwi+lKSSgh1wmT1SoFuX+D7aA?=
 =?us-ascii?Q?zy9g1Mku3/C4YhLd4fxYKL8K3JpymNStBIrzbuyLt4Tss/T/cxrWIN/m7QOp?=
 =?us-ascii?Q?CJK73FVekIWaeGFr6DSQUDy1OVSgfFp6OQ/8Vyp02QdJbPI3MymLcr2GAWbO?=
 =?us-ascii?Q?A4g45Gfhi9j9gRrmMYKE8rNK52usGz2I+ZC+dkYqPrqzzkSjoksQtKy7Ufrs?=
 =?us-ascii?Q?7wvsVFk9Y1YGwwtLSykTV5MSKLz9D5/izQ4JkJ2dz8TCBeLuIEbyBd4E/LVj?=
 =?us-ascii?Q?NHaKbSGhQTh1qiP7IZ1iuomcxnRQZ6DInr3xRsUNYmF93jhP5avoge7hMXAE?=
 =?us-ascii?Q?19WQIRvryy1ZrDLS5YvyPWc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB8796.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LR4MegyqcqYISXfeM4XC8iEQu86OsL+QJzq4Y5xqj2cj1SUX2IbCbkOfKWQ/?=
 =?us-ascii?Q?wgIaISMsw2jYzH8ybKPV055U+BGExqEL74ffKqSwX4Mk2EDPkyUZak/GGRZq?=
 =?us-ascii?Q?msLbQIRAhik2Knz6zds5e5ybGS0bXxhIUJndMYZUcxU7sGIFEJdBq7wzNXKt?=
 =?us-ascii?Q?ELB2wxSSM8BGO6THnhL1ORKkOvg24VwFJM+BilqytvNUKVsVKUX5u6UKeKYY?=
 =?us-ascii?Q?Wbkj6WyE6yIfvqymcaPbMLzTa6aSq/i9TuLFrB+6uuX9jKPKmP54hQzvhRL/?=
 =?us-ascii?Q?8kjCZ3jUsul2MXrTSrNP+XA20dOfNi/pYimN5VYRzipkRSe7bN2ja77qEgWl?=
 =?us-ascii?Q?RlA2kPICoCUNZDvg0dLOW8JRaufE73Bg5k1BzplS8yDNxgJJ3Jdgii12+OKF?=
 =?us-ascii?Q?lM6Nr8eZ2OYSoyplsdp5KR4XPkzvyRWDAZ7Eojbr+IL+4fX6z7wPeg/PtlFn?=
 =?us-ascii?Q?NbuALzEWzn/kcfQ7zbBWGlih+1v+rjAF5jHJlmo10cELCGUwA06UYyhZKMoD?=
 =?us-ascii?Q?98Y5Q2XakmSAzwJ856AB0GyfEwhG5EV7RbCXBMrTCtHS0XHzhVpKYeFsSk0J?=
 =?us-ascii?Q?eLpdnjzkaveQfydMSi4V658TTVB3ZnTxtjHnpufop3aW9ymI/7fv8MPBXkaj?=
 =?us-ascii?Q?HxF+biCtAkUIi/eXIB0x6xWWBKlkBIdvWzcKuTYNkTfQUXWcmRHxHDfRql+w?=
 =?us-ascii?Q?eWrx42+kC7T5dKRKBw+BUd2OYHJ3TZiTlvyDxhZiPtDndiFvB4bYI4L7hCtk?=
 =?us-ascii?Q?3YpSJzsMPeGJB9RSuqCaWVx5Kjse9SURGsM36WVOSWbfx0iDgH433hiDckC3?=
 =?us-ascii?Q?ycQnlPFaqjIFNJFoDMKCJuTwDSvm1GHFHb+9an469lTU9XN/0me5lEbNeLeJ?=
 =?us-ascii?Q?rJnkGfGxVx2vC8whLW6A0R84XMxpzeIXDx8BnEf/Qml2+KAfoHTQVCKBpb8E?=
 =?us-ascii?Q?0Z7M+x+zETpZAnfhvKxFf736w2Ft+K6/knA9WkVIGSwQwL6eQM1p7bbT36tv?=
 =?us-ascii?Q?aoNUYoVnkl/cnuzBvvbHTbT1fdA1Il07iT22ZBlSSjWUjnFzgxAyh/DWxnq/?=
 =?us-ascii?Q?dVUGRUBCwZhdcGnVoeBxNO6U81VU3gaGsE/aPBVmXoRtNYh3RWMuoqEZyfaJ?=
 =?us-ascii?Q?jsLgLaqKUy7YN31sSMGDvqQtMvxj4hxxtUPAA6SM/2kV/bMlszLGmwadKImN?=
 =?us-ascii?Q?Iib0ABLfNoKGkkx09ZQfx1L3Yf83jKjqGfIss4hy92VSh4zpawNjqBHqh/Zc?=
 =?us-ascii?Q?tNIfHLjFUrwSanBXv7xQG18t6eTKoo/7/xh/Frp0mnsx/VbA0zzeSGe65TG0?=
 =?us-ascii?Q?ddQjClu/Xeq5sAYTgR7d0gbI6VnuyoBm7SwQwUVuTbKXs1K+lJW2rsqa8EmB?=
 =?us-ascii?Q?liEJLrgdkO5/arZbchuwXb0LgtVDNZ3BjCq9CynaBgHfRTGXL92nlfp8MCGe?=
 =?us-ascii?Q?BFtJ5TrEXigVIRRPbMCTmwjY8MdSF0pyadHapC2U38hq3v5ppB9GAay0M18l?=
 =?us-ascii?Q?J3yaQkphzRzJDvDlgnc9EhHZKUIo5qku9sB5+pAozJhHfkNmf6lDP9hLMaov?=
 =?us-ascii?Q?ZK1KzXgHc4+edd7qUpDYqArhvmcplPUAZtboH7LGSZN725tZTg4T/3hauwoH?=
 =?us-ascii?Q?ZsBayueqp09vVe8D/kFI87/OzYc3JPBaUuHBEct0Jm2KOPSWQHiHCH7FlSDZ?=
 =?us-ascii?Q?KhOdPDiF+ft5sB15suzSkxJuNWq/p1LBXH/FQpjHd7w9lf0c?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8796.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a059d94-219b-4dfb-ad29-08de5fae8b39
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2026 03:20:39.7488 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JaPw6zUJs65+D9BsIwa9Uw747ga5qwvy/UcpqaqenEHNcO3jEaIY94MoBSjtN1Hj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6426
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,seu.edu.cn];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Tao.Zhou1@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:email]
X-Rspamd-Queue-Id: BD276B6C99
X-Rspamd-Action: no action

[AMD Official Use Only - AMD Internal Distribution Only]

Thanks for the catch,

Reviewed-by: Tao Zhou <tao.zhou1@amd.com>

> -----Original Message-----
> From: Zilin Guan <zilin@seu.edu.cn>
> Sent: Thursday, January 29, 2026 4:35 PM
> To: Deucher, Alexander <Alexander.Deucher@amd.com>
> Cc: Koenig, Christian <Christian.Koenig@amd.com>; airlied@gmail.com;
> simona@ffwll.ch; Zhou1, Tao <Tao.Zhou1@amd.com>; Zhang, Hawking
> <Hawking.Zhang@amd.com>; Chai, Thomas <YiPeng.Chai@amd.com>; Xie,
> Patrick <Gangliang.Xie@amd.com>; Yang, Stanley <Stanley.Yang@amd.com>;
> amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-
> kernel@vger.kernel.org; jianhao.xu@seu.edu.cn; Zilin Guan <zilin@seu.edu.=
cn>
> Subject: [PATCH] drm/amdgpu: Fix memory leak in amdgpu_ras_init()
>
> When amdgpu_nbio_ras_sw_init() fails in amdgpu_ras_init(), the function r=
eturns
> directly without freeing the allocated con structure, leading to a memory=
 leak.
>
> Fix this by jumping to the release_con label to properly clean up the all=
ocated
> memory before returning the error code.
>
> Compile tested only. Issue found using a prototype static analysis tool a=
nd code
> review.
>
> Fixes: fdc94d3a8c88 ("drm/amdgpu: Rework pcie_bif ras sw_init")
> Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> index 2a6cf7963dde..8de9f68f7bea 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> @@ -4343,7 +4343,7 @@ int amdgpu_ras_init(struct amdgpu_device *adev)
>        * to handle fatal error */
>       r =3D amdgpu_nbio_ras_sw_init(adev);
>       if (r)
> -             return r;
> +             goto release_con;
>
>       if (adev->nbio.ras &&
>           adev->nbio.ras->init_ras_controller_interrupt) {
> --
> 2.34.1

