Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A691EAEF45F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 12:05:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 664BC10E586;
	Tue,  1 Jul 2025 10:05:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nUKY6vSZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D23DF10E583;
 Tue,  1 Jul 2025 10:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751364331; x=1782900331;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dMfUgbmec6OtalUCAIwNBk0ALiZT2JI093iGfzdP3Yc=;
 b=nUKY6vSZ0srGIW3Z6Ngk6IAqOqBeYDQpEZCGEgdj9MPWFqvOUQJEFLHE
 KuLdKBEmkMWHkHgwMzBVUyZJ09j48ifanLcEXqydTVrC4p8Tl1Kx1ZeNi
 KmM9VS0Zj+56vOW1x82vdLXsLZvOvrmrJuM3Ra+QeXhNrnofCeuJZm0jZ
 HHRPaAfFhowyLOpQcbolr0EAykLQCxS3Hip7scWduIb2ok/kWdnciIJS8
 C3sKrpB4yP2qyYP2MI4thJ2QBsHUDhaPx5rHNHvmrS87pGkrItMZ4q9ex
 g/XE3andhti4mGtNjhxEmwSz4Zt4TL+FYdEeP7/vWKB/rkEKt/vV1VSiY A==;
X-CSE-ConnectionGUID: 5NgoHKauSWmePIIXI0KUcA==
X-CSE-MsgGUID: p3SELTiSQGmAlyAWz073aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="57429934"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="57429934"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 03:05:31 -0700
X-CSE-ConnectionGUID: jEHMvAJ+RvGoS4zYHsRgVA==
X-CSE-MsgGUID: cni2xgl/TRahvL2D31FO/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="154218785"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 03:05:30 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 03:05:29 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 1 Jul 2025 03:05:29 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.64) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 03:05:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ciMzq27TMgnEIkaOO/Pk1OntIp7VWUHEhc4JqLcMfgbt1OEtHcWP6iVSY9c0sJ+zqof+DxoCQaL7RcMO8aOJYBhKcSkZYZorKiNhi6GmRolHHXckAkE7tZRdF+I0VtFwfR3QDlTArd4fX7TQXil/cyFm4u0DcaJwFGy/2WWt2Ndf3HQVhm5i4ze8ydVJ6Hv3/kaW1en8NzrEEu7052FWBlav8wT8S6cmkV4GscmZhNVOTkoUsRt7YF5021YSctMMH82EwywmfYHhNKTjEdjoPDvDDUdWBWjOlD4On8QH574OXHzpZi/MMHWz17wx9I8E1gMJw+DKJwWcs46DgR2oYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dMfUgbmec6OtalUCAIwNBk0ALiZT2JI093iGfzdP3Yc=;
 b=bti7dMCQG6+khMXdzCmNURoDwiT7KBTr80UxIo/1XAGwDWlfH91lngzSgepRGX4i1TbdBwUS6mtHQKV0NAegzLyTug5sv8fKHVNEOZyv1+iwdrpVe54P2zHtSO+AvnuKtBNlnyFqYB3kAyKy9FTdWHj3de5jVwMsaaV44bFI8Gx4sslnE8Bw6tNpDYXVdjRmWrGN5ikXdyDl9TmaqeXhAbfM7ytFqu+85eQ4xmQLHGo5GDcj0I1vUUyBmkxcP1JWL4gJjoBsIry4I7qA2up0l1yXEOIQReqSQL0ShW2rr0azOOdOLkQWDj0+5fU1nhTYaUpneMApOx9vgUzF8sFLZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by CH2PR11MB8778.namprd11.prod.outlook.com (2603:10b6:610:281::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Tue, 1 Jul
 2025 10:05:27 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%5]) with mapi id 15.20.8901.018; Tue, 1 Jul 2025
 10:05:27 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Greg KH <gregkh@linuxfoundation.org>, "Nilawar, Badal"
 <badal.nilawar@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Gupta,
 Anshuman" <anshuman.gupta@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>
