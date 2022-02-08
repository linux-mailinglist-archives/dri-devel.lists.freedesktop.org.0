Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7993E4AD330
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 09:24:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF27210E50E;
	Tue,  8 Feb 2022 08:23:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2071.outbound.protection.outlook.com [40.107.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 770E810E1CA;
 Tue,  8 Feb 2022 07:34:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ROwFfg/DhkTOCVR90ibeV/zofvzdzdcGQXrEaDJsZZTcSrnO9rdF+Iae7ZvHKEJiNqhZ8D2XEP5YR0kueUUb2N9+jDU9fhRzRXbiTz3kcIM8/XIZ1FzOYI/WdjhsZy2yv9ZpHSKOYFAXVTQors0QBDolB0LtZyuKW+cToQIFJevLHwwKAMNKmqshPRyXLuOJVRQu3e/uBQCAZtuQdBSFZFkDVjPgrDA6FUV96phRH3yhxNkZZ7SMqRtwQO7+l6zFEnkBoh4y+PmmQ0toA5GHxBzscXtFDEOv+YvJM49KVSBIcxSXIIovPXnvbEE1IOBTqCZGmAz83G7d3h5Y9d+aZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bpv4CUC9roT9s/p7zmR18PqBIXBpym7ysRo8VGuGpCs=;
 b=Ct2+4GF3oqFI2uFY6qHUZWFSVBhnMKWtx6/SRAP4v+Mu2pt1QZngTiKwp+H3UolscHIG90TA4xEBUpYMJtsL6cqCtVEwnFC+1gk9eq4VT4Kvw7Ozm3KXoYymmZ95foZkdgqs1bn3TgNgpcH5BYXEumYFidfQaCRMU12Jps9HgmCBYDq8voTxJXIPTIKGUUEZ6UYWP1pijWqxZUE0xn/bttJsmboUX1W9TWvjkPJK6WLI6LQMheYfw60BJy+rFXqJUp6VbFtcdl2LwA+lsL+QeBmqx0Eg8cl93IHWeir4lhiHo5KKBKd7umtMVMqDO+tBir5EofdeA7oknt7T4HKgjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bpv4CUC9roT9s/p7zmR18PqBIXBpym7ysRo8VGuGpCs=;
 b=PNIdZK12oksxMrEzvSpN9L+c8m94n30Vs7a0O2IXnVfnu/k8wvPOMN6zwh5Q57VTVVx2czOyymL0xJV8rJJtpPn3+lxFGa7yu1ul88YB3lSCnFK7JseqvlgICtQtYQEewz4JIkRkJu92s2cZH9Hp9o47BzJinwpJDp8d70HrnUrjq05MEk++Nbijl2CGtQWBlb85s4O7YXT/2udfQtjNx8jnXlqd+LYwGK8mIbkgGA4/id3eaIb7q74MevOjtKZaAfUhJtp7Mw8TydJo2uWMh4VTf6vvmnvUe7+eKOgZ3HtfutxHlulDOP4QAaOFz8EyhHShqjEXgKYd6y2Tl+TdjQ==
Received: from MW2PR12MB4667.namprd12.prod.outlook.com (2603:10b6:302:12::28)
 by BL1PR12MB5336.namprd12.prod.outlook.com (2603:10b6:208:314::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Tue, 8 Feb
 2022 07:34:04 +0000
Received: from MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::846c:d3cd:5a30:c35]) by MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::846c:d3cd:5a30:c35%5]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 07:34:04 +0000
From: Chaitanya Kulkarni <chaitanyak@nvidia.com>
To: Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 4/8] mm: move free_devmap_managed_page to memremap.c
Thread-Topic: [PATCH 4/8] mm: move free_devmap_managed_page to memremap.c
Thread-Index: AQHYHL4/9oSrH7pfvkOYRPCGQzbM0Q==
Date: Tue, 8 Feb 2022 07:34:04 +0000
Message-ID: <59813968-de8c-e33c-b81e-2d491aa600a9@nvidia.com>
References: <20220207063249.1833066-1-hch@lst.de>
 <20220207063249.1833066-5-hch@lst.de>
