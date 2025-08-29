Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DBFB3C29C
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 20:45:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CC3610E104;
	Fri, 29 Aug 2025 18:45:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="T8k0ZziO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A2F10E04A;
 Fri, 29 Aug 2025 18:45:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f/ZHAwubBF82O7BAYf1SdVGpCONREnCtCcgJoweolj690Ay9bjI+VMerqzujqhb76lQg/AXDn57GGo8P3ztlXuajc1NUAhxQMGnm5TKGbAbUM3ms7CuAAK6Y5IbV3NDdeUZQQPYa3hfbj1C4scJK+iyve+yTmZDD3TtSELGOTPyQjjPG6sCD2HKpX71KMt0xzebaYXLDaZc4Wwp0w1Ou23l9OnWMKELrU+qhxhO33XLSmwYZ3MDLeYRBBPI3mEamDTftBpG9stLKAPsS1MjM2WapuwbRs5zSN9mrsEG+vK2EI3YbsKmZHnc57joHPV6shmeqeFMPR+jjfTyO7o2cPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7hTF1azlV0B8kPByjb8XWrVla4T/VWKKbPyZVKo6kwU=;
 b=a7Bz8sWq12jFN1NkJp/iLZAMpaXO7o0pNsXSJKXbMYZ1ZnMo/4/jfnMnwsq23TBKfgmRRNJ2AVN/4OKEOt/m0kOEA6rRIgzteeJGMRZkhU4k3kQTWU9g1I+3pxaSWMvldU9QjIlw8ATYMYh5tdRULKE0HPDrWFZzYPyA5XB1qlHFwob3/4vLpPqni17tMVkSNJyqGrYACEzRn49p10HhCRJXxWvIxuusUqZPLfs8gLoMG3RfG7IYOD6WkBCBCbg+64UTMaTC7+B1uvTQYnX8kEjhQ6G3r0ajRejeGjz/UdVSU7FT1rWreoFDent+mVbqZcVV9ViNnd8PRAQPsh/3Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7hTF1azlV0B8kPByjb8XWrVla4T/VWKKbPyZVKo6kwU=;
 b=T8k0ZziOBZVqQDS8Vsj6PqGjT8jiFJWK2mgw0Y9flOeFaJAImw07busFltUcTqUfX97wmJd44gIR8QtaI+wJeNvgx2rQHwA8n6Wj50h7imMDgoFDYVxDdxDMHvigllG+JeY2fSR4EBgJ2bPyCYmkhOUhREj6wNn2+OPlrMO+IScFBKWx9FmGnKRcBJXMHU2GmZtyu9OAYAO+JjiuG8VCvA/plycO+3Z2DzELRJvDutDt6e+6t9J1TKv3xSWgINTYNGKOPHB1hzJ0zrgG+twwo+WXeiMQLmqCXdx+iMnlzE3r+rTQyeqRF6idvktbP2t94oHHFVl0xSVtkgtfNmGZWg==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by CH2PR12MB4197.namprd12.prod.outlook.com (2603:10b6:610:ab::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Fri, 29 Aug
 2025 18:44:53 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%6]) with mapi id 15.20.9052.021; Fri, 29 Aug 2025
 18:44:53 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Joel
 Fernandes <joelagnelf@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre
 Courbot <acourbot@nvidia.com>
CC: "joel@joelfernandes.org" <joel@joelfernandes.org>, "lossin@kernel.org"
 <lossin@kernel.org>, "ojeda@kernel.org" <ojeda@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, "a.hindborg@kernel.org"
 <a.hindborg@kernel.org>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "tmgross@umich.edu" <tmgross@umich.edu>, "alex.gaynor@gmail.com"
 <alex.gaynor@gmail.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, John Hubbard
 <jhubbard@nvidia.com>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "bjorn3_gh@protonmail.com"
 <bjorn3_gh@protonmail.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>, "gary@garyguo.net"
 <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH 05/17] nova-core: gsp: Add support for checking if GSP
 reloaded
