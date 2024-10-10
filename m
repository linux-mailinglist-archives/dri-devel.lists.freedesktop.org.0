Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3530A998CC9
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 18:07:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36EDB10E97A;
	Thu, 10 Oct 2024 16:07:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UFm0vSae";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8267010E97A
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 16:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728576431; x=1760112431;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=z2dymkq6B6YpW4VxmidEFiuVpHEFd6hsh20r8mPsb6Q=;
 b=UFm0vSaegMmiAMPdZo5ab5t1v0OYYbStlEhWoXqv/b6zg/U3/77gzcov
 h0cSGRDNByTyoUDDpDmYYXfDa94uBiIDB/yQD1Nz/LN7O42wi4tgpZBgz
 0FdQWrODYWyEdLWNffU1k6cK+NyiXyCF3AcH+VPM7nMx+P8+G/Qxs2yMa
 jcGysE9cKNxS7t7M34N1Srzmgn0NL1O6vKwsXxjYNQEPwNWBJas7m3zln
 30NjzjoMBoKB2Cy2hE0iiR6Y3mtwNzsmjHE1dCBaDXWVycjKrK6UCPhpq
 52yiLgSX3whf/lCioDWfJK5XdJ4vJChgMgH96WcgYD5RFQUTJYSCDWO+u Q==;
X-CSE-ConnectionGUID: vhvV5fE0SMq/Hgi9lUbhjw==
X-CSE-MsgGUID: M0cnzvUeTX6jA2TP7J1Hew==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="53349742"
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; d="scan'208";a="53349742"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 09:07:10 -0700
X-CSE-ConnectionGUID: 3aAphF75QjuqzLvWM0EuEg==
X-CSE-MsgGUID: 0tZgmmEcSxay0ZhIvtROwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; d="scan'208";a="114109934"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Oct 2024 09:07:09 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 09:07:09 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 09:07:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 10 Oct 2024 09:07:08 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 10 Oct 2024 09:07:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P0BRPmzmZ6USPPtw+u8H3KORVhcIaVE2YPRZyw2Dl6g2C/7JKCnnWvfSHhVtEnKNR0cZL8Qr/+uNyCNgApjrlAfm+ZXn7QzDA+NUTbYdjg2T4uH47aYcVsKzmiQMYmgmn+RA/Jq0rSSNv68bEUgiXPEoBVMXc9HvIj9YGSsXcLkzJQcRajx/Q+zv9R+5ZAL5+0Ep2L0bBYXiMfd9YNPCTNuQkw84iWpolVYiJD0GYOr7/aMoORsyJ0QAfSAqm+u5cR+4zQ/ZGz5XrjeKE4lsST12aGdKbnxJkx3E1PN1uJrugKq9JENe93tjhmIggBJsRgl2Nfs3ZDFOehrUu/CKEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z2dymkq6B6YpW4VxmidEFiuVpHEFd6hsh20r8mPsb6Q=;
 b=eyYtee8hmyJ+RMq9z39yD6u4NIXvxm4R4unLr9vc/i41SOfqfCjkZLpwHMuup1DHQwdqHH9U76xVtTyDUUrPFpQcCVNK4orVQTt8tpQuTvtY6eqnLtDV1Yxdn0advFEKKkDS72yuCIH26UXSN5/HEJo8uC6QqmSM0qNaSuVyTXZtqt0ms8NW1BpfsxhABXUoyl49bXfybSoXc9+nrzZ+mg5UWdLGy7F8VoCvRDkbHPfC5FsvVc6HjG4Slq95FgQX0pYIUPQRxb43iV/aLFHk2dvtikOmI5cHLGR/Bm8kuJ4ku+YwWbzS7iJCbtZl3QNCugzGSCSlCf0766wQzsv/jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by PH0PR11MB4917.namprd11.prod.outlook.com (2603:10b6:510:32::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 10 Oct
 2024 16:07:06 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361%4]) with mapi id 15.20.8048.013; Thu, 10 Oct 2024
 16:07:06 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
CC: "jfalempe@redhat.com" <jfalempe@redhat.com>, "airlied@redhat.com"
 <airlied@redhat.com>, "sam@ravnborg.org" <sam@ravnborg.org>,
 "emil.l.velikov@gmail.com" <emil.l.velikov@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v5 0/7] drm/mgag200: Implement VBLANK support
