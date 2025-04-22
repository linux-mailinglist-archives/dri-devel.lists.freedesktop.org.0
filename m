Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD7CA95D34
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 07:04:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5900610E4E8;
	Tue, 22 Apr 2025 05:04:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J6A+b0Q0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC2110E4E7;
 Tue, 22 Apr 2025 05:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745298280; x=1776834280;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IZdhlM6LDzLvwC6tS/z6IzILpxI2YxfREk3WDwhIRkg=;
 b=J6A+b0Q0jkb9LlR5CnnLAQqqkGuDqUzVpEZqPHytmRwXPat5dRl2dLfx
 2cnoN8Lb0F5tiux1c33O722NzGoMDwWI0AW7EA9ej6rIIeZDhcTRpWZNH
 0EUVQt39Eg6KJPybPBVd3d9SHf+9nO5a5SxYFfqbJLcytfWyh8Wxzj49o
 WWcb6QW/8tN6sdnjEa8lewt1F+0m3dC0ja9NS4aQwNhmRmaHXPMKPpyZ2
 0v8zD0eXD0NAKQHHXQom09hf7QGSg0OOk3y0YkE0mSbCb0PIv0bDBq7rT
 y40eRMYbVGJ6rcqPkYbGlZ7iJ6qpKiNiKcdniYa+FbUYBC49dwLBOuo41 Q==;
X-CSE-ConnectionGUID: 3H6PYVdlQLSw1YvBC4sFog==
X-CSE-MsgGUID: vokSzhODR7y63iTtp8azEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="50505497"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="50505497"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 22:04:40 -0700
X-CSE-ConnectionGUID: 5MPmos1eTeG7hsLG9AK3BA==
X-CSE-MsgGUID: dd/vSVJ6T6moKtNV/9S0Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="132442802"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 22:04:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 21 Apr 2025 22:04:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 21 Apr 2025 22:04:38 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 21 Apr 2025 22:04:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cs+6ZbYo7GV7gwELrCkVTMvgG04wHQPvkQ4+MwMNmVCxZzzqZQH6S0AlFMbUs8q0fU++qrb+pMWXhBU4UMMs0xDv7XCJz/Z0bF0g3z0h/ywoQGJXRlypuuwF52QvM7JC7iNQx7++9qr7bL8R52chBG6yd4hStwPIlKsdHXKI4buoQs9KCL48462zQbzdsS1z0JdiurFHcoasFM4aOApcFUda0V4MAQxZc8hszGbq7On9/gOREnXMm/9BnrevAkjx2j0hy7iwVVphj1Dz1L7+bVGFoYXQnnikua7av+k7Z9zVMo/rhYq8ycZZqcLc1c701N6kzZNMI1ZLF+Hi4r7u6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IZdhlM6LDzLvwC6tS/z6IzILpxI2YxfREk3WDwhIRkg=;
 b=B9ygEdvgFrVFauWNy42mbd3WScBBxbvvqSXHObusbo++j//g44yVClB83iarzF4jF6RTdDOdCWAbqO+wbQUxt90t4qQr8WrLePC1fEF7nOPChu6ube+7rk6h+fXiV9ZWnw2zzxX4PP+YNmJoQdWzKvQVFzYFREkW1ViPEVPt7j8fmtrsLGBIN9WIyghZzgXILT6aWpKTyYWZcnS4TzL2cBJ0Z5Rx72EbYcorDZT8FDTGPKiaxzw5cUERfT6QEEQJtQc2y+MIxM8UZk8uSOkSvk3jjMXh5ZHkWzuHzWhm6D8SMfWo3hvYUBhDaxprHxNaES3ozy4gNJTQkjlgLV46nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by LV8PR11MB8558.namprd11.prod.outlook.com (2603:10b6:408:1ed::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 05:03:52 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%4]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 05:03:52 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>, "Deak, Imre"
 <imre.deak@intel.com>, "Murthy, Arun R" <arun.r.murthy@intel.com>
Subject: RE: [PATCH v3 1/3] drm/display/dp: Export fn to calculate link symbol
 cycles
Thread-Topic: [PATCH v3 1/3] drm/display/dp: Export fn to calculate link
 symbol cycles
Thread-Index: AQHbr4jiUpxdW/o3fkq4MrP1okf4VbOvGeqA
Date: Tue, 22 Apr 2025 05:03:52 +0000
Message-ID: <SN7PR11MB675003796B6C9B181A696175E3BB2@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20250417-hblank-v3-0-d3387df7efce@intel.com>
 <20250417-hblank-v3-1-d3387df7efce@intel.com>