Thread-Topic: [PATCH 05/17] nova-core: gsp: Add support for checking if GSP
 reloaded
Thread-Index: AQHcGQsDhaX7vmsICUemtT50I07Z3LR59+wA
Date: Fri, 29 Aug 2025 18:44:53 +0000
Message-ID: <a251efc542a49e95fd7b7032bdd1092253f967b4.camel@nvidia.com>
References: <20250829173254.2068763-1-joelagnelf@nvidia.com>
 <20250829173254.2068763-6-joelagnelf@nvidia.com>
In-Reply-To: <20250829173254.2068763-6-joelagnelf@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|CH2PR12MB4197:EE_
x-ms-office365-filtering-correlation-id: 29938086-2c38-4acf-ba22-08dde72c2476
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?OWNHY2FkZHNtMUVmVy9UUC8xNEVvNTY3UEtvVnJHM2kzSTZtL0xjR1dmUjhp?=
 =?utf-8?B?K21BZ1dRZkw0YjIyWjdDbE0vUk12UzFEbFBuNDc3OVg3SGoyc3lPR1Nzcnlh?=
 =?utf-8?B?d29GUjRSdGMxVFVFV3lYZko2UWZmbG1zeEcyUEowZ29LM091Z04xV2QrRGF6?=
 =?utf-8?B?SWxPMDg2U1cwaUx3T1pWajdaL2VJL01VcUcxaUg5K1VpNmJlc2t6TFo1MlZQ?=
 =?utf-8?B?RmxrVjd4Y2Z0TmUvWEhnZHJvQjJ3MGFDMWkyVWNzemJYVjgyRG9jU1BTVm9p?=
 =?utf-8?B?U2pTalAzbTZPcVVZWWtwU09YRm9vSVVuNnFMdkEyem5IK3R4UTdUaUwzcmpM?=
 =?utf-8?B?M0h0eThTZnY4WVNsMStJSlh1RDEwNTF4ZXZJWnJBdldXZURhTi8xdDVmMzM2?=
 =?utf-8?B?bTRVcFFwVk1zVEVRRktGVi9EZWg2bCsrVm1EU3kza3FYb0NXOHpoUWF6YmRE?=
 =?utf-8?B?aCs2NTVJQTc2NGRwdnZzcE9zemhVbXJMVlpsdWsrTWJZRERPbDdReWxpMDg2?=
 =?utf-8?B?MUZPY2lQUUZiU0krQm9aL2U5OFdtV3lxeHV3cnJsejBMcFpaSUdpU1FWZm5p?=
 =?utf-8?B?MCt6WUlvKysxeFJJbkcrWC9kclE5ejlpcGhrWExvOWFvaGc2WTZTVFRPdkFH?=
 =?utf-8?B?NGE3MTlDekEvd2txYTB6bWFGc21iU1Y5NkJZNGE1dk14OU1uQ2VENS9QZWxV?=
 =?utf-8?B?WW5scGM4SEFyeEtBSVovRkRIUjZKd29tRHQvTHdPbHVBcURKWVhXNTZDWnRq?=
 =?utf-8?B?cklPUUJQdWNOR3FSVmdra3B2dDd0V2VxUXlkTkk0K3pSTDNRRTRpVWdCeFoz?=
 =?utf-8?B?Y2ZYNUVYR3lWUG5jK1UrYmtwZG9oaTRtNnZUZFNtbG0xMFhOOWNNTHRXYzZ3?=
 =?utf-8?B?NXRxQ01PcmxGVFlBRHZzQ3psRC8zL2gxSDVZcUpDdWhJblo3enlSbUd2Ym1n?=
 =?utf-8?B?NTVoalJyT0RTaHhzTGkxT0NPNWVxMUxWZTRaRlNWMnhvQnlmRkszZnM0R3lO?=
 =?utf-8?B?SGtGM3pvUnk5T242SVpmRDc5di9JK01FYWFnL25CekZFWjBiMHVlb0hyK294?=
 =?utf-8?B?elRaVFdrWllseXNCVU5QcGRrV1g3K05GZnV2RUh4VU9RUmVvK0hxeUg4Mk1k?=
 =?utf-8?B?K01ZTlNLVUVDQ1NTKytTelBicWptclNMYncvRjd6aU0wbUpVU0YrYWRBaHhO?=
 =?utf-8?B?UUZIRkNWMzgzaGlqclhWdWJJZFZZelNMK3NFNlFkMFNwRnNESTZ5dXBMMzlp?=
 =?utf-8?B?WC9abm5oalJLelRqeGczNmJBeVlENkZKSmxTUFh0bDZEN2RxbUtMNFU2WE9h?=
 =?utf-8?B?REhuUGZMc2NucGJsWXlESWFQY3FYaktlakx6c2lqd3NZTWJiNDcvakNPZVNu?=
 =?utf-8?B?aDBQZWtLV0VlSFFRbDJueVBINi8zYzIwdldvTVFmVTNTQWFCTk55bm5BSXRU?=
 =?utf-8?B?VDBiY0tmRGhhSHpIVERTMFVOVDlTRzJrR2VZUk5ydkJMeEoycTlZQWZQY1RO?=
 =?utf-8?B?U3JvVGc1emJTdXlKZVA4NDVzTHk2Q29CMW9sWjFCUU9oeG9pSGJtQWlvZWlv?=
 =?utf-8?B?WEs5N2o2UlVLSzE3UE1PbDRWVjV1aG45dzRXQ3JJMllzdUp0ZXZXN2N0WU9z?=
 =?utf-8?B?c2VxaEdlRXBhQVIrZzgzQUZCMWM5bWhpdTN5MzNVdEd4Y3o1UXdXQU9CR3N3?=
 =?utf-8?B?eENOSkEvYlA5WHgvTEkzcm1sNVJJWXoxN0hGNm5lK2RCVWlHNnZic2FwU1BV?=
 =?utf-8?B?N0NLaHRTVHlMbHJDelBqajVka1BvbGRmUG1HZzZtUlcySjZpNkQ4Z25QekEy?=
 =?utf-8?B?STZtN0hnZjJnQUJiZk1VVWNLVk9vWVBsajJqNFI1OWdTV2R0VTVpMnNyWXlh?=
 =?utf-8?B?QnZTL01Wd1FQQkcyY0pnMk5Ec0wwWlAyNTNSM0hMTjd4Wkl1R1VDdTQxSy9V?=
 =?utf-8?B?REtBMlBYV1dFSTA2cExINFF1bHBWaTZGRHpTcThVOTNEWGhvTzVabWRqdVVx?=
 =?utf-8?B?cFJ0Z1VLcHRBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NndJZVhNK1VIVkx6QXEzamdJcUcrcDI4T0xJamFpa01USkVLWGNUN0N6L3JQ?=
 =?utf-8?B?c05nTTNmR01qMWIzYlNDdHM4cWNFVjBQaUhMSkhRMTZzdnMrNnJiU25LWjU1?=
 =?utf-8?B?TFdWbklod0dBUW9qbVkyeWNzMzdoUzZ5bHpMQ1UzSVg5NW92STVsdUIvOFh0?=
 =?utf-8?B?Z3hmMzlDeDN2TWM0SFZPaEtCZ05nc0hDcTdJRFpVL3RPY2dmZ2t3SDQ0a1hF?=
 =?utf-8?B?M2d2NUhjOXUrajBQVldCeEFDR0VxZG1nK3h3Q1VadWRUeGRhZ3BucGtQZmNn?=
 =?utf-8?B?dzY4cWJxU1V5SHRqSlIvcnhjNncybkRIZmZJUkYwMFByS1A3M3RPY3puSHZG?=
 =?utf-8?B?Vno1V0thVGUvekZXVmpuV0tNYTB5dUEvcWhiemZYS3h4eVMrcmF3bTFocVRF?=
 =?utf-8?B?L3E0ZWwxWGlRSjc5amhydy9qY0VCOFozR3JTdlVIMEwrKzRrQUVteFF0eDVF?=
 =?utf-8?B?Q2pRdlNLdTF1TStVU3FaRWlob0pHRUlUdW1mbFQ1WlEwSzZZdGIzVEh0WkJ1?=
 =?utf-8?B?elVmODltVXFzWG5mYmQzbEZlQmR2Z3VQY3Z6WU9VekEyaEh3YTkxcmw3WUpH?=
 =?utf-8?B?ZDNsSG1vd2tpOGNvaHlKcmI1VFo3S01zMmliODRlSDd5aHhZL0pZOVJpRG9C?=
 =?utf-8?B?cWcxVVMxWnpWMlorT3NvK0F5c3NDb0d5VWVkWlo0aGJmcDNwRGdlRlhRYWxn?=
 =?utf-8?B?NWltQXNLV1hmZ2llbXJ1aVhRYXZLc2dJNXpIUjU4S0I0NDFEWXpyZFZIM0pS?=
 =?utf-8?B?YnhwVXNVbmtTRWE5REJTM2tydHkxT2J6Q1hEZFowVElWVWJITUg4S3c3VFNx?=
 =?utf-8?B?OUZSYTlEeFNwMEY5Smg5NnNucjdPdGRjSjgrc0V3TGMxQkdsbGozblF2cnJM?=
 =?utf-8?B?RW5zZmk1dkY0NnpTVEI3dytmS25EWVF2d2c1R0pCdU5LYm9IZ0dHTjh6RFhS?=
 =?utf-8?B?NHhTN1NmcTBONW9tWUY0OUdvWDBwRkJldFhVbUlYKzh2ZkpKaE8rOHJoVVdn?=
 =?utf-8?B?c3FVR0tzUFEzbDdxSytJdEtEVGZ5Vi9JdU1GMEoxb29nVTBtaEVyWjBvNHU3?=
 =?utf-8?B?ZTEwUG55WkQ3VjJsRjNoQVpBV3hQVzd6WUxhWFp1a1JDTDdFM3p2NjRUdFpi?=
 =?utf-8?B?Y0h2NnhsajJHZVEySHJvalV3UkxoZkpEaHdvVGtqQnlGcFRXTGtFQXZLMlQ2?=
 =?utf-8?B?cjNNSFJyZ2NldS8rSGNUaGQyc093eFZQcnk0bG1Za0ZIaGxxNU5NY1cwdmlx?=
 =?utf-8?B?NFJ2S0NDcjZ3RnZQeXFpMGhKTlQ5VHpwbS9QbzdyQWF2NUdVZllsbkV6ZE5E?=
 =?utf-8?B?NVl3VTJkU3B6RjNPTCtheE9VR1R5b1h3WGFRR2s2QUpVQnovNUxGUUIwR1g5?=
 =?utf-8?B?a2UrbzZvRkg4Ny80SGtUd3J3Nk5XalU5VGFqNkkwTXJ4S1RDenZGcmNmWlgz?=
 =?utf-8?B?V3I3R1hENW5kSVBXQ2xBdUVKQUhHZHF3TUZxMmdvOVpiN2Zwczd0Mk5wdms5?=
 =?utf-8?B?ME5KMDlWMmZiRERON09ibkorR0l0T3dwanljdEZtRFhURWFkSmJMZVQ3dlMr?=
 =?utf-8?B?NWk3VlFsTUFDYXNvMGFRNExuSjc3OFM1R1JaK2VKVjhsb0llZUFDdUhCbDVZ?=
 =?utf-8?B?Q0M3UWorbktZT0lmd0NIa2JFeVFPbTJEUHduRXZzSFROZDBvcHRBSXI2eTJZ?=
 =?utf-8?B?dks5T3F6TXB4TzlGc2hPaUJudWo4c0VnQjUwOFVmT2JOWTZwQVJNeEZ4MEtJ?=
 =?utf-8?B?SXowZFJ0bWlxSDNxVG0ybkthaFFDTHNNUlVsSUx4S0pRdEVKMkVoQTdPaGZX?=
 =?utf-8?B?b05vSEtBaFJlbEswVVEvbFhBMXQrblVmTVdGY0J5aVN5T05qV3pCTkdEY0xW?=
 =?utf-8?B?bGw2RjQwamM3TjladjkrZE02bE8wNXd4Smc2aTBKRGp0dDR1TGxZdW9aVVc3?=
 =?utf-8?B?Ui9lUjhrTTBBRUtwYUF0cnBFSzhHMyt0RlN4Q2ZnZWV6QzNadU40dUdCR2hZ?=
 =?utf-8?B?Y0hxMXVOWWVlaFd3NkI5VTd0alVZMEtYc2wwVC9TMmRreHQ1czgwQm1PcHBO?=
 =?utf-8?B?UERwSmR6aVlIMVdnM1NVNmJKM3gva2ZBR3M1dEY1ang3NHBmY0FsS1BCcVND?=
 =?utf-8?Q?RkeV589F+Um4v3fH3DL4jrzbn?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5A19927ADC3203448890CA31149ED41D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29938086-2c38-4acf-ba22-08dde72c2476
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2025 18:44:53.2562 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fb/dAi/gdR8sv7tHoaqAuzHN7CpGwSkSMNi28t8jRFkHJuOLiZVNRxIJtM3h7QF8nIxKULTdg7UwrSjBkfuJNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4197
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

