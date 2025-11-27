Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B49AC8D8F4
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 10:31:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9272D10E7B0;
	Thu, 27 Nov 2025 09:31:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y7VCiBUh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6945A10E7B0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 09:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764235888; x=1795771888;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AboWBMj5ICHnt4F7EZQ5MPUzIe54YpfTysIoRHqDs7E=;
 b=Y7VCiBUh3eu6lb0GhT9qMtpDCqrM9yh9VZnB3PXkG70/PvPvacuSHEA3
 NV+qeQ4IWoah661mFAZbtNIlSvkFhCrPmHl8K2kK4adHPwU+4mU72QTK1
 gPdg6/KktajQUwNljgZnrYvjW0DgzQadimVvovHNBmA4F5NJiAfhH2rXM
 XTVlYmd5g2JWmj2WK7v+1tf1CzVX0PHHpHC0US5k787XN75yU/atxwd7p
 6mqCbCso0d3vjmpfhESHvLs22YfBlNDabN7nmLbIWAzMIhwW0v4JJUaqo
 CMTrSjmeNbsV1dT4HQ1x9mMVmefpwkanNdOeyZcEqvYHlgPUX67XzdZoX g==;
X-CSE-ConnectionGUID: fajR/jJFTl65VKimA4ZCYQ==
X-CSE-MsgGUID: OWTsh3/JQO2sf/SnRP4ICw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="88925938"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="88925938"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 01:31:28 -0800
X-CSE-ConnectionGUID: Ez4WO+IVTTS44XWhevVFHA==
X-CSE-MsgGUID: vS14TMdgRo2vq341fUqfxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="192439936"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 01:31:27 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 01:31:27 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 27 Nov 2025 01:31:27 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.55) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 01:31:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NLDaBg6M3cXb6vF0T35zXOMPD+Eu2UjpsH+c9txclGA9Tza0QOcqKwt/LrMUsR5aMe1xSCTMWcC1iAsIA7AXEWLPNv4oqmV1HSX+gjzVjHj8rGpIJ1w5JuCEJLMY4uhrLjNBOpJH3oDJkG3KKsBm/cf3Yg5aoFN/AeX3aB28vNWmsp4jyIcSMP+z908AgMBBhe8jOUwI1qUGxf+Qm3sgilUZbxZpgJYHESYOoJO3amYlKqzdZkrnS/0/RA7sVoTOJBFrqzbV10MuFhTsvLPeNKrkreu8kzDZKBYEIJ8UGNv+gqoZwO9q2IsjxTmzTIsDBKRN/iVQvcPBWLmt3Mo8SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AboWBMj5ICHnt4F7EZQ5MPUzIe54YpfTysIoRHqDs7E=;
 b=eOULYoHYAPNJ0/MabvJifkM+jezGLQjYfvcn20OoitFhZ7SNdhZc9t0a3w1sAFjXjGerOJYdSLdWoFdeWtkA/g0Id45lIhTU7UrVCCreAJSmeGFVo/4ITSqVh7ycPusREsgZEuDHfcPt5a3AEnqXo7dz4e1vd0k1lHtm0y1gZrDsyufe1Szvniz6ZCKApIx2ZUWhQFOgWuTU+mR845unM5/GKJmDaWiWzFXmHfv+yrJpN149nGjzTlv/KpBLaBiZ7a6eH21GojR89gQI8XxQtKN2DDJVGeMyefBZsaxP6/9+2E3MWgHJo1ylOWYBVEjW+bGwW4g0IBiYI7i+zLIWGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA4PR11MB9251.namprd11.prod.outlook.com (2603:10b6:208:56f::13)
 by SJ2PR11MB8451.namprd11.prod.outlook.com (2603:10b6:a03:56e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 09:31:25 +0000
Received: from IA4PR11MB9251.namprd11.prod.outlook.com
 ([fe80::6de6:5e54:b54d:8edc]) by IA4PR11MB9251.namprd11.prod.outlook.com
 ([fe80::6de6:5e54:b54d:8edc%7]) with mapi id 15.20.9366.009; Thu, 27 Nov 2025
 09:31:24 +0000
From: "Sokolowski, Jan" <jan.sokolowski@intel.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: David Francis <David.Francis@amd.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Felix Kuehling <felix.kuehling@amd.com>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH 1/1] drm: disallow setting 0 as new handle in
 DRM_IOCTL_GEM_CHANGE_HANDLE
Thread-Topic: [PATCH 1/1] drm: disallow setting 0 as new handle in
 DRM_IOCTL_GEM_CHANGE_HANDLE