In-Reply-To: <20220207063249.1833066-5-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9cfa69fa-aa0e-4ffd-e904-08d9ead56242
x-ms-traffictypediagnostic: BL1PR12MB5336:EE_
x-microsoft-antispam-prvs: <BL1PR12MB53364EB04D56DABB50B32360A32D9@BL1PR12MB5336.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i59zXoiPw9NuxefY0LHKrs6svSlrAscWqb7DLh0v/FXp85O2lk7coDYdT4dw2tvvf708+GJaFDco2rTX+yu5kvAQHhWhwn3Ng4QbLymQ8OAgMOc+6eJ/94kQgFkhbwjGZK4UaFtySfLce4ivTK6ahvrRHMtFTxYDtS97cnTWuxli0QEjQkdBPV/Yey/lcCgs8HM+KzcCLSyNrJKxRMIvxmpTpTbKZH8HS1e8Tn5JuQ33GI8O7Q3/Bvt3eZ0cA4OqN5P97wpWsXJFsnKy2XqlWfPXhWZaUnzGhmmJy9VG7JgCalCmQ+DhdaVrxbdSoJiplJ5TSzowMBEJGZd/Z05yXpoypSOTNGcR37zPZI0PEaQLaXiuKzr2JKsUhXkYdXZW2Mqtd05LPOzFEG3MCAAKXzZpqUmwQWi0POMQMotH4L7R1AeykS8+Y/Uxrru8eiFnthFugVRqRVWd/V5MDxHupoVVTJzEKO96VQLAy0u1c0PrLu4YNrbisiY1QguWtJBLeG7mcJ4Th0S870zd2PWTx5IIgozCgqlo9dZOrpYGALQCVx3cP//VqpEkpg9OlAJ4+5mBSZbhupI7H7/iTrUvgyVmXQFigUsXmktoeVfESM88RPeEyehckXSaHl3nhAS4y6sj7d6KfwBwnEGfDK66dNb8br08C08V4H1XGBROjL27tPSCV8wHVRT1Q7+gB4jfhZdAkY+7vAN7yfyonLW6xhVjrMVRiga2QFxO8eQRNWBW8Y04SU8tor8WWtOC9lhhmWG/GN0/s/8p9WFmI1JTZw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR12MB4667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(64756008)(76116006)(2616005)(8676002)(66946007)(66556008)(66446008)(66476007)(6506007)(6512007)(38070700005)(186003)(6486002)(122000001)(86362001)(4326008)(91956017)(31696002)(38100700002)(8936002)(316002)(54906003)(110136005)(71200400001)(4744005)(53546011)(508600001)(7416002)(31686004)(36756003)(2906002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NVJ1QWJtTmsrTjRyUHJMZThtWGVVb1JmY1F1V0FoQk9LaWNmZnlFd0dTUUhK?=
 =?utf-8?B?WG1vUE03OWRibmw3VmxRLzMraEp0OGtvN2FiUmwwR1dJUWx5OUxoRGxXK0pP?=
 =?utf-8?B?YmpMZTRiUHFUTEcvZWNySGhDNjJhdTV2SEk2VThYUFJjcmMyS014Umg2RHhR?=
 =?utf-8?B?YVpxQnVxbGIwR3FLUjRocEVLRXdFeldmamdsNHJKU2ZVaEkwRUtSeGFhMTBY?=
 =?utf-8?B?Qm1uMGFWOExtbStIcWxPNWI4TVlOVUp4QlVvbklyMVY2ZVRMcVFaMmN3NVdN?=
 =?utf-8?B?K0xabi92WUJTR2YvUGJMdXVWNEJBNVdCNEpCUG9rRXZwL3hWZWxibVFFdm02?=
 =?utf-8?B?TGorQ1lqdFNUcFlHYWdIbzAzMTlDbEJsQlZKckxyMTdYRU5NaytyZk04UmR4?=
 =?utf-8?B?MWZGN3NkZXltTExBMUZLUGc0MkpkUTRUdmYvWkJTUTB0K2hTd0dwUXo5OFVX?=
 =?utf-8?B?YXFHK05UdjJBVEQwdUhuNWJkZEtOOFZaUVJ2bzJUalIvRHhMeDMxUFdvMUxO?=
 =?utf-8?B?WjB6NjhSUzJCaTg3L1RqclNIcmdHalhscUpwRUoxOWo0M0RUdWJHZkxhemlG?=
 =?utf-8?B?aE9Fc25VRWJjeC9memhOUm9iamNhYURxKy9wTVRFV05UU3N6RXVHVzNXUFMw?=
 =?utf-8?B?SkxYQkhvNXJmS3ZNS2RQNFVueStrVzF5UkNKYk9LdUUyaDh0NHJsSjJpalNQ?=
 =?utf-8?B?YWFGYUVzdVdNZXp0b04raVlpNnd1Sk5ranpGRXlEQm9LUmhLemhiU1c5TkRh?=
 =?utf-8?B?VG5LVEh0NGdoaGMxZC9kV05DT0FNam9WcEdSQzhrUmJYZ290UTE0QklVaFpn?=
 =?utf-8?B?YTU3OXphSFNxK05kVG1ua0xsc2tMcEwwbXc3dVFqa2VrQlNlQmxFd09pdHAv?=
 =?utf-8?B?dUtkN2ZYQjhGVWxBWEZTNyt1TzB2NnhpVUxMWDZPUi8xWFk5enpBdlNteUlj?=
 =?utf-8?B?SGdHcWVibE10eW1iOFJVUkxOVDlwMFpjMTYydktoUHJHdmtFV2xydnZGQmR4?=
 =?utf-8?B?SXh0NGhBWDMvcmVvTkd4TmZFL1hDSlJJTjBDdXhGQ0Q2aGFMdGQxUDZJL1dN?=
 =?utf-8?B?NDQ2OHlhc0ZGZzQ0R3RrNzh1ODd2cXpHVlcxbUhQN1VjNU8yYVFySnZQNnQw?=
 =?utf-8?B?NmRkanNnRVdMUTZjajhMa0hPS0o3cTZIZTY1TDkrblhlV0hRcHJnK05QckhC?=
 =?utf-8?B?QnJPbm1lc2NqRGNYTURsNGR5Zzd2TG9UYUYzRXdncW9XMGEzMWkrc01Pc21h?=
 =?utf-8?B?RW9kVG1YSVdSTytScXAxSEJsZE1YMnpqUllJYnBJcW1VYktnUFVFazlpMWg5?=
 =?utf-8?B?VWovSStJeTVmWWtsUVhtMytaVVpkNmNxeEJLZ0xjK2RKTExpVU92VVhGYzVv?=
 =?utf-8?B?b2RuR3VnVGZXS1IyT0lta0RXdmJtQlAvb1luWm1wYmIvK2QxSllNb1g4ZVND?=
 =?utf-8?B?OUg5S29HOGkzcnB6NU5TcjQvYk1UOGQ2OVZlR3B0eDY3blk0L2hLeElRQjlV?=
 =?utf-8?B?cXMwTW93VHdtcGdQRVJSMmRPa0RkendsL2pPUkFBb1hwVVZxSmtUbHVuSnZl?=
 =?utf-8?B?MkhtVmVjdWJoR2sxOUNtN2JzSlJmQ1BIYmw3VW1NYXFyRU5CTm16OTlSYWhs?=
 =?utf-8?B?QnNvb3VCYTkrVUNlQktOZjlFUytnSGJodVl2YnhQQkZ3aDl3SXlFdThDMkwr?=
 =?utf-8?B?cm5JK1FGaHNWdWVZeW1FRWtHUVQyZUpWRkoxdG5lWFFvaWtGcE5XQ1BFRDM1?=
 =?utf-8?B?Y1pRREE2YUxrQ3hGRWZWZUoxTVpxZjFFc0k4R1o2OU9QaFlnMzE1TlRHamRt?=
 =?utf-8?B?aS85L1pLeWc5ZEloallXY2REZ29od0s0M212S0FtRWRVMG5XZTJHMkpOSnFD?=
 =?utf-8?B?NU5IUkZiWHdUYloxNTY3d25jRTkxZXN6UXpmcy9EbTVjUXE3ZWVKY20yTTRH?=
 =?utf-8?B?ZTVhekRONmMzTmdPbERLekJMdnVZcmdCY1FyVWU1K0I5TGk4ZDM0cTNJdVBj?=
 =?utf-8?B?KzZCRFRsSjcrS1hMdERhaGZLam9lMlZtUVVsOTlybmxqaVV3eTZoSjRWTnIv?=
 =?utf-8?B?a3VTN2RFWDJnRFgrclRoTUMyTWplWFlaKzJBTERpQm1heDBna0ZiOTkvcm1S?=
 =?utf-8?B?OWU4VFlPT3MwWHZRcC9lV0tsSkVoNVVuK0cxbzErbVdnVHkzUnNwRjJQUytk?=
 =?utf-8?Q?naGK3zDGr8EK/+lzCX6Aga6xHQvE5E2pEJN31VRvbz2p?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <19DE456A4F48F8468DC6081EFCA1850A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB4667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cfa69fa-aa0e-4ffd-e904-08d9ead56242
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 07:34:04.5715 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7cHvRGVtW1nmTzpQ5UJruY2Aph4s+TxTZpu01HK9YwPjR3hUXG/0D6vYKvLOzcWyLa2lT9z6yglw1WyApDssQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5336
X-Mailman-Approved-At: Tue, 08 Feb 2022 08:23:40 +0000
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
Cc: "nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>,
 Ralph Campbell <rcampbell@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Karol Herbst <kherbst@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Ben Skeggs <bskeggs@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Logan Gunthorpe <logang@deltatee.com>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMi82LzIyIDEwOjMyIFBNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToNCj4gZnJlZV9kZXZt
YXBfbWFuYWdlZF9wYWdlIGhhcyBub3RoaW5nIHRvIGRvIHdpdGggdGhlIGNvZGUgaW4gc3dhcC5j
LA0KPiBtb3ZlIGl0IHRvIGxpdmUgd2l0aCB0aGUgcmVzdCBvZiB0aGUgY29kZSBmb3IgZGV2bWFw
IGhhbmRsaW5nLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWc8aGNoQGxz
dC5kZT4NCg0KVHJ1ZSwgdGhlIG9ubHkgZGV2bWFwIGNvZGUgaXMgcHJlc2VudCBpbiB0aGUgc3dh
cC5jIGlzIGNvdXBsZSBvZg0KY2FsbHMgaW4gbXkgdHJlZS4NCg0KTG9va3MgZ29vZC4NCg0KUmV2
aWV3ZWQtYnk6IENoYWl0YW55YSBLdWxrYXJuaSA8a2NoQG52aWRpYS5jb20+DQoNCg==