T24gRnJpLCAyMDI1LTA4LTI5IGF0IDEzOjMyIC0wNDAwLCBKb2VsIEZlcm5hbmRlcyB3cm90ZToK
PiArwqDCoMKgIC8vLyBGdW5jdGlvbiB0byBjaGVjayBpZiBHU1AgcmVsb2FkL3Jlc3VtZSBoYXMg
Y29tcGxldGVkIGR1cmluZyB0aGUgYm9vdCBwcm9jZXNzLgo+ICvCoMKgwqAgI1tleHBlY3QoZGVh
ZF9jb2RlKV0KPiArwqDCoMKgIHB1YihjcmF0ZSkgZm4gY2hlY2tfcmVsb2FkX2NvbXBsZXRlZCgm
c2VsZiwgYmFyOiAmQmFyMCwgdGltZW91dDogRGVsdGEpIC0+IFJlc3VsdDxib29sPiB7CgpJIHRo
aW5rIHRoaXMgc2hvdWxkIGJlIHJlbmFtZWQgdG8gaXNfcmVsb2FkX2NvbXBsZXRlZCgpIGFuZCBy
ZXR1cm4ganVzdCBib29sIGluc3RlYWQgb2YgUmVzdWx0PGJvb2w+Cgo+ICvCoMKgwqDCoMKgwqDC
oCB3YWl0X29uKHRpbWVvdXQsIHx8IHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsZXQgdmFs
ID0gcmVnczo6TlZfUEdDNl9CU0lfU0VDVVJFX1NDUkFUQ0hfMTQ6OnJlYWQoYmFyKTsKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBpZiB2YWwuYm9vdF9zdGFnZV8zX2hhbmRvZmYoKSB7Cj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTb21lKHRydWUpCj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfSBlbHNlIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE5vbmUK
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4gK8KgwqDCoMKgwqDCoMKgIH0pCgpBbmQgaWYg
eW91IGluc2lzdCBvbiByZXR1cm5pbmcgUmVzdWx0PGJvb2w+LCBhdCBsZWFzdCBoYXZlIHRoaXMg
cmV0dXJuIFNvbWUoZmFsc2UpIG9yClNvbWUodmFsLmJvb3Rfc3RhZ2VfM19oYW5kb2ZmKCkpIGlu
c3RlYWQuCg==
