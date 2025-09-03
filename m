Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3675B42453
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 17:03:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 015AC10E8B0;
	Wed,  3 Sep 2025 15:03:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NoYwAtMa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061.outbound.protection.outlook.com [40.107.244.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6044D10E8AF;
 Wed,  3 Sep 2025 15:03:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aENMckUDzIOmYt/htRdCXjHjz4lmZG3EgxXNZ9+orELA5PeOSX96robaUbpDxiK+8tfBMZdTkArt3xvMvWN/4I/JIxcgXAavc4/Zn8Op49H+QGG+v8xrk0LpGd3lNC8VKzwf6cAf1nnWt96spagZ3FP7RWDnMfdckVe7QdXl6gFeGMtxaTw8uDCgMVoD0UIC9heOaBVv5eKyV2XLb6zJywEBT074/78K1onbaiBGgJzDtl9ge1VroFET4tsfknxSul+sek3/KJuyODuG1Y0c6FLtTwkud/deSlIvjVJSXkkTOj+aD5tC4HyvcRKjOxmi2n+5j3qncQWeb57eZhtbGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i13JIw98JIgPuBwP0HAlmM9XOP2BkSyfde8IbI0O8Dk=;
 b=T9P0TSA/Oe4rKp7YabtCXAv1SN2Mmv6lkzPhh3aUPMCCq4E90s4chC9X06H5fqRtcHhP9vzdi9XCs5cqfq5zTq7ORZ9BXiWh/GU1VlRQtwMSx7V1M59o82UjivGNG8kxBjjRZX58/EF36D1rNXblHSW9ExCYgsgBfrwgCJTMpIF67ZywfeAPHbsIT2XvcPhOWHYH8Z7M6LM+PIpx1ZQTKBnpVdzUkrI80VDVnISXxTaV6SWckxCeJ7m3oJXNG9K0U4TVYOYXHOBxd0keTLp+u8NbtpDjZmdDHnkmEVyJLfoYz14K7RQ7Ik1Ay2Ug6lcHRz35sFC6rNgOHx6QXobmew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i13JIw98JIgPuBwP0HAlmM9XOP2BkSyfde8IbI0O8Dk=;
 b=NoYwAtMarnwyVpgvDIRBzoxPpcIz4Ho+ged75JkepbM1J0kCJzQMJi+QDYJJNfJv0Kr1Ez8vJ8sahoMCMi24o4b7/POf6xTh/oWHW71vmDYnUsJjGrR4jhGan83K49n7s6vk91J0rBYvnDoRK+1FU2phhr+sORUBz5OprbtpeA8=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by LV5PR12MB9801.namprd12.prod.outlook.com (2603:10b6:408:2fc::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Wed, 3 Sep
 2025 15:03:12 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42%4]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 15:03:12 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Mario Limonciello <superm1@kernel.org>, Antheas Kapenekakis
 <lkml@antheas.dev>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "philm@manjaro.org" <philm@manjaro.org>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, Robert Beckett <bob.beckett@collabora.com>
Subject: RE: [PATCH v3 6/6] drm: panel-backlight-quirks: Log applied panel
 brightness quirks
Thread-Topic: [PATCH v3 6/6] drm: panel-backlight-quirks: Log applied panel
 brightness quirks
Thread-Index: AQHcGPVZWdnPI/t3Bka0oPRU4zbGN7R5uaSAgAcxjACAAKphEA==
Date: Wed, 3 Sep 2025 15:03:12 +0000
Message-ID: <BL1PR12MB5144E131D87B8B6584CF297DF701A@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20250829145541.512671-1-lkml@antheas.dev>
 <20250829145541.512671-7-lkml@antheas.dev>
 <CAGwozwHaWPwy6_LTvTy4ybdrN27fEXc-GbhYEt4_cM88_VGYPA@mail.gmail.com>
 <588626d9-eb27-4376-8741-a1cc2e2e17cf@kernel.org>
In-Reply-To: <588626d9-eb27-4376-8741-a1cc2e2e17cf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-09-03T15:02:24.0000000Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source; MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5144:EE_|LV5PR12MB9801:EE_
x-ms-office365-filtering-correlation-id: c0c01c6b-09f2-4c30-3a60-08ddeafb0086
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cTR6Mlp6UUNZcUFUQmJjUGRVcTd0OTNxV2Jsc1UvRk5uTWFNNHRBRElTY1ZO?=
 =?utf-8?B?b0xQTkRqeUljQWQ2R0l5Z1M3RjRFU0lyaVVCR3RHYm9RSmcyUHJXNzYxYkJ1?=
 =?utf-8?B?aVVvYndRbGFYQzFFUUR1VDF5RVNHMENqMnpmdkZmSjRLRFFBQ0xOVTVXZVZq?=
 =?utf-8?B?MVlPUFB5dm1TbUx2SUFOa2I5L0VwcnpjYkNHZnFMWnhJdkJYbVRZakZucEx5?=
 =?utf-8?B?VG5Vd2VlR3NMTndpYVoxVlFPWmFvMU84SmtxaXF2cEFhSHluT1QycTZxNG42?=
 =?utf-8?B?NXBqOE5HY1dkam1Dcnduc2svb01sK0tBaEwyeE94ZlE5QWRhWmJYdVpNZ29j?=
 =?utf-8?B?S3ZPWnBHMnVUVjFoaTZ2UHkvZHNUWlNrd3BmS2VVREhZWm5sWkRLRUV2R0xo?=
 =?utf-8?B?QTZ6NURZQU5CRDZ6OWhvMDVCczlCbG1rK2diamtDd2w0Uy83ZFZYTXFVMHlN?=
 =?utf-8?B?RGNUaHdieUNqb3J2dmYzMS9uZlNCOVdGYlJMcnl0dGdkMEhqU29wMHYwRjlm?=
 =?utf-8?B?R1VZd3pOUGJEa1ZURmFFOGlYNVR6eG0vcnBXTVJzbnNTSnA3WDk5eFpWTHEy?=
 =?utf-8?B?SHFSaUtiaTJsVStubi8yZUgwNU1SVmlhWHVJWi83Zm5mVEdjUmo3dHpyYU5a?=
 =?utf-8?B?b3huUzBSK2VZcm0vMGpDTkI2L052WEdHZ2Y2RXVORE8yTkNVbk1yYWU0KzNK?=
 =?utf-8?B?dlh6a2lMNU43YVZaWUZyTDRLWEZrRTIxdjYyVXZpQnNoTUxEeml1aEVUdUJu?=
 =?utf-8?B?M3pjSUc2VW93QUVuLzBPSUlxRTNmdjdnQ1hRMzlseWdpQlljcGloeEg4RkI0?=
 =?utf-8?B?S2dJZzFOcFhLNUQxV2NvRE52bE50NDREZFpCOG11T2hsbE5uS3crSmJmbVdI?=
 =?utf-8?B?QnUyaFRUYVUyeE03U1RaYzRmR3gwWHNPV0M2Z0NjQVYxQStmT3VCTmhQeXps?=
 =?utf-8?B?czAzUC9mbnBvdmFyRVpnUG95N21XYUpLeWlMVXNkbitCWnFkTDQrSzhiRkhm?=
 =?utf-8?B?WHNxM2htREdoTGs5Qkx3RllqTWxFREQ5NGU4alhHN0RUM0lIMXNESVZSQ0VC?=
 =?utf-8?B?UFhrbytOR2RjT1JUTSttZmp1UGEvYzJ4TlNmaDRDN2VRTXFiVHZ1aGdQMDRu?=
 =?utf-8?B?ekx4TGhTbWVpZzFhZ3hCQ1Z3VWNyaHJuRmxVdWlQVXMwckpYOUpjVDUrd3BL?=
 =?utf-8?B?T2VMSzZBcGhETTl2d0pvSzh6S2pUcUZ5YnZ4YUg0OENBbVBxK1ZwTzNMNjk1?=
 =?utf-8?B?NWlQR01rcW5FQk1paXA2Q1RnZUxIazVFN1FFSjNvalFYcTd0aXN5UHNCMktS?=
 =?utf-8?B?Mm9EOTgvc0lHKzJvWFFTRGowWWZUNzQ2d05jajg2Rkw0TXVSUFphalVJYzhu?=
 =?utf-8?B?RnphSGkyd0oxU3c1SVVKQ3phTzdUYkFXb1VocmZyQ25TbzAzWGJJc0RCcUhv?=
 =?utf-8?B?VUZEZTlPalAwQ3ZibW9FWC9iS2VGUTdJWG5mVWhVU2w1MldhL3NVc3dBV2RN?=
 =?utf-8?B?QVdwR3IyRWRQUWpnRmNrT01zK2V5QUhvc2ZHbERTQWRmM2ZCbkRIbEVWNVZY?=
 =?utf-8?B?T3cxZ3gzZ2Ztb0NYTmx0RFhFaW1MRjJZS0tUNW42ZHgweVduOVd0U1I1MnVO?=
 =?utf-8?B?UXIraDF1VUg2RUwreUk4WFUrM01uNW82TWdmOHEyOVJLQ0hwUWt3R2g4MEV5?=
 =?utf-8?B?WXgyTWVaSm9QMitPSVZSc0Y5UlFLZnpGbTF4dk43Y0Q1T2tRSUZEb2pzM3k2?=
 =?utf-8?B?dnVFcTVtS1d1bjlTTkRidk91RWhZREJSRjN0T3ZVZGtnaEtadzlna3pBcCth?=
 =?utf-8?B?K1NxM1lxOXRSOWd2eGYzNm5jTWYwd2NBbW5ieFAzS2x2K3Bubk5uakg3ODBS?=
 =?utf-8?B?WnNTaHQwVDV0U0M4cVI4MVZBZkxFZmRnbExUeHFFejdSdFQ5ZHh6QzRNS3ZN?=
 =?utf-8?B?V2NDbmowWi9QRjV4TitBWG0wV0VaVy9aY2VIdjdIcXFrTVlPRXVROG4xcXJS?=
 =?utf-8?B?bU1NdVR2Z2x3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MHJEYUxZcFF0UG8yak4xVDhZVmJ5WnRlbllPU211OXFIYnZMR3F5dng4UGxp?=
 =?utf-8?B?ZTNXOUVBbG9TWWd5alozR2V4Vnp0Q2l3OHgranB0dytmTzJoNVJQa2ZONTdX?=
 =?utf-8?B?U1NZSGZHcjFUZlJ3bUVmZkZvaXNDYUhhWE00SUVha1V3ajlzQVd3VENDZDNQ?=
 =?utf-8?B?aklseU81MmRmSDgzOG9tcWtxTFdjU0ZWQXMyQXBPbmpMZzhBdkxsMkRYUktB?=
 =?utf-8?B?NDVLQW5Ld2Y0VWExRjZUMzVGSnl6Qm5LNEE2MTFVRFZyaFBtSGdLQXJjbldV?=
 =?utf-8?B?RG1DcjM1QnZvRHB6VUNOY090MHZxL0RYUUhmTmhmOW50ZzJHeEVDRnBDZ1J1?=
 =?utf-8?B?UU9hcDZvbmVMU0sxcTNhNHhjMGdzdEVzemJucjZ5MXpmbzQzQ0NUN2VHQjJt?=
 =?utf-8?B?S2VJYSs2WXkvY2VKRC9oRDV4WFdlNE5RK2NjVzJRR004WENrRFZhK0gzZFhJ?=
 =?utf-8?B?bVNJSlErcXhrbTVBNWFsZUdhaW9DMmtBbGVwQ0hmNHNxbUNRQ09LeVc1bkNj?=
 =?utf-8?B?UHljdjk3MnB3QUV3S1B4UzVnL3IrbG5uTkxjL2tMOXZWMzdpSEdjUEx6eVR1?=
 =?utf-8?B?aExOeDUvYkpOODRGVlA5Zm9xQlIvVnVPR2pRL0dwNHE4dFhBS3RlZnVyM083?=
 =?utf-8?B?RjdGZmt2eHFKRGVBU05JSjQvZzBRbnpBb2RBME5aQmptVFgxK25YbExwSElo?=
 =?utf-8?B?Q21RZzFXN0xCYW1iRUpuSTJ2RVFuQkpFb2Z0M3loYTBMWXlYWVNGZlFNMnJx?=
 =?utf-8?B?T1dZZ25vWjdYVlFWNE1YdmVYQldFSzczQkt3cDNCVTZxNWpOVjRKeHp6YmJF?=
 =?utf-8?B?NlFMbEFKMkJ2V0dRUElESmxhMGtBL2JmL1A4RFpiZDAvVFFoQ0FXU3ZKSUUr?=
 =?utf-8?B?OUp0RXdnREllOWp1elJJQnJUeUhxU0tiZGVWeHF2RGlZYU1rZnVIWjFNZVRp?=
 =?utf-8?B?cEdvaHd5MEV0d1l3YUx2WlM4dUFOenU0N3k0SWoxRWpUUUNjendSRkRNMCsv?=
 =?utf-8?B?dHl5eWxLREs0djhTRjVndDJHUUs4M3pJWUM2clZLanhBdzZiS3V1SzhRM1lp?=
 =?utf-8?B?SXR2RHpadEJKc08xREluYWV4cUkvZFVtNUwxaHA4ZXZTUXBnTlZnT1ZCejFU?=
 =?utf-8?B?azhsTnZUUTZObnhvcEhuNlhiTHNlRXFMNVlRTmhkTDJ3RWRyMVh0ZU5mYUlS?=
 =?utf-8?B?R0g1aWJiSkVaYjhFbXIvQ24zRmUxb0x6MlJ3T1NFTUJxeUxTMTE1ZjNEbDg0?=
 =?utf-8?B?bzNJVzVWWTRJZXRlc3RnWklieHJjazg2dzJlL2hHSGozZlllVXQzcVZwYkpL?=
 =?utf-8?B?aDRaWTArRkFtRzlrUVdLd0czVUJKYW5yQlhZZzhtRWJLZUdnWVh2dXN5STBr?=
 =?utf-8?B?T2VYNFZ6dklmWTdWSTJTVjg2L2Z1ak5LVDBZWWxjZmROVzBTMS9kZWpCeHVP?=
 =?utf-8?B?U3dGalBVNUpFVTQrTWFIakNYNW55dFNzMWtrUTNabDA5SUwxZnhBT0I2cG5C?=
 =?utf-8?B?RG1oYlFTOHphM3J2VHVodjBqdTR6UjBMdVFQTEJmOGZRVm9PcHRJR0Fmb2Rt?=
 =?utf-8?B?eU9Qd1gyeFVEWE1KRk1kWmQvVmhSVVNXY3E4TWJ3YnpEYjFYVDBkVlk2bmtQ?=
 =?utf-8?B?dE9DYXd3K1lQbC9kamZ5YmZySjQ1RzlUZGxYNXhMNUdDNkhyaWhiZ1FZOHZi?=
 =?utf-8?B?T2ltVXVFYzdLem9ydCtrMXFZeEVqMFpZQWVJQjB1elFBdXNKTW1pc3E3ZE9B?=
 =?utf-8?B?alQ2Qk8yN3ZuaFJERGdFRk1tZDJSVHZGVXNGSFdWQ1RucGt4QUwxT043dm9Q?=
 =?utf-8?B?QWZPWVQ4ZXdtc3VNWmMrYXUvaXh3RjFDNzFZcVNxSmd3VWlkb2Uwa1NYUmsy?=
 =?utf-8?B?ODFOY3I5eDhpWmYyNHI0cU9yaGxGS0hUdXY5WHQwcUM3OGhFN3ZxZ3ZUWVFS?=
 =?utf-8?B?ZDlTVGVOaU9TQXdLYi85MUxDZWFMM2w3a0tiZmxqTytPNHpmdHZ6Z3NiRUJW?=
 =?utf-8?B?Q1FUbng1RmpQdEM1Q3oxaW1SQzRkTCtRRS9paEgvMFhsVzNPT3lubFZKbDlh?=
 =?utf-8?B?bGppeTJ4QitIZ0VYdjQ4ekQ1ZzJIMEJpRWJndm95V25SNm5EdE84dHU1VFVR?=
 =?utf-8?Q?PWww=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0c01c6b-09f2-4c30-3a60-08ddeafb0086
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 15:03:12.2373 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0DaUU/6a7/ey9gPvtKOsKdEkCfawNP0zK6EfDyNqg55AXFisu8TIroPoBWCZ9pP4teKzi5bZcw+yAmMc3vlZlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9801
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

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNYXJpbyBM
aW1vbmNpZWxsbyA8c3VwZXJtMUBrZXJuZWwub3JnPg0KPiBTZW50OiBXZWRuZXNkYXksIFNlcHRl
bWJlciAzLCAyMDI1IDEyOjUzIEFNDQo+IFRvOiBBbnRoZWFzIEthcGVuZWtha2lzIDxsa21sQGFu
dGhlYXMuZGV2PjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+
IHBoaWxtQG1hbmphcm8ub3JnOyBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVy
QGFtZC5jb20+OyBLb2VuaWcsDQo+IENocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29t
PjsgUm9iZXJ0IEJlY2tldHQNCj4gPGJvYi5iZWNrZXR0QGNvbGxhYm9yYS5jb20+DQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjMgNi82XSBkcm06IHBhbmVsLWJhY2tsaWdodC1xdWlya3M6IExvZyBh
cHBsaWVkIHBhbmVsDQo+IGJyaWdodG5lc3MgcXVpcmtzDQo+DQo+IE9uIDgvMjkvMjAyNSAxMDow
MSBBTSwgQW50aGVhcyBLYXBlbmVrYWtpcyB3cm90ZToNCj4gPiBPbiBGcmksIDI5IEF1ZyAyMDI1
IGF0IDE2OjU3LCBBbnRoZWFzIEthcGVuZWtha2lzIDxsa21sQGFudGhlYXMuZGV2PiB3cm90ZToN
Cj4gPj4NCj4gPj4gQ3VycmVudGx5LCB3aGVuIGEgcGFuZWwgYnJpZ2h0bmVzcyBxdWlyayBpcyBh
cHBsaWVkLCB0aGVyZSBpcyBubyBsb2cNCj4gPj4gaW5kaWNhdGluZyB0aGF0IGEgcXVpcmsgd2Fz
IGFwcGxpZWQuIFVud3JhcCB0aGUgZHJtIGRldmljZSBvbiBpdHMgb3duDQo+ID4+IGFuZCB1c2Ug
ZHJtX2luZm8oKSB0byBsb2cgd2hlbiBhIHF1aXJrIGlzIGFwcGxpZWQuDQo+ID4+DQo+ID4+IFN1
Z2dlc3RlZC1ieTogTWFyaW8gTGltb25jaWVsbG8gPG1hcmlvLmxpbW9uY2llbGxvQGFtZC5jb20+
DQo+ID4+IFNpZ25lZC1vZmYtYnk6IEFudGhlYXMgS2FwZW5la2FraXMgPGxrbWxAYW50aGVhcy5k
ZXY+DQo+ID4+IC0tLQ0KPiA+PiAgIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9h
bWRncHVfZG0uYyAgICB8IDE2ICsrKysrKysrKysrKystLS0NCj4gPj4gICAxIGZpbGUgY2hhbmdl
ZCwgMTMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gPj4NCj4gPj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMNCj4g
Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jDQo+
ID4+IGluZGV4IDI2M2YxNWY2ZmRlYS4uMmEzZTE3ZDgzZDZlIDEwMDY0NA0KPiA+PiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jDQo+ID4+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMNCj4g
Pj4gQEAgLTM2MTcsMTMgKzM2MTcsMTUgQEAgc3RhdGljIHZvaWQgdXBkYXRlX2Nvbm5lY3Rvcl9l
eHRfY2FwcyhzdHJ1Y3QNCj4gYW1kZ3B1X2RtX2Nvbm5lY3RvciAqYWNvbm5lY3RvcikNCj4gPj4g
ICAgICAgICAgc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5fYmFzZTsNCj4gPj4gICAgICAgICAg
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXY7DQo+ID4+ICAgICAgICAgIHN0cnVjdCBkcm1fbHVt
aW5hbmNlX3JhbmdlX2luZm8gKmx1bWluYW5jZV9yYW5nZTsNCj4gPj4gKyAgICAgICBzdHJ1Y3Qg
ZHJtX2RldmljZSAqZHJtOw0KPiA+Pg0KPiA+PiAgICAgICAgICBpZiAoYWNvbm5lY3Rvci0+Ymxf
aWR4ID09IC0xIHx8DQo+ID4+ICAgICAgICAgICAgICBhY29ubmVjdG9yLT5kY19saW5rLT5jb25u
ZWN0b3Jfc2lnbmFsICE9IFNJR05BTF9UWVBFX0VEUCkNCj4gPj4gICAgICAgICAgICAgICAgICBy
ZXR1cm47DQo+ID4+DQo+ID4+ICAgICAgICAgIGNvbm5fYmFzZSA9ICZhY29ubmVjdG9yLT5iYXNl
Ow0KPiA+PiAtICAgICAgIGFkZXYgPSBkcm1fdG9fYWRldihjb25uX2Jhc2UtPmRldik7DQo+ID4+
ICsgICAgICAgZHJtID0gY29ubl9iYXNlLT5kZXY7DQo+ID4+ICsgICAgICAgYWRldiA9IGRybV90
b19hZGV2KGRybSk7DQo+ID4+DQo+ID4+ICAgICAgICAgIGNhcHMgPSAmYWRldi0+ZG0uYmFja2xp
Z2h0X2NhcHNbYWNvbm5lY3Rvci0+YmxfaWR4XTsNCj4gPj4gICAgICAgICAgY2Fwcy0+ZXh0X2Nh
cHMgPSAmYWNvbm5lY3Rvci0+ZGNfbGluay0+ZHBjZF9zaW5rX2V4dF9jYXBzOw0KPiA+PiBAQCAt
MzY1OSwxMiArMzY2MSwyMCBAQCBzdGF0aWMgdm9pZCB1cGRhdGVfY29ubmVjdG9yX2V4dF9jYXBz
KHN0cnVjdA0KPiBhbWRncHVfZG1fY29ubmVjdG9yICphY29ubmVjdG9yKQ0KPiA+PiAgICAgICAg
ICBwYW5lbF9iYWNrbGlnaHRfcXVpcmsgPQ0KPiA+PiAgICAgICAgICAgICAgICAgIGRybV9nZXRf
cGFuZWxfYmFja2xpZ2h0X3F1aXJrKGFjb25uZWN0b3ItPmRybV9lZGlkKTsNCj4gPj4gICAgICAg
ICAgaWYgKCFJU19FUlJfT1JfTlVMTChwYW5lbF9iYWNrbGlnaHRfcXVpcmspKSB7DQo+ID4+IC0g
ICAgICAgICAgICAgICBpZiAocGFuZWxfYmFja2xpZ2h0X3F1aXJrLT5taW5fYnJpZ2h0bmVzcykN
Cj4gPj4gKyAgICAgICAgICAgICAgIGlmIChwYW5lbF9iYWNrbGlnaHRfcXVpcmstPm1pbl9icmln
aHRuZXNzKSB7DQo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgIGRybV9pbmZvKGRybSwNCj4g
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIkFwcGx5aW5nIHBhbmVsIGJhY2ts
aWdodCBxdWlyaywgbWluX2JyaWdodG5lc3M6ICVkXG4iLA0KPiA+PiArDQo+ID4+ICsgcGFuZWxf
YmFja2xpZ2h0X3F1aXJrLT5taW5fYnJpZ2h0bmVzcyk7DQo+ID4NCj4gPiBtbW0sIG5lZWRzIGEg
LTEgaGVyZQ0KPiA+DQo+DQo+IFlvdSBtYXkgYXMgd2VsbCByZS1vcmRlciBpdCB0b28gc28gdGhh
dCB5b3Ugc2V0IGNhcHMtPm1pbl9pbnB1dF9zaWduYWwgYW5kIGFjY2Vzcw0KPiBpdCBpbiB0aGlz
IG1lc3NhZ2UuDQo+DQoNCldpdGggdGhhdCBmaXhlZCB1cCwgdGhlIHNlcmllcyBpczoNCkFja2Vk
LWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+DQoNCg0KPiA+PiAg
ICAgICAgICAgICAgICAgICAgICAgICAgY2Fwcy0+bWluX2lucHV0X3NpZ25hbCA9DQo+ID4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhbmVsX2JhY2tsaWdodF9xdWlyay0+bWlu
X2JyaWdodG5lc3MgLSAxOw0KPiA+PiAtICAgICAgICAgICAgICAgaWYgKHBhbmVsX2JhY2tsaWdo
dF9xdWlyay0+YnJpZ2h0bmVzc19tYXNrKQ0KPiA+PiArICAgICAgICAgICAgICAgfQ0KPiA+PiAr
ICAgICAgICAgICAgICAgaWYgKHBhbmVsX2JhY2tsaWdodF9xdWlyay0+YnJpZ2h0bmVzc19tYXNr
KSB7DQo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgIGRybV9pbmZvKGRybSwNCj4gPj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIkFwcGx5aW5nIHBhbmVsIGJhY2tsaWdodCBx
dWlyaywgYnJpZ2h0bmVzc19tYXNrOg0KPiAweCVYXG4iLA0KPiA+PiArDQo+ID4+ICsgcGFuZWxf
YmFja2xpZ2h0X3F1aXJrLT5icmlnaHRuZXNzX21hc2spOw0KPiA+PiAgICAgICAgICAgICAgICAg
ICAgICAgICAgY2Fwcy0+YnJpZ2h0bmVzc19tYXNrID0NCj4gPj4NCj4gPj4gcGFuZWxfYmFja2xp
Z2h0X3F1aXJrLT5icmlnaHRuZXNzX21hc2s7DQo+ID4+ICsgICAgICAgICAgICAgICB9DQo+ID4+
ICAgICAgICAgIH0NCj4gPj4gICB9DQo+ID4+DQo+ID4+IC0tDQo+ID4+IDIuNTEuMA0KPiA+Pg0K
PiA+Pg0KPiA+DQoNCg==