Subject: RE: [PATCH v4 02/10] mei: late_bind: add late binding component driver
Thread-Topic: [PATCH v4 02/10] mei: late_bind: add late binding component
 driver
Thread-Index: AQHb5fIovEVVgypf8kmRHl0YtfTjo7QYgX4AgAR4P1A=
Date: Tue, 1 Jul 2025 10:05:26 +0000
Message-ID: <CY5PR11MB6366E8BA6721BB6B587B03B4ED41A@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250625170015.33912-1-badal.nilawar@intel.com>
 <20250625170015.33912-3-badal.nilawar@intel.com>
 <2025062834-scraggly-barracuda-7ea6@gregkh>
In-Reply-To: <2025062834-scraggly-barracuda-7ea6@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|CH2PR11MB8778:EE_
x-ms-office365-filtering-correlation-id: 04c523d2-54d3-4a18-b795-08ddb886cd8e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RmhJalJOMW9FNy9YUEU2akJ1Ri9ONlVmMmZlTDBjY2pNcWo2WmhPbDhzM0pP?=
 =?utf-8?B?bkdVYzRlYjZIZGpHRlZnT3BKWkVNVTY5TTJ5ZUl1YlJNSzlOdTdpQkNnbm1C?=
 =?utf-8?B?aXZDdEJWNFp0OEFMMTdFUGVjOElwV0ZpSGFhTTFhVmtxalNJSnVPRWNxRThG?=
 =?utf-8?B?TytkVU9FR2IxbEpjelcrcDd5NzRmOW5sSnBBSkdrS0ZyVW04a0dyMVZEakV0?=
 =?utf-8?B?TGd3ZlJkb2ZGOERqdnZ1dXBrRlNzd2JSZm9EdytjK1VUbzhyMG1nTGhaTitF?=
 =?utf-8?B?NzJZd3Q5ZGVzSGFrbEMrUkJqdVROR1pwbkFveWtyYmZWejJNZ0hBNU5wVkdK?=
 =?utf-8?B?cXVtYUgxOWlWVW5Ga2tQamI3LzNMQTZaWnE3Sk16THR2dDhqcXJKUktkbmVa?=
 =?utf-8?B?Ti9oWkc2eDMxQmE5VXB0U0hwL3JNb0RpOE83NzRZdlJrU0tNRHpJbEJQOXNh?=
 =?utf-8?B?WkFQVE40OGMvcnVjR24rTnp3bHA1UklvTUVYVE5ON0c0VER0OFhPdi9GYXhP?=
 =?utf-8?B?OGY4b3k3MzB4TDRvSytBRmwvWjJ5UzFaNDh5MVZkcm84YXZCd1pvaGE3RkNu?=
 =?utf-8?B?SzhpTVFia005ZkY2dXFqU05rNzNiTndYbXBkK3YydWIvZnp2VjJrQkd1QUgr?=
 =?utf-8?B?eXI0Uk5CMUFCdWc4bmV2a2FmTHRXNjI5TzhER1hyREFxVXdGUXZtYm5sZFlL?=
 =?utf-8?B?OW04ZEExcWZPN0hDRlh2S1NnM0Fuemw0RUk2Nmg5NlZ5UUJJb2t1TlcwUytB?=
 =?utf-8?B?dEZhM0hKS1dzTmNYcFNNdjdla3haekZ3VHdxSmtvUTRmN1ZoaTQ4NnJ0OVYx?=
 =?utf-8?B?ZXdpTllIUXFkbWdxSVkzRHRoZ2lUWUFmb3NaTkpSUm1meXFOWjFaZWJyNkNa?=
 =?utf-8?B?cHlkZGU5TmJDcVJrUlJ2UC9taGxJQWVnL2RDVThFajF0ZFJsYXNrZGhTbWlH?=
 =?utf-8?B?aUdIa2gwbDBKZFlJZmp0UDVzb29sZ3RGRHlRZlV6RFRnRHhWdW9MeUQ1Tm15?=
 =?utf-8?B?UW43WWV6VFpxKzNBYnVsdkQvREk1NlNIY2NWUHRtMm5ud0NXZlpac3NjYjhn?=
 =?utf-8?B?K3RPSzNLaUVIMkxZaHVpUmtPRThKTUQ5aFJZUnVLRU5NTnpYMmRYZzhiWUpS?=
 =?utf-8?B?MzlVMWgzQmIyZjBvM21teWtYWnFub0NPSnNneW8xSDBWRkFJZEFqMVV4N1V6?=
 =?utf-8?B?eWY3OEk5TkVqRjZ3WE81TTg4M2ljdDhMQnJRdUVnWEk4dy96QUR1VjMwUlNB?=
 =?utf-8?B?MDVBM1ByblVjT2xsZzBPajNabWltVXFFQ2EzRGpCb0hQYmMvaUZ2OE4zZENP?=
 =?utf-8?B?VE1QWmRmTXJ3MDJ6d2VBbm13UHR4bkdjLzZNVG5Gb2pCblUxQjEzelpFZTBH?=
 =?utf-8?B?bVlxNE5xTGZOTWljUWhSVzdzc2hncTlKUGl5Q1dxTVJNVW0wWE1qNm5qWGVH?=
 =?utf-8?B?MXFoK1FlQVhSZDVSVEdyaWw5ZGY3MXl0YW9tK2FCSzRlZFoxQkZEbVFCR1l0?=
 =?utf-8?B?UWN1SnllUG5QTUU5eTdMNm9oZ3ZtMTh5UnFuSmxtRFBxVUo2cGRxUUcwdkJE?=
 =?utf-8?B?OHJ1MW4zYzdDbUlFQjl5WDF3RmM0N2ZucjExNGRmN25uV2JDNWNreXl5UWw0?=
 =?utf-8?B?RTkxOG1tM095OG5HbHpxK2ZNS1hpaXhOTUVFQy9WdlBUbVh4NWp2WXlMb0Fp?=
 =?utf-8?B?QkI5anF6UDVnVEx1c25rVyt1ejAyWXBZbHN3UjhUZGEvT3o3RnB6OG1TVXBU?=
 =?utf-8?B?bnJ3RWE0bFJGR0pDVXBMeVlyd3MvUUVUMVlPOHc0N3FpaWFENmNRMjV6T2lD?=
 =?utf-8?B?VVFGb0JRV2IzWmxsTkdyazFBUWhKSkRzN2tPZnloV1ZWZGFpbVorU05yY0t1?=
 =?utf-8?B?cndydlBoM3FxL0ExQ1ErMzc3NEVibytJaktYUGhncFpxT3V1MkNLNHdCdVZw?=
 =?utf-8?B?Q0hFdEpOWWhXWDQvL2VWUFY3aWU5akNzeWpoVVNLd25iYytCdDEwSXF2Z3E2?=
 =?utf-8?Q?A9PNYO1OUoCM7k9uH8NTdR30xByoe4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T3gweVJRM2F1aWhKNjdyYTFrbElxYW8vaWRNblJYaGc0a0Q5dXA1V0dxK2Vy?=
 =?utf-8?B?b0ZqU1ZpbHRDWWJ0Yjdnc1FUYVM3U1pWT3JONFBJaHplMzhVUDJXTExDcTNx?=
 =?utf-8?B?eTZFRGo0MjFLZ3dVdVFNZ1Q1TjZ2cHd4MVBJMHVRbmEzakFBMjhtQzRKQitx?=
 =?utf-8?B?MHpmL3ZQZkJvUFBCZWRFUVIvZFNjcXhPd0ovVWg1MXZRTzV3ZjByK1Fhakll?=
 =?utf-8?B?aWE0aVhVMDJpVnJ0VlpnbTJEaldTYUxWVnRHUWFpelc4Z1BOUkNDQWNoSU1a?=
 =?utf-8?B?d3M0SjJramZMd3UxWVlrOUh1ZEZ2WjN5d3dvY2VmaFpSRlh5T1FzdUtIZFQr?=
 =?utf-8?B?cXo4aDA3RWJ0c3RZMDlsdXZkaldhaDZTemtpcG5xYkZyR1pxWVBRUmJ5Q3JO?=
 =?utf-8?B?S21waEwvMXN2RzN6cXd1Z3I3ekVYMFVkbW5lSlB6RFBqL0JyekdwTjQ0cGth?=
 =?utf-8?B?RnQ0N1pkVVRtSDNMd0c2dWd5VmZiKzFTQWFBUlVQa3BkTU9DYjZkNm0wYmVZ?=
 =?utf-8?B?V3VzS21pNTBCTjlIVlJILzVrSlpkaTZaL0x4ditncTZjWWVOTWdMKzVMVWwv?=
 =?utf-8?B?SWZXdVN5NUMzdVRBWkJEUEV4ZDhuQ2JVbXIyV01jQ2dESldBUTJkVnhFQjll?=
 =?utf-8?B?L3J6T1B3bzI5dUtURk5PVGhadE9vbll5SUhtb0VuZGtjdm1YWG5keUsyUTFE?=
 =?utf-8?B?NVVQN2dyOXZzOGRjOXFlM2Rxb0grNUJFbkNub09xOENvMmV6NjZNcGExK0Zt?=
 =?utf-8?B?NWZTa005YWdjQWhlaG1xUW4xNDdyQVR3VUZ6aXJOQUt0dWVQOWV2MHBjQVN5?=
 =?utf-8?B?S3ZHbWE2NUo2SDZ5ajZpSTlSNDRMbllkaHFtcjc0N3h6Vks0bXNiTjAyRUNZ?=
 =?utf-8?B?aS8zeThaWjNuUlprMXFZSjBhNVFmOENhaFNKSERqNk04VWxtSm9Ga0VOVjV5?=
 =?utf-8?B?QlZjLytZUGNCYzdYN2M0NWdJb3FTb242VFlNemIvM0hWMkFNRmpvOUJBNDRK?=
 =?utf-8?B?MlBXTzc2bEU4WXBaazJYVE5VR1FQa2o3dGxJVGkyRlB6d2dXK3lLR0pBVWlN?=
 =?utf-8?B?Nmh4TEtkY0hJa2cwSjZIdHJOanZrbjFoaTRiRkgzdEV0VGxZZ21MelJMRm1J?=
 =?utf-8?B?TUkyN2tvQ2U4MkxJZFJhcmZhU3NsQnBNQllxS0FROUtQVkxWd243VlRhRW43?=
 =?utf-8?B?RDJyUVhDR2d2UnZLMy96N1cyUFVubGNabjBjQlUyUjArRVZYNXhsWWNubFpP?=
 =?utf-8?B?a0NtVk5MMC9PUTk3aWN0cFVYU09PMlF4a2RsaXF0T1RjbGFlUVZIekJCc3Zs?=
 =?utf-8?B?bWt6Mjg4SVVKdXNLQUVIaEJQZTV1M0xzQm9RbzlZWjFwSEtTbnhsbm9BSVQx?=
 =?utf-8?B?NU5EeG42V3V2MWJURUhiYmQ5dDdsb3UxQ01kcEl6RVVhT3RqOFYxMjY1YVVD?=
 =?utf-8?B?Qi9WZEcydEdoV2pMMnJFT3lhZGNSam1obElwUHhDMm41a1o0OUlKUG5qNWV4?=
 =?utf-8?B?MzNYMm9BUXY3MThoZlc4SDFrV2JHemM3UCtrTE8xWHNkK1ZTYUZoaWw4TXJo?=
 =?utf-8?B?QzNyQXR2RnlGZk5uNFc0bnUyWTllSEd4V0dCcTZWVkVTTkJJSW9VeHphV255?=
 =?utf-8?B?UmtKL1lFejZ5OVBnT1VUK042Q05rRjhubjBNMVhzUlp3dndwNlBTRmNkQTZX?=
 =?utf-8?B?NmJMMnNNeWRSRlNhSXVYb1p4MXFKRzBjRXBuRjluUEZrZnE0RmxLUmlYbG03?=
 =?utf-8?B?c05TNjFZMWM3aCt2Q0hqcGtyb01NeGRlM0ZicElsSFIxdWVvVnNLMkxHTm9H?=
 =?utf-8?B?UXR0bFZpY29zMVlETEYzZllMc0pjTmRBSVQ3ZVRiWjU3Z0Y1M21NdVF1cnNi?=
 =?utf-8?B?cEYvcTVDc2dTbi9XWXhDL3B1WUsxUVUzOEF0by9Kb2FRZkVMbldJYnRuUm4r?=
 =?utf-8?B?R3ZpaUU0MGJyNnQ2OFFpZU5lTHVTWXoxSEFuUmNxbmJDbnBaWlpyOFBrTkRP?=
 =?utf-8?B?MnZmRE9rblhxT2l3RVU3cWFaekxqRjBKRlVOelJnSGJoWndZZTZPVkcwNlc1?=
 =?utf-8?B?TmE2VHFrd3ByOFVHaFR3ODM0Q1VjajFJaTdWZDRiMkI1anF2UjgzWVBqakhE?=
 =?utf-8?B?ZGJGRXNjUlo5dTdpaEZ6NlpmUmpCaGkyczZTUDQxRDNTN0gwYXBxc2h4alg4?=
 =?utf-8?B?WEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04c523d2-54d3-4a18-b795-08ddb886cd8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2025 10:05:27.0038 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tJzcJ2VBLA8p5DYCrPRvCePMiDz4nY5uuDfIf+eL/GojoJLqH2vWK/TqKAFrXThkPJZWCMZK8Yfbl9VwTZ9CpJhwKN96z5xWSPdTrPcV1rQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8778
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR3JlZyBLSCA8Z3JlZ2to
QGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+IFNlbnQ6IFNhdHVyZGF5LCBKdW5lIDI4LCAyMDI1IDM6
MTggUE0NCj4gVG86IE5pbGF3YXIsIEJhZGFsIDxiYWRhbC5uaWxhd2FyQGludGVsLmNvbT4NCj4g
Q2M6IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZzsgbGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IEd1cHRhLCBBbnNo
dW1hbiA8YW5zaHVtYW4uZ3VwdGFAaW50ZWwuY29tPjsNCj4gVml2aSwgUm9kcmlnbyA8cm9kcmln
by52aXZpQGludGVsLmNvbT47IFVzeXNraW4sIEFsZXhhbmRlcg0KPiA8YWxleGFuZGVyLnVzeXNr
aW5AaW50ZWwuY29tPjsgQ2VyYW9sbyBTcHVyaW8sIERhbmllbGUNCj4gPGRhbmllbGUuY2VyYW9s
b3NwdXJpb0BpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMDIvMTBdIG1laTog
bGF0ZV9iaW5kOiBhZGQgbGF0ZSBiaW5kaW5nIGNvbXBvbmVudA0KPiBkcml2ZXINCj4gDQo+IE9u
IFdlZCwgSnVuIDI1LCAyMDI1IGF0IDEwOjMwOjA3UE0gKzA1MzAsIEJhZGFsIE5pbGF3YXIgd3Jv
dGU6DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2RyaXZlcnMvbWlzYy9tZWkvbGF0ZV9i
aW5kL21laV9sYXRlX2JpbmQuYw0KPiA+IEBAIC0wLDAgKzEsMjgxIEBADQo+ID4gKy8vIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+ID4gKy8qDQo+ID4gKyAqIENvcHlyaWdodCAo
QykgMjAyNSBJbnRlbCBDb3Jwb3JhdGlvbg0KPiA+ICsgKi8NCj4gPiArI2luY2x1ZGUgPGRybS9p
bnRlbC9pOTE1X2NvbXBvbmVudC5oPg0KPiA+ICsjaW5jbHVkZSA8ZHJtL2ludGVsL2xhdGVfYmlu
ZF9tZWlfaW50ZXJmYWNlLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9jb21wb25lbnQuaD4NCj4g
PiArI2luY2x1ZGUgPGxpbnV4L3BjaS5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvbWVpX2NsX2J1
cy5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51
eC9vdmVyZmxvdy5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvc2xhYi5oPg0KPiA+ICsjaW5jbHVk
ZSA8bGludXgvdXVpZC5oPg0KPiA+ICsNCj4gPiArI2luY2x1ZGUgIm1raGkuaCINCj4gPiArDQo+
ID4gKyNkZWZpbmUgR0ZYX1NSVl9NS0hJX0xBVEVfQklORElOR19DTUQgMHgxMg0KPiA+ICsjZGVm
aW5lIEdGWF9TUlZfTUtISV9MQVRFX0JJTkRJTkdfUlNQDQo+IChHRlhfU1JWX01LSElfTEFURV9C
SU5ESU5HX0NNRCB8IDB4ODApDQo+ID4gKw0KPiA+ICsjZGVmaW5lIExBVEVfQklORF9TRU5EX1RJ
TUVPVVRfTVNFQyAzMDAwDQo+ID4gKyNkZWZpbmUgTEFURV9CSU5EX1JFQ1ZfVElNRU9VVF9NU0VD
IDMwMDANCj4gPiArDQo+ID4gKy8qKg0KPiA+ICsgKiBzdHJ1Y3QgY3NjX2hlY2lfbGF0ZV9iaW5k
X3JlcSAtIGxhdGUgYmluZGluZyByZXF1ZXN0DQo+ID4gKyAqIEBoZWFkZXI6IEByZWYgbWtoaV9t
c2dfaGRyDQo+ID4gKyAqIEB0eXBlOiB0eXBlIG9mIHRoZSBsYXRlIGJpbmRpbmcgcGF5bG9hZA0K
PiA+ICsgKiBAZmxhZ3M6IGZsYWdzIHRvIGJlIHBhc3NlZCB0byB0aGUgZmlybXdhcmUNCj4gPiAr
ICogQHJlc2VydmVkOiByZXNlcnZlZCBmaWVsZA0KPiANCj4gUmVzZXJ2ZWQgZm9yIHdoYXQ/ICBB
bGwgcmVzZXJ2ZWQgZmllbGRzIG5lZWQgdG8gYmUgc2V0IHRvIGEgZGVmYXVsdA0KPiB2YWx1ZSwg
cGxlYXNlIGRvY3VtZW50IHRoYXQgaGVyZS4NCj4gDQo+ID4gKyAqIEBwYXlsb2FkX3NpemU6IHNp
emUgb2YgdGhlIHBheWxvYWQgZGF0YSBpbiBieXRlcw0KPiA+ICsgKiBAcGF5bG9hZDogZGF0YSB0
byBiZSBzZW50IHRvIHRoZSBmaXJtd2FyZQ0KPiA+ICsgKi8NCj4gPiArc3RydWN0IGNzY19oZWNp
X2xhdGVfYmluZF9yZXEgew0KPiA+ICsJc3RydWN0IG1raGlfbXNnX2hkciBoZWFkZXI7DQo+ID4g
Kwl1MzIgdHlwZTsNCj4gPiArCXUzMiBmbGFnczsNCj4gDQo+IFdoYXQgaXMgdGhlIGVuZGlhbiBv
ZiB0aGVzZSBmaWVsZHM/ICBBbmQgYXMgdGhpcyBjcm9zc2VzIHRoZQ0KPiBrZXJuZWwvaGFyZHdh
cmUgYm91bmRyeSwgc2hvdWxkbid0IHRoZXNlIGJlIF9fdTMyPw0KPiANCj4gPiArLyoqDQo+ID4g
KyAqIHN0cnVjdCBjc2NfaGVjaV9sYXRlX2JpbmRfcnNwIC0gbGF0ZSBiaW5kaW5nIHJlc3BvbnNl
DQo+ID4gKyAqIEBoZWFkZXI6IEByZWYgbWtoaV9tc2dfaGRyDQo+ID4gKyAqIEB0eXBlOiB0eXBl
IG9mIHRoZSBsYXRlIGJpbmRpbmcgcGF5bG9hZA0KPiA+ICsgKiBAcmVzZXJ2ZWQ6IHJlc2VydmVk
IGZpZWxkDQo+ID4gKyAqIEBzdGF0dXM6IHN0YXR1cyBvZiB0aGUgbGF0ZSBiaW5kaW5nIGNvbW1h
bmQgZXhlY3V0aW9uIGJ5IGZpcm13YXJlDQo+ID4gKyAqLw0KPiA+ICtzdHJ1Y3QgY3NjX2hlY2lf
bGF0ZV9iaW5kX3JzcCB7DQo+ID4gKwlzdHJ1Y3QgbWtoaV9tc2dfaGRyIGhlYWRlcjsNCj4gPiAr
CXUzMiB0eXBlOw0KPiA+ICsJdTMyIHJlc2VydmVkWzJdOw0KPiA+ICsJdTMyIHN0YXR1czsNCj4g
DQo+IFNhbWUgcXVlc3Rpb25zIGFzIGFib3ZlLg0KPiANCj4gPiArfSBfX3BhY2tlZDsNCj4gPiAr
LyoqDQo+ID4gKyAqIG1laV9sYXRlX2JpbmRfcHVzaF9jb25maWcgLSBTZW5kcyBhIGNvbmZpZyB0
byB0aGUgZmlybXdhcmUuDQo+ID4gKyAqIEBkZXY6IGRldmljZSBzdHJ1Y3QgY29ycmVzcG9uZGlu
ZyB0byB0aGUgbWVpIGRldmljZQ0KPiA+ICsgKiBAdHlwZTogcGF5bG9hZCB0eXBlDQo+IA0KPiBT
aG91bGRuJ3QgdHlwZSBiZSBhbiBlbnVtPw0KPiANCj4gPiArICogQGZsYWdzOiBwYXlsb2FkIGZs
YWdzDQo+ID4gKyAqIEBwYXlsb2FkOiBwYXlsb2FkIGJ1ZmZlcg0KPiA+ICsgKiBAcGF5bG9hZF9z
aXplOiBwYXlsb2FkIGJ1ZmZlciBzaXplDQo+ID4gKyAqDQo+ID4gKyAqIFJldHVybjogMCBzdWNj
ZXNzLCBuZWdhdGl2ZSBlcnJubyB2YWx1ZSBvbiB0cmFuc3BvcnQgZmFpbHVyZSwNCj4gPiArICog
ICAgICAgICBwb3NpdGl2ZSBzdGF0dXMgcmV0dXJuZWQgYnkgRlcNCj4gPiArICovDQo+ID4gK3N0
YXRpYyBpbnQgbWVpX2xhdGVfYmluZF9wdXNoX2NvbmZpZyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHUz
MiB0eXBlLCB1MzINCj4gZmxhZ3MsDQo+ID4gKwkJCQkgICAgIGNvbnN0IHZvaWQgKnBheWxvYWQs
IHNpemVfdCBwYXlsb2FkX3NpemUpDQo+IA0KPiBXaHkgZG8gc3RhdGljIGZ1bmN0aW9ucyBuZWVk
IGtlcm5lbGRvYyBmb3JtYXR0aW5nPw0KPiANCg0KVGhlIHB1c2hfY29uZmlnIGZ1bmN0aW9uIHBv
aW50ZXIgaXMgZG9jdW1lbnRlZCBpbiBsYXRlX2JpbmRfY29tcG9uZW50X29wcy4NCldlIGNhbiBk
cm9wIG9uZSBoZXJlLg0KDQo+ID4gK3sNCj4gPiArCXN0cnVjdCBtZWlfY2xfZGV2aWNlICpjbGRl
djsNCj4gPiArCXN0cnVjdCBjc2NfaGVjaV9sYXRlX2JpbmRfcmVxICpyZXEgPSBOVUxMOw0KPiA+
ICsJc3RydWN0IGNzY19oZWNpX2xhdGVfYmluZF9yc3AgcnNwOw0KPiA+ICsJc2l6ZV90IHJlcV9z
aXplOw0KPiA+ICsJc3NpemVfdCByZXQ7DQo+ID4gKw0KPiA+ICsJaWYgKCFkZXYgfHwgIXBheWxv
YWQgfHwgIXBheWxvYWRfc2l6ZSkNCj4gPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gDQo+IEhvdyBj
YW4gYW55IG9mIHRoZXNlIGV2ZXIgaGFwcGVuIGFzIHlvdSBjb250cm9sIHRoZSBjYWxsZXJzIG9m
IHRoaXMNCj4gZnVuY3Rpb24/DQo+IA0KDQpUaGlzIGlzIHRoZSBjYWxsYmFjayBwcm92aWRlZCB0
byBhbm90aGVyIGRyaXZlciB2aWEgY29tcG9uZW50IGZyYW1ld29yaywNCnRoZXJlIGlzIG5vIGNv
bnRyb2wuDQpTaG91bGQgd2UgdHJ1c3QgY2FsbGVyIGhlcmU/DQoNCj4gDQo+ID4gKw0KPiA+ICsJ
Y2xkZXYgPSB0b19tZWlfY2xfZGV2aWNlKGRldik7DQo+ID4gKw0KPiA+ICsJcmV0ID0gbWVpX2Ns
ZGV2X2VuYWJsZShjbGRldik7DQo+ID4gKwlpZiAocmV0IDwgMCkgew0KPiANCj4gWW91IG1lYW46
DQo+IAlpZiAocmV0KQ0KPiByaWdodD8NCj4gDQpZZXMsIG1laV9jbGRldl9lbmFibGUgc2hvdWxk
IG5ldmVyIHJldHVybiA+MA0KDQo+IA0KPiA+ICsJCWRldl9kYmcoZGV2LCAibWVpX2NsZGV2X2Vu
YWJsZSBmYWlsZWQuICV6ZFxuIiwgcmV0KTsNCj4gDQo+IFdoeSBkaXNwbGF5IHRoZSBlcnJvciBh
Z2FpbiBpZiB0aGlzIGZhaWxlZD8gIFRoZSBjYWxsZXIgYWxyZWFkeSBkaWQNCj4gdGhhdC4NCj4g
DQoNCkl0IGlzIGEgc2VwYXJhdGUgbW9kdWxlLCBhbmQgZHluYW1pYyBkZWJ1ZyBjYW4gYmUgZW5h
YmxlZCBzZXBhcmF0ZWx5Lg0KSSBzZWUgaXQgYXMgZGVidWcgcmVmaW5lbWVudCwgYnV0IHRoaXMg
Y2FuIGJlIGRyb3BwZWQgaWYgc2VlbWVkIHVubmVlZGVkLg0KDQo+IEFuZCB0aGUgZnVuY3Rpb24g
cmV0dXJucyBhbiBpbnQsIG5vdCBhIHNzaXplX3QsIGRpZG4ndCB0aGUgY29tcGlsZXINCj4gY29t
cGxhaW4/DQo+IA0KDQpOZXZlciBzZWVuIHRoYXQsIGRvIHlvdSBzdWdnZXN0IHRvIGFkZCAicmV0
dXJuIChpbnQpcmV0OyINCmFzIHdlIGtub3cgdGhhdCBpbiB0aGlzIHN0YWdlIG9ubHkgZXJyb3Ig
Y29kZXMgY2FuIGJlIGluIHRoaXMgdmFyaWFibGU/DQoNCj4gdGhhbmtzLA0KPiANCj4gZ3JlZyBr
LWgNCg0KDQotIC0gDQpUaGFua3MsDQpTYXNoYQ0KDQoNCg==
