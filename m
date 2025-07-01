Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C75AEF132
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 10:33:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC4310E533;
	Tue,  1 Jul 2025 08:33:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UKzXGr+d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C4E210E534;
 Tue,  1 Jul 2025 08:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751358779; x=1782894779;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vUwFPb2sNIlv4n8RjUqCoAioaaEWOPEMuS7XAWaNMTI=;
 b=UKzXGr+d12YdyIUG2s3sa0XEdSNj8TBkbIx2Qa/wAs7+Es47fBgznrvL
 rAJLkZJUi7HzkiMe5ug9rb4WCNX25kGUhiIsLLDrkITCytWrd4hpWGX9P
 s8mqoGprh5dsmM37t/rdp5rKkEhlz1BlUZngJiEKGaDf0VMNcu3NxsQCW
 aUGDeTOYSDcCqVIa75mc4ZaQRMTlD3JLR5ZzZrNI8hXlw+jBQJGoKyp2+
 pfQPbzggiUSlvY9dopfNv6UD7hUsQI1gxxiVSK30wSJwWTM4EUwQfas2O
 AC+H58EJvwpi17k/nF8gTi3GSYe0vRnAWDK0oxSj5RrBQiPZBszLtD8iR Q==;
X-CSE-ConnectionGUID: jbdjF4DvSoezjIHtbfv2vw==
X-CSE-MsgGUID: Kaod+SWpR96HbThaHofePA==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="53548015"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="53548015"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 01:32:58 -0700
X-CSE-ConnectionGUID: 1v4PaJDJQSu8lUZi22u/lA==
X-CSE-MsgGUID: 6ivHBdPESmSL72H1O0N39g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="153096336"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 01:32:58 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 01:32:57 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 1 Jul 2025 01:32:57 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.71)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 01:32:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vQZVyfDBQMTqd+1kbl4LeBAfVK5rnLORVsOfJMbOjexJS+nv9FG2ngkbojUX9A4yfvwUgvQB8hCp5Q3jE+Z0EcElo2V10t5ZXHynxV6aM8wfRmvpF+OmyCPsD/lAoMYCLntpE6NDiHAVhdQzBOQM8jnaralppIxga0k0evuvA7NRpLfvJ+wfNXPLxl9U5PAOooMlwjlwG8noLYT5MVVGyrBS5xJ1iFIBF1P6+SxESoB17ZlCne2sgf9YKOdrM7fbs25/x0liNxHiqVuElb7iWAkJdSHrKHcqrDsTk/ZMOpnikRQ0iDqhlLFH85otv+e0oVrqrf9TUSZb+2TigY/ZZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vUwFPb2sNIlv4n8RjUqCoAioaaEWOPEMuS7XAWaNMTI=;
 b=QyDXNn/NlyXfcljTPYSLryXwDEHLhtvCHsPDj/Iig3zMWfBb4SzhPGfwAiAkqrp591LVUoCej7TyTa4hwpG6xj3KwfdUAeanPaWs24hzvXAJZk/R/1F0K8X7PtMxz0t3IvsL5togipWoaLcbIEDO8eFcIItLLSL1mBeL2udtjsgiBRvPk7ix1pDWNKuBlNF1FfI7Lz/JjfL6m2VSpSZjku+VhT07lWniJvmkpijTij4kNU39i3sueJXhV/X1Jt2JFh9tGtje/HkACztFLi50UpoA1ev96VTSE9L/+SQYAWCGo7zcA1pCP1YfjYP/NIT6NpCOWRinc5Y2CY9+hgIOvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by MW3PR11MB4668.namprd11.prod.outlook.com (2603:10b6:303:54::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.24; Tue, 1 Jul
 2025 08:32:21 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%5]) with mapi id 15.20.8901.018; Tue, 1 Jul 2025
 08:32:21 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>, Greg KH
 <gregkh@linuxfoundation.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Gupta,
 Anshuman" <anshuman.gupta@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>