Thread-Topic: [PATCH v5 0/7] drm/mgag200: Implement VBLANK support
Thread-Index: AQHbFJmT04jrr3jRak+Ttm6l1x35MrJzoo8AgAKwlQCAAIBHEIAI7u2AgABwP+A=
Date: Thu, 10 Oct 2024 16:07:06 +0000
Message-ID: <SJ1PR11MB6083AC96151969AD04C4330DFC782@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <20240718104551.575912-1-tzimmermann@suse.de>
 <Zvx6lSi7oq5xvTZb@agluck-desk3.sc.intel.com>
 <49f0ca61-0cf4-4093-b4a7-f49dc46037ab@suse.de>
 <SJ1PR11MB60836E1B04A688CF55506BF4FC702@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <ad02af39-b9b5-4b04-878b-78b3eb7885a5@suse.de>
 <SJ1PR11MB6083AE35E583A3E556B29004FC722@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <4769b892-b2a6-4f8b-a0c6-72fed9eacd31@suse.de>
In-Reply-To: <4769b892-b2a6-4f8b-a0c6-72fed9eacd31@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|PH0PR11MB4917:EE_
x-ms-office365-filtering-correlation-id: ae63356b-3e1a-4cc2-ac3b-08dce9459639
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?akdwWXZFVUo1MHhDN1VnbnZXZVdyeHI1SldpMU9PSXBDY3F4VTdVTC9jUlI3?=
 =?utf-8?B?QmhVTFBZZUcySFlXSkZGa2lMNFI1NXlnSEZwaS9jVElaNmZpZkhBa0JhU1VY?=
 =?utf-8?B?SENDSVZLVm9HckFPK3VQaHpuR2xZeWpoNEFWRlZ0NEpuZzM1T3JVaHBLb0Ra?=
 =?utf-8?B?djRkZGtobzQrRDBqcDYrd2lOSW1sWG1vYzN1bUthWmtpM2dvK1RRcTJxOUdI?=
 =?utf-8?B?Zkx0akVyR0E3ZFJDQlZ4dVhCN3kveFN1Z2puRDI2YjBGRUFKOVcvSEk3STA4?=
 =?utf-8?B?UE5YR1ZvejMrVjkxVG9oaW9VUk03KzJwUWg2bjB2MEpUT1BHTXM0QjRjT2NH?=
 =?utf-8?B?TUhZVUoyNC8zQ0tKMlRDUktFMmgvMjNTRlFPc2J3WHkzQkpINjV0ZVkzb0NY?=
 =?utf-8?B?bHF1TENmQWtFNVM1bTN5OStSY2lsMHh2a0VCWFczWmxkK05qZWZKK0RLWEdR?=
 =?utf-8?B?blQ1MnV5SVNUSEVxZlpyL2RZV0pJcjZpYitnR3plNThKQkhENmRaNWZhV0hR?=
 =?utf-8?B?RVFGWDUxam9WWEFBRzhaMGx4K3MzVFJ3aHdVUGZwSnZVN2dQcy9kZ3NFNDZq?=
 =?utf-8?B?Q0owUDdnTUhBV3FTWTRUbjdEWjFldG9VZi9KUmlwbzMwK1VTcjdXOEZFNnEx?=
 =?utf-8?B?RzRvTVNJKytDU0g0NnhTWmVpQjdmUXVwOGRZSWtWTnoyL3ZFY2c2RlpSNmdt?=
 =?utf-8?B?MDNLRFZxbnNuQURISE1TcHJnU3diZWFtWUJ4WUZBVWtoM2VONzMvVzg1LzFU?=
 =?utf-8?B?ZDdQQ3JUMklUeGNIMXZTYWxCL3JDQ1RUczZ2b3BHOGVOTmNXclFtbmx1cU5w?=
 =?utf-8?B?Q09mZ0RoTy9Eck1Lbk5pd1JrMjJLOTNIa2tEUnBnWW51R3lBbkRBQXF3c25p?=
 =?utf-8?B?WTJ4TUlhRW1HOTRTR0V0TmdKQ0hrNzFUaXB4bDRjQ2h4R0s5MVVxenZRMFA1?=
 =?utf-8?B?NDdHZkN1WkVhUk9zS3k4SFp6WkNkS3NCVHBCNDU0MGtjd29GQ3MrcEE5ai93?=
 =?utf-8?B?U0x2MWhNY1haVU84Tmx4NldFbzlWR3RIbVVHK0VVSG9UeE41SVlhNGxpTVgr?=
 =?utf-8?B?dTJiMGlpRWhtT1NHVUhkSzVZMmMyQzNNVXJ1WS92dDFlTms1YWY3WFhpRGZx?=
 =?utf-8?B?ZUYwdlVlS0VuNCs1SWV3dXF2YXQvWjVtRGw1ekVUdFp4Q2RLa1pHTnpjNTNJ?=
 =?utf-8?B?eFVpZldPcG9NVU9PYmc2MldhSDJ0dFpFWlRkd3I4K1hxZnk0SjVYSzJlN2k3?=
 =?utf-8?B?K3ZoeEhIeXhOY1h5dTlWbjZvckZibDlSRTdUdmlKeGVQcnBGRFRMZW0wMWRQ?=
 =?utf-8?B?cTdCZFhjZnl3cm1qUjE2OWJPRkJhN3Z1M3JlU3J5YTl4UUdLWUNiaHB5d1NN?=
 =?utf-8?B?bHg1ZHRZdEVSRFRzZDlFQnlhRVVNdE9MOTJCcXFRdnlaMmhxZk9QOHBFVXBX?=
 =?utf-8?B?VkQrenJkYUZSQktxWWhqdWZZakcyMG5ydjg4NDJLKzlSSlgwL3JwM2RUUTBK?=
 =?utf-8?B?MHdmK3I5ZWtwQWpoL0RWK3Y5c29oVjBFd1lBck1Ya1ZNUFArVHJtQmJuUEta?=
 =?utf-8?B?SjFOa0RVeEVsbFk4SWJuM0FCLytCL3RHdU5GaDgya2VlSzNvaWszamtoeUlC?=
 =?utf-8?B?bmdOOFZ1N3FyQ2pzMDgyOUpPQ3p5TlJjMXZzei9YZHdrTmgycTR3NVhnc1hm?=
 =?utf-8?B?K3BWMWJTdHUwRU8wUmZocWVUamVJcWJXQ3BQOUlDbzN1ZnZ0em8za2lIRTEy?=
 =?utf-8?B?MzdBV1NSempFOXFwVkNFZXRVSkErMndCM2Y4TTVpZWFjWkQxUFFCN3BOdEZD?=
 =?utf-8?B?ZzNIOWNFWk5VWkE3d0d2Zz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6083.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aFZQd0RkODRXMHlMYi9obUE4WTQ3TGFCMENpOEFlZkZCSlhja0o4TWFxOC9C?=
 =?utf-8?B?Q3ZpQmdHK2JvOElpN21wNng4alNQM0hhMkU4dmlZdS9yeFJ5V0ZqWkdzV1lF?=
 =?utf-8?B?cXhUUCtad3FqdWZ2RnVVYXcvV0MxdkRUdlUyODY2UThLd2FJQURRSk92S0FD?=
 =?utf-8?B?RUlGZy9VdnNtT0FYVVh0YlFMaGNQM0FHa2FSZTY0eXIzb2dVN3h6dzFuU282?=
 =?utf-8?B?THVrdlA4WURwaDc2UWhPZitFNENKK1pnWkxOOW1veGFzYW5TbnlQc0p3VnZa?=
 =?utf-8?B?dVNZQmdBSlRaamFzUmpWRXFUYkVBT2IyMjhnQUJQaytPR2JYdkdLcG41VDlW?=
 =?utf-8?B?NlhTSUgrdjFzNHdDRFdDc0puNkIrTWdPczFQM21OOXdpc1RyeXo5bGlablV5?=
 =?utf-8?B?allRUmltbUFDdVRJeTB0MExFaHVhOGJRYnJlR29DYWR1SVBXVjJVYzE0ZXg5?=
 =?utf-8?B?enhWYzRlRnVEaHR2a09OcVRzUUtnWTAwTlk3b2dBZUFkSDFDRjZrMS8vNlJa?=
 =?utf-8?B?ZytOZXFOSENvMkF2VFF5Z2hReUJ2ZVhja0VEaEUvVVVUM3gzTmRHeGNlSlAx?=
 =?utf-8?B?TnE0eFJCUGpLbzlYbGNBalpha3kwQVVoODJzN3NGbEg2T0hTdzkzbkxpR0pN?=
 =?utf-8?B?TE03NGwrUjhUbForMkNmaVlUSGNPZWZoSEltM09Id1hqbGNpQ0dQUzUwcENi?=
 =?utf-8?B?S0ptcVAyUzVZczV6T0dUWTk5K1Y2MVp1QVVodW1mTEpLT042ckRXNXRBQU9V?=
 =?utf-8?B?VDEvVjlLNmw3VmNJczRQS2xGaFNIOHVZQkY0WklESUQzaDFiWW0rTlZ3bitN?=
 =?utf-8?B?RWN2SEVFMmJiWFQzVHJuR1BNVzEyb2RGRnlPbXlEYm5RclZmWUtid1JVc0ZZ?=
 =?utf-8?B?Q2JZSVFBbnMrOXJSVW5uQ3ZoN0kvalFXa3I4dWNxeTVTc2RNN2pDSHFpUEtn?=
 =?utf-8?B?cGNhWDd0OGVzMGZuZERxV0VVK2JUYmJCaFA2R240VFJwL0FkRGdHTHdqUXhL?=
 =?utf-8?B?YmFyZTZVQlE0OFUyL2N1Ym1pVUF4MTBqbVhTWEhPK2pxd25GVXJsb0tjTDAy?=
 =?utf-8?B?akZwT2FhaUFGUVo5MzA3emlUMEc3RG5VN1lkcVVaTmtLdmF1UDUyWExoNmZH?=
 =?utf-8?B?bEtRY28wdWxSeXVDb1lsdzNiaEJIUVFmUzNUMmYvU2NVT0lMWnBsQ2FBVGxT?=
 =?utf-8?B?MGwzemZrZ0o0NUFSdnMxT2ZXNy9Wc3U1cmV2dGZycGQ5c29xS3prd3ZZTitU?=
 =?utf-8?B?MUcwQVk0RG9oMU9keHhmQUFIdHB0WlJUcHd6VE04MjZkUjZnT2FxYnpwLzha?=
 =?utf-8?B?NHUvb05LTzBidkJkQnA4RUNwVkRUdXdWUXdWSVlzNFNRaHRGUDc0a2pnNXpm?=
 =?utf-8?B?T0JLMWdkQjZsa0poWS9rYkR3RUFNMHF0dVArSXpMMVJENFJMY3IyM1kwZ3RI?=
 =?utf-8?B?clk2K1lTdGY2K1o1VWtENjNKSVJhQnFILytVMmpXM3M2ZC9QYVRyL0tuZlVI?=
 =?utf-8?B?ZExRTTZFN3NBdlE3TEx0YkJyYzgxNVRSc2dJeWlzUU5hc2ZLTW9CaW9sQWZZ?=
 =?utf-8?B?ZGdhbjAzSVRQdGIxSWpiR212REtZKzJkZHliUTFzWU5KVTNHRWNSMVEvNm84?=
 =?utf-8?B?V1p5aXFxOWwweGdPb1BIR2wrby9ENWlIeHFvQjljSmJpV3ZGdHRnbU9GUVQ0?=
 =?utf-8?B?eHRHZEJ2WXZteDVBWmpPNFFkaHZwczczVWsxUERpSW9yKzhaTGthVS9pTWxR?=
 =?utf-8?B?WHg3Z2twZHdoeHg2cFcwT3VKciswRUEwWTVhbDZaN3l3U2hlM1YzeXZDWS93?=
 =?utf-8?B?TXFkSnROMjJ6THhVS1ZueFV5Q29CY0c5THRSV3pyU0tHWEZmcndrcnlPMXI5?=
 =?utf-8?B?NVErSDc1NEdBZG1oNmtCN3N5alJyVENxV3pqZitzYTgzSTVoZ2NFWjdzN1dH?=
 =?utf-8?B?WW40YXFGQW1nQUhoMHlYbVRXVFdZY0Vnb29sUDdFelV3bFJZMXRrR2xNR3J3?=
 =?utf-8?B?M1U2YklaRDVzUkhaOXVTcEcydWswdGNyTEFZNFduTEVEdXZUQzcvRWlXelhS?=
 =?utf-8?B?aktnM1lMbXkrQTNnQWd1d1V2S0ZRRlZORHcxaVVQeGRFeVhYSUhnQ2ZvZWVD?=
 =?utf-8?Q?XChA89FxegI57bVxww2am+6RQ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae63356b-3e1a-4cc2-ac3b-08dce9459639
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2024 16:07:06.1610 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oAVE7e8fxSQ20RqXvOkMFqDjJYSwbvFDQPSkhQYiUZ8ky3QHs8+kKIK2sxi3sr8S/jlYyMWCXY+A2qdEIAxULA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4917
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

