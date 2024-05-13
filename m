Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 633ED8C3D99
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 10:55:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93EE010E52F;
	Mon, 13 May 2024 08:55:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QUGSIh7V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A830810E52F
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 08:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715590529; x=1747126529;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=/55Nr3uBncVteW5yXWdVFOOtBUZI34eJkbPRQCF99zs=;
 b=QUGSIh7VgsRf6DS9VaBa3XCxWVWeGjf0PNZ70JHwY52kLBbVAA1UI8IJ
 XoFLkOV0FpTRx8UfeDMRcVXnVv8JI3X/A9tqoiAJDzmNyB+njWrKPrpRx
 QHXOuZpkwuWORDXbHDfqMg2C0RKxFRb1iBoHa0DvNWfeNmnjgqPFV+Ylc
 wYgvRjJ2bcqJvWQXW4jIee+U0MIVKxpLdmQSjZUqafgD6rDzt+kzD/nYn
 RDRQadLCyNtDu7DSiizkTuphWqtl/qmEaz8CnR5Rv9/yJ7jlj4fOj+MQ0
 haZaW1BfxZcr2qt6C2F4rfsA2yJlPAPjr/c3aYi8ik9hFtNjvylX9l80B A==;
X-CSE-ConnectionGUID: BNhQ9tmYQoyrjKzSSjkv3g==
X-CSE-MsgGUID: 0iNgV3SxQ1WXF0zNX0qWWg==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11454367"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="11454367"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 01:55:28 -0700
X-CSE-ConnectionGUID: qdc9t+i5QMOtyMfKAVj20g==
X-CSE-MsgGUID: 2D/lxOU3RU2CR+nRdMNxTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="30232509"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 May 2024 01:55:28 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 01:55:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 01:55:27 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 13 May 2024 01:55:27 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 13 May 2024 01:55:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nBpU5aCstJLo30fzsxITomFCp4JqPp7W3gCIpL1A33VMLdQYsKxb25lWG8ua7/xePAfJZ20BAF9BMbO0p5T6x7XAfHCsnaLhtBGvVSR6W52bkPk3PK2DGEfhiDPIhQy0koWr8a6wHUrJAOlNU5EWJcBtX+NKN4J52Uxo8+ETkbFALZKFGyq/T/qad+/Xdq1XPKiMUJd/k90E+NJGYknbRvBi8GkmyDEFcZpSs3K7csyptzkntuMCYwYiWv0FNcbAHtNDJJ0BtQEa/vsI7JjDQj6m3QTRrNKfvnb8w5LGHOcCrXgQqy0IdTOd+oUWHVuiTUwVxqUptRUquN6M5Pq0FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/55Nr3uBncVteW5yXWdVFOOtBUZI34eJkbPRQCF99zs=;
 b=hvMTs46f3UnyBvFyFw/a8dd/K0iSbpb9va10ukNR7sssyZxl8aQBSyqEbD0ik9WKVov7TGab8vEFQGHRtfN9qmgNZ8+kS/5jDWJoYmHDG3tpv0GbCg3TFqyiutQRQMGUpQ32rMRhgn+X0Y42fxUeTHA+Ar4XgRO17UP6hnxFDzVMkJ9TxsMANrF+RfSCoVnNw+HMkUvhrcIDpb79RSLZWWYHFfuEZSVg4RIbjTNXUKKowDNz20Lo2O6GFWqrcsoxwlYm5JWMemR1sRn5Bz8bVzMFrNkVYwNvcRj1az8z7kyVavwh1q9pEuy6Vk6fDDXatFZVMPl/vyJVYv4ITfEgUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 DS0PR11MB7959.namprd11.prod.outlook.com (2603:10b6:8:fd::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.55; Mon, 13 May 2024 08:55:25 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2%4]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 08:55:25 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>
CC: "Manna, Animesh" <animesh.manna@intel.com>
Subject: Re: [PATCH v10 05/12] drm/panelreplay: dpcd register definition for
 panelreplay SU
Thread-Topic: [PATCH v10 05/12] drm/panelreplay: dpcd register definition for
 panelreplay SU
