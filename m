Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A08888D26FA
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 23:20:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F29110F1D9;
	Tue, 28 May 2024 21:20:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dRzgVU6o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2066.outbound.protection.outlook.com [40.107.243.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 162A01120E8;
 Tue, 28 May 2024 21:20:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZWo5vzIv51S0aqW8Crq8SBUVVxgkHEe9j7//0lEDezLLQC0dk9Htdpp8GqYjATYX+FQIJJAH/NplCyDLkSIYgkhUKJhn/QT/h9iD6GOb9RCAL8xq+EqkdxuYPVrsS3f+nR4NJ/bSUM2NRN2i2PPmKlA3GnBt9jdNc6NqAVG4WAHIUNDuLyZPpGJbLKM4QelLgff9Uk8G2VmLpK7678nVuAAYCZSle2y5D2/+7N73Dhoru680TclqFVaFkStjsjoWH9AQAYloV1R9eZSCZuhtViCUITCi0qanlTJgt2srqtWUmdqvaeZb9LDYZPqwSkUBKOF0yHuPZkrZkoaJlgmNkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1jyBuP4OwmquYW+KAHHhYV4L7KAH0BzV+YxpD/giniU=;
 b=R3GV7j4LPzFcFIIliGD94uonMMPOzocMMrxtfQPI23uryRm2RDXIWS7QteoRbAnukX9/6s+Cp0RHaDKkXgV9CgZ02Z0Zj0sfLlJNo/Bxx+0G9LPso/X1IYG9zZYo94OT0QEUbMlDgQchyx9KjlmyAJuvTGck8R7616qTrct3BHY/4+66at1NaBUMTYZSD1uZi875ILMkZ6q+1PAf6gKW4lk4hshnVYNlt9KM9Z0K7fvbyyyGOILTJCCwFqkWEXQuA14iVrkgjFOyLlYe1B3IKTdghffrieDvp4Zbr7txnpJsSbpyt+mm6O1Ctm6exPtpm1Q0odBQAZ9jPnwVnTiTOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1jyBuP4OwmquYW+KAHHhYV4L7KAH0BzV+YxpD/giniU=;
 b=dRzgVU6oFvWrY5SUO77HxQ6QXiDpMk/orikVk2oN70n9oxPXO92MUw7wMLiC6diUzNDjO20qSCNryMBIfUCbYy9QkFzYfQLTX7gJeiZtVHC4EtB6tJ+5QFAtjvugHPTeJw0ApBoaD3qm+AkqKRfQ4b53kr6QSEs+yDlQg/aZG2lzoJZrSPthR9uOm6FTNcHcNwraesyOInG1AnpRyJ0H10YRnNMHGpO+pWLoPAHcJQEI5r5ft2dqgjOvUFJbRjsjbaGfvQsOrcBMUp/Sui+oZTX666xnLwIHuvT9AWZJDclC2Ast+CJ6vRkqx4zlIcJO3cY8cm1wkeThtjplhksZqw==
Received: from SA1PR12MB6870.namprd12.prod.outlook.com (2603:10b6:806:25e::22)
 by DS0PR12MB6653.namprd12.prod.outlook.com (2603:10b6:8:cf::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 21:20:33 +0000
Received: from SA1PR12MB6870.namprd12.prod.outlook.com
 ([fe80::8e11:7d4b:f9ae:911a]) by SA1PR12MB6870.namprd12.prod.outlook.com
 ([fe80::8e11:7d4b:f9ae:911a%5]) with mapi id 15.20.7611.030; Tue, 28 May 2024
 21:20:33 +0000
From: Zhi Wang <zhiw@nvidia.com>
To: Danilo Krummrich <dakr@redhat.com>
CC: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "ojeda@kernel.org" <ojeda@kernel.org>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, "wedsonaf@gmail.com"
 <wedsonaf@gmail.com>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "gary@garyguo.net" <gary@garyguo.net>, "bjorn3_gh@protonmail.com"
 <bjorn3_gh@protonmail.com>, "benno.lossin@proton.me"
 <benno.lossin@proton.me>, "a.hindborg@samsung.com" <a.hindborg@samsung.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>, "fujita.tomonori@gmail.com"
 <fujita.tomonori@gmail.com>, "lina@asahilina.net" <lina@asahilina.net>,
 "pstanner@redhat.com" <pstanner@redhat.com>, "ajanulgu@redhat.com"
 <ajanulgu@redhat.com>, "lyude@redhat.com" <lyude@redhat.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
Thread-Topic: [RFC PATCH 7/8] rust: add firmware abstractions
Thread-Index: AQHasGq9PdWC/vvfakyx3/WUuSONP7GsVISAgABeiwCAAHXZAA==
Date: Tue, 28 May 2024 21:20:33 +0000
Message-ID: <b44bdeb1-8663-4b3f-9b09-cdeec2e42dd2@nvidia.com>
References: <20240520172059.181256-1-dakr@redhat.com>
 <20240520172422.181763-4-dakr@redhat.com>
 <20240521083231.000074c2.zhiw@nvidia.com>
 <ZlTcnYNff2EDQJdj@pollux.localdomain>
 <fd5dbd42-24b7-422b-bc0b-393347b3fdca@nvidia.com> <ZlXnxGK24QaYLDmM@pollux>
In-Reply-To: <ZlXnxGK24QaYLDmM@pollux>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB6870:EE_|DS0PR12MB6653:EE_
x-ms-office365-filtering-correlation-id: 76917486-e0aa-4f5b-80d9-08dc7f5c0284
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|1800799015|7416005|366007|376005|38070700009; 
x-microsoft-antispam-message-info: =?utf-8?B?VUd4ZG93OCtNbjJHQlB5NjJ6UzRzcE10cHZvc2RkUVFMdmxuUjNnenpCTFNV?=
 =?utf-8?B?anFTZnZmQzE4YnZDYmRaRVVWZGZSS2N0aUhpV0Z6YTg4UmNKQ0ZIK0xML1ds?=
 =?utf-8?B?SU9aZzgwM2E4VFo3bU9pUzI3c1BIOTZXdnpkNmczMUF2dEtCQWt5Sk5vUmJP?=
 =?utf-8?B?VFJZWGZkWGNsdVVJNWlVWFlsc0Zjb09lNTQ1cXlhOTROU1VLMEFneWI2b0pO?=
 =?utf-8?B?VHFuc1hMOFdHTzRSQ3AwdVNnd2d3bjZzNkQ4a0FzRDdsODN3ZTJlU0pUbXN5?=
 =?utf-8?B?VnA5Z3ozZStGMnljTVhkc0wwWXJNNkNBMFBkVzdwUzdzMlJxQmtMcEN1Nk1h?=
 =?utf-8?B?RVVPRkE2QzRmZzNpTkIzUTJtU0doM25MWUQreUEza1dSSDBDMnVPM3Z3TWJq?=
 =?utf-8?B?RjZwclFiM3FGZy9WclFEWkM4YWovRzNVb0hvTDZmWEVBZ3NZR1YzVzlPekxr?=
 =?utf-8?B?RG5LVURDMEViSE1kQjhiSUx4N3RDcjdCajBLcEhVbWd0YjZ1QmFRZWl5V1My?=
 =?utf-8?B?WmpnbTNka0pPKzRvNEVqZkR1ZzZxbk84OHV3cHcxNEd5T2RTdTFoNGxsc1dT?=
 =?utf-8?B?NTZ5K0NjTVh5a2prODRTZXROQlpoWEhNeVpoTFRlMDdtbjAvZmlUbVNSdjJ6?=
 =?utf-8?B?M2t3dllVSjVRTUhCdWUyUVppNjA3ZWRKSTVqMVMvUElmVjhzTnBMRWQ5ZFNF?=
 =?utf-8?B?L0J5RmxjaXpMc0lZSndhWmhDUGx6VkNBY1pDaFM4TGRYS2ZDeWplYmF3THg1?=
 =?utf-8?B?TEowdmc1cUsyNHFlVGdHRDUvM25Ta1VSQ2ZtdVFYOFMyTi9Kb0V6aEp1VytQ?=
 =?utf-8?B?VnRJV1FGTXVLYkRYUWtTUENld09WTkx1UlA5eFVWaHVpbERRVnBmRkY4Zk95?=
 =?utf-8?B?WVBOeER0Z2lEWFpleFRneWlqY2tRV0NyOE0yWTJFeXpvb0dWQUliRXdhcjNs?=
 =?utf-8?B?MWg1SmdCTFlHRnFEZStJajNSWnRPbDZvNDJCQ3lYbTdxKzc4QWxCZ0FJL2Nv?=
 =?utf-8?B?U3NpMzlOMFRVQ1BDNHk1TnhLN3NzaC9mNEcxSmtYazNyRjcvRUl3RlZrTnl5?=
 =?utf-8?B?OC81dzh2QWF5TGNzclFtUHFaUjhBZWhJVm96WE5UL2laeWZ3V3ZJdXdUcy9j?=
 =?utf-8?B?dmxaemRFSEhtZmxJeEVGUWJvbFVtZk5vSTR1MmpFZEsvNTF0ZTliOFZHSmlH?=
 =?utf-8?B?SzUvSXNsVWI4NmllOFYxSzk2OWQxcHN3LzdHeWtrMzhKOW9NOXFEMUl0cGFl?=
 =?utf-8?B?eGs4Z2JKSWUyNzJUaXMrTjAzVDFpL25zRjZ3aGthWW44RVN0M2wrOFI2UTJC?=
 =?utf-8?B?c3ZwWUpmem0ybG5rK2tRdENPWDV0US9xMTM1UFF1VmhuVHFuZ0tVaUVGQTZH?=
 =?utf-8?B?SDNKU2lPaENqWHJZZk80T0s2NGE4Ym9LamduTThZMDIvcjBkdlAyazhsNy91?=
 =?utf-8?B?b2ZuSjJmS0EzRUlDN3NycnlpMGpvU3VGOWNhbFViUVBHMFM5eVpOSUN3d0F4?=
 =?utf-8?B?ZWZQRU1GUFpjd0FLQkFKWkYxeUYwMWlkdi9nTE9uS01LSVRlSllSK09QZU1S?=
 =?utf-8?B?L1pUTmx0WlR3Vm1ibVZBUG91ZkNiRHVCbVExU0FvMFd3SzhOaGgwL2NiNzdJ?=
 =?utf-8?B?NFBlbFROSTZtcHNpUnB0dEkwTE9lTlRLanFVMlBGcmRCaS9KOTJzaE4wdWNG?=
 =?utf-8?B?d2RXajN2QmpMb3NuUHVpMnJyay82dkJIcytORDhjTE54c2VRaGppUHdrMXVE?=
 =?utf-8?B?Q0NBTno4Q28rQ1dPRXdZRmJEMzZxOTcyYThsZzBSL2RvWE1CbnFIRWQzNmFP?=
 =?utf-8?B?YVJWaDRjaW5zU0JRVXpqQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB6870.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(7416005)(366007)(376005)(38070700009); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TE9zanpHYzhoeTJnU2dLSzdLWHFXOXo4ck55MFdTWjNSWllVU2d2VEU0NFhm?=
 =?utf-8?B?RGErQVR3MlZ5Wjk5UndyajY5ZUExS0Nyc0J1QWpua3dReEVoVTdiZjVSM0Ix?=
 =?utf-8?B?anprRFl1YU9ObDBsdG1QTDVwRnNPVTg4bEZRN3c5VVVjdHllVkF2MFgxNXN0?=
 =?utf-8?B?YklaYnhsUlc0NGowWjNBVDlqNlJPaFpzdkRQUlZPVWx2djNIbUNneTM4cXhZ?=
 =?utf-8?B?R0RRSnluRmh4RFdlcHFjZ0pCeUM1UTZ1N2ZDNSs2OWROd2dqUGZxRlZpNXpx?=
 =?utf-8?B?azdJSlRaR3pNaXNydmdNU3lrQjdRTjJBNjRORWZvV0ZEcFdHZ3dIMHFRdFhk?=
 =?utf-8?B?OS9iUlIybVB3M2pNRGllbTFWSDd4QXdsQ2NhZmFyYjFzQU1wUXBmbmdWZUdp?=
 =?utf-8?B?TFhwQzlHbk4rak1rd2tuMWZ0YVovenR5djN5V1k3Z1ZoTGxKaXlIcFpweC9N?=
 =?utf-8?B?elU3VnV4UlplMHRPTk9tTWJVVThYckpMK3EyU1BHM2VhZVdYeFprWkYvMFFl?=
 =?utf-8?B?OXB5UDVSZlRsYUtlSndRb2lkMW5rRC8zUUxWVXV0MUMrenMrTGZBTjVVVEJu?=
 =?utf-8?B?ZHVvdmlHU3pTdStwMGUxUXl2amh2STRTeHNPNzF3RW1pZWgzU1BrR0VPUXhJ?=
 =?utf-8?B?SnBnRVlPNURlSmJNa1Rwb21pOWtzaVNGRThWU2xWeDFneTB6bzM2YzFKaE1M?=
 =?utf-8?B?ck8rS2hrdm5TbklFby94Z2t0dzdMRXpSa0ROK3BuVXRLbXhrV2ViYXlrcU5D?=
 =?utf-8?B?Q1o4d0ZkcktoWSs0UVkyWm5JL3RtQTBmVVJWRGxrZFNKVkRFdm9FV0xYa1I5?=
 =?utf-8?B?c0NkbTNQUVJ3c1F6NFUxeVRId2dFejZZdHVEOUU1L2tiUG5yMG83STdFYnlK?=
 =?utf-8?B?L2RhbStsTFVYb2JkbHdleDVzYmg0WnJLNjROM1ZxVzRxVnlVRm5Wc09vTjVG?=
 =?utf-8?B?azJCSmdaMUpCM0dNMlZlWkdLTjJtdGFKU1pzWkhJZ0pwTlFuUjBUU3YyWVJp?=
 =?utf-8?B?TlZFSGQ2SlNHSW1wM3ZiRzVaZ1pQUFc3bmVVU0JEL29nTXF2QlRkL2tzVjNh?=
 =?utf-8?B?a09QZ0F6ZmczYkp5dDl0cGc3Y0YyalNrcFgySDdTZ2lVMFVBVVNsWlgzSUlF?=
 =?utf-8?B?a3NLelBKL2lxRlhQSWQ3cUtDUFZVV0RVbFZkbERGeVFibEZ5NnJkVm9qaXpl?=
 =?utf-8?B?RUpXZloycGZEVGlTdm1rU0MwcDBkV2gxbllzaFVBY1dNYWlJOE9wOEF1OUFL?=
 =?utf-8?B?cWNGL2doNlZuaWxZOGpIQjFRNS9NMDhlTkVaVWpYNGI0dzJ5Z25qdm5OVFBh?=
 =?utf-8?B?SnJDK1c2VE10WURjNko2OFpGc1g4MVZKUVkwdWRvVDBDT3JOR2l0Q3MyMEhV?=
 =?utf-8?B?VmQrUWpnT3pTSkMvL3hrOERWb2wzVTNzL3FFVFNWNW1xaG1jaHVXMG1hQjN3?=
 =?utf-8?B?UjVibWhnNHcyenVxZzI3MFIwZFFiYi8wVmZRdG5QS2xsdDlFbTI1L0FyVWxp?=
 =?utf-8?B?S0R2R1lHSmZqaG1uTUNjN2JLeEJFSmgzaVFSWDI4U2ZFWHZUSTJ1WHBvMWNW?=
 =?utf-8?B?TTVSSnBLdlBDUzlzR1J6b3IvQ2NvcVdPRXdMQk1WVUh5VHBWUGR0VWpDOEcr?=
 =?utf-8?B?RWkzZStJOS9JUHl3S2cvdXY2RFdpai9NU1FGU1lOeTFTK3FJRnVYRlRoa3dI?=
 =?utf-8?B?UUJWN01laFlpbG9GVjkrdlFXS0pJSEVMSTBsNWhVTmpRSkpHeGkrbmJOU2tP?=
 =?utf-8?B?eFc3WmoyNUEvSEFEYU5VLzVpdEhIWFFCdnpIQ1BtRXNxTFZ1S2Z6aFhCZDMx?=
 =?utf-8?B?eDhFN081Q1JPVkFFV09HNE5JQ05MT2RpVjBiT3ZuZkZualJWSFRYQWxORkQr?=
 =?utf-8?B?Ky9nZlRVM3FDRGs1ZE1tMExmeElvODFOd2d1V1UrTUZWd1V0RVpVUWlKUmZT?=
 =?utf-8?B?bEl1SXM5MHpwdnRhK3Q4NDROWWNremZkUlkzdlBJWkVqdDFsSVhRbG1udGhS?=
 =?utf-8?B?UkFSUSthd2VUdENyS3RMNTZ1eXlHdzlqMUlsaDN6eXBSZXBmVWI2SUFad0xH?=
 =?utf-8?B?aHpWU1I5WW9LLzB2K2RzTzRnSnFSK0FsNHdqaGNBcHQ1Y21yNWk5QXRYT2RV?=
 =?utf-8?Q?s+Qk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D13800D658D9EF4CBAF437A344042C9B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB6870.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76917486-e0aa-4f5b-80d9-08dc7f5c0284
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2024 21:20:33.5462 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZhL33iM6xfQoWNVUodly+ZzdNf1hKLT1kREtt78vuvGcNzuefL2GVQZ0Cg1xf1og
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6653
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

T24gMjgvMDUvMjAyNCAxNy4xOCwgRGFuaWxvIEtydW1tcmljaCB3cm90ZToNCj4gRXh0ZXJuYWwg
ZW1haWw6IFVzZSBjYXV0aW9uIG9wZW5pbmcgbGlua3Mgb3IgYXR0YWNobWVudHMNCj4gDQo+IA0K
PiBPbiBUdWUsIE1heSAyOCwgMjAyNCBhdCAwODo0MDoyMEFNICswMDAwLCBaaGkgV2FuZyB3cm90
ZToNCj4+IE9uIDI3LzA1LzIwMjQgMjIuMTgsIERhbmlsbyBLcnVtbXJpY2ggd3JvdGU6DQo+Pj4g
RXh0ZXJuYWwgZW1haWw6IFVzZSBjYXV0aW9uIG9wZW5pbmcgbGlua3Mgb3IgYXR0YWNobWVudHMN
Cj4+Pg0KPj4+DQo+Pj4gT24gVHVlLCBNYXkgMjEsIDIwMjQgYXQgMDg6MzI6MzFBTSArMDMwMCwg
WmhpIFdhbmcgd3JvdGU6DQo+Pj4+IE9uIE1vbiwgMjAgTWF5IDIwMjQgMTk6MjQ6MTkgKzAyMDAN
Cj4+Pj4gRGFuaWxvIEtydW1tcmljaCA8ZGFrckByZWRoYXQuY29tPiB3cm90ZToNCj4+Pj4NCj4+
Pj4+IEFkZCBhbiBhYnN0cmFjdGlvbiBhcm91bmQgdGhlIGtlcm5lbHMgZmlybXdhcmUgQVBJIHRv
IHJlcXVlc3QgZmlybXdhcmUNCj4+Pj4+IGltYWdlcy4gVGhlIGFic3RyYWN0aW9uIHByb3ZpZGVz
IGZ1bmN0aW9ucyB0byBhY2Nlc3MgdGhlIGZpcm13YXJlDQo+Pj4+PiBidWZmZXIgYW5kIC8gb3Ig
Y29weSBpdCB0byBhIG5ldyBidWZmZXIgYWxsb2NhdGVkIHdpdGggYSBnaXZlbg0KPj4+Pj4gYWxs
b2NhdG9yIGJhY2tlbmQuDQo+Pj4+Pg0KPj4+Pg0KPj4+PiBXYXMgcGxheWluZyB3aXRoIGZpcm13
YXJlIGV4dHJhY3Rpb25zIGJhc2VkIG9uIHRoaXMgcGF0Y2guDQo+Pj4+IFVuZm9ydHVuYXRlbHkg
SSBlbmRlZCB1cCB3aXRoIGEgbG90IG9mIHBvaW50ZXIgb3BlcmF0aW9ucywgdW5zYWZlDQo+Pj4+
IHN0YXRlbWVudHMuDQo+Pj4+DQo+Pj4+IEFzIHdlIGtub3cgbWFueSB2ZW5kb3JzIGhhdmUgYSBD
IGhlYWRlcnMgZm9yIHRoZSBkZWZpbml0aW9ucyBvZiB0aGUNCj4+Pj4gZmlyd21hcmUgY29udGVu
dCwgdGhlIGRyaXZlciBleHRyYWN0IHRoZSBkYXRhIGJ5IGFwcGx5aW5nIGEgc3RydWN0DQo+Pj4+
IHBvaW50ZXIgb24gaXQuDQo+Pj4+DQo+Pj4+IEJ1dCBpbiBydXN0LCBJIGZlZWwgaXQgd291bGQg
bmljZSB0aGF0IHdlIGNhbiBhbHNvIGhhdmUgYSBjb21tb24NCj4+Pj4gZmlybXdhcmUgZXh0cmFj
dG9yIGZvciBkcml2ZXJzLCB0aGF0IGNhbiB3cmFwIHRoZSBwb2ludGVyIG9wZXJhdGlvbnMsDQo+
Pj4+IHRha2UgYSBsaXN0IG9mIHRoZSBmaXJtd2FyZSBzdHJ1Y3QgbWVtYmVycyB0aGF0IGNvbnZl
cnRlZCBmcm9tIEMgaGVhZGVycw0KPj4+PiBhcyB0aGUgaW5wdXQsIG9mZmVyIHRoZSBkcml2ZXIg
c29tZSBjb21tb24gQUJJIG1ldGhvZHMgdG8gcXVlcnkgdGhlbS4NCj4+Pj4gTWF5YmUgdGhhdCB3
b3VsZCBlYXNlIHRoZSBwYWluIGEgbG90Lg0KPj4+DQo+Pj4gU28sIHlvdSBtZWFuIHNvbWUgYWJz
dHJhY3Rpb24gdGhhdCB0YWtlcyBhIGxpc3Qgb2YgdHlwZXMsIG9mZnNldHMgaW4gdGhlDQo+Pj4g
ZmlybXdhcmUgYW5kIGEgcmVmZXJlbmNlIHRvIHRoZSBmaXJtd2FyZSBpdHNlbGYgYW5kIHByb3Zp
ZGVzIHJlZmVyZW5jZXMgdG8gdGhlDQo+Pj4gY29ycmVzcG9uZGluZyBvYmplY3RzPw0KPj4+DQo+
Pj4gSSBhZ3JlZSBpdCBtaWdodCBiZSBoZWxwZnVsIHRvIGhhdmUgc29tZSBjb21tb24gaW5mcmFz
dHJ1Y3R1cmUgZm9yIHRoaXMsIGJ1dCB0aGUNCj4+PiBvcGVyYXRpb25zIG9uIGl0IHdvdWxkIHN0
aWxsIGJlIHVuc2FmZSwgc2luY2UgdWx0aW1hdGVseSBpdCBpbnZvbHZlcw0KPj4+IGRlcmVmZXJl
bmNpbmcgcG9pbnRlcnMuDQo+Pj4NCj4+DQo+PiBJIHRoaW5rIHRoZSBnb2FsIGlzIHRvIDEpIGNv
bmNlbnRyYXRlIHRoZSAidW5zYWZlIiBvcGVyYXRpb25zIGluIGENCj4+IGFic3RyYWN0aW9uIHNv
IHRoZSBkcml2ZXIgZG9lc24ndCBoYXZlIHRvIHdyaXRlIGV4cGxhbmF0aW9uIG9mIHVuc2FmZQ0K
Pj4gb3BlcmF0aW9ucyBoZXJlIGFuZCB0aGVyZSwgaW1wcm92ZSB0aGUgcmVhZGFiaWxpdHkgb2Yg
dGhlIGRyaXZlciB0aGF0DQo+PiBpbnRlcmFjdHMgd2l0aCB2ZW5kb3ItZmlybXdhcmUgYnVmZmVy
LiAyKSBlYXNlIHRoZSBkcml2ZXIgbWFpbnRlbmFuY2UNCj4+IGJ1cmRlbi4NCj4gDQo+IFdpdGgg
YSBnZW5lcmljIGFic3RyYWN0aW9uLCBhcyBpbiAxKSwgYXQgbGVzdCBzb21lIG9mIHRoZSBhYnN0
cmFjdGlvbidzDQo+IGZ1bmN0aW9ucyB3b3VsZCBiZSB1bnNhZmUgdGhlbXNlbHZlcywgc2luY2Ug
dGhleSBoYXZlIHRvIHJlbHkgb24gdGhlIGxheW91dA0KPiAob3Igb2Zmc2V0KSBwYXNzZWQgYnkg
dGhlIGRyaXZlciBiZWluZyBjb3JyZWN0LiBXaGF0IGlmIEkgcGFzcyBhIHdyb25nIGxheW91dCAv
DQo+IG9mZnNldCBmb3IgYSBzdHJ1Y3R1cmUgdGhhdCBjb250YWlucyBhIHBvaW50ZXI/IFRoaXMg
bWlnaHQgc3RpbGwgcmVzdWx0IGluIGFuDQo+IGludmFsaWQgcG9pbnRlciBkZXJlZmVyZW5jZS4g
QW0gSSBtaXNzaW5nIHNvbWV0aGluZz8NCj4gDQo+Pg0KPj4gU29tZSBzb2x1dGlvbnMgSSBzYXcg
aW4gZGlmZmVyZW50IHByb2plY3RzIHdyaXR0ZW4gaW4gcnVzdCBmb3INCj4+IGRlLXJlZmVyZW5j
aW5nIGEgcGVyLWRlZmluZWQgc3RydWN0Og0KPj4NCj4+IDEpIFRha2UgdGhlIHZlbmRvciBmaXJt
d2FyZSBidWZmZXIgYXMgYSB3aG9sZSwgaW52ZW50IG1ldGhvZHMgbGlrZQ0KPj4gcmVhZC93cml0
ZSB3aXRoIG9mZnNldCBmb3Igb3BlcmF0aW5nIHRoZSBidWZmZXIuDQo+Pg0KPj4gSW4gdGhpcyBz
Y2hlbWUsIHRoZSBkcml2ZXIgaXMgcmVzcG9uc2libGUgZm9yIHRha2luZyBjYXJlIG9mIGVhY2gg
ZGF0YQ0KPj4gbWVtYmVyIGluIGEgdmVuZG9yIGZpcm13YXJlIHN0cnVjdCBhbmQgYWxzbyBpdHMg
dmFsaWQgb2Zmc2V0LiBUaGUNCj4+IGFic3RyYWN0aW9uIG9ubHkgY292ZXJzIHRoZSBib3VuZGFy
eSBvZiB0aGUgd2hvbGUgZmlybXdhcmUgYnVmZmVyLg0KPj4NCj4+IFRoZSBjb25zIGlzIHRoZSBy
ZWFkYWJpbGl0eSBvZiB0aGUgb3BlcmF0aW9uIG9mIHRoZSB2ZW5kb3IgZmlybXdhcmUNCj4+IGJ1
ZmZlciBpbiB0aGUgZHJpdmVyIGlzIG5vdCBnb29kIGNvbXBhcmluZyB3aXRoIEMgY29kZS4NCj4+
DQo+PiBIYXRlIHRvIHRoaW5rIGEgbG90IG9mIHh4eCA9IHZlbmRvcl9maXJtd2FyZV9zdHJ1Y3Qu
cmVhZChvZmZzZXQpOyAvLw0KPj4gcmVhZGluZyBpdGVtIEEgaW4gdGhlIGNvZGUuDQo+Pg0KPj4g
MikgRGVmaW5lIHRoZSBmaXJtd2FyZSBzdHJ1Y3QgaW4gcnVzdCAobWlnaHQgbmVlZCB0byBmaW5k
IGEgYmV0dGVyIHdheQ0KPj4gdG8gaGFuZGxlICJ1bmlvbiIgaW4gdGhlIGRlZmluaXRpb24gb2Yg
dGhlIHZlbmRvciBmaXJtd2FyZSBzdHJ1Y3QpLiBVc2UNCj4+IG1hY3JvcyB0byBnZW5lcmF0ZSBt
ZXRob2RzIG9mIGFjY2Vzc2luZyBlYWNoIGRhdGEgbWVtYmVyIGZvciB0aGUgdmVuZG9yDQo+PiBm
aXJtd2FyZSBzdHJ1Y3QuDQo+Pg0KPj4gVGhlbiB0aGUgY29kZSBpbiB0aGUgZHJpdmVyIHdpbGwg
YmUgbGlrZSB4eHggPQ0KPj4gdmVuZG9yX2Zpcm13YXJlX3N0cnVjdC5pdGVtX2EoKTsgaW4gdGhl
IGRyaXZlci4NCj4+DQo+PiBJbiB0aGlzIHNjaGVtZSwgdGhlIGFic3RyYWN0aW9uIGFuZCB0aGUg
Z2VuZXJhdGVkIG1ldGhvZHMgY292ZXJzIHRoZQ0KPj4gYm91bmRhcnkgY2hlY2suIFRoZSAidW5z
YWZlIiBzdGF0ZW1lbnQgY2FuIHN0YXkgaW4gdGhlIGdlbmVyYXRlZA0KPj4gc3RydWN0LWFjY2Vz
cyBtZXRob2RzLg0KPj4NCj4+IFRoaXMgbWlnaHQgZXZlbiBiZSBpbXBsZW1lbnRlZCBhcyBhIG1v
cmUgZ2VuZXJpYyBydXN0IGZlYXR1cmUgaW4gdGhlIGtlcm5lbC4NCj4gDQo+IFRoaXMgc291bmRz
IG1vcmUgbGlrZSBhIGRyaXZlciBzcGVjaWZpYyBhYnN0cmFjdGlvbiB0byBtZSwgd2hpY2gsIGFz
IHlvdSB3cml0ZSwNCj4gd2UgY2FuIHByb2JhYmx5IGNvbWUgdXAgd2l0aCBzb21lIG1hY3JvcyB0
aGF0IGhlbHAgaW1wbGVtZW50aW5nIGl0Lg0KPiANCj4gQnV0IGFnYWluLCB3aGF0IGlmIHRoZSBv
ZmZzZXRzIGFyZSB3aXRoaW4gdGhlIGJvdW5kYXJ5LCBidXQgc3RpbGwgYXQgYSB3cm9uZw0KPiBv
ZmZzZXQ/IFdoYXQgaWYgdGhlIGRhdGEgb2J0YWluZWQgZnJvbSBhIHdyb25nIG9mZnNldCBsZWFk
cyB0byBvdGhlciBzYWZldHkNCj4gaW1wbGljYXRpb25zIHdoZW4gZnVydGhlciBwcm9jZXNzaW5n
IHRoZW0/IEkgdGhpbmsgbm8gZ2VuZXJpYyBhYnN0cmFjdGlvbiBjYW4NCj4gZXZlciBjb3ZlciB0
aGUgc2FmZXR5IHBhcnRzIG9mIHRoaXMgKGVudGlyZWx5KS4gSSB0aGluayB0aGVyZSBhcmUgYWx3
YXlzIHNlbWFuaWMNCj4gcGFydHMgdG8gdGhpcyB0aGUgZHJpdmVyIGhhcyB0byBjb3Zlci4NCj4g
DQoNCkkgd2FzIHRoaW5raW5nIG9mIGEgcHJvY19tYWNybyB0aGF0IHRha2VzIGEgdmVuZGVyLWZp
cm13YXJlIHN0cnVjdCANCmRlZmluaXRpb24uIEFzIGl0IGNhbiBnZXQgdGhlIHR5cGUgYW5kIHRo
ZSBuYW1lIG9mIGVhY2ggbWVtYmVyLCB0aGVuIGl0IA0KY2FuIGdlbmVyYXRlIG1ldGhvZHMgbGlr
ZSB4eHg6Om1lbWJlcl9hKCkgdGhhdCByZXR1cm5zIHRoZSB2YWx1ZSBmcm9tIA0KdGhlICJ1bnNh
ZmUgeyoodHlwZSAqKShwb2ludGVyICsgb2Zmc2V0KX0iLiBUaHVzLCB0aGUgdW5zYWZlIHN0dWZm
IHN0YXlzIA0KaW4gdGhlIGdlbmVyYXRlZCBtZXRob2RzLg0KDQpGb3Igb2Zmc2V0LCBJIHdhcyBo
b3BpbmcgdGhlIG1hY3JvIGNhbiBhdXRvbWF0aWNhbGx5IGNhbGN1bGF0ZSBpdCBiYXNlZCANCm9u
IHRoZSBtZW1iZXIgb2Zmc2V0ICh0aGUgdmVuZG9yLWZpcm13YXJlIGRlZmluaXRpb24pIHdoZW4g
Z2VuZXJhdGluZyANCnh4eDo6bWVtYmVyX3goKS4gKE1heWJlIGl0IGNhbiBhbHNvIHRha2UgYWxp
Z25tZW50IGludG8gYWNjb3VudCkNCg0KQXMgdGhlIHJldHVybiB2YWx1ZSBoYXMgYSBydXN0IHR5
cGUsIHJ1c3Qgc2hvdWxkIGNhdGNoIGl0IGlmIHRoZSBjYWxsZXIgDQp3YW50cyB0byBkbyBzb21l
dGhpbmcgY3JhenkgdGhlcmUuDQoNCj4gR2VuZXJhbGx5LCBJIHRoaW5rIHdlIHNob3VsZCBhaW0g
Zm9yIHNvbWUgZ2VuZXJhbGl6YXRpb24sIGJ1dCBJIHRoaW5rIHdlIHNob3VsZA0KPiBub3QgZXhw
ZWN0IGl0IHRvIGNvdmVyIGFsbCB0aGUgc2FmZXR5IGFzcGVjdHMuDQo+IA0KDQpJIGFncmVlLiBJ
IHdhcyBtb3N0bHkgdGhpbmtpbmcgaG93IHRvIGVhc2UgdGhlIHBhaW4gb2YgZHJpdmVyIGFuZCBz
ZWUgDQpob3cgdGhlIGJlc3Qgd2UgY2FuIGRvIGZvciBpdC4NCg0KPj4NCj4+IFRoZSBjb25zIGlz
IHN0aWxsIHRoZSBkcml2ZXIgbWlnaHQgbmVlZCB0byBzeW5jIGJldHdlZW4gdGhlIEMtdmVyc2lv
bg0KPj4gZGVmaW5pdGlvbiBhbmQgcnVzdC12ZXJzaW9uIGRlZmluaXRpb24uDQo+IA0KPiBXaGF0
IGRvIHlvdSBtZWFuIHdpdGggdGhlIGRyaXZlciBuZWVkcyB0byBzeW5jIGJldHdlZW4gYSBDIGFu
ZCBhIFJ1c3QgdmVyc2lvbiBvZg0KPiBzdHJ1Y3R1cmUgZGVmaW5pdGlvbnM/DQo+IA0KDQpMZXQn
cyBzYXkgYSBDIGRyaXZlciBtYWludGFpbnMgcXVpdGUgc29tZSBoZWFkZXJzIGFuZCBzdXBwb3J0
IHNvbWUgbm90IA0KdmVyeSBuZXcgSFdzLiBBIG5ldyBydXN0IGRyaXZlciBtYWludGFpbnMgc29t
ZSBoZWFkZXJzIHRoYXQgd3JpdHRlbiBpbiANCnJ1c3QsIGl0IG5lZWRzIHRob3NlIGhlYWRlcnMg
YXMgd2VsbC4gTm93IHRoZSBmaXJtd2FyZSB1cGRhdGVzLCBib3RoIHRoZSANCkMgaGVhZGVycyBh
bmQgcnVzdCBoZWFkZXJzIG5lZWRzIHRvIGJlIHVwZGF0ZWQgYWNjb3JkaW5nbHkgZHVlIHRvIEFC
SSANCmNoYW5nZXMuDQoNCkkgd2FzIHRoaW5raW5nIGlmIHRoYXQgcHJvY2VzcyBjYW4gYmUgb3B0
aW1pemVkLCBhdCBsZWFzdCB0cnlpbmcgdG8gDQphdm9pZCB0aGUgc3luYyBwcm9jZXNzLCB3aGlj
aCBtaWdodCBiZSBwYWluZnVsIGlmIHRoZSBhbW91bnQgb2YgdGhlIA0KaGVhZGVycyBhcmUgaHVn
ZS4NCg0KPj4NCj4+IDMpIEFsc28gcmUtdXNpbmcgQyBiaW5kaW5ncyBnZW5lcmF0aW9uIGluIHRo
ZSBrZXJuZWwgY2FtZSB0byBteSBtaW5kDQo+PiB3aGVuIHRoaW5raW5nIG9mIHRoaXMgcHJvYmxl
bSwgc2luY2UgaXQgYWxsb3dzIHRoZSBydXN0IGNvZGUgdG8gYWNjZXNzDQo+PiB0aGUgQyBzdHJ1
Y3QsIGJ1dCB0aGV5IGRvbid0IGhhdmUgdGhlIGJvdW5kYXJ5IGNoZWNrLiBTdGlsbCBuZWVkIGFu
b3RoZXINCj4+IGxheWVyL21hY3JvcyB0byB3cmFwIGl0Lg0KPiANCj4gSSB0aGluayB3ZSBzaG91
bGQgaGF2ZSB0aGUgc3RydWN0dXJlIGRlZmluaXRpb25zIGluIFJ1c3QgZGlyZWN0bHkuDQo+IA0K
PiAtIERhbmlsbw0KPiANCj4+DQo+Pg0KPj4+Pg0KPj4+PiBUaGFua3MsDQo+Pj4+IFpoaS4NCj4+
Pj4NCj4gDQoNCg==