In-Reply-To: <20250417-hblank-v3-1-d3387df7efce@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|LV8PR11MB8558:EE_
x-ms-office365-filtering-correlation-id: bfff1ca8-2d8d-41ae-7669-08dd815b13aa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?RHhpU2YvNHRwRzVPbEc3UzFrekRaZU04TTNOVVRwREUrVG9wVEF3bHdTeWd6?=
 =?utf-8?B?VTNzZlhzSnF4L1JJSEErN3BKS3B4MmxYK2xVQXQ1R09YV01BQzIxNUovNEFy?=
 =?utf-8?B?SUxuTi9ia3pxZk9qUXNYYWRSeXFSeUlla1B3aTBlVnlIY0twSWFEbzZrQlZZ?=
 =?utf-8?B?Um0wcDNJUTZuckVzQjI4N1pBcFgvdzlvNGs3NUpudHp0MlBvc1E5NTJZb2Rh?=
 =?utf-8?B?aUFCdDM1cUliUC9xNVFRdHBUdkZYVG9HdElsTzlVZ3k3ZWpqanVuajVmbWFn?=
 =?utf-8?B?bjBnUDFQeHZRS2dScGNSajlBZmVWZnlmcmlnS2IrRkYwVG1abDBrUlpmeFFU?=
 =?utf-8?B?bXRPTkVMaDBBL29Wd2hGRXdadWJzTWY4SHNQeGlCRjdHUCs5VkJwVjg3anFk?=
 =?utf-8?B?QWtJeUJMSWFURFZ3NUIzTHRYb2JIUDk2M2locEJsdmJ5ZXBXQjlVREVmbVZP?=
 =?utf-8?B?OVQxY21rNnhFMW9iMXArTlUvWDgxeFBRUlNGU3o1bXJzTGN1Rk1MQlQweE5x?=
 =?utf-8?B?UTZZdXlyUXoxdDdpUmVGOUR3TE9hY01NUzRkSzVGN3lJY1g4T2tSRm5idU5O?=
 =?utf-8?B?enNqSFEwbmFxV3I2QncvdmduQzdCY1Z2NnNEOW1FN0dVOGRtWU9VaHl0MVFX?=
 =?utf-8?B?cUdxRmx2NTJSUnZ1ZTJJUDJUVWhZNVlGS1kzNjg3ZWdDVWQ4MkgxRVgzbEVN?=
 =?utf-8?B?ODFUNWtHSmlMSzVmOTlDUDlSMVpldktKZ0RsOTM0b1pldVhZbHp6UjBUSDUx?=
 =?utf-8?B?OERZN3BWdW9UMjE0Zm5nMFFId3pCZFZteTVSTXpoL1cycDBBS0tCZDdSeXpr?=
 =?utf-8?B?dUsreWhMS2ptdjFrQitab3pRR25Ed3dEOHdkRjFOZ3orMGZLWjNyMHp4Z2g3?=
 =?utf-8?B?ZnZqelkzNE80WVY3MlR6NWVBU1Uwa0ZGZDBPV2s3K0RGMUlvV2RnWXRnZUY4?=
 =?utf-8?B?Um9JQXpZeUZPdG9qTGMrRFFlVnhwV0g5eFhtbC8xNm83dWtQdDVya2M4azJR?=
 =?utf-8?B?endxNUJvRkxCSitxNk1vc3NtY3JER0k1VTVRV3ZDRWRUQzZBYVBqZUF2Y09I?=
 =?utf-8?B?Y0wzUTdTSmpXT25mVEh0VXBJa0JIb2dnWUtCQU16NS9CZ1NjOWpwTjdnOVNJ?=
 =?utf-8?B?SUE2UklrOEhERU41OFYxTFd5OFE0UGQwWll6UnROb0p4RUNzdVhVQmQ4SGFU?=
 =?utf-8?B?cGd2eXQ4dXZwQ3pxKzRVTnZjMFAxbndJQXBPc1dlZThCTjZnR1NKTkNqQzJQ?=
 =?utf-8?B?UE1pK1RZR2ZzSkFQZ0VVSEE2NVc1cEhxTTZpSDFEK1VvS3J3OS9sMGFXQStG?=
 =?utf-8?B?bFN5NWtESFE5YzJoblV5Ui9iR3Z3WkJVM0w3akhDMWVaRkgreUEzdGNOb1lR?=
 =?utf-8?B?S01pa3FXZ1BUV2ZYZWtZODRyWGFSUTZCOE9waHRjbHFQSjhGTWNLMkZKVEpJ?=
 =?utf-8?B?cDlEWWYyM2doSXV5QUlQMUJlV0NWTGpmMFZDY2ZTKzZkclhGUFh5U1BXcFJQ?=
 =?utf-8?B?bjZsZWF4SldhN2REMlNoanNoeDZ2RW9IZHd5MXVFTWdEOFhlcVdEYytRdWVu?=
 =?utf-8?B?eCtZR1YwUldtZE50WTVGNGMrMlNrNEN2S0U3S2pLZHpLR1FSbk9vcU4rbzJw?=
 =?utf-8?B?VmNJM09RbzJGWHpZbm1UWXN3K0N1Q1lxVDc4eEIxNHd1RFdrZkFWQjhpdllB?=
 =?utf-8?B?UllJL3hrS3o3aERPZDFOWEJ6OXZCcUtDc2hEU0dWZkx4cEVFeW5FNTdKblVw?=
 =?utf-8?B?am1IaEhkY0JOSm1oWVlrWUFOdUFsbEMzZTYwSVNGMFdBZWxsVnQ1R1RuNXVv?=
 =?utf-8?B?V3Q5YmpHYlhOWDk1S2x0Vk8vS1RCY0V1T1N0TzFMM0Y1eUdFZ2hvUHQ0R1ZY?=
 =?utf-8?B?QWFNSng2eUZmR2FzS21ubFlwVWtNSVE4ZDhZbWNQU3VYNEo5ZXg4OGRTVHEw?=
 =?utf-8?B?RUxnQVduLzI5VmhtOTZ4R3hRZ2RUVVVJR3daNjJUdE03UUFEWmxsSGxIbnpz?=
 =?utf-8?Q?X+TNBwzdcRTH9jWPF2b29kgS/gA5nk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QUZWMWllQUpUWFhIU21WSitSMXpmdFlwdzBiUlRubTZHTzVSd2JWU2FQNEtX?=
 =?utf-8?B?ZGJDUnFlbllZekNWSjJqSDl6b3UyZmU5UGk3alg2dDBUS01LbG5pcnNYczFh?=
 =?utf-8?B?NDhrYXNxMk5EYkZ6dTF6SGZ6RG9pSHJFSHgxYmxJN09wQ3YvQnRRWnBJQWR0?=
 =?utf-8?B?TmZSb1paMnFwdU9hSm8wNkIxZVlRRWgzR1k2NGg3QkRrSFhvQlFkRmR3bTFC?=
 =?utf-8?B?N1ZrU0oxYkxBalB1S3hINHIybzRnYk80M3BYN2dvVmZkWkJQaHN6TnA5Mlo2?=
 =?utf-8?B?UDd1TERoQ0tDVjNtc01OTDQrbjBpWW03MnhlMTVLNWpMaGQ2VWVhdWJPNjZN?=
 =?utf-8?B?amZPL1FyRmZPb3NKL2tVZkxHTHFNVlFrVlV5S2tmZGdqbXVQNnpQcTZxNXF6?=
 =?utf-8?B?azBxaC85V2pOdjFNN1d0bWU3bHVNYTNmT1RtN2pmdHd2MGJNbWdYS0dzZUo3?=
 =?utf-8?B?a3RtY2MrZnU5SjFHTmJROFdWTVJRQWxJdVRRWEFnN0o1TVlIL0tqeThJK3NF?=
 =?utf-8?B?NEhBZU14RjBUelZnRjNTbmcvQit0a0VoQ3AzRnRhWlRITXRxUGNGQjJJNEpO?=
 =?utf-8?B?bHQzNWNRV3Z4V1Z3UHYxNkNvWGJEOFFPWkVaYW4vMGdNb2RhYU9xWEFoTUtI?=
 =?utf-8?B?dnQ1akZic1RZZkhsRzZQNlZNU1J4eG1aUWhTWVZHelo4YTJiVW5ubnhJeFJ6?=
 =?utf-8?B?d0VONXR5N0FJVUJpQ25UT1NGcHJRTTlpanBUVzFRT0ZvQ1pBSnNPWlVnR3hJ?=
 =?utf-8?B?Ni9hTmw1bkRNTXFNc25wYzJZcmxIWHBETk94Z3N0RHZSWHNIeGp4ZlpxdmJp?=
 =?utf-8?B?NnYrK2gzNS95TitNUW5nSU8xbFF1ZFN5V2JMa2xrWEVBR1d0TS84QkMxRHB1?=
 =?utf-8?B?SmhITHdqWCtmWFBsN2VnR0o3UUZHMUgxeXRTWlZKMHBSSk81SWdRRFNad1RS?=
 =?utf-8?B?Z2thcjBSUm1zNFlveVNWZ3ZUcGM0djBjUnNwRnl1bEZ6dXdJK1h2SUNNTkFQ?=
 =?utf-8?B?L2l4TlpjYVcwYlg3TDNhNWpIdFMxMlFlcldqYnEwNzNjNkJDRmE4Slo4dWdH?=
 =?utf-8?B?Qmh5ZmpBUUpZMnJJdEtoQXNrQlo4RysxMHFsQVR5M0VTS3cxdE0zZk4wYVds?=
 =?utf-8?B?VStkU1h5d3NjcWdjNnRBMmljVkNMTUd0am1Jd08zc083MlNFenhocThjQUZl?=
 =?utf-8?B?TjFwNkk4MEw4a0dSdTk4WTdBNW1sa21xM044NENCd093N3ZIbEx3QVVFSjdn?=
 =?utf-8?B?MnhrbjdPdVVZZzJrQ0FlTkt3MGkxcUFDRXNRelo0WXJMV0RYY0VYUmQ3SFYv?=
 =?utf-8?B?NXZuWUV1WUp3M1Zqeis4NWVvK0VEdjNxM1pMV0ZtNng2T0xjd1lPOENiODYr?=
 =?utf-8?B?VVhsMm9jT2VwMU9xbE56ZlVob0dKaFlZWjEyalp0VURJSDM4eGdRQXFGbkwr?=
 =?utf-8?B?Rk9Sck5oa0p3TGEzYTF6MlBSeGVmclVmY0JndWZjc2NWVi9TT1RRTkN4Ukcy?=
 =?utf-8?B?Sk1Pd3F5L1JMMEdWOFQ2NVovdkczdWx0L0dmUEUySWZYaUowaGFRMk4yanNz?=
 =?utf-8?B?T00vbks3OW9VWWYrZFB2WWd1OFBDT201cjQydDBZeS9TbEtsa2ZnZlVuSkdw?=
 =?utf-8?B?eG5jK2RESG1XNW0zSHBOWTd4amlzTFVZQk92RFZVV1Baenl0bXBBY0E5Znh3?=
 =?utf-8?B?N1MzMmtITlJDdS92ZU5Yam9pa3pUZmhYNXFPUU1uTDN1OXZoSGJEV2lrcXhT?=
 =?utf-8?B?S0V4dkZlSnBROWxibjh5M1BDaWdqR3I1ZjlNb1MyUWlqaUFpOGZ4UXF4d3RS?=
 =?utf-8?B?Yi9CK2cwalNBM1hTQ1dBVVZWWHZaUW1WZ0QrQk8za1BlTHBITzR0VFNCMTh3?=
 =?utf-8?B?RkRGU1lrZ2NUM2tDL0c1eXBucDFWeG1QNWN4dm1VeUdRSnd3Sm05WjlyTW9L?=
 =?utf-8?B?TU5lbXYzTWxJRFNrK0NGVTJEZlBrTDZiQW50VXI5clJXVkZuMS9XNzVyVlNx?=
 =?utf-8?B?akw4NWtBZVh1TFJ2aEFRc2NSWEI5WHlhdDk2VTBNeHRaNVNjWFdCaHJSVlVL?=
 =?utf-8?B?Z2VZdDhNMWxEYnBQZGVnQ3VUR0VEZXlHNmEwQ0FQa2dFVGRzdE1UNkYwVU9Z?=
 =?utf-8?Q?aD/dL5RrQxwFNlBW6sQilmh/c?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfff1ca8-2d8d-41ae-7669-08dd815b13aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2025 05:03:52.8324 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nNHc1rZtogmhu51e8rg1j/c2aLLA29qt9jSTDTmB/o7pdfkZThSPf8NBxpiQT9n4eA6JP6GWHE9WunTTlCohQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8558
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwtZ2Z4IDxpbnRl
bC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBBcnVuIFIN
Cj4gTXVydGh5DQo+IFNlbnQ6IFRodXJzZGF5LCBBcHJpbCAxNywgMjAyNSA0OjIyIFBNDQo+IFRv
OiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnOyBpbnRlbC0NCj4geGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBHb3Zp
bmRhcGlsbGFpLCBWaW5vZCA8dmlub2QuZ292aW5kYXBpbGxhaUBpbnRlbC5jb20+OyBEZWFrLCBJ
bXJlDQo+IDxpbXJlLmRlYWtAaW50ZWwuY29tPjsgTXVydGh5LCBBcnVuIFIgPGFydW4uci5tdXJ0
aHlAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggdjMgMS8zXSBkcm0vZGlzcGxheS9kcDog
RXhwb3J0IGZuIHRvIGNhbGN1bGF0ZSBsaW5rIHN5bWJvbA0KPiBjeWNsZXMNCj4gDQo+IFVuaWZ5
IHRoZSBmdW5jdGlvbiB0byBjYWxjdWxhdGUgdGhlIGxpbmsgc3ltYm9sIGN5Y2xlcyBmb3IgYm90
aCBkc2MgYW5kIG5vbi1kc2MNCj4gY2FzZSBhbmQgZXhwb3J0IHRoZSBmdW5jdGlvbiBzbyB0aGF0
IGl0IGNhbiBiZSB1c2VkIGluIHRoZSByZXNwZWN0aXZlIHBsYXRmb3JtDQo+IGRpc3BsYXkgZHJp
dmVycyBmb3Igb3RoZXIgY2FsY3VsYXRpb25zLg0KPiANCj4gdjI6IHVuaWZ5IHRoZSBmbiBmb3Ig
Ym90aCBkc2MgYW5kIG5vbi1kc2MgY2FzZSAoSW1yZSkNCj4gdjM6IHJlbmFtZSBkcm1fZHBfbGlu
a19zeW1ib2xfY3ljbGVzIHRvIGRybV9kcF9saW5rX2RhdGFfc3ltYm9sX2N5Y2xlcw0KPiAgICAg
cmV0YWluIHNsaWNlX2VvY19jeWNsZXMgYXMgaXMgKEltcmUpDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBBcnVuIFIgTXVydGh5IDxhcnVuLnIubXVydGh5QGludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2
ZXJzL2dwdS9kcm0vZGlzcGxheS9kcm1fZHBfaGVscGVyLmMgfCA1MyArKysrKysrKysrKysrKysr
Ky0tLS0tLS0tLS0tLS0tDQo+IC0tDQo+ICBpbmNsdWRlL2RybS9kaXNwbGF5L2RybV9kcF9oZWxw
ZXIuaCAgICAgfCAgMiArKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCAy
NiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZGlzcGxh
eS9kcm1fZHBfaGVscGVyLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vZGlzcGxheS9kcm1fZHBfaGVs
cGVyLmMNCj4gaW5kZXgNCj4gNTc4MjhmMmI3YjVhMDU4MmNhNGE2ZjJhOWJlMmQ1OTA5ZmU4YWQy
NC4uNWNlOGNjYzMzMTBmYjcxYjM5ZWE1Zjc0YzQNCj4gMDIyNDc0YzE4MGY3MjcgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kaXNwbGF5L2RybV9kcF9oZWxwZXIuYw0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vZGlzcGxheS9kcm1fZHBfaGVscGVyLmMNCj4gQEAgLTQzOTIsMjYgKzQz
OTIsMzMgQEAgRVhQT1JUX1NZTUJPTChkcm1fcGFuZWxfZHBfYXV4X2JhY2tsaWdodCk7DQo+IA0K
PiAgI2VuZGlmDQo+IA0KPiAtLyogU2VlIERQIFN0YW5kYXJkIHYyLjEgMi42LjQuNC4xLjEsIDIu
OC40LjQsIDIuOC43ICovIC1zdGF0aWMgaW50DQo+IGRybV9kcF9saW5rX3N5bWJvbF9jeWNsZXMo
aW50IGxhbmVfY291bnQsIGludCBwaXhlbHMsIGludCBicHBfeDE2LA0KPiAtCQkJCSAgICAgaW50
IHN5bWJvbF9zaXplLCBib29sIGlzX21zdCkNCj4gLXsNCj4gLQlpbnQgY3ljbGVzID0gRElWX1JP
VU5EX1VQKHBpeGVscyAqIGJwcF94MTYsIDE2ICogc3ltYm9sX3NpemUgKg0KPiBsYW5lX2NvdW50
KTsNCj4gLQlpbnQgYWxpZ24gPSBpc19tc3QgPyA0IC8gbGFuZV9jb3VudCA6IDE7DQo+IC0NCj4g
LQlyZXR1cm4gQUxJR04oY3ljbGVzLCBhbGlnbik7DQo+IC19DQo+IC0NCj4gLXN0YXRpYyBpbnQg
ZHJtX2RwX2xpbmtfZHNjX3N5bWJvbF9jeWNsZXMoaW50IGxhbmVfY291bnQsIGludCBwaXhlbHMs
IGludA0KPiBzbGljZV9jb3VudCwNCj4gLQkJCQkJIGludCBicHBfeDE2LCBpbnQgc3ltYm9sX3Np
emUsIGJvb2wNCj4gaXNfbXN0KQ0KPiAtew0KPiAtCWludCBzbGljZV9waXhlbHMgPSBESVZfUk9V
TkRfVVAocGl4ZWxzLCBzbGljZV9jb3VudCk7DQo+IC0JaW50IHNsaWNlX2RhdGFfY3ljbGVzID0g
ZHJtX2RwX2xpbmtfc3ltYm9sX2N5Y2xlcyhsYW5lX2NvdW50LA0KPiBzbGljZV9waXhlbHMsDQo+
IC0JCQkJCQkJICBicHBfeDE2LA0KPiBzeW1ib2xfc2l6ZSwgaXNfbXN0KTsNCj4gKy8qKg0KPiAr
ICogZHJtX2RwX2xpbmtfZGF0YV9zeW1ib2xfY3ljbGVzIC0gY2FsY3VsYXRlIHRoZSBsaW5rIHN5
bWJvbCBjb3VudA0KPiArICogQGxhbmVfY29vdW50OiBEUCBsaW5rIGxhbmUgY291bnQNCiANClR5
cG8gImxhbmVfY291bnQiDQoNCj4gKyAqIEBwaXhlbHM6IGhvcml6b250YWwgYWN0aXZlIHBpeGVs
cw0KPiArICogQGJwcF94MTY6IGJpdHMgcGVyIHBpeGVsIGluIC40IGJpbmFyeSBmaXhlZCBmb3Jt
YXQNCj4gKyAqIEBzeW1ib2xfc2l6ZTogRFAgc3ltYm9sIHNpemUNCj4gKyAqIEBpc19tc3Q6IGlz
IG1zdCBvciBzc3QNCj4gKyAqIEBzbGljZV9jb3VudDogbnVtYmVyIG9mIHNsaWNlcw0KPiArICoN
Cj4gKyAqIENhbGN1bGF0ZSB0aGUgbGluayBzeW1ib2wgY3ljbGVzIGZvciBib3RoIGRzYyBhbmQg
bm9uIGRzYyBjYXNlIGFuZA0KPiArICogcmV0dXJuIHRoZSBjb3VudC4NCg0KTGV0cyBhZGQgdGhl
IERQIHNwZWMgdG8gYmUgcmVmZXJyZWQgc2VlbXMgbGlrZSBpdCB3YXMgbWlzc2VkDQoNCj4gKyAq
Lw0KPiAraW50IGRybV9kcF9saW5rX2RhdGFfc3ltYm9sX2N5Y2xlcyhpbnQgbGFuZV9jb3VudCwg
aW50IHBpeGVscywgaW50IGJwcF94MTYsDQo+ICsJCQkJICAgaW50IHN5bWJvbF9zaXplLCBib29s
IGlzX21zdCwgaW50IHNsaWNlX2NvdW50KQ0KPiB7DQo+ICsJaW50IHNsaWNlX3BpeGVscyA9IHNs
aWNlX2NvdW50ID8gRElWX1JPVU5EX1VQKHBpeGVscywgc2xpY2VfY291bnQpIDoNCj4gKwkJCQkJ
IHBpeGVsczsNCj4gKwlpbnQgY3ljbGVzID0gRElWX1JPVU5EX1VQKHNsaWNlX3BpeGVscyAqIGJw
cF94MTYsDQo+ICsJCQkJICAoNiAqIHN5bWJvbF9zaXplICogbGFuZV9jb3VudCkpOw0KDQpTaG91
bGRuJ3QgdGhpcyBiZSAxNg0KQWxzbyBvbmUgdGhpbmcgSSBzZWUgd2hpY2ggd2FzIHRoZXJlIHBy
ZXZpb3VzbHkgdG8gd2hpbGUgY2FsY3VsYXRpbmcgaXMgd2UgaWdub3JlIHRoZSB0d28gY2VpbHMg
DQpJbnNpZGUgdGhlIGZ1bmN0aW9uIGFuZCBtZXJnZSBpdCBpbnRvIGEgc2luZ2xlIGRpdl9yb3Vu
ZF91cCB3aGljaCBtYXkgYnJpbmcgYXMgc2xpZ2h0IHZhcmlhdGlvbiBpbiBjYWxjdWxhdGlvbg0K
Rm9yIGV4YW1wbGUgZm9yIG5vbiBkc2MgY2FzZQ0KU3BlYyBzYXlzDQpIQUNUX0xMX1NZTV9DWUNf
Q05UDQo9IENFSUwoQ0VJTChIQUNUX1dJRFRIIC8gNCkgw5cgUElYX0JQUCAvIFNZTUJPTF9TSVpF
KQ0KSEFDVF9NTF9TWU1fQ1lDX0NOVA0KPSBIQUNUX0xMX1NZTV9DWUNfQ05UIMOXIDQgLyBQSFlf
TEFORV9DTlQNCg0KQnV0IHdlIGRvDQpESVZfUk9VTkRfVVAoc2xpY2VfcGl4ZWxzICogYnBwX3gx
NiwJICAoNiAqIHN5bWJvbF9zaXplICogbGFuZV9jb3VudCkpOw0KDQpXaGljaCB0cmFuc2xhdGVz
IHRvIA0KQ0VJTCggKEhBQ1RfV0lEVEgqIEJQUCo0KS8oMTYgKlNZTUJPTF9TSVpFICpMQU5FQ09V
TlQpKQ0KDQpXaGljaCBkb2VzIG5vdCBzZWVtIHRvIG1hdGNoIHRoZSBjYWxjdWxhdGlvbiBleGFj
dGx5IGFzIHdoYXQgd2FzIHNhaWQgaW4gdGhlIHNwZWMNCkxldHMgaGF2ZSBhbiBpbnRlcm1lZGlh
dGUgbGxfc3ltYm9sX2N5Y2xlIHZhcmlhYmxlIHRvbyBzaG91bGQgbWFrZSB0aGUgY2FsY3VsYXRp
b25zDQpNb3JlIGNsZWFyZXIgYW5kIHByZWNpc2UgYWNjb3JkaW5nIHRvIG1lLg0KDQpBbHNvIGZv
ciBkc2MgY2FzZSBsZXRzIGhhdmUgY2h1bmsgc2l6ZSBpbnN0ZWFkIG9mIHJldXNpbmcgc2xpY2Ug
cGl4ZWxzLg0KDQpSZWdhcmRzLA0KU3VyYWogS2FuZHBhbA0KDQo+ICsJaW50IHNsaWNlX2RhdGFf
Y3ljbGVzID0gQUxJR04oY3ljbGVzLCBpc19tc3QgPyAoNCAvIGxhbmVfY291bnQpIDogMSk7DQo+
ICAJaW50IHNsaWNlX2VvY19jeWNsZXMgPSBpc19tc3QgPyA0IC8gbGFuZV9jb3VudCA6IDE7DQo+
IA0KPiAtCXJldHVybiBzbGljZV9jb3VudCAqIChzbGljZV9kYXRhX2N5Y2xlcyArIHNsaWNlX2Vv
Y19jeWNsZXMpOw0KPiArCXJldHVybiBzbGljZV9jb3VudCA/IChzbGljZV9jb3VudCAqDQo+ICsJ
CQkgICAgICAoc2xpY2VfZGF0YV9jeWNsZXMgKyBzbGljZV9lb2NfY3ljbGVzKSkgOg0KPiArCQkJ
ICAgICAgc2xpY2VfZGF0YV9jeWNsZXM7DQo+ICB9DQo+ICtFWFBPUlRfU1lNQk9MKGRybV9kcF9s
aW5rX2RhdGFfc3ltYm9sX2N5Y2xlcyk7DQo+IA0KPiAgLyoqDQo+ICAgKiBkcm1fZHBfYndfb3Zl
cmhlYWQgLSBDYWxjdWxhdGUgdGhlIEJXIG92ZXJoZWFkIG9mIGEgRFAgbGluayBzdHJlYW0gQEAN
Cj4gLTQ0ODYsMTUgKzQ0OTMsOSBAQCBpbnQgZHJtX2RwX2J3X292ZXJoZWFkKGludCBsYW5lX2Nv
dW50LCBpbnQgaGFjdGl2ZSwNCj4gIAlXQVJOX09OKChmbGFncyAmIERSTV9EUF9CV19PVkVSSEVB
RF9VSEJSKSAmJg0KPiAgCQkoZmxhZ3MgJiBEUk1fRFBfQldfT1ZFUkhFQURfRkVDKSk7DQo+IA0K
PiAtCWlmIChmbGFncyAmIERSTV9EUF9CV19PVkVSSEVBRF9EU0MpDQo+IC0JCXN5bWJvbF9jeWNs
ZXMgPSBkcm1fZHBfbGlua19kc2Nfc3ltYm9sX2N5Y2xlcyhsYW5lX2NvdW50LA0KPiBoYWN0aXZl
LA0KPiAtCQkJCQkJCSAgICAgIGRzY19zbGljZV9jb3VudCwNCj4gLQkJCQkJCQkgICAgICBicHBf
eDE2LA0KPiBzeW1ib2xfc2l6ZSwNCj4gLQkJCQkJCQkgICAgICBpc19tc3QpOw0KPiAtCWVsc2UN
Cj4gLQkJc3ltYm9sX2N5Y2xlcyA9IGRybV9kcF9saW5rX3N5bWJvbF9jeWNsZXMobGFuZV9jb3Vu
dCwNCj4gaGFjdGl2ZSwNCj4gLQkJCQkJCQkgIGJwcF94MTYsDQo+IHN5bWJvbF9zaXplLA0KPiAt
CQkJCQkJCSAgaXNfbXN0KTsNCj4gKwlzeW1ib2xfY3ljbGVzID0gZHJtX2RwX2xpbmtfZGF0YV9z
eW1ib2xfY3ljbGVzKGxhbmVfY291bnQsDQo+IGhhY3RpdmUsDQo+ICsJCQkJCQkgICAgICAgYnBw
X3gxNiwgc3ltYm9sX3NpemUsDQo+ICsJCQkJCQkgICAgICAgaXNfbXN0LCBkc2Nfc2xpY2VfY291
bnQpOw0KPiANCj4gIAlyZXR1cm4gRElWX1JPVU5EX1VQX1VMTChtdWxfdTMyX3UzMihzeW1ib2xf
Y3ljbGVzICoNCj4gc3ltYm9sX3NpemUgKiBsYW5lX2NvdW50LA0KPiAgCQkJCQkgICAgb3Zlcmhl
YWQgKiAxNiksDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kaXNwbGF5L2RybV9kcF9oZWxw
ZXIuaA0KPiBiL2luY2x1ZGUvZHJtL2Rpc3BsYXkvZHJtX2RwX2hlbHBlci5oDQo+IGluZGV4DQo+
IGQ5NjE0ZTJjODkzOTc1MzZmNDRiYjcyNThlODk0NjI4YWUxZGNjYzkuLjk4YmJiZTk4ZTViYzBj
ZTBmOWNkZjUxM2INCj4gMmM1ZWE5MGJiNWNhZmZiIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2Ry
bS9kaXNwbGF5L2RybV9kcF9oZWxwZXIuaA0KPiArKysgYi9pbmNsdWRlL2RybS9kaXNwbGF5L2Ry
bV9kcF9oZWxwZXIuaA0KPiBAQCAtOTcxLDUgKzk3MSw3IEBAIGludCBkcm1fZHBfYndfY2hhbm5l
bF9jb2RpbmdfZWZmaWNpZW5jeShib29sDQo+IGlzX3VoYnIpOyAgaW50IGRybV9kcF9tYXhfZHBy
eF9kYXRhX3JhdGUoaW50IG1heF9saW5rX3JhdGUsIGludCBtYXhfbGFuZXMpOw0KPiANCj4gIHNz
aXplX3QgZHJtX2RwX3ZzY19zZHBfcGFjayhjb25zdCBzdHJ1Y3QgZHJtX2RwX3ZzY19zZHAgKnZz
Yywgc3RydWN0DQo+IGRwX3NkcCAqc2RwKTsNCj4gK2ludCBkcm1fZHBfbGlua19kYXRhX3N5bWJv
bF9jeWNsZXMoaW50IGxhbmVfY291bnQsIGludCBwaXhlbHMsIGludCBicHBfeDE2LA0KPiArCQkJ
CSAgIGludCBzeW1ib2xfc2l6ZSwgYm9vbCBpc19tc3QsIGludCBzbGljZV9jb3VudCk7DQo+IA0K
PiAgI2VuZGlmIC8qIF9EUk1fRFBfSEVMUEVSX0hfICovDQo+IA0KPiAtLQ0KPiAyLjI1LjENCg0K