Thread-Index: AQHcXfXbiSxh9f6oD0iHeinWZoYJJrUDWR8AgAABmUCAAAagAIAAAi+QgAALRYCAAtXAcA==
Date: Thu, 27 Nov 2025 09:31:24 +0000
Message-ID: <IA4PR11MB9251037D83E91FB00D0CB1B799DFA@IA4PR11MB9251.namprd11.prod.outlook.com>
References: <20251125102847.904357-1-jan.sokolowski@intel.com>
 <20251125102847.904357-2-jan.sokolowski@intel.com>
 <28441359-4625-4d3e-8c1a-852a1868bde8@amd.com>
 <IA4PR11MB9251D04B84D7129BB1DA449099D1A@IA4PR11MB9251.namprd11.prod.outlook.com>
 <10bd3353-c3cc-414b-8033-7f3b8edb5968@amd.com>
 <IA4PR11MB92511EB3B943B4F2BEB0A1D199D1A@IA4PR11MB9251.namprd11.prod.outlook.com>
 <6aec16e4-6b63-4aa3-a430-2e981c94bfd7@amd.com>
In-Reply-To: <6aec16e4-6b63-4aa3-a430-2e981c94bfd7@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA4PR11MB9251:EE_|SJ2PR11MB8451:EE_
x-ms-office365-filtering-correlation-id: f1374215-b82a-46da-8c48-08de2d97bbed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?T0g1NGNMajFHZ1Y5SEp4MnRYVEVzblJoRnJ5S2RCWE1VcUdxQTJ0cGRRK1Fs?=
 =?utf-8?B?M3VKOFB0ZDJaMWhCbWhsb21BSGtpYlRIbFVMaDBLZnpocFdnRUJSZS9HSThj?=
 =?utf-8?B?bDBBREtkYzMrbFF6SXVtQm0wN2w1MFdOY3UyUk55RS9DeWc2dVgrZjg1ZmY0?=
 =?utf-8?B?anRWc0ozVFVISFgxYUlYUzBvZ3A2VUVDczI4b0xsTHBnR2JsM1IzaE1RV3Jm?=
 =?utf-8?B?S1M0SFArODduZkM5VVBmRGRTQ1Voc1Z2bHgwVWRPS2pqQmEvZk5NR0lLZnNo?=
 =?utf-8?B?Uzd5K1IwTzd0b1hsYVhSUDVNRC8vOGFIMm85bzNsbUk0Qmt6UGN1ekVDU2Mx?=
 =?utf-8?B?WUYxVmNyd0dhL05UMG1oMzBqM21ocFNyVDVVQkl2OSthTG1ZT2RreXVqMTdG?=
 =?utf-8?B?dGMrMWFvdmhmTGRUbzF3bVdVa0hJTDE2WmNQbyt4MDB1TW1OMm14YU1kZUxH?=
 =?utf-8?B?blROVUtOSkExWU0rVkJicVFkUFRuNzF6dHZUeEhtMTgxSEgrdDdrdEVvb2hE?=
 =?utf-8?B?eHN3bVVYeXliUFNoN0VHNGg3STFmNTlXUjduaTJBVDVYdTR1djZvRFFDY0xU?=
 =?utf-8?B?bUQveE0vb295NyszMEY1Ri9RcmtDaG55T1hBMVZDT1hlUHRMU2JzUDRiSFBP?=
 =?utf-8?B?RnlsT2NoRjJGQ1diVDFjSkQvei9Vc1MrQlgrNjdtdk52UWdHdXNZd1pwd24v?=
 =?utf-8?B?ckZMRGZDSSs3TXpxaXRYRFdubUljVklaTVZmdWRwSEVycnlXUHdOZ2hUQUxN?=
 =?utf-8?B?UlcvU1duT1N3SkJIZWljZWZOTmdYMTFhWjZUNlpHalNUUGtEV0tadjRyZllS?=
 =?utf-8?B?WFlGajFaR3pVRUUzWHlRS0NzUk9oNEFUbWxFR1VlYXJIYWxJV09vSzF4K25V?=
 =?utf-8?B?a2xtWjJaM0o5cm14QUdIKzdIV2psSWtXTFdVa2NLZlFDdG9yOU9RNnlwSEdH?=
 =?utf-8?B?bUgrWkpUSlNydnZlUVpjTElqcmloZFVZTlYrK2FDTTBsbFBCbW4ySlVaTkRD?=
 =?utf-8?B?aVNSMkVxeFdWOEhPYVVMdk9ackx3MTE2NWVCQmtMR2xRZC95T2dCSmhhQm5F?=
 =?utf-8?B?L0dHNHp1OFpYcFhDbmp3b3pyOXRzRm1pVUpsanBTVklqTS9SanVVVTU3eGZU?=
 =?utf-8?B?VUlDUy9LVERPNkpjZWJEUllacWNQa1FSeDQ2cEk3d1EreERBMGpMNURIbGR5?=
 =?utf-8?B?Vm04ZjNLUVZvaHU4YjFJZW9pRGpsamdKRFB4L1RKd0xwQWdqdDMyRlZiVGE4?=
 =?utf-8?B?aXJLSXdNaWZzZ2lhTHpocFhjRGxDelBqQ3lFY2JyWkNjNStkVVJqYmRSdWxB?=
 =?utf-8?B?THVLVFY1b2QwVktQUzUwT0lNZDNEdmJ3VlBwa2NIbGFRcEY5cmtPRUFMeStG?=
 =?utf-8?B?VDdSU2JZcFBGRm9OVDgxSVNEcjUxbk1FWnBGZ3Z2b0swbGR2ckxqZXVXQlkx?=
 =?utf-8?B?Ukg1dVM5YWFacGlaY1E2WWxxOHk3anV1ekNkMjZVbWhBK1VXc3dHdlJFUGwx?=
 =?utf-8?B?M1RLYnhlM2lQM2d4UXdSN0h1OW42S0tEUGRJbHR1RnhVWEQ5c0UvOTFjRFZF?=
 =?utf-8?B?bWh6elhESmhuR1RqRzlFcmxKd3dlQWRoSmpUQWtyajlHeWV6bUFmNnFpZ2VS?=
 =?utf-8?B?dnc0Vkd5ajVXRFlQWUs4RmsvNURFMEVnRnRYSTl5OFgyd2hNZm9Ld3FYTGww?=
 =?utf-8?B?cjB1RmZ0dXIySzgvWlRVcWsrUUFmcHZqU2FFQSszcmRZTjg5TjVzV3lmdlhm?=
 =?utf-8?B?dk5NNVhkUTFZZzFXWlBVL0VSejdzSjlJQ21EWG80bllQbVAyWDIrVnd6MnNO?=
 =?utf-8?B?bFMxQjVPZmc4cTRiSy90UytpVTlUN2FaMjJNYVZ3MklUZFZzUkRNaFoydGdj?=
 =?utf-8?B?NkpkNjhEeVlzRk00clNGcFNXTFc0cWhKZmwxZ1RZQjRadVJ5ZFFtdEdLZFg5?=
 =?utf-8?B?ckNRTlhHQW9vYzRiWFlKNFBmMVpqR0p2N0lwcXl3Uy9TdWZnSWwxcE1wUXhN?=
 =?utf-8?B?REJnakluYVRBZ3c5c2kvUjlXQ25PbVlwcy9rRWVmRkx2cGsydWNLUHVHSnFS?=
 =?utf-8?Q?2QQidw?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA4PR11MB9251.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aFhVUGliTWZ1MU0xbjduUmZVVWNMWmh3bG1IbUNFME9PTGRsWExJenZ3UU5v?=
 =?utf-8?B?ZEE4WDJoamNIT0hQWmlvaHJWcVc2aXhNWDhOT1FDWHMzZnZDSy9HZEhrSk5Z?=
 =?utf-8?B?bThQTE1wWDB6UkdWTTZIZHVFZFhORmtlTU5wTHhEOXhYQ3hLQlA4cWpjQ0FB?=
 =?utf-8?B?S3dSY2JBZDUwRGxWNERzQ081a3U5emFEcWMyWE0vWlN6SmVBWnpaY0Z1Ny9m?=
 =?utf-8?B?WXlnbkJUSzFIWXBVK1BibHVwT3Bid3dKWEJEOG94azFHenJBdm9zZFJVdlZa?=
 =?utf-8?B?cTF6clJadXVsY0UxTWtTV2o1TGw1aTdwNVJPOTVrU1V3Q0JaRWc5bFFzS1lE?=
 =?utf-8?B?MVN2cWNhUVc1RHliZkNZRFg4M01rVlJaZmVPZnlteXJoMnZhdnZWcWIyOHls?=
 =?utf-8?B?bWVaeU4zcTlRbTUvSjgvNnVRRnJuZDJINGFnMFd3K1JEQUVuQVFuYVBDL2Zt?=
 =?utf-8?B?M0RWK0sxNjJPN3EvYi9sRW9pbmpmMWpMNVVVYkM5U3UxcjE3QWhzMStteDh3?=
 =?utf-8?B?T2g1QlR1YWlBeWdPdVFkQ1ZiOGptRzg2Z0tuSTBuUjV4WmVFd0NyNktTTmtz?=
 =?utf-8?B?bzVlM0JNOTVhOVgrbjRZYjIza1lHcW1HZkVrc2M3L0dPM1UyY2F3WXFpSjJH?=
 =?utf-8?B?R0xCNW03WEsybVRVMzNnYzJBaG1Dc2UxbFBIdU1mVVU0NzhZR2xGelpVbDBv?=
 =?utf-8?B?VTZiUm1aOE5LWENxaEpoNkE3dlQ0QjhKSUVJMEJ2b0hjRHlKQlJYMkZlajRr?=
 =?utf-8?B?Q3JaVEVyb2NaTUhTejc4NXV4VXMxb3M5YzgrdnB5YjFqeW5kc0tjT3gyMFNZ?=
 =?utf-8?B?VlFwRFlReWtKQlRGWHh1MzgwWFBBNlpKNHd4aXRhZWdiV29YcXhxT1ZmdXlv?=
 =?utf-8?B?bkNhOG8zaDJtcXQrTUFCOUxCWDJ3MWZDV2xySnNqSXFTQ3hmU1A0WUZFeDJk?=
 =?utf-8?B?c2o2THVYTENhNCtSb0Y0UHI4RG1aQW8vZXNPMFNaOTFjaDN4ZXAwVDRvZWNX?=
 =?utf-8?B?OFh2ZzlwYXM3aU5HYzdxRTZybWhRMUNjUUVEUnVTbXJNT01aZDBnZVZ5c1cw?=
 =?utf-8?B?OHRReWp0SzlBMm1mUnhjaHlpSzdEaDBLcVdzOWRQWW5uMzFiMEgwSnFZVjZ0?=
 =?utf-8?B?dmpvTkNBU2hhR0ovRWJ6c3VpL2lHZkVTY1B6a1VXTndmWVcyaEJXYVpQbFUy?=
 =?utf-8?B?a04wT1FjUGg5VDlSWFhsUitsRDFuSjJ1K3h5eUFTL0MveW5OTGwzWlZDSGV4?=
 =?utf-8?B?Q1ZZcERYMTFuS0RMVGlhOEY1WmJoTGdWanp6ZU9WNDl5VDUzNjAvR1pVdWhL?=
 =?utf-8?B?NXZYdHBIQ3E4eFhxdXNXaXNsK3VENXlrT1VTYm1Vdm0xbDNVU3NZSWNDTTdO?=
 =?utf-8?B?aUtiK1dYcFZEbW5adE9GVW0wbzNrVFNWU3YyTysxQ3ZJb1BicFZjMkU2dUFh?=
 =?utf-8?B?dlQ3M2ZlaGFybTI2MUd0VkVwREJhUWs0NkN6a3lVRnhSUktvMm9rNTNpNDNa?=
 =?utf-8?B?aEZabkMxcStiQi9ZNUNHc0lGL0hUdDl5cmFXMklyWXBxaEp6dFMrekw3a3dI?=
 =?utf-8?B?cHFldzZ1QmNMQUF1ZEhZWXg3WWlOVGNQYUxyWkJKNHc2TkEwVmFoSFcyUTZy?=
 =?utf-8?B?U0s2ZEkvYzNOTEFQUDBubkdLb3lITEllWEJyVThDeG8zaFIwaFFZNGdtbWFi?=
 =?utf-8?B?b1lEZmVZL1gzY2pSeG1xVGVrUVBOUVFjS3FlaU40TUpXbUxxOFlkS3RUclpt?=
 =?utf-8?B?UGNxQlkybkFUZ3ZIOFBNOUs0RnNCYk54NXNjN3AzSnNnL0VCV2ZaSXV1YkVp?=
 =?utf-8?B?UTFORXBaVjlOWVJLWFA0TzkzNU0rVTg4NUMyL0lqbzJkeUVUU0xKQUtmSDlI?=
 =?utf-8?B?ZlgwVENmMUl5WFVlbjh1UjdyeDNkd040bityUlp4bDlkMVBwbDBRYTZBM1VF?=
 =?utf-8?B?SVVvR0N4cWJId0tsMldYNHd4K3ZhUHMzdllDNGIrcmdpaWJiRG9JY2lmNHQv?=
 =?utf-8?B?MmkweHVac2ZiTlhVY1lZZXJZRmhZYTEwOTY3bHkyQU56R1piRG8zUTdDdmFs?=
 =?utf-8?B?TGM1emNmb1lzWnZxQyswOFhKeENmSEMrcHV6Z2U4WlZHbXNlbFBQQjFiR3hr?=
 =?utf-8?Q?xujSx2b3VnUTHuBRfYgEGDMWr?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA4PR11MB9251.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1374215-b82a-46da-8c48-08de2d97bbed
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2025 09:31:24.8825 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e6c1NV8EanGB9TjXatxBaAnaa+XGRIBNkj5nkhDTpv5leG+IcjwEhJQkmG9wVk/G7AZB2vbXD1oi3ZuM7kjGkOnkB32G8RUbCsQM+cHjAyc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8451
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ2hyaXN0aWFuIEvDtm5p
ZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBOb3ZlbWJlciAy
NSwgMjAyNSAzOjExIFBNDQo+IFRvOiBTb2tvbG93c2tpLCBKYW4gPGphbi5zb2tvbG93c2tpQGlu
dGVsLmNvbT47IGRyaS0NCj4gZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBEYXZp
ZCBGcmFuY2lzIDxEYXZpZC5GcmFuY2lzQGFtZC5jb20+OyBNYWFydGVuIExhbmtob3JzdA0KPiA8
bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPjsgTWF4aW1lIFJpcGFyZA0KPiA8bXJp
cGFyZEBrZXJuZWwub3JnPjsgVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+
Ow0KPiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAZ21haWwuY29tPjsgU2ltb25hIFZldHRlciA8c2lt
b25hQGZmd2xsLmNoPjsgRmVsaXgNCj4gS3VlaGxpbmcgPGZlbGl4Lmt1ZWhsaW5nQGFtZC5jb20+
OyBEZSBNYXJjaGksIEx1Y2FzDQo+IDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+DQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggMS8xXSBkcm06IGRpc2FsbG93IHNldHRpbmcgMCBhcyBuZXcgaGFuZGxl
IGluDQo+IERSTV9JT0NUTF9HRU1fQ0hBTkdFX0hBTkRMRQ0KPiANCj4gT24gMTEvMjUvMjUgMTQ6
MzksIFNva29sb3dza2ksIEphbiB3cm90ZToNCj4gPg0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4NCj4gPj4gU2VudDogVHVlc2RheSwgTm92ZW1iZXIgMjUsIDIwMjUgMjoyMyBQ
TQ0KPiA+PiBUbzogU29rb2xvd3NraSwgSmFuIDxqYW4uc29rb2xvd3NraUBpbnRlbC5jb20+OyBk
cmktDQo+ID4+IGRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+PiBDYzogRGF2aWQgRnJh
bmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPjsgTWFhcnRlbiBMYW5raG9yc3QNCj4gPj4gPG1h
YXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT47IE1heGltZSBSaXBhcmQNCj4gPj4gPG1y
aXBhcmRAa2VybmVsLm9yZz47IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRl
PjsNCj4gPj4gRGF2aWQgQWlybGllIDxhaXJsaWVkQGdtYWlsLmNvbT47IFNpbW9uYSBWZXR0ZXIg
PHNpbW9uYUBmZndsbC5jaD47IEZlbGl4DQo+ID4+IEt1ZWhsaW5nIDxmZWxpeC5rdWVobGluZ0Bh
bWQuY29tPjsgRGUgTWFyY2hpLCBMdWNhcw0KPiA+PiA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29t
Pg0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIDEvMV0gZHJtOiBkaXNhbGxvdyBzZXR0aW5nIDAg
YXMgbmV3IGhhbmRsZSBpbg0KPiA+PiBEUk1fSU9DVExfR0VNX0NIQU5HRV9IQU5ETEUNCj4gPj4N
Cj4gPj4gT24gMTEvMjUvMjUgMTQ6MDIsIFNva29sb3dza2ksIEphbiB3cm90ZToNCj4gPj4+PiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+Pj4+IEZyb206IENocmlzdGlhbiBLw7ZuaWcg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4gPj4+PiBTZW50OiBUdWVzZGF5LCBOb3ZlbWJl
ciAyNSwgMjAyNSAxOjU0IFBNDQo+ID4+Pj4gVG86IFNva29sb3dza2ksIEphbiA8amFuLnNva29s
b3dza2lAaW50ZWwuY29tPjsgZHJpLQ0KPiA+Pj4+IGRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zw0KPiA+Pj4+IENjOiBEYXZpZCBGcmFuY2lzIDxEYXZpZC5GcmFuY2lzQGFtZC5jb20+OyBNYWFy
dGVuIExhbmtob3JzdA0KPiA+Pj4+IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+
OyBNYXhpbWUgUmlwYXJkDQo+ID4+Pj4gPG1yaXBhcmRAa2VybmVsLm9yZz47IFRob21hcyBaaW1t
ZXJtYW5uDQo+IDx0emltbWVybWFubkBzdXNlLmRlPjsNCj4gPj4+PiBEYXZpZCBBaXJsaWUgPGFp
cmxpZWRAZ21haWwuY29tPjsgU2ltb25hIFZldHRlciA8c2ltb25hQGZmd2xsLmNoPjsNCj4gRmVs
aXgNCj4gPj4+PiBLdWVobGluZyA8ZmVsaXgua3VlaGxpbmdAYW1kLmNvbT47IERlIE1hcmNoaSwg
THVjYXMNCj4gPj4+PiA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPg0KPiA+Pj4+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggMS8xXSBkcm06IGRpc2FsbG93IHNldHRpbmcgMCBhcyBuZXcgaGFuZGxlIGlu
DQo+ID4+Pj4gRFJNX0lPQ1RMX0dFTV9DSEFOR0VfSEFORExFDQo+ID4+Pj4NCj4gPj4+PiBPbiAx
MS8yNS8yNSAxMToyOCwgSmFuIFNva29sb3dza2kgd3JvdGU6DQo+ID4+Pj4+IGRybV9maWxlJ3Mg
b2JqZWN0X2lkciB1c2VzIDEgYXMgYmFzZSB2YWx1ZSwgd2hpY2ggY2FuIGNhdXNlIGlkDQo+ID4+
Pj4+IG1pc21hdGNoIHdoZW4gdHJ5aW5nIHRvIHVzZSBEUk1fSU9DVExfR0VNX0NIQU5HRV9IQU5E
TEUNCj4gPj4+Pj4gdG8gY2hhbmdlIGlkIGZyb20gMSB0byAwLg0KPiA+Pj4+Pg0KPiA+Pj4+PiBE
aXNhbGxvdyAwIGFzIG5ldyBoYW5kbGUgaW4gdGhhdCBpb2N0bC4NCj4gPj4+Pj4NCj4gPj4+Pj4g
Rml4ZXM6IDUzMDk2NzI4Yjg5MSAoImRybTogQWRkIERSTSBwcmltZSBpbnRlcmZhY2UgdG8gcmVh
c3NpZ24gR0VNDQo+ID4+Pj4gaGFuZGxlIikNCj4gPj4+Pj4gU2lnbmVkLW9mZi1ieTogSmFuIFNv
a29sb3dza2kgPGphbi5zb2tvbG93c2tpQGludGVsLmNvbT4NCj4gPj4+Pj4gQ2M6IERhdmlkIEZy
YW5jaXMgPERhdmlkLkZyYW5jaXNAYW1kLmNvbT4NCj4gPj4+Pj4gQ2M6IE1hYXJ0ZW4gTGFua2hv
cnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+DQo+ID4+Pj4+IENjOiBNYXhp
bWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+DQo+ID4+Pj4+IENjOiBUaG9tYXMgWmltbWVy
bWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4gPj4+Pj4gQ2M6IERhdmlkIEFpcmxpZSA8YWly
bGllZEBnbWFpbC5jb20+DQo+ID4+Pj4+IENjOiBTaW1vbmEgVmV0dGVyIDxzaW1vbmFAZmZ3bGwu
Y2g+DQo+ID4+Pj4+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4NCj4gPj4+Pj4gQ2M6IEZlbGl4IEt1ZWhsaW5nIDxmZWxpeC5rdWVobGluZ0BhbWQuY29t
Pg0KPiA+Pj4+PiBDYzogTHVjYXMgRGUgTWFyY2hpIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+
DQo+ID4+Pj4+IC0tLQ0KPiA+Pj4+PiAgZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYyB8IDQgKysr
Kw0KPiA+Pj4+PiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQ0KPiA+Pj4+Pg0KPiA+
Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYw0KPiBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZ2VtLmMNCj4gPj4+Pj4gaW5kZXggNjgxNjhkNThhN2M4Li4yYTQ5YThlMzk2
ZmEgMTAwNjQ0DQo+ID4+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMNCj4gPj4+
Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYw0KPiA+Pj4+PiBAQCAtOTc1LDYgKzk3
NSwxMCBAQCBpbnQgZHJtX2dlbV9jaGFuZ2VfaGFuZGxlX2lvY3RsKHN0cnVjdA0KPiA+Pj4+IGRy
bV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwNCj4gPj4+Pj4gIAlpZiAoYXJncy0+aGFuZGxlID09
IGFyZ3MtPm5ld19oYW5kbGUpDQo+ID4+Pj4+ICAJCXJldHVybiAwOw0KPiA+Pj4+Pg0KPiA+Pj4+
PiArCS8qIEFzIHRoZSBpZHIgYmFzZSBpcyAxLCB0cnlpbmcgdG8gc2V0IGhhbmRsZSAwIHdpbGwg
Y3JlYXRlIGlkDQo+IG1pc21hdGNoDQo+ID4+Pj4gKi8NCj4gPj4+Pj4gKwlpZiAoYXJncy0+bmV3
X2hhbmRsZSA9PSAwKQ0KPiA+Pj4+PiArCQlyZXR1cm4gMDsNCj4gPj4+Pg0KPiA+Pj4+IFRoYXQg
d291bGQgbmVlZCB0byByZXR1cm4gLUVJTlZBbCBvciBzb21lIG90aGVyIGVycm9yIGNvZGUuDQo+
ID4+Pg0KPiA+Pj4gT2ssIHdpbGwgY2hhbmdlIHRoYXQgaW4gbmV4dCB2ZXJzaW9uLg0KPiA+Pj4N
Cj4gPj4+Pg0KPiA+Pj4+IEJ1dCBJJ20gd29uZGVyaW5nIHdoeSB0aGF0IGlzIG5lY2Vzc2FyeSBh
dCBhbGw/IERvZXNuJ3QgaWRyX2FsbG9jKCkNCj4gcmV0dXJuDQo+ID4+IGFuDQo+ID4+Pj4gZXJy
b3Igd2hlbiB5b3UgdHJ5IHRvIGFsbG9jYXRlIGhhbmRsZSAwPw0KPiA+Pj4NCj4gPj4+IEl0IGFw
cGVhcnMgdGhhdCBpZHJfYWxsb2MgZG9lc24ndCByZXR1cm4gYW55IGVycm9ycyBpbiB0aGlzIHNj
ZW5hcmlvLA0KPiA+PiBvdGhlcndpc2Ugd2UnZCBnb3RvIG91dF91bmxvY2sgc3RyYWlnaHQgYXdh
eS4NCj4gPj4NCj4gPj4gTWhtLCB0aGF0IGlzIGEgYml0IG1pc2xlYWRpbmcuIFdlIGludGVudGlv
bmFsbHkgaW5pdGlhbGl6ZWQgdGhlIGlkciBzbyB0aGF0IGl0DQo+ID4+IHN0YXJ0cyBhdCAxLiBN
YXliZSBpZHJfYWxsb2MoKSBzaG91bGQgYmUgZml4ZWQgaW5zdGVhZC4NCj4gPg0KPiA+IEkndmUg
Y2hlY2tlZCB3aGF0IGlkcl9hbGxvYyBkb2VzLCBhbmQgaXQgbG9va3MgbGlrZSBpdCdsbCByZXR1
cm4gMiBpbiB0aGlzIGNhc2UsDQo+IA0KPiBXZWxsIHRoYXQgd291bGQgYWJzb2x1dGUgY2xlYXJs
eSBiZSBhIGJ1ZyBpbiBpZHIuDQoNCkkgc2VudCBhIFJGQyBwYXRjaCB0byBsaW51eCBrZXJuZWwg
YXQgdmdlciAoW1JGQyBQQVRDSCAwLzFdIElEUiBmaXggZm9yIHBvdGVudGlhbCBpZCBtaXNtYXRj
aCksDQpob3BlZnVsbHkgdGhhdCdzIHRoZSBwcm9wZXIgcGxhY2UgZm9yIHRoYXQgcGF0Y2guDQpJ
J2xsIHdhaXQgZm9yIGl0IHRvIGJlIHJldmlld2VkIGJlZm9yZSBzZW5kaW5nIGFueSBmdXJ0aGVy
IGNoYW5nZXMgdG8gZHJtX2dlbS5jIChhcyB0aGF0IHBhdGNoIHdvdWxkIGZpeA0KdGhlIHdhcm4g
YW55d2F5KQ0KVGhhbmtzIGZvciB0aGUgcmV2aWV3IQ0KDQo+IFRoZSBzdGFydCBwYXJhbWV0ZXIg
aXMgZG9jdW1lbnRlZCBhcyB0aGUgbWluaW11bSAoaW5jbHVzaXZlKSB2YWx1ZQ0KPiByZXR1cm5l
ZCBhbmQgdGhlIGVuZCBwYXJhbWV0ZXIgaXMgZG9jdW1lbnRlZCBhcyB0aGUgbWF4aW11bSAoZXhj
bHVzaXZlKQ0KPiB2YWx1ZSByZXR1cm5lZC4NCj4gDQo+IFNvIGlmIHlvdSBhc2sgZm9yIHZhbHVl
IDAgYW5kIGdldCAyIGluc3RlYWQgdGhhdCBpcyBjbGVhcmx5IG5vdCB0aGUgZG9jdW1lbnRlZA0K
PiBiZWhhdmlvci4NCj4gDQo+IFNvbWV0aGluZyBmaXNoeSBpcyBnb2luZyBvbiBoZXJlLiBQbGVh
c2UgaW52ZXN0aWdhdGUgd2hhdCBpcyBhY3R1YWxseQ0KPiBoYXBwZW5pbmcgYW5kIHdoeS4NCj4g
DQo+IE15IGVkdWNhdGVkIGd1ZXNzIGlzIHRoYXQgdGhlIGJhc2UgaXMganVzdCBpZ25vcmVkIGJ5
IGlkcl9hbGxvYygpLCB0aGF0J3MgYSBiaXQNCj4gc3VycHJpc2luZyBidXQgYXQgbGVhc3Qgbm90
IG90aGVyd2lzZSBkb2N1bWVudGVkLg0KPiANCj4gUmVnYXJkcywNCj4gQ2hyaXN0aWFuLg0KPiAN
Cj4gPiB3aGljaCBpcyB0aGUgbmV4dCByZXNlcnZlZCBpZCAoMCBpcyByZXNlcnZlZCwgc28gaXQg
Z29lcyB0byAxKSArIGJhc2UgKDEpLg0KPiA+IE1heWJlIHRoZSBzb2x1dGlvbiB3b3VsZCBiZSwg
aWYgaWRyX2FsbG9jIHJldHVybnMgYSB2YWx1ZSBvdGhlciB0aGFuIGFyZ3MtDQo+ID5uZXdfaGFu
ZGxlLCB0aGVuDQo+ID4gYSkgYmFpbCBvdXQNCj4gPiBiKSBuZXdfaGFuZGxlID0gaWRyX2FsbG9j
LCBhbmQgaW5mb3JtIHVzZXIgdGhhdCB0aGUgYXNzaWdubWVudCB3YXMNCj4gY2hhbmdlZCB0byBh
bm90aGVyIGhhbmRsZS4NCj4gPg0KPiA+IEFzIGlkciBpcyB1c2VkIGluIG1hbnkgb3RoZXIgcGxh
Y2VzLCBJIGRvbid0IHRoaW5rIHRoYXQncyBmZWFzaWJsZSBvciBlYXN5IHRvDQo+IGZpeCB0aGF0
Lg0KPiA+DQo+ID4+DQo+ID4+IEJ1dCB0aGF0IGlzIGNsZWFybHkgYSBtdWNoIGxhcmdlciBjaGFu
Z2UsIHdpdGggdGhlIHJldHVybiBjb2RlIGZpeGVkIGZlZWwNCj4gZnJlZQ0KPiA+PiB0byBhZGQg
UmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4g
dG8gdGhpcw0KPiA+PiBwYXRjaCBoZXJlLg0KPiA+Pg0KPiA+PiBBZGRpbmcgYSBDQzogc3RhYmxl
IHRhZyBzb3VuZCBhcHByb3ByaWF0ZSBhcyB3ZWxsLg0KPiA+Pg0KPiA+PiBSZWdhcmRzLA0KPiA+
PiBDaHJpc3RpYW4uDQo+ID4+DQo+ID4+Pg0KPiA+Pj4+DQo+ID4+Pj4gUmVnYXJkcywNCj4gPj4+
PiBDaHJpc3RpYW4uDQo+ID4+Pj4NCj4gPj4+Pj4gKw0KPiA+Pj4+PiAgCW11dGV4X2xvY2soJmZp
bGVfcHJpdi0+cHJpbWUubG9jayk7DQo+ID4+Pj4+DQo+ID4+Pj4+ICAJc3Bpbl9sb2NrKCZmaWxl
X3ByaXYtPnRhYmxlX2xvY2spOw0KPiA+Pj4NCj4gPg0KDQo=