Thread-Index: AQHaosSGCNxdgAmqYU6lkw5+t8RsarGU4QuA
Date: Mon, 13 May 2024 08:55:24 +0000
Message-ID: <b7d802e06d5c33ec9774814d421f610621e269e6.camel@intel.com>
References: <20240510102602.3172283-1-jouni.hogander@intel.com>
In-Reply-To: <20240510102602.3172283-1-jouni.hogander@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|DS0PR11MB7959:EE_
x-ms-office365-filtering-correlation-id: a2031d2c-1143-49f6-4c51-08dc732a6dec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?WkpoZzJoZXZWaHpmNDZxaTYvS0tmNEhqaDN3bXczNUM1ZkN3N3ZQVTVySjVk?=
 =?utf-8?B?eVB6MGJxdEVYQ3lYb0pqc21Wekg1SlRqb1UyaHdGVEFYTEZEVEl5WW5xd09N?=
 =?utf-8?B?NkxSNTYrbys3OUVCcFI0NXVSejFtd2FxTE1qb1U1OGdxaE5PeHdVNlU5Myt3?=
 =?utf-8?B?NW1zVWd4SVBTVzZJQ2tOTHRCbVU5M1I3M2wzOWcxZ3cxVU1oVTFNbnlVbkY2?=
 =?utf-8?B?N0o5QVF1VTdqZzRVcC8yUHFUSXdkZ1lteWEzSVVxUllkNVp2a3ZoSUFEV25X?=
 =?utf-8?B?NkJCWXNaQlZhOU11czRDU1FlM1krRHVBRTJkZDVjcjRaN0ZVNTBNTzZldHdS?=
 =?utf-8?B?N3lSaXdXUjBVRytrS3BIeVg5UUJXODB2WHZhKzFEdnVrczg5YmtVZWk5T1hP?=
 =?utf-8?B?N0szU0d5YUplTVpvVlV4VGFEWW5nYU5BVEYvZjJGbXVPWk1Od2FoOGRCVlQ4?=
 =?utf-8?B?cTdKN1U5djZFSk5lN0MwN1pPTEppVXUrOXhFOEJjUnBVOU1acXRlR3JCaEVK?=
 =?utf-8?B?ZldTZUtSWUIrbGk4dE1relZNTDhnclNyZXlHL3NTYWM3eGd3a29kWGlzaHlw?=
 =?utf-8?B?aFhobUdIZEt0TWtRNlREVXBodlZrb0pzZEVkcUlvU0VPMlgwVnl6SXV1RW15?=
 =?utf-8?B?WmZ6ekMxU3VGT3ZTdm9lRStYYUR6UmZETjJ1bGZvaFprem5VcDdjbkJiWS9v?=
 =?utf-8?B?Witnb2FCN1R5UkFweWVuM3lUVmFBV0FvOU1MRGhONTdhR3gzSG5ocUwwVXRD?=
 =?utf-8?B?SGhZRmVHOG4zdHlibUx0SGRKenM1WHpVU0JQUEFlUkpSbW5IV3cxb3Q0MGdK?=
 =?utf-8?B?Y3VXOTRIK3JFdEtIN3ZXMUNHUmtYbWpGZWM5UlBYL3V3K3RvRGtKL0FKSzVE?=
 =?utf-8?B?ZnhkbUlQSVVrVERRMzcrREoxKzhUSkdnNzYva09nQ2RuaXZka1lkRXN1Tm9z?=
 =?utf-8?B?eUMrb1VjSkRtV1M1NHNuWjhYbzk3TlAwSk1GRldvZS9mN0JvanRsSlBPTVZQ?=
 =?utf-8?B?TDBjdk5LR0RKVEtBVlpvdkkwTVFwdU9NanFFVG1NcDRYbHd4c0p3dkcxOWhZ?=
 =?utf-8?B?akRHT3U0NVFsNXVKdGJiSmlBVlNXa0JoYnZ6cFl6dDQzeW9aYnRXVnBpczZ2?=
 =?utf-8?B?ZEhZYkpJR1JnUlFXZ2cvelRMdm56eUFrOWxxS2Z4clRvWUNDWTZCdDFYeGc0?=
 =?utf-8?B?OW95SEd4V2hCR2ZwMmd3TlJRRFErVWI3SnJTZ2dPUTVwbTRGRTVTb0E1TlVw?=
 =?utf-8?B?SDRjY2JMYVdPNUZoRDU3YTBydTBDL3VLbzJkYlo1NktoZFBiNG5uaWhEM0VY?=
 =?utf-8?B?N3R6R0RDTzV0ZjFHbDVrM3BYeFRDR2FyaHN4Y002MmRvR0dLYWpTYmphbUFF?=
 =?utf-8?B?YUcrT3NtZjh6ZC8waUlrNEVMbXNKTmJzYWN4QkJWM0RnUHh6SlNjMnBKVS9t?=
 =?utf-8?B?WVJJN3dkMEVOdk9aSWV3b1F5aGUvY2FYOEw1N1M3LzhSS1NTUVdpY0FsSGVz?=
 =?utf-8?B?UnFTYnNWcFNBOHRVTGNtdzd6eE1STE9ORGxKOSt3NmxRWmIvYnlZa2dWdXFj?=
 =?utf-8?B?THJTK2lvc2F4anRpZm9nYjYyWjNidlV1bTJsTXF6WkdvcTZhWXNyRjFCMDVm?=
 =?utf-8?B?OC9FVDdxSzErWXFsMWpLVmFDeHJTN29jd3E1REloMXlwMG9LZWIvUEllRkRM?=
 =?utf-8?B?LzJlUE5sVTZKQWFyMTVnaGZWcXc2NDVTMFFXOUQ3MDJkeWVKaDJhMzREQmRl?=
 =?utf-8?B?aGI5Um0xQXkvbXl6cjFBWGxFT2NXNVdaeGFHRmF2ZFRNQVprbDNOUEdjbnVZ?=
 =?utf-8?B?THYwRWRGVjZPcEpDQm9Xdz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TkpIMHpDODRKZWJ2SjNyWnUxL0lQb0tDYkxvdWgwWVZXY2V0bDB3MWdaY0ZJ?=
 =?utf-8?B?RUZqbVNHRTdGa3Z4TTRXT3dxdXI0UmlTVnF0UnU5V3lod0Y0NXBRdU1hOEIy?=
 =?utf-8?B?emYya3M1cVdjbE1FRjJrNHFXTEtLNzlocHNQSmwySTJFL2RQNEdtSjBBTnBi?=
 =?utf-8?B?SEFqWjFqa1B6Y1RzQjNxWTNwaThidENqcTErVzFvdGMxa0xXdDM5cUhENldi?=
 =?utf-8?B?YjQwUi93ejdoclVmaVg0TmcrNFRtZXFiQTdHOFZ3OTlYdHlnYUVZblFKQUs2?=
 =?utf-8?B?dWwyUG8rYzBHNmdhZTdibStQVlpjLzFXb3M5eE9nOHM1UkpQS0FyZ3pUUzd0?=
 =?utf-8?B?dUdyT0lCV3ZQQTZvSHVaQy9iVzBYb1VNbXhYTU84Q2Z3TXU4aFh6aHp1SERV?=
 =?utf-8?B?SlgxcEk0amZPLys4VnV4Mi91a0NKdnY1VkNtb0RKc0c4dXVYMU9wQ1ZJUkx5?=
 =?utf-8?B?N2hrS0g0d0s5aTV3cEVGYXRLWUJyVnk2UFVpaXJJeVo4TVZCcnNJbnM1UzNZ?=
 =?utf-8?B?R1pTSTJMa09FMFlFbTNXcjNwYVczRVN2NDNwVnBMZWdpUytoTTFtNU5QZGNs?=
 =?utf-8?B?WC9tbUt0aUp3RDB2L1huYVJtTjRFTHJKRUlzNWcvZXE2VWdlOFUzQyt5VUJU?=
 =?utf-8?B?VVpFbEtya2tEQ0xiZDM1SGZMRE1JdTY2QWtNbXlzb2ZVTEZqeGZQNjM5dnZC?=
 =?utf-8?B?OFJMZmtHSzM3QkpwN3Y3Y0VRSGR4VUduOGtDWVJmalRFVGFEaG1BM0VGcmll?=
 =?utf-8?B?S29TOUlHVkdRbzF6bEUwZkJmMzc0QlBPaytUcVBZems4UVN4RnRvSGZ5T0Vp?=
 =?utf-8?B?Q3ZCd20ra0FHVDl3UUNIZTc0NHlMRWdaY2NrUDlFR291YzNoNjkvOEttRUp6?=
 =?utf-8?B?NnoyMmZWRVlFb2NGT3Z5NERTNklVaG9HeVlRSm5nN3M1enpCZUtnbUtDb0ts?=
 =?utf-8?B?djhZYzlhVTF3YzE4S0tWbDVRaUNrVFp0TEJxVU1va2pNWjFnMlFNVEZpZEZh?=
 =?utf-8?B?UENvcUxkVlc0Tk9ha3NuZkZ6d3lnUk5VUW4yZFNyMzNkSnpWeTFGb2JjRlAr?=
 =?utf-8?B?MnNBSHhkL21GSFl6Zks5bGV3cEl0Mmx0d3ZHZmpZVmhTcmRGSDd5UDNreHV3?=
 =?utf-8?B?aStUUndBREdIb0NxeW9Na0Y4Z3draHJxUWpyNUc1cGFsbTZQY29vWkMzRGpZ?=
 =?utf-8?B?V2gwalZoQ3JnVlJrUmJETmpya3ZTV0hiMm1GUmlqc2kzMzN6cU1OUGdDV2VV?=
 =?utf-8?B?VVpwTTVxVHNFUDNtZjdieUE5ZUpZa0toVW5xV1JLSWh0RzlYNUI4elVxL0wv?=
 =?utf-8?B?Q1hIYmRtVW03VTdUVlNWMlZrREVSNUJ6QTNpT0llcE1lWEpRekZtZ0lWTUxu?=
 =?utf-8?B?d2sreTVGQzJnbXNXRnBWRld3eEppYzlrNFo0K1djZXVPMlRyRDlEaTF3cEV4?=
 =?utf-8?B?QlhUM3hTV25BR3hNR0xOWmp0b0VhYm1Ta01NRkFwcUdoK01JamxmTlhYU1Ur?=
 =?utf-8?B?dENYcVBWaGF2WTh0RkNKS256TitBQmw2R2doZjhtLzZSWTFOWDYwU0UxN0Zw?=
 =?utf-8?B?TDlndjFxd0hLMHc0M0xrb3FXY1NGMEI3TGx2czZwWFp4am82L21vZXErNTJU?=
 =?utf-8?B?VlBFeS9pZ21JNVdORWx2OXR3WHJEQ3pVL1FuUkJEdFFpVUhxS2x6NmtISnhI?=
 =?utf-8?B?VjFsTXdvekRrY2s3L2FyaGJnbkxRNk9OWGtwSzdqUzRCc0Vrd0s1dVZYaFJR?=
 =?utf-8?B?RjMybnR5eEFCckxOMVkzME5JMmZ4L0V5TjdoRSszeWlzNVllTDM0L2ljMHVq?=
 =?utf-8?B?UGxad1lQNEdVcGh4YmE1RWh2T0QyYUkwVW5JbDBSRkVUMVlSQVZYR0FwWnIw?=
 =?utf-8?B?VjlwaDFLSXdtNUhJN2hrOWhrZXV2S3NsTEo4eS9LT21YRVh3bjlwZFRPWnJm?=
 =?utf-8?B?V0duc1RHR2dPRHRLMmQxVHN5bW9LQ0pwWGV0WUFndXlINDFYalZaVUZCaDJs?=
 =?utf-8?B?WXBQa2s2NHBsWmVBY1BoQWtyVXl0d1VBV1Z2ZTAwZWFDWHNBWkNoWmJET0lv?=
 =?utf-8?B?MmdIbW9RTjEwR2EvLzFoV25mZUU1dVZqS0htZEtKWU9LUjhNdW8vNXFBTVVF?=
 =?utf-8?B?U3JWNWlGZUlzS1pKbjU5N0JLU2ZjTEdyK2ZrUVVoRGVnUUwzRjQyK3R3Mlc3?=
 =?utf-8?B?UXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BFA621D7E5CA7843A56E9AC39F045346@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2031d2c-1143-49f6-4c51-08dc732a6dec
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2024 08:55:24.9285 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u2fqugsBWcPQjOSqmzlOUGfYBlySTAjWP+xQgd632evEY2PK0+fiAIeiaP9bDvVWxexGoyDWcE5OuqMAYTRKt9qoA7ZwfnbbJ+qjjxMSD/s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7959
X-OriginatorOrg: intel.com
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