Subject: RE: [PATCH v4 02/10] mei: late_bind: add late binding component driver
Thread-Topic: [PATCH v4 02/10] mei: late_bind: add late binding component
 driver
Thread-Index: AQHb5fIovEVVgypf8kmRHl0YtfTjo7QYgfaAgARwjgCAAALLAIAAAWsAgAACblA=
Date: Tue, 1 Jul 2025 08:32:21 +0000
Message-ID: <CY5PR11MB6366894B5667A90759A7EADDED41A@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250625170015.33912-1-badal.nilawar@intel.com>
 <20250625170015.33912-3-badal.nilawar@intel.com>
 <2025062808-grant-award-ee22@gregkh>
 <a0e54703-721e-4e87-9962-7007771f947b@intel.com>
 <2025070131-snaking-trolling-87dc@gregkh>
 <BN9PR11MB55308686A2B95B0234C8B889E541A@BN9PR11MB5530.namprd11.prod.outlook.com>
In-Reply-To: <BN9PR11MB55308686A2B95B0234C8B889E541A@BN9PR11MB5530.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|MW3PR11MB4668:EE_
x-ms-office365-filtering-correlation-id: ce45a0d8-c569-43b0-3652-08ddb879cc71
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VnNlcW44aVZKUy96RUFoMk9qdVdINlNZREFWQUEybmFFaFdWcFd5ZTdZdTZi?=
 =?utf-8?B?Qi83eDF2eVVJK0NYS1QxblFNUWhIUGNSTVh2bkFjdFY4QmhMSVZ4SzFPK3VZ?=
 =?utf-8?B?NExTVEcyUkxaQ0VxK2hIVU91ckk0VHZrNXR4YnNRYjdOTVltU21WOTFhOFRD?=
 =?utf-8?B?eVo4d2g2Q1hPYnJTbFc4T284N1pSVzNZakRRWXFkelRaQmUxMnFGOFhTK0gr?=
 =?utf-8?B?bHNhVzlpMVgreGZSaWlsU25CaFpsV0hnNFQ4LzZGOTloK3N4bStQZE90bFgy?=
 =?utf-8?B?aEFoUUIvWURMWVA2bWZZdklDWFZjKzlpTEhLOTZqNjBhT0NXU0hLV2p0TWxa?=
 =?utf-8?B?VUREMmRzZVNVNkVQV0ZxK3RWVGVXUGtwcFA4d2RhSjhBUmZOdVk5Yk1LeHVv?=
 =?utf-8?B?MVFBQ3lDRTRYaUNCemRZVWl4cXdNTVAwcDFweTF4MUhKVytzYytWczlYNEt2?=
 =?utf-8?B?SlA3OGxOTS8zNjRhL3RiQUUvWWtyd0kwVmRnUW1vT1dod3BzdkdRYU1kT2NX?=
 =?utf-8?B?QXFYblJNQmJCRUNjaURYQlJvV1BPOWZKcXVTMEZEeGg0SGRORk8vNzNHSWNk?=
 =?utf-8?B?eGR0dDBSa0dXYkpVOFJyQkdEbmhQaE1ydm82VnhNc0hqNnhvQUwveHJaQkQr?=
 =?utf-8?B?aGxFTlgvaHRSSmppWDBjNGVJd05IeGVkc1N3aGppL0hZY3Y5MEhCREMwcEor?=
 =?utf-8?B?dlh4QWNyUE9lWE1zYkxzUW5aNkk1T1RpbzhTZ3lCU2JDbUlrODVWQzlUTGdt?=
 =?utf-8?B?VFdyNGZFS24zcXkya2J6VXhiWi9rYVg0ZklLUnZpdGpLMFpDTjE0UnZOZGtv?=
 =?utf-8?B?K1p2YzFnQjJuUmF3Z3kyUFRFcUlKS3U2emxOeG54bWdpbmdBQXRpNVMrYldx?=
 =?utf-8?B?VzlSNjhxZ3l1WUdiOWtVQmFxV1RkekdKQVZxWjhpdXV0U0lpQ0pDVHVITDJ3?=
 =?utf-8?B?ZmIzR0t0Uk1QVFJaVm9CYUVIbnY4RXRKSStkdUpPVVdZeDAveWRueXZncUJV?=
 =?utf-8?B?dkZ1bk5mRnM0SnZZVTJPOWVSbWZxU2pQRStUZEFMUXBqRlFONkV1YSs2Ti82?=
 =?utf-8?B?MnpsazNNN2c4aGRnYUcxcFl5bGxZMzNkZkY5N0ZUVlNVb1Nka0JKWXBQaC9E?=
 =?utf-8?B?TnBlMHhobmRhMWtzdDUzSjIxY0x3MGdPbVVZN1l3eDhMeHRadXpxVDRydTdB?=
 =?utf-8?B?d0YyMk93UGYzNG5Ra3B6b0JvYno5Z2NqMFlpTEtHeFgyRzhMSXlRNTFhQkVQ?=
 =?utf-8?B?NHRxZmExcHNIQVRsNlZqcCtsaE9iSTVaNW1hUld6ODVEaFNNZitnVHYwdFV3?=
 =?utf-8?B?NExWbmo3dlVHVGdtRGZNQ09IYlNCc2JWZ09wcTU0eVE4UWFHRkxFUkxaOUg5?=
 =?utf-8?B?cldQT1dtVDJITWY3NkU0NndRcHh0czJLRDBIdVU5ZmhhVGdkQzJHcXZJZU9m?=
 =?utf-8?B?TFE5WjV6UGIvOXlRODdmYWY0TDZNcVhvbkN0Vy9Qdit5ZlJ1TmNUS2NRNUEv?=
 =?utf-8?B?andZdGEwL3M5Y1J2S1M0aUdWRHB6R3preE1MaUJndlJZSzJYUmp2UjVGM3NN?=
 =?utf-8?B?R3haM3NuYkk5d3N3bFBjNnJDT09xRVFoMFhuczVaYjRFaWlvTVZYY1NOK2tH?=
 =?utf-8?B?MkhlWldiNUhwY0grNDB3YVpXdElMc0ErV09DWXZQeGhWem92Q3poanVhYUNt?=
 =?utf-8?B?MmpMSTVXVkxOTDg0RkJLZ1d5YXg2WEJsemUxdDQ1ZXZwdnpnMXlBY2VVM0Fk?=
 =?utf-8?B?RXhTREErS3dxdklzajRMSjc2L0tuWThERk5GTUM2Z0dCRTRLTDFCZzBwV0k5?=
 =?utf-8?B?b1dFcy9LNlkvYll2NFdGNXI3YnR6cThhN2tnWEtyclJFUzRKeUtZUVppUWhY?=
 =?utf-8?B?MlpmWG9QSVRFSHB3SHRKOWx3Y1JUMWZ0NnZIUVQyalFGY3RrK1hVS2RPOFFx?=
 =?utf-8?B?ZW5rdm5EbTRFeVZDTlY1RHBzYWpQNE1nM1JZWXhrYXZHWHkwcGUzUjhHZzhr?=
 =?utf-8?Q?07djpdNTu8W41yaRHZNHtzgY+o8nmg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RG1RUmJYQkU1MUZKZmN1MmpSbWpnaEtBcjdWQlFscDdFNC9IWXZJWElpdTRX?=
 =?utf-8?B?TTNSMy9GbysrN2tyeSt1dmlWd2FjUFRxYlVNTk9md3VNbWhYMGdmeUtWcmdo?=
 =?utf-8?B?Y1h6WFN1SWdTUXNyNTRYS0pGVDJuUE5sZktPODdNdWlIcWNWTUQ0MklrVVJ3?=
 =?utf-8?B?cm5rWUFweWdtN2FoTXJTWmJUeEtzWGdxcnRIb3dxUWs0bUUzRXJFSzcvNVNE?=
 =?utf-8?B?SzNtOWxqYldXMXgwaVJUQTZ3WElTbVpGWjlzTnN0ZEFCUW5VRnNyU3RZdXcw?=
 =?utf-8?B?SVEzWnZ4Um5hKytHdE03QXQvMzhZTUhnQk5oMnc4TnY2d3N5akVZS2VVY3cy?=
 =?utf-8?B?Z3JWN0wrL1NMZUhIMnJEVjM5SGRKbEZVRDNjbkIwVTNZZlNMdUpZYldvbi82?=
 =?utf-8?B?OFNUTWRJVFhVdnd0RXhYZ1pnenR0VEFHRjNWc0l1a29zdnFwSWJxTVQ1azRW?=
 =?utf-8?B?U1RNOFd3ZE5NUWUvVVFyN2pzWVJOWjZvcFlPTXNVMVZXaDI1cEROcjNVUE03?=
 =?utf-8?B?SVF3VE1kajQ3VXIrYXVMbGFheU50SDNJb01lRnFpZ0dFY3pPL0FzbmlzN3k1?=
 =?utf-8?B?OUdFVXluWUdDczRqZnpGQkhYRUxncmp6YlhCQjFEYjY3MDJHUFlzRDcwOE5V?=
 =?utf-8?B?d1RxWjkyVDN1eUU0QzNuQ1B0MGxTeEhDTWFsQm00dDk4Z1Q4NDA0MUFWU2ln?=
 =?utf-8?B?MmZWTzZzcWMyYWRWSVMrVEoyWEJhQno4dEFkUDlvdjJmam15ak05d1JiREgz?=
 =?utf-8?B?M3ZwRXlVTDBYZDI1NTgyOFgxd0xKNy8xTzhrK3pnT3hvaE8wNFZNMWo4S2FH?=
 =?utf-8?B?NFFwNmJnS1dVUXJmbW9hOVdORWc0OXhTVTVKODFQTFJ5Ujd2WnlEZTlNYnp6?=
 =?utf-8?B?VVBqRVJnaEJLVXd2V25iOXZOUjBXMTJueHZtN3BHRjJUcmlqM1haeVE4WFZm?=
 =?utf-8?B?ZWwweGNtTG82Vm1ZYlhLSHFWcHVNL21qa2pzN2dGM0p4YlYwZ2txdHRYZzZU?=
 =?utf-8?B?RDY3QXcwVGE2bWF5NnZyeHRPbjdlbEUzd1pPSlI1VFVjMnROTll4OWNkNVZ5?=
 =?utf-8?B?OHJUUnRsSURyN3Z1WUg3RWV5cDlOMXBJejFZYStqZFI2M2Z4NEV4YktNY2ZV?=
 =?utf-8?B?SEY0Qi82R0NvbFVidlZIcnBaRW16ZzRpTit5dVUyVy9OTTI1dTVoMUdsay9p?=
 =?utf-8?B?SWtsMXRudGtocytsbTlMYU13dFlpVXR1S1N2RzlVU3ZrcWpPbUVqV0VXUDJC?=
 =?utf-8?B?akVhbmJhNmpxZXVFMU5PSklzN2lISnlZb2xYKzJUWVovRFJEZEhnYXlDNlNR?=
 =?utf-8?B?akJJZ0RCL24vemI3ZXI3eTh4MHRUUHNBMC9kRzRKcUs3RkVScERJSFdTMTZj?=
 =?utf-8?B?RTlDdmV4RzZ6bWhkT2hWODFQSGpwNEUxdVFLcWNuUFE0Q2k3eFJlSktpNnhl?=
 =?utf-8?B?Q1NhTmxqcDZkbGJSeno5TVZxQ1ArSEdOOGsyNStNSkRPa21zYmo0bGxTWFcz?=
 =?utf-8?B?YlJ3aWp0UkhSelIwRzZHaVZXRXNVc3kzL1hzT1JpYjZoSU1vRTVCVHlXeUFK?=
 =?utf-8?B?cm8ramZpdXh3dEVSL0VwblozNndxelkzSHJvSTBGTGdMN2VwZzY1QnNHTlls?=
 =?utf-8?B?Zkp2ZGx2bTU4aWZGdG92RnhwVEV5QTZkVHpqUysyS2JOV1MrQ0k4NVRkenJj?=
 =?utf-8?B?U1E3Zm4weTNBRHloNmY4cGpsZUFDVWpJY0FPcG04WWtqdzdJMDBEZGxzSU1J?=
 =?utf-8?B?dWhHeE9Lemd1QWxVWTF2cmI3NjJHZzRqbDhXSTZtTWVpejk5VWxmMkRBS0Yy?=
 =?utf-8?B?Yzl4UFRaZUJ2dlh0NXZZMnhnNjlaamgzV3FaQVBkNUw4S1NNZDYydVcvdHZR?=
 =?utf-8?B?RU9IS0VaV20vUzAwb0pYVllqQ1RpY2N2NDdOT3BLeS9vUXdGR1J6WVM1SVdI?=
 =?utf-8?B?QkZsQ3oxUm4zZms5dlloUkhNTFJUWlJ6Z3JTckN6aTQwUVNtTUR0bVJkNVNJ?=
 =?utf-8?B?WUoydjgzVFNmOFpzYnlJUGFaTkdiMWNuc20yeWRRRXY0SWlvL0FDWTFHVkxP?=
 =?utf-8?B?WlhKc1pyR2hCbEd5cFdyMXFuMXRzVEZVbjVndXd2Qlp0cHRpNnNSVmlCb3lz?=
 =?utf-8?B?K3VKNEhzM3dzV2NKQW0zS0trTzc0RGpxd1BuT1RuRUwybjVPdnVRejgwcFZT?=
 =?utf-8?B?ZWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce45a0d8-c569-43b0-3652-08ddb879cc71
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2025 08:32:21.6540 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WaKptRZww3H3BvsXnc5d1Em1ZKBG9kbOR/XyV+hFdNsRJW61ZqgZiYuRuuGvvSgk9a5Cu5DtbeI4d5V+3uG1N/z9adMV13gk0iOg4C6kcAE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4668
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

PiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMDIvMTBdIG1laTogbGF0ZV9iaW5kOiBhZGQgbGF0
ZSBiaW5kaW5nIGNvbXBvbmVudA0KPiA+IGRyaXZlcg0KPiA+DQo+ID4gT24gVHVlLCBKdWwgMDEs
IDIwMjUgYXQgMDE6Mzc6MzZQTSArMDUzMCwgTmlsYXdhciwgQmFkYWwgd3JvdGU6DQo+ID4gPg0K
PiA+ID4gT24gMjgtMDYtMjAyNSAxNzo0OSwgR3JlZyBLSCB3cm90ZToNCj4gPiA+ID4gT24gV2Vk
LCBKdW4gMjUsIDIwMjUgYXQgMTA6MzA6MDdQTSArMDUzMCwgQmFkYWwgTmlsYXdhciB3cm90ZToN
Cj4gPiA+ID4gPiArLyoqDQo+ID4gPiA+ID4gKyAqIHN0cnVjdCBsYXRlX2JpbmRfY29tcG9uZW50
X29wcyAtIG9wcyBmb3IgTGF0ZSBCaW5kaW5nIHNlcnZpY2VzLg0KPiA+ID4gPiA+ICsgKiBAb3du
ZXI6IE1vZHVsZSBwcm92aWRpbmcgdGhlIG9wcw0KPiA+ID4gPiA+ICsgKiBAcHVzaF9jb25maWc6
IFNlbmRzIGEgY29uZmlnIHRvIEZXLg0KPiA+ID4gPiA+ICsgKi8NCj4gPiA+ID4gPiArc3RydWN0
IGxhdGVfYmluZF9jb21wb25lbnRfb3BzIHsNCj4gPiA+ID4gPiArCXN0cnVjdCBtb2R1bGUgKm93
bmVyOw0KPiA+ID4gPiBJIGRvbid0IHRoaW5rIHlvdSBldmVyIHNldCB0aGlzIGZpZWxkLCBzbyB3
aHkgaXMgaXQgaGVyZT8NCj4gPiA+ID4NCj4gPiA+ID4gT3IgZGlkIEkgbWlzcyBpdCBzb21ld2hl
cmU/DQo+ID4gPg0KPiA+ID4gSXQgaXMgc2V0IGluIGRyaXZlcnMvbWlzYy9tZWkvbGF0ZV9iaW5k
L21laV9sYXRlX2JpbmQuYw0KPiA+ID4NCj4gPiA+IHN0YXRpYyBjb25zdCBzdHJ1Y3QgbGF0ZV9i
aW5kX2NvbXBvbmVudF9vcHMgbWVpX2xhdGVfYmluZF9vcHMgPSB7DQo+ID4gPiDCoCDCoCDCoCDC
oCAub3duZXIgPSBUSElTX01PRFVMRSwNCj4gPiA+IMKgIMKgIMKgIMKgIC5wdXNoX2NvbmZpZyA9
IG1laV9sYXRlX2JpbmRfcHVzaF9jb25maWcsIH07DQo+ID4NCj4gPiBBaC4gIEJ1dCB0aGVuIHdo
byB1c2VzIGl0PyAgQW5kIHdoeT8gIE5vcm1hbGx5IGZvcmNpbmcgY2FsbGVycyB0byBzZXQgLm93
bmVyDQo+IGlzDQo+ID4gZnJvd25lZCBhcG9uLCB1c2UgYSAjZGVmaW5lIGNvcnJlY3RseSB0byBo
YXZlIGl0IGF1dG9tYXRpY2FsbHkgc2V0IGZvciB5b3UgaW4NCj4gPiB0aGUgcmVnaXN0cmF0aW9u
IGZ1bmN0aW9uIHBsZWFzZS4NCj4gPg0KPiA+IEFuZCBhcmUgeW91IF9zdXJlXyB5b3UgbmVlZCBp
dD8NCj4gDQo+IEluIHhlIGttZCBvbmx5IHVzZXMgLnB1c2hfY29uZmlnIHNvIC5vd25lciBjYW4g
YmUgZHJvcHBlZC4gTG9va3MgbGlrZSBpdCBnb3QNCj4gcHJvcGFnYXRlZCBmcm9tIHByZXZpb3Vz
bHkgaW1wbGVtZW50ZWQgbWVpIGNvbXBvbmVudHMgYnV0IGZvciBub25lIG9mDQo+IHRoZSBjb21w
b25lbnQgLm93bmVyIGlzIHVzZWQuICBTbyBpdCdzIGZpbmUgdG8gZHJvcCBpdC4NCj4gQFVzeXNr
aW4sIEFsZXhhbmRlciBwbGVhc2Ugc2hhcmUgeW91ciB0aG91Z2h0cyBvbiB0aGlzLg0KPiANCg0K
QXMgY2FsbGVyIGRvIG5vdCBuZWVkIHRoaXMsIGNhbiBiZSBkcm9wcGVkLg0KDQotIC0gDQpUaGFu
a3MsDQpTYXNoYQ0KDQoNCg0KPiBCYWRhbA0KPiANCj4gPg0KPiA+IHRoYW5rcywNCj4gPg0KPiA+
IGdyZWcgay1oDQo=
