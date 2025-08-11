Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E2AB20293
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 11:05:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4424010E3A6;
	Mon, 11 Aug 2025 09:05:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ifUIKG9P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B893410E2F0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 09:05:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KDUN+4b0duYxKvGjxKO9UgIzqSQTIK8tBSBmEizZd/g+J44E09QIzScc8SiUFOBl71VN+tHalyRDvfMZ+RG+gZKprvZMg78hvTCBKbM8aEf8g3Hpnki+vrcedyAUEZCJcpaUXpuJ6C4/YC7wcpCBCE0wyOP0KPMr0ZgvNDZOySNEL/5Ln4v3N/GeGENpCr4tbNNxrOajSJ7/cbEIIobPBMx2hTUhehwMZ82OZ0t/6m7VCDJG4mHgd0Qd+WSq2T0xUU+hT5mWCfdmOtY2rjhQCCe/CU9jmNVl8Qb69oXa+ebq6fg8wFu24R0dhax17bf8eV9CQMDIDsPJEotUcS3exQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6LJ3Z3JCmQwQtN7B4lvAptaJVMmpsC3Rb2jKNy6uffI=;
 b=bffZf90KegbmFryR6r4sGmP8mbfOvCeeJdZ0YTFTvLZLKunIN9AUwFHwTYxzLTQ9VKB9dmuNRe+jSzsIcDI4rQpFICNmobZ1UVn9tZfkXPApEUjymuKUbjKQp2ywjQnnGGGayX+VLqGK5MrqQ2iwMK1biWf4IAup9yA3EzuZCaKFjBFOjUjaCbKQZZyBFXY2C/oSDNizp3/DUXsuLNN8gR7RwopO8AtPw04vI2Y0dH/5j5kmi/kwfqPos81tkdatcEPijGszLaN0lh3tu6c7O/+H4BBIGD53SJvUEZ4tvRxocfNXm+o7Ik/exQKAdujxsbpaSjDrUFAWoy7ASeZ6Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6LJ3Z3JCmQwQtN7B4lvAptaJVMmpsC3Rb2jKNy6uffI=;
 b=ifUIKG9PuZizYvpApxYIojMdw3iqpUJzppIyUXtqRXzHi0v1sUDmkHhMm/V4N8oHX03FRr83SAfDc+O5YUa8IJa6+wckQiMPN81gk9bXa2dX5GmgcDzQe3mIxHMVpIfUZwUDuJhrWnRIlKhcPO+PazkwGf2C6vBrw6Wds1FYr18=