SGVsbG8gTWFpbnRhaW5lcnMsCgpDb3VsZCB5b3UgcGxlYXNlIGFjayB0aGlzIHBhdGNoPyBJJ20g
cGxhbm5pbmcgdG8gbWVyZ2UgaXQgdmlhIGRybS1pbnRlbAp0cmVlLgoKQlIsCgpKb3VuaSBIw7Zn
YW5kZXIKCk9uIEZyaSwgMjAyNC0wNS0xMCBhdCAxMzoyNiArMDMwMCwgSm91bmkgSMO2Z2FuZGVy
IHdyb3RlOgo+IEFkZCBkZWZpbml0aW9ucyBmb3IgcGFuZWwgcmVwbGF5IHNlbGVjdGl2ZSB1cGRh
dGUKPiAKPiB2MjogUmVtb3ZlIHVubmVjZXNzYXJ5IENjIGZyb20gY29tbWl0IG1lc3NhZ2UKPiAK
PiBTaWduZWQtb2ZmLWJ5OiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5pLmhvZ2FuZGVyQGludGVsLmNv
bT4KPiBSZXZpZXdlZC1ieTogQW5pbWVzaCBNYW5uYSA8YW5pbWVzaC5tYW5uYUBpbnRlbC5jb20+
Cj4gLS0tCj4gwqBpbmNsdWRlL2RybS9kaXNwbGF5L2RybV9kcC5oIHwgNiArKysrKysKPiDCoDEg
ZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9k
cm0vZGlzcGxheS9kcm1fZHAuaAo+IGIvaW5jbHVkZS9kcm0vZGlzcGxheS9kcm1fZHAuaAo+IGlu
ZGV4IDBiMDMyZmFhOGNmMi4uOTA2OTQ5Y2EzY2VlIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJt
L2Rpc3BsYXkvZHJtX2RwLmgKPiArKysgYi9pbmNsdWRlL2RybS9kaXNwbGF5L2RybV9kcC5oCj4g
QEAgLTU0OCw2ICs1NDgsMTIgQEAKPiDCoCMgZGVmaW5lIERQX1BBTkVMX1JFUExBWV9TVVBQT1JU
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAoMSA8PCAwKQo+IMKgIyBkZWZpbmUgRFBfUEFORUxfUkVQ
TEFZX1NVX1NVUFBPUlTCoMKgwqDCoMKgwqDCoMKgICgxIDw8IDEpCj4gwqAKPiArI2RlZmluZSBE
UF9QQU5FTF9QQU5FTF9SRVBMQVlfQ0FQQUJJTElUWcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoDB4YjEKPiArIyBkZWZpbmUgRFBfUEFORUxfUEFORUxfUkVQTEFZX1NVX0dSQU5VTEFSSVRZ
X1JFUVVJUkVEwqAoMSA8PCA1KQo+ICsKPiArI2RlZmluZSBEUF9QQU5FTF9QQU5FTF9SRVBMQVlf
WF9HUkFOVUxBUklUWcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoDB4YjIKPiArI2RlZmluZSBEUF9Q
QU5FTF9QQU5FTF9SRVBMQVlfWV9HUkFOVUxBUklUWcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoDB4
YjQKPiArCj4gwqAvKiBMaW5rIENvbmZpZ3VyYXRpb24gKi8KPiDCoCNkZWZpbmXCoMKgwqDCoMKg
wqDCoMKgRFBfTElOS19CV19TRVTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgMHgxMDAKPiDCoCMgZGVmaW5lIERQX0xJTktfUkFURV9UQUJMRcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAweDAwwqDCoMKgIC8qIGVEUCAxLjQgKi8KCg==