PiBUaGFua3MgZm9yIHRlc3RpbmcuIEhlcmUncyBhbm90aGVyIHBhdGNoIHRvIHRyeSBWaWxsZSdz
IHN1Z2dlc3Rpb24uIEl0IA0KPiBzaG91bGQgZGlzYWJsZSBIVyB2YmxhbmsgSVJRcyBvbiB5b3Vy
IHN5c3RlbS4gQ291bGQgeW91IHBsZWFzZSB0ZXN0IGl0IA0KPiBhbmQgcmVwb3J0IG9uIHRoZSBy
ZXN1bHRzPw0KDQpUaG9tYXMsDQoNClRoYW5rcyBmb3Iga2VlcGluZyB3b3JraW5nIG9uIHRoaXMu
IE91dHB1dCBpcyBkaWZmZXJlbnQsIGJ1dCBzdGlsbCBkaWVzIHdpdGggdmJsYW5rIHByb2JsZW1z
Lg0KDQpbICBPSyAgXSBTdGFydGVkIEdOT01FIERpc3BsYXkgTWFuYWdlci4NClsgIDMyOS41NzU4
MTNdIG1nYWcyMDAgMDAwMDowODowMC4wOiBbZHJtXSAqRVJST1IqIGZsaXBfZG9uZSB0aW1lZCBv
dXQNClsgIDMyOS41ODI4ODldIG1nYWcyMDAgMDAwMDowODowMC4wOiBbZHJtXSAqRVJST1IqIFtQ
TEFORTozMjpwbGFuZS0wXSBjb21taXQgd2FpdCB0aW1lZCBvdXQNClsgIDMyOS43MTk3NzldIC0t
LS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLQ0KWyAgMzI5LjcyNTE3NF0gW0NSVEM6
MzQ6Y3J0Yy0wXSB2Ymxhbmsgd2FpdCB0aW1lZCBvdXQNClsgIDMyOS43MzA3MjRdIFdBUk5JTkc6
IENQVTogMTUwIFBJRDogMTQwMiBhdCBkcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIu
YzoxNjgyIGRybV9hdG9taWNfaGVscGVyX3dhaXRfZm9yX3ZibGFua3MucGFydC4wKzB4MjRmLzB4
MjYwIFtkcm1fa21zX2hlbHBlcl0NClsgIDMyOS43NDYyNjRdIE1vZHVsZXMgbGlua2VkIGluOiB4
dF9DSEVDS1NVTSB4dF9NQVNRVUVSQURFIHh0X2Nvbm50cmFjayBpcHRfUkVKRUNUIG5mX25hdF90
ZnRwIG5mX2Nvbm50cmFja190ZnRwIGJyaWRnZSBzdHAgbGxjIG5mX2Nvbm50cmFja19uZXRiaW9z
X25zIG5mX2Nvbm50cmFja19icm9hZGNhc3QgbmZ0X2ZpYl9pbmV0IG5mdF9maWJfaXB2NCBuZnRf
ZmliX2lwdjYgbmZ0X2ZpYiBuZnRfcmVqZWN0X2luZXQgbmZfcmVqZWN0X2lwdjQgbmZfcmVqZWN0
X2lwdjYgbmZ0X3JlamVjdCBuZnRfY3QgbmZ0X2NoYWluX25hdCBpcDZ0YWJsZV9uYXQgaXA2dGFi
bGVfbWFuZ2xlIGlwNnRhYmxlX3JhdyBpcDZ0YWJsZV9zZWN1cml0eSBpcHRhYmxlX25hdCBuZl9u
YXQgbmZfY29ubnRyYWNrIG5mX2RlZnJhZ19pcHY2IG5mX2RlZnJhZ19pcHY0IGlwdGFibGVfbWFu
Z2xlIGlwdGFibGVfcmF3IGlwdGFibGVfc2VjdXJpdHkgaXBfc2V0IHJma2lsbCBuZl90YWJsZXMg
bmZuZXRsaW5rIGlwNnRhYmxlX2ZpbHRlciBpcDZfdGFibGVzIGlwdGFibGVfZmlsdGVyIHN1bnJw
YyB2ZmF0IGZhdCBpbnRlbF9yYXBsX21zciBpbnRlbF9yYXBsX2NvbW1vbiBpbnRlbF91bmNvcmVf
ZnJlcXVlbmN5IGludGVsX3VuY29yZV9mcmVxdWVuY3lfY29tbW9uIHNiX2VkYWMgaVRDT193ZHQg
aW50ZWxfcG1jX2J4dCBpVENPX3ZlbmRvcl9zdXBwb3J0IHg4Nl9wa2dfdGVtcF90aGVybWFsIGlu
dGVsX3Bvd2VyY2xhbXAgaXBtaV9zc2lmIGNvcmV0ZW1wIHJhcGwgaW50ZWxfY3N0YXRlIGpveWRl
diBpbnRlbF91bmNvcmUgYWNwaV9pcG1pIHBjc3BrciBtZWlfbWUgaTJjX2k4MDEgaTJjX3NtYnVz
IGlwbWlfc2kgbHBjX2ljaCBtZWkgaW9hdGRtYSB3bWkgaXBtaV9kZXZpbnRmIGlwbWlfbXNnaGFu
ZGxlciBhY3BpX3BhZCB6cmFtIGlwX3RhYmxlcyBjcmN0MTBkaWZfcGNsbXVsIGNyYzMyX3BjbG11
bCBtZ2FnMjAwIGNyYzMyY19pbnRlbCBpMmNfYWxnb19iaXQgZ2hhc2hfY2xtdWxuaV9pbnRlbCBk
cm1fc2htZW1faGVscGVyIHNoYTUxMl9zc3NlMw0KWyAgMzI5Ljc0NjYwNF0gIGRybV9rbXNfaGVs
cGVyIHNoYTI1Nl9zc3NlMyBtcHQzc2FzIHNoYTFfc3NzZTMgaXhnYmUgcmFpZF9jbGFzcyBtZGlv
IGRybSBzY3NpX3RyYW5zcG9ydF9zYXMgZGNhIGZ1c2UNClsgIDMyOS44NTg1MDZdIENQVTogMTUw
IFVJRDogMCBQSUQ6IDE0MDIgQ29tbToga3dvcmtlci8xNTA6MSBUYWludGVkOiBHICAgICAgICBX
ICAgICAgICAgIDYuMTIuMC1yYzIrICMxNzENClsgIDMyOS44NjkwMzBdIFRhaW50ZWQ6IFtXXT1X
QVJODQpbICAzMjkuODcyMzU3XSBIYXJkd2FyZSBuYW1lOiBJbnRlbCBDb3Jwb3JhdGlvbiBCUklD
S0xBTkQvQlJJQ0tMQU5ELCBCSU9TIEJSQkRYU0QxLjg2Qi4wMzM4LlYwMS4xNjAzMTYyMTI3IDAz
LzE2LzIwMTYNClsgIDMyOS44ODM5NDFdIFdvcmtxdWV1ZTogZXZlbnRzIGRybV9mYl9oZWxwZXJf
ZGFtYWdlX3dvcmsgW2RybV9rbXNfaGVscGVyXQ0KWyAgMzI5Ljg5MTQ3Ml0gUklQOiAwMDEwOmRy
bV9hdG9taWNfaGVscGVyX3dhaXRfZm9yX3ZibGFua3MucGFydC4wKzB4MjRmLzB4MjYwIFtkcm1f
a21zX2hlbHBlcl0NClsgIDMyOS45MDA5MzddIENvZGU6IDAwIDQ4IDhkIDdiIDA4IGU4IDQxIGI3
IDM4IGQxIDQ1IDg1IGZmIDBmIDg1IGQzIGZlIGZmIGZmIDQ5IDhiIDU2IDIwIDQxIDhiIGI2IGQ4
IDAwIDAwIDAwIDQ4IGM3IGM3IGIwIDQwIGRmIGMwIGU4IDIxIDYxIDMwIGQxIDwwZj4gMGIgZTkg
YjUgZmUgZmYgZmYgNjYgMmUgMGYgMWYgODQgMDAgMDAgMDAgMDAgMDAgOTAgOTAgOTAgOTAgOTAN
ClsgIDMyOS45MjE5MzJdIFJTUDogMDAxODpmZmZmYmI5ZjIzMjc3YzAwIEVGTEFHUzogMDAwMTAy
ODYNClsgIDMyOS45Mjc3OTddIFJBWDogMDAwMDAwMDAwMDAwMDAyNiBSQlg6IGZmZmY5ZGUxODU2
MmUwMjggUkNYOiAwMDAwMDAwMDAwMDAwMDAwDQpbICAzMjkuOTM1NzkzXSBSRFg6IDAwMDAwMDAw
MDAwMDAwMDIgUlNJOiBmZmZmZmZmZjkzYTAwZTc4IFJESTogMDAwMDAwMDBmZmZmZmZmZg0KWyAg
MzI5Ljk0Mzc4Nl0gUkJQOiBmZmZmOWUxM2Q5MTBkYzgwIFIwODogMDAwMDAwMDAwMDAwMDAwMCBS
MDk6IGZmZmZiYjlmMjMyNzdhYzANClsgIDMyOS45NTE3NzhdIFIxMDogZmZmZmJiOWYyMzI3N2Fi
OCBSMTE6IGZmZmY5ZTMzODExZmZmZTggUjEyOiAwMDAwMDAwMDAwMDAwMDAwDQpbICAzMjkuOTU5
Nzg0XSBSMTM6IDAwMDAwMDAwMDAwMDAwMDAgUjE0OiBmZmZmOWRlMGFkYTY1M2YwIFIxNTogMDAw
MDAwMDAwMDAwMDAwMA0KWyAgMzI5Ljk2Nzc3N10gRlM6ICAwMDAwMDAwMDAwMDAwMDAwKDAwMDAp
IEdTOmZmZmY5ZTIwMzIxMDAwMDAoMDAwMCkga25sR1M6MDAwMDAwMDAwMDAwMDAwMA0KWyAgMzI5
Ljk3NjgzOF0gQ1M6ICAwMDEwIERTOiAwMDAwIEVTOiAwMDAwIENSMDogMDAwMDAwMDA4MDA1MDAz
Mw0KWyAgMzI5Ljk4MzI4MF0gQ1IyOiAwMDAwNTU1Y2U5ZDBkMDMwIENSMzogMDAwMDAwM2VjY2Mz
YTAwNCBDUjQ6IDAwMDAwMDAwMDAzNzA2ZjANClsgIDMyOS45OTEyNzNdIERSMDogMDAwMDAwMDAw
MDAwMDAwMCBEUjE6IDAwMDAwMDAwMDAwMDAwMDAgRFIyOiAwMDAwMDAwMDAwMDAwMDAwDQpbICAz
MjkuOTk5MjY4XSBEUjM6IDAwMDAwMDAwMDAwMDAwMDAgRFI2OiAwMDAwMDAwMGZmZmUwZmYwIERS
NzogMDAwMDAwMDAwMDAwMDQwMA0KWyAgMzMwLjAwNzI2Ml0gQ2FsbCBUcmFjZToNClsgIDMzMC4w
MTAwMTFdICA8VEFTSz4NClsgIDMzMC4wMTIzODNdICA/IF9fd2FybisweDkwLzB4MWEwDQpbICAz
MzAuMDE2MDIyXSAgPyBkcm1fYXRvbWljX2hlbHBlcl93YWl0X2Zvcl92YmxhbmtzLnBhcnQuMCsw
eDI0Zi8weDI2MCBbZHJtX2ttc19oZWxwZXJdDQpbICAzMzAuMDI0ODAzXSAgPyByZXBvcnRfYnVn
KzB4MWMzLzB4MWQwDQpbICAzMzAuMDI4OTI0XSAgPyBfX2lycV93b3JrX3F1ZXVlX2xvY2FsKzB4
NDgvMHgxMzANClsgIDMzMC4wMzQxMTZdICA/IGhhbmRsZV9idWcrMHg1Yi8weGEwDQpbICAzMzAu
MDM4MDQzXSAgPyBleGNfaW52YWxpZF9vcCsweDE0LzB4NzANClsgIDMzMC4wNDIzNTNdICA/IGFz
bV9leGNfaW52YWxpZF9vcCsweDE2LzB4MjANClsgIDMzMC4wNDcwNjRdICA/IGRybV9hdG9taWNf
aGVscGVyX3dhaXRfZm9yX3ZibGFua3MucGFydC4wKzB4MjRmLzB4MjYwIFtkcm1fa21zX2hlbHBl
cl0NClsgIDMzMC4wNTU4NTFdICA/IF9fcGZ4X2F1dG9yZW1vdmVfd2FrZV9mdW5jdGlvbisweDEw
LzB4MTANClsgIDMzMC4wNjE3MjNdICBkcm1fYXRvbWljX2hlbHBlcl9jb21taXRfdGFpbCsweDcx
LzB4ODAgW2RybV9rbXNfaGVscGVyXQ0KWyAgMzMwLjA2ODk1NF0gIG1nYWcyMDBfbW9kZV9jb25m
aWdfaGVscGVyX2F0b21pY19jb21taXRfdGFpbCsweDI4LzB4NDAgW21nYWcyMDBdDQpbICAzMzAu
MDc3MDU3XSAgY29tbWl0X3RhaWwrMHg5NC8weDEzMCBbZHJtX2ttc19oZWxwZXJdDQpbICAzMzAu
MDgyNjQyXSAgZHJtX2F0b21pY19oZWxwZXJfY29tbWl0KzB4MTNlLzB4MTcwIFtkcm1fa21zX2hl
bHBlcl0NClsgIDMzMC4wODk1OTddICBkcm1fYXRvbWljX2NvbW1pdCsweDk3LzB4YjAgW2RybV0N
ClsgIDMzMC4wOTQ3MDZdICA/IF9fcGZ4X19fZHJtX3ByaW50Zm5faW5mbysweDEwLzB4MTAgW2Ry
bV0NClsgIDMzMC4xMDA2MjRdICBkcm1fYXRvbWljX2hlbHBlcl9kaXJ0eWZiKzB4MTg1LzB4MjUw
IFtkcm1fa21zX2hlbHBlcl0NClsgIDMzMC4xMDc2NzJdICBkcm1fZmJkZXZfc2htZW1faGVscGVy
X2ZiX2RpcnR5KzB4NGMvMHhiMCBbZHJtX3NobWVtX2hlbHBlcl0NClsgIDMzMC4xMTUyODJdICBk
cm1fZmJfaGVscGVyX2RhbWFnZV93b3JrKzB4ODMvMHgxNTAgW2RybV9rbXNfaGVscGVyXQ0KWyAg
MzMwLjEyMjIyMV0gIHByb2Nlc3Nfb25lX3dvcmsrMHgyMTQvMHg2MDANClsgIDMzMC4xMjY3Mjdd
ICB3b3JrZXJfdGhyZWFkKzB4MTdmLzB4MzIwDQpbICAzMzAuMTMwOTMyXSAgPyBfX3BmeF93b3Jr
ZXJfdGhyZWFkKzB4MTAvMHgxMA0KWyAgMzMwLjEzNTcxNF0gIGt0aHJlYWQrMHhlMC8weDExMA0K
WyAgMzMwLjEzOTI0NV0gID8gX19wZnhfa3RocmVhZCsweDEwLzB4MTANClsgIDMzMC4xNDM0NTVd
ICByZXRfZnJvbV9mb3JrKzB4MzAvMHg1MA0KWyAgMzMwLjE0NzQ3M10gID8gX19wZnhfa3RocmVh
ZCsweDEwLzB4MTANClsgIDMzMC4xNTE2ODNdICByZXRfZnJvbV9mb3JrX2FzbSsweDFhLzB4MzAN
ClsgIDMzMC4xNTYxMDRdICA8L1RBU0s+DQpbICAzMzAuMTU4NTUzXSBpcnEgZXZlbnQgc3RhbXA6
IDY4OTYzDQpbICAzMzAuMTYyMzY4XSBoYXJkaXJxcyBsYXN0ICBlbmFibGVkIGF0ICg2ODk3NSk6
IFs8ZmZmZmZmZmY5MjE4M2ZhZT5dIF9fdXBfY29uc29sZV9zZW0rMHg1ZS8weDcwDQpbICAzMzAu
MTcyMDExXSBoYXJkaXJxcyBsYXN0IGRpc2FibGVkIGF0ICg2ODk4Nik6IFs8ZmZmZmZmZmY5MjE4
M2Y5Mz5dIF9fdXBfY29uc29sZV9zZW0rMHg0My8weDcwDQpbICAzMzAuMTgxNjQ3XSBzb2Z0aXJx
cyBsYXN0ICBlbmFibGVkIGF0ICg2ODg1MCk6IFs8ZmZmZmZmZmY5MjBkYWM5MT5dIF9faXJxX2V4
aXRfcmN1KzB4YTEvMHgxMTANClsgIDMzMC4xOTExOTVdIHNvZnRpcnFzIGxhc3QgZGlzYWJsZWQg
YXQgKDY5MDA3KTogWzxmZmZmZmZmZjkyMGRhYzkxPl0gX19pcnFfZXhpdF9yY3UrMHhhMS8weDEx
MA0KWyAgMzMwLjIwMDczNF0gLS0tWyBlbmQgdHJhY2UgMDAwMDAwMDAwMDAwMDAwMCBdLS0tDQpb
ICAzNDAuMzI3MzQyXSBtZ2FnMjAwIDAwMDA6MDg6MDAuMDogW2RybV0gKkVSUk9SKiBmbGlwX2Rv
bmUgdGltZWQgb3V0DQpbICAzNDAuMzM0Mzc5XSBtZ2FnMjAwIDAwMDA6MDg6MDAuMDogW2RybV0g
KkVSUk9SKiBbQ1JUQzozNDpjcnRjLTBdIGNvbW1pdCB3YWl0IHRpbWVkIG91dA0KWyAgMzUwLjU2
Njg5MV0gbWdhZzIwMCAwMDAwOjA4OjAwLjA6IFtkcm1dICpFUlJPUiogZmxpcF9kb25lIHRpbWVk
IG91dA0KWyAgMzUwLjU3MzkyNV0gbWdhZzIwMCAwMDAwOjA4OjAwLjA6IFtkcm1dICpFUlJPUiog
W1BMQU5FOjMyOnBsYW5lLTBdIGNvbW1pdCB3YWl0IHRpbWVkIG91dA0KWyAgMzUwLjcxMDg4Nl0g
LS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tDQo=