Received: from DM4PR12MB6134.namprd12.prod.outlook.com (2603:10b6:8:ad::16) by
 CH2PR12MB4216.namprd12.prod.outlook.com (2603:10b6:610:a8::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.17; Mon, 11 Aug 2025 09:05:21 +0000
Received: from DM4PR12MB6134.namprd12.prod.outlook.com
 ([fe80::d989:2e7e:7809:bf21]) by DM4PR12MB6134.namprd12.prod.outlook.com
 ([fe80::d989:2e7e:7809:bf21%7]) with mapi id 15.20.9009.013; Mon, 11 Aug 2025
 09:05:21 +0000
From: "Liu01, Tong (Esther)" <Tong.Liu01@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "phasta@kernel.org" <phasta@kernel.org>, "dakr@kernel.org"
 <dakr@kernel.org>, "matthew.brost@intel.com" <matthew.brost@intel.com>, "Ba,
 Gang" <Gang.Ba@amd.com>, "matthew.schwartz@linux.dev"
 <matthew.schwartz@linux.dev>, "cao, lin" <lin.cao@amd.com>, "cao, lin"
 <lin.cao@amd.com>
Subject: RE: [PATCH] drm/amdgpu: fix task hang from failed job submission
 during process kill
Thread-Topic: [PATCH] drm/amdgpu: fix task hang from failed job submission
 during process kill
Thread-Index: AQHcCpCC4/JlspjK0kyj6HNvBty6hLRdHcoAgAAIuaA=
Date: Mon, 11 Aug 2025 09:05:21 +0000
Message-ID: <DM4PR12MB613427A4B81ED0A910B530B59028A@DM4PR12MB6134.namprd12.prod.outlook.com>
References: <20250811072050.3838241-1-Tong.Liu01@amd.com>
 <b2e02500-0d50-4d84-8ec5-fb8cb753c91a@amd.com>
In-Reply-To: <b2e02500-0d50-4d84-8ec5-fb8cb753c91a@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-08-11T08:56:26.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB6134:EE_|CH2PR12MB4216:EE_
x-ms-office365-filtering-correlation-id: de7fc127-d7e8-47d2-1972-08ddd8b63341
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?NVcxQk9abG96SWxWMDRleEc1VC9nSkdVT1RkeWpJVmxpQ2NibWtGRUdkMVM4?=
 =?utf-8?B?U2IxV0lQTzRaMkNRVVV4ZWhXV1V5elVsdTJEMjZJR3RLRXZWalJkTXhCRGd0?=
 =?utf-8?B?N0NmZnRQcTQ4alFweFdra3dJQk1nY2ROM1BhS1NZL2U0U0dWNzlyZzF6MmFF?=
 =?utf-8?B?bXNMY2x1Wi9LVm5PVlN0QVk5Z1o0WnJTaUZ3Tm8rcGYxQ2NZU1ZDT0F3djBz?=
 =?utf-8?B?TXNtZVcxV0JHbXdTZk1CTTBRT3dCRFRGRnBrZWl3Mzh2Tmc0RE5jeUpWOExz?=
 =?utf-8?B?bUFza0tEa2FjVFFsWm0wUk1UaTBvR0hIaUlwT2hscUdrd2hEVEFxZHBGQzVy?=
 =?utf-8?B?M1Z1TmNFUXEvYnV5QXFEU21mb3EycWZhVDh5Mk5LOGtqcVBGWTU4RjNhMnVJ?=
 =?utf-8?B?ZTZOZktOa1BiZEhJcC9RTHJEWjMzbVBsblYxcUUzSjZZK2dvTnBNL3NUZDBs?=
 =?utf-8?B?TXlhMm5vZXRhallWQnl4K0pkZVE4RUE5U1crUzN0cDFIdzlJMzk2V25kWmkv?=
 =?utf-8?B?RTI0amJpeU1GOFRzcmxrQ3cxSnRiMnRVNHJxMGpNY1ZBaEJScFJNT3BGU2pu?=
 =?utf-8?B?eE12Q1I5MEJvNjc2UHRUWTRERnFXSTZ3T1gydURzVVhOUzNPY3FOa3lUckhM?=
 =?utf-8?B?Wmo0eVkwemxYRlZIZDZ3TnE2Wk05eXZXMitjclNuaEtGKzMxREVxTEpDcDRS?=
 =?utf-8?B?bXV2OENCRXEzZkVnNFNYTk4rRzhZZkRWTmpnTnZZWHM0Qlo3UHJZcUQxY3dR?=
 =?utf-8?B?bzg5VC96T3d3OFg5eW4vUjFhMGYrcUczSG5UVFZGb1RHVmVkOG5WVzFCZ0JG?=
 =?utf-8?B?cHpJSHBkTWJZWFVTRllvTjhIV0pmaGdXejlXbDlBL284bXU1Sk5XdnZsVUQ3?=
 =?utf-8?B?V24xd2YyNk9WTWlQbXNCeTJlaHk3UnRHckVKclBuQUYyVkszcDdwckpVTzBp?=
 =?utf-8?B?RWhqUUptbitqZmx6RldQN3VYVGlJNkNKYjI2dDhCNU1rTG1FZlRRcG5aOUtz?=
 =?utf-8?B?RjJ2WTk1TDk3WTF1QlAwcUdJVHhOYndGQTh1QmhqRFBIL0paNDFBTEQ0TnJM?=
 =?utf-8?B?dlVYRG5PQ3BTVlVZdHVwRWRXbGZyNGFPY2oxWjl1TWE5Zmp6SlFHVUlQaDI5?=
 =?utf-8?B?emlraEJvV1pjUmhEY2JHWjhhb3F0ZGt2M1h3QjNXWkRhSUwrTkladWJoK2Zz?=
 =?utf-8?B?T2dGRGw4QWp5ZTV3dXBMb01ZbXRyd0VuSUY4RC9QK3lha1VMdFQ4U2JHMC9z?=
 =?utf-8?B?Y0RzeThaekszQWwrZmdQMlIyeDUycHE1NE83b0hZVm1JMWkydVczdkdlV0Zl?=
 =?utf-8?B?REJ0eFJ5VE9jQUc0dDJGNmViUmdHUklQZUdrb2k3ZXZ5MEM0QzZja25jcHg5?=
 =?utf-8?B?K1F0WmROYnhJeEZmMEh2aEw3clhVTXN0dkdpYm9wZVJRUEU2bFJMZHcxTStX?=
 =?utf-8?B?NS90cmdiVjhEdDhhaS8xclRLZnlQRHNsVDRXblhmSkJ6SVgxUVNreHpDb2Va?=
 =?utf-8?B?OWR1VzIwcDdoRTJzbDYwRnM2K2U0S2M3K2VMWnl4MlZjNk9UOFdYSm16a2RP?=
 =?utf-8?B?WTlQcHRLRCtqdWtza2xkOHlZNFR0OGhFTXRDQXV6Z2sxRGw4di82UHYzRytC?=
 =?utf-8?B?d1Fta1lEUWxsd0EybUtLeTcvS0wyREo0emswbktUbytoVDlSK3BZV2hreERZ?=
 =?utf-8?B?aVhIT3F3Qk56QXVYNDJlYzdHUTRjZkp6RGZLdE96cUgvNTJOUXF5Y0xyQ0gy?=
 =?utf-8?B?RUhCa0ZmeGxWRUg1dGJkcWliM3dJdUNNb2QrdDF1SUZDSjF0T29tSFpHa053?=
 =?utf-8?B?T1c0Q1VwUDZ3VXhWL204Y01Vbk5BTjlpOFhjaURTWWRiRW0vN0hUcFBPTDJO?=
 =?utf-8?B?Yk9meGpKanVoc2d4VjUvaDIvL0ZBV090bTV0WU81TkdyR21VM1hTUEtGdzY2?=
 =?utf-8?B?dGVFQVpMa1hRQnNac2tkQmZkRDRYY3Q3M25hVUJSVHRwdjJ4VlF4NXFmWWo2?=
 =?utf-8?Q?Cajpj6SBRhkRpgPssTAaJravQBsHwQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6134.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OTdoNUJHNFhlb0ozVUo1eFJuUkNWVkhvK0RpZ0xjTHMyUVF6NlZoNGQ0R2gz?=
 =?utf-8?B?RVNVOHczMGJvLzN1TitlcmJGeVlRSTF6dTZkbHB0UFlGMjNNK3VTS0c1NldN?=
 =?utf-8?B?TzdVbHQ0d1I4OG9xbHVSQ1M5NVY1WFJrQWhhdGdwUWdYVUFxM2toSFRsMWdS?=
 =?utf-8?B?SHQ5N2liV0xDUzcrMno3bU1LQUN1WGdQUUxiV083Ukx3NmhGYURmT0RqRGRk?=
 =?utf-8?B?RFlLb0FNUEErV3I0Q1R5eXAzVVNldDNTWTdGU1c5VVZaL0xQMHRsQmxIVmpR?=
 =?utf-8?B?MXZlYjh6MmZSMDhCOGZHWnlVUVpoQU5UR0IzeFBoazFOMGhiYnZ6UGx1czk2?=
 =?utf-8?B?MHp0UjVUOU9Mb0JBVDJYQ2dvMUloZVFPejM0dndwVjUxbk9DTHJvNXNXQnJM?=
 =?utf-8?B?ZktPMEh2eUIxQmZuZVFzSkJTa01IRzNlUm5FQzB3d2Znd3hhZ213VzNWTVpw?=
 =?utf-8?B?RkxHamNhcmlEOC9sWU5BVUIvQUQwN2pVSm4vZ1BlcHBKNzRzMGQ1dnlBZENN?=
 =?utf-8?B?Z1NVUkJtVTkxcFhUYjFUWTRSREJWeWI5SlltcXpyWnMwRDhRRXF3aW9sWkR6?=
 =?utf-8?B?ZnliSnlyN3NqV2pNemlleHBFS3Y0R3MzdTJPbnBUNThmc1NvUlQrc211QSta?=
 =?utf-8?B?SDBIaU9EejR6QWxyK3B3S1JacDFMWVo3cGJWb0JUd0wrWUwweGdNV0ozVCtM?=
 =?utf-8?B?ME90WTNFZWc0aEdNcW54cVgvTTYvOW90R3dFNzNsSUR5YnRQL0paam5iT3BQ?=
 =?utf-8?B?V2pLcS9rNnEyVzVKSytYaEQ2Snkyc1MwUGQ2ZjhhODQ2a0pmSHRMTDhoOVZr?=
 =?utf-8?B?U21CODNLMG9Ib1dhMFhXR2JBcFNDRzRGeWo5OG1scWJmdnNxTlR6YUkwNEx6?=
 =?utf-8?B?QUUvZGc3Q1NjS0lrUXFpdnpiOG9SOGlRWHlDZjd0TS9JaXVCTkZieE9DV3hj?=
 =?utf-8?B?eDhIOTVxOWdXcGJFTHFaTTgxSGs2clE3MHlqbGdQRS9qb1F0WmFMd2lHRUxT?=
 =?utf-8?B?aE5IKzFqMmpuSGJaY0U4bm00aU1CbFRSU3hOOG9TQnM1TDlOTDFRUUdBK28x?=
 =?utf-8?B?a2tLYlI2cmlndWtUeGFqQ3draTZYYXAvKy9YalFaSnZvU0FhYnJUMWhvckN4?=
 =?utf-8?B?c2NGL3FaZ0FWNjUvaXZpekpjNnNhaHlianFqTEtrWjd4TkdoUFljaUx1OHBs?=
 =?utf-8?B?RnZXMnFhYUxaeFVEWGU5VW5HYWpmSkZCNTZkeWZoK081WVg2LzZNTXhpeUor?=
 =?utf-8?B?aVByem1mbkZ6UEdoVE9TdytPZG1CeFJXREp6Y0ZNaWdpZnBQQjY4KzdPZUVG?=
 =?utf-8?B?YlhNNDlKR3Z6REpuWkJmUU9sa1FaTDRRMnlnTDJPVStueU9FbmVFS2htSHRn?=
 =?utf-8?B?WW9McEVmZHhKUjRmbEpzK0VwWFlZbTF6TE9yVGY4RmlKSlYvejhJSk1oN1Mr?=
 =?utf-8?B?OGpiR21ydEwxSWhyWVlvdGdJa3Q0b041eEdkcCt1YkU2OXhESC91K1NwMEFs?=
 =?utf-8?B?Y21WcUl1NVJRNGRCWGREaElSSmluZGNQQlFPSUVEUXhyVkJPUloydm95NFZO?=
 =?utf-8?B?M2VFMFYwYlRZS2F6QThOK2haN3lmblBDMForSnVPaXJEYnVyREY2ZTArS09R?=
 =?utf-8?B?bW0wZlJqbGF5dHgxYmp5QVVYM1RTdDFqVFpndEE2Q1Brd0VJRUhQc1pGNHFV?=
 =?utf-8?B?V05SZjM5ejJtc1pieU9IYWFmR1BkYjl5WU92UmZXd01GcXlBQlo5U0sveENn?=
 =?utf-8?B?bHVLK3lmdWRJdzR2QnJVd3pYNk8zcVhPYUdvVnFKVVFyRGlsdGdrUXJBTHFO?=
 =?utf-8?B?dGZKZko1SHdSeDBIRlNsN0NudXpWSzdReXVuMXJOc2ptUkI2NjN0T0x1YjNi?=
 =?utf-8?B?dm5TeGRnRURCTmM0S0h6a2pGR2RxelNNQkZVWUN0Qks0MXloRnU0bWUxd3VL?=
 =?utf-8?B?QmlwNTFIeDd6SnBwU01keW5HTzRIRXhYZnJUNnFDNEV2Smg1L2cwbCtzcmFH?=
 =?utf-8?B?SDRIL3NJWS81TWN2dXZwNU1wRUtXYStldnhYckx5RHJyQTZoUG9rNW1CT2k5?=
 =?utf-8?B?a1daaTF6RDlBUkxCeWpXTVJnMHgzaENtandEdDN3SjFhT2NibDRrTnNhZUF3?=
 =?utf-8?Q?DDd8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6134.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de7fc127-d7e8-47d2-1972-08ddd8b63341
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2025 09:05:21.1687 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RhGSyUTyUprpBxit6UPXoxFZc2YzXkjLojTu1BpwdIHC6wT7aHW2VjOoDIG74ap1kZLtqvFQd11MJwxwW5nsog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4216
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

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KSGkgQ2hyaXN0aWFuLA0KDQpUaGUgcmVhbCBpc3N1ZSBpcyBhIHJhY2UgY29uZGl0aW9uIGR1
cmluZyBwcm9jZXNzIGV4aXQgYWZ0ZXIgcGF0Y2ggaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L2NvbW1pdC8/aWQ9MWYwMmYy
MDQ0YmRhMWRiMWZkOTk1YmMzNTk2MWFiMDc1ZmE3YjVhMi4gVGhpcyBwYXRjaCBjaGFuZ2VkIGFt
ZGdwdV92bV93YWl0X2lkbGUgdG8gdXNlIGRybV9zY2hlZF9lbnRpdHlfZmx1c2ggaW5zdGVhZCBv
ZiBkbWFfcmVzdl93YWl0X3RpbWVvdXQuIEhlcmUgaXMgd2hhdCBoYXBwZW5zOg0KDQpkb19leGl0
DQogICAgfA0KICAgIGV4aXRfZmlsZXModHNrKSAuLi4gYW1kZ3B1X2ZsdXNoIC4uLiBhbWRncHVf
dm1fd2FpdF9pZGxlIC4uLiBkcm1fc2NoZWRfZW50aXR5X2ZsdXNoIChraWxscyBlbnRpdHkpDQog
ICAgLi4uDQogICAgZXhpdF90YXNrX3dvcmsodHNrKSAuLi5hbWRncHVfZ2VtX29iamVjdF9jbG9z
ZSAgLi4uICBhbWRncHVfdm1fY2xlYXJfZnJlZWQgKHRyaWVzIHRvIHN1Ym1pdCB0byBraWxsZWQg
ZW50aXR5KQ0KDQpUaGUgZW50aXR5IGdldHMga2lsbGVkIGluIGFtZGdwdV92bV93YWl0X2lkbGUo
KSwgYnV0IGFtZGdwdV92bV9jbGVhcl9mcmVlZCgpIGNhbGxlZCBieSBleGl0X3Rhc2tfd29yaygp
IHN0aWxsIHRyaWVzIHRvIHN1Ym1pdCBqb2JzLg0KDQpLaW5kIHJlZ2FyZHMsDQpFc3RoZXINCg0K
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEtvZW5pZywgQ2hyaXN0aWFuIDxDaHJp
c3RpYW4uS29lbmlnQGFtZC5jb20+DQpTZW50OiBNb25kYXksIEF1Z3VzdCAxMSwgMjAyNSA0OjI1
IFBNDQpUbzogTGl1MDEsIFRvbmcgKEVzdGhlcikgPFRvbmcuTGl1MDFAYW1kLmNvbT47IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBwaGFzdGFAa2VybmVsLm9yZzsgZGFrckBr
ZXJuZWwub3JnOyBtYXR0aGV3LmJyb3N0QGludGVsLmNvbTsgQmEsIEdhbmcgPEdhbmcuQmFAYW1k
LmNvbT47IG1hdHRoZXcuc2Nod2FydHpAbGludXguZGV2OyBjYW8sIGxpbiA8bGluLmNhb0BhbWQu
Y29tPjsgY2FvLCBsaW4gPGxpbi5jYW9AYW1kLmNvbT4NClN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRy
bS9hbWRncHU6IGZpeCB0YXNrIGhhbmcgZnJvbSBmYWlsZWQgam9iIHN1Ym1pc3Npb24gZHVyaW5n
IHByb2Nlc3Mga2lsbA0KDQpPbiAxMS4wOC4yNSAwOToyMCwgTGl1MDEgVG9uZyB3cm90ZToNCj4g
RHVyaW5nIHByb2Nlc3Mga2lsbCwgZHJtX3NjaGVkX2VudGl0eV9mbHVzaCgpIHdpbGwga2lsbCB0
aGUgdm0NCj4gZW50aXRpZXMuIFRoZSBmb2xsb3dpbmcgam9iIHN1Ym1pc3Npb25zIG9mIHRoaXMg
cHJvY2VzcyB3aWxsIGZhaWwNCg0KV2VsbCB3aGVuIHRoZSBwcm9jZXNzIGlzIGtpbGxlZCBob3cg
Y2FuIGl0IHN0aWxsIG1ha2Ugam9iIHN1Ym1pc3Npb25zPw0KDQpSZWdhcmRzLA0KQ2hyaXN0aWFu
Lg0KDQo+LCBhbmQNCj4gdGhlIHJlc291cmNlcyBvZiB0aGVzZSBqb2JzIGhhdmUgbm90IGJlZW4g
cmVsZWFzZWQsIG5vciBoYXZlIHRoZQ0KPmZlbmNlcyAgYmVlbiBzaWduYWxsZWQsIGNhdXNpbmcg
dGFza3MgdG8gaGFuZy4NCj4NCj4gRml4IGJ5IG5vdCBkb2luZyBqb2IgaW5pdCB3aGVuIHRoZSBl
bnRpdHkgaXMgc3RvcHBlZC4gQW5kIHdoZW4gdGhlIGpvYg0KPiBpcyBhbHJlYWR5IHN1Ym1pdHRl
ZCwgZnJlZSB0aGUgam9iIHJlc291cmNlIGlmIHRoZSBlbnRpdHkgaXMgc3RvcHBlZC4NCj4NCj4g
U2lnbmVkLW9mZi1ieTogTGl1MDEgVG9uZyA8VG9uZy5MaXUwMUBhbWQuY29tPg0KPiBTaWduZWQt
b2ZmLWJ5OiBMaW4uQ2FvIDxsaW5jYW8xMkBhbWQuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1
L2RybS9zY2hlZHVsZXIvc2NoZWRfZW50aXR5LmMgfCAxMyArKysrKysrLS0tLS0tDQo+ICBkcml2
ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYyAgIHwgIDUgKysrKysNCj4gIDIgZmls
ZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfZW50aXR5LmMNCj4gYi9kcml2
ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX2VudGl0eS5jDQo+IGluZGV4IGFjNjc4ZGU3ZmU1
ZS4uMWU3NDRiMmViMmRiIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVy
L3NjaGVkX2VudGl0eS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRf
ZW50aXR5LmMNCj4gQEAgLTU3MCw2ICs1NzAsMTMgQEAgdm9pZCBkcm1fc2NoZWRfZW50aXR5X3B1
c2hfam9iKHN0cnVjdCBkcm1fc2NoZWRfam9iICpzY2hlZF9qb2IpDQo+ICAgICAgIGJvb2wgZmly
c3Q7DQo+ICAgICAgIGt0aW1lX3Qgc3VibWl0X3RzOw0KPg0KPiArICAgICBpZiAoZW50aXR5LT5z
dG9wcGVkKSB7DQo+ICsgICAgICAgICAgICAgRFJNX0VSUk9SKCJUcnlpbmcgdG8gcHVzaCBqb2Ig
dG8gYSBraWxsZWQgZW50aXR5XG4iKTsNCj4gKyAgICAgICAgICAgICBJTklUX1dPUksoJnNjaGVk
X2pvYi0+d29yaywgZHJtX3NjaGVkX2VudGl0eV9raWxsX2pvYnNfd29yayk7DQo+ICsgICAgICAg
ICAgICAgc2NoZWR1bGVfd29yaygmc2NoZWRfam9iLT53b3JrKTsNCj4gKyAgICAgICAgICAgICBy
ZXR1cm47DQo+ICsgICAgIH0NCj4gKw0KPiAgICAgICB0cmFjZV9kcm1fc2NoZWRfam9iKHNjaGVk
X2pvYiwgZW50aXR5KTsNCj4gICAgICAgYXRvbWljX2luYyhlbnRpdHktPnJxLT5zY2hlZC0+c2Nv
cmUpOw0KPiAgICAgICBXUklURV9PTkNFKGVudGl0eS0+bGFzdF91c2VyLCBjdXJyZW50LT5ncm91
cF9sZWFkZXIpOyBAQCAtNTg5LDEyDQo+ICs1OTYsNiBAQCB2b2lkIGRybV9zY2hlZF9lbnRpdHlf
cHVzaF9qb2Ioc3RydWN0IGRybV9zY2hlZF9qb2INCj4gKnNjaGVkX2pvYikNCj4NCj4gICAgICAg
ICAgICAgICAvKiBBZGQgdGhlIGVudGl0eSB0byB0aGUgcnVuIHF1ZXVlICovDQo+ICAgICAgICAg
ICAgICAgc3Bpbl9sb2NrKCZlbnRpdHktPmxvY2spOw0KPiAtICAgICAgICAgICAgIGlmIChlbnRp
dHktPnN0b3BwZWQpIHsNCj4gLSAgICAgICAgICAgICAgICAgICAgIHNwaW5fdW5sb2NrKCZlbnRp
dHktPmxvY2spOw0KPiAtDQo+IC0gICAgICAgICAgICAgICAgICAgICBEUk1fRVJST1IoIlRyeWlu
ZyB0byBwdXNoIHRvIGEga2lsbGVkIGVudGl0eVxuIik7DQo+IC0gICAgICAgICAgICAgICAgICAg
ICByZXR1cm47DQo+IC0gICAgICAgICAgICAgfQ0KPg0KPiAgICAgICAgICAgICAgIHJxID0gZW50
aXR5LT5ycTsNCj4gICAgICAgICAgICAgICBzY2hlZCA9IHJxLT5zY2hlZDsNCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jDQo+IGIvZHJpdmVycy9n
cHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMNCj4gaW5kZXggYmZlYTYwOGE3MTA2Li5jMTVi
MTdkOWZmZTMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRf
bWFpbi5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jDQo+
IEBAIC03OTUsNiArNzk1LDExIEBAIGludCBkcm1fc2NoZWRfam9iX2luaXQoc3RydWN0IGRybV9z
Y2hlZF9qb2IgKmpvYiwNCj4gICAgICAgICAgICAgICByZXR1cm4gLUVOT0VOVDsNCj4gICAgICAg
fQ0KPg0KPiArICAgICBpZiAodW5saWtlbHkoZW50aXR5LT5zdG9wcGVkKSkgew0KPiArICAgICAg
ICAgICAgIHByX2VycigiKkVSUk9SKiAlczogZW50aXR5IGlzIHN0b3BwZWQhXG4iLCBfX2Z1bmNf
Xyk7DQo+ICsgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ICsgICAgIH0NCj4gKw0KPiAg
ICAgICBpZiAodW5saWtlbHkoIWNyZWRpdHMpKSB7DQo+ICAgICAgICAgICAgICAgcHJfZXJyKCIq
RVJST1IqICVzOiBjcmVkaXRzIGNhbm5vdCBiZSAwIVxuIiwgX19mdW5jX18pOw0KPiAgICAgICAg
ICAgICAgIHJldHVybiAtRUlOVkFMOw0KDQo=
