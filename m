Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04122BB7A3C
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 19:01:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A659F10E94F;
	Fri,  3 Oct 2025 17:01:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jGXRYwwX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B9F410E94D
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 17:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759510907; x=1791046907;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=A+h3CF9JF8C4YbLZFoNp+rbvMqXdID6lsXnCwqIq6Kw=;
 b=jGXRYwwXk9WCHtMd7ZkyFnCqJyqkUFGxp/wv2LNitpu3EGhRFJHs/agp
 2oOGS3uiqMpr0KiEzKzmPAm+7rCZqSg5gkJBeh8mlFOhbQz9ch2W6dI4Y
 lndMjkdF0x+fy0ccXvBYtQe0Ea8A2wPQx7vfqRhaKCKe8F9Dvk8q7FE7c
 Io4Ng4xMbCuitao3l6VvZOtcl1gD+d2Hpsx4DSgCAfVDGrsaqQXFLfjzj
 mIj5KUBOuxC34k9A9tXPhT/QwnLBN3Nr1jHnki4mD+6rbmWyMf7zfy06Y
 1q2EtEPTlPOBcK6HO6qUQe0mimWoWWeZpEcJlC3Gg9kj4FLaa/OazZ0ct w==;
X-CSE-ConnectionGUID: po08f/KqS+esiGAQX9aiqQ==
X-CSE-MsgGUID: 9MUgwLhAS9SX/qwVWZQ78w==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="61506175"
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; d="scan'208";a="61506175"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 10:01:46 -0700
X-CSE-ConnectionGUID: p23UN/vdTW6EYDN/DTwS6Q==
X-CSE-MsgGUID: TOsOfEYVTPy++9W8P+WB/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; d="scan'208";a="178985175"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 10:01:46 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 10:01:45 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 3 Oct 2025 10:01:45 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.30) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 10:01:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CYHcGD1fBFFpJnPIYyi9hYisfofuIOFzUsQKiuGqQw9fTehy7woMxOZ+ljOxJNCSDO3+zgjbR3S+WmNxr0/NrkgQB1qaZK4hGARMhx36vSaQjB7UN0jV/FtZ0+yVLg8D/rnYXXhWAw6O2JFRKGqMP3fREu+Os4/Jh+6mVyyRPTR9Tib0OiryJbo2+jbhZzb/Sxbe7cAJgYKXjWiQ45FAVthfqCFmbvWZ6DdBEJY0+lF+EDV1R2Piyb0v/AN5n72JO6bq0ZkNMDx9W9rvz7wlvhKL0vLOwIDfFqBTLmNFI8uJ7EB1HYwzGx+Cc77bmHqsFdzyiMHRSZwDQcijFqksyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A+h3CF9JF8C4YbLZFoNp+rbvMqXdID6lsXnCwqIq6Kw=;
 b=E90nQu9eKPrBUq+mdoPYMwjsuEEke8JZ1Jh/IZWwrAUU5r+wEZN2lRydvO5QjHpbd9sKFo3ZfEdAPE8MRKNTjv5MJ6NwuIMpoIfDR2l8ldmHw+ZsLucNBj3cwLwHNWJfW4tEq2rgSrc+o9l2z1gIg8sluNZ2bIbnHza3nbEbV+JQ/0b9SJnlyr2++UsRXR58jfmJJbEMez5Reqh8/rfwMQsp4Cw4SqkhlOfNUVy/XB595CCjMhmg3JUf5/n5yVXvUQPis+VtU+HDRmhfiLVPIjpC6gc+o5d6SZ3AXqM6XZq8dMAhAQ4u1fpKBDldWqIEZBivhA9kXra757AsnO4xJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5112.namprd11.prod.outlook.com (2603:10b6:510:3b::18)
 by MW4PR11MB6786.namprd11.prod.outlook.com (2603:10b6:303:20b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Fri, 3 Oct
 2025 17:01:29 +0000
Received: from PH0PR11MB5112.namprd11.prod.outlook.com
 ([fe80::b6b7:41ec:7dc8:773]) by PH0PR11MB5112.namprd11.prod.outlook.com
 ([fe80::b6b7:41ec:7dc8:773%6]) with mapi id 15.20.9160.018; Fri, 3 Oct 2025
 17:01:29 +0000
From: "Kim, Dongwon" <dongwon.kim@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "nirmoyd@nvidia.com" <nirmoyd@nvidia.com>
Subject: RE: [PATCH v5 2/3] drm/virtio: Add support for saving and restoring
 virtio_gpu_objects
Thread-Topic: [PATCH v5 2/3] drm/virtio: Add support for saving and restoring
 virtio_gpu_objects
Thread-Index: AQHcNHWvB6idhqOgWU+kU1kBCRCfnbSwoivw
Date: Fri, 3 Oct 2025 17:01:29 +0000
Message-ID: <PH0PR11MB51125B8A88CBFAE48E7BDC62FAE4A@PH0PR11MB5112.namprd11.prod.outlook.com>
References: <20251003053402.732218-1-dongwon.kim@intel.com>
 <20251003053402.732218-3-dongwon.kim@intel.com>
 <059d3074-dc1f-47cf-9bdd-ca582e150511@collabora.com>
In-Reply-To: <059d3074-dc1f-47cf-9bdd-ca582e150511@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5112:EE_|MW4PR11MB6786:EE_
x-ms-office365-filtering-correlation-id: d6ff85d3-3c60-4cf1-bdcf-08de029e7f50
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?VGpRRlp3WEdJcGJkWTNKbVFXZ01jOCt1eHFkL0xYaU1NMXdrM1B6QXBMY3BS?=
 =?utf-8?B?aHIyMDlsZVkzeHpMekFKdEVSTzhrWVFzNUxtZ3gySEwwNEhwYUxtTUl2eHU2?=
 =?utf-8?B?aDVOMmNiTWE1dUtzL0ZsSXRDT0RVbm42Y3NXUFllcnlwS0JDSEswU0hlUEJH?=
 =?utf-8?B?N1BSVWpaYU1obG95K21sVXBGN3U0S29WZ0dIci9TTDM5RGZmVlpRdnNlMlRF?=
 =?utf-8?B?M2t0cUtuQ3JiUmEwRkhNcXdJQmRVM1lHQzFQbTYreVFicXZTWU9Bb0tEWXYv?=
 =?utf-8?B?dWdGMkJKeXhhazFMZGhBVkJpL3JMU0tmMHcrSTJZeFBlNmZrY29tV2xvc1Nx?=
 =?utf-8?B?MDBZc2Q5ZGQvMFhqVjBDeFdyVlcrRlloTnkzK2VzeHVMRDhCVnJsSVdLSU1R?=
 =?utf-8?B?UUllMXRnZXZnTDlpeDFCcXZtcytFbURBSXhMZHlod1FoblMwNS9JNmhISUVQ?=
 =?utf-8?B?djFNRCs3cS9hZjloZVB5MWxHTHEyOHFUV2FsWUxuRlA3NTQrSXA5VjFsRnZ4?=
 =?utf-8?B?M1RxUmpuWkdtQnlLbkVIemZrT3JteUdnaVdsZi8zS3RheDFHSk9LcHJqNUJY?=
 =?utf-8?B?NjNEYlhTcDBza2tTV01LL1JydmsyZXRvb3pOMzJEMVZCczdySUpCM1NIVC9n?=
 =?utf-8?B?czdtRHhhWE1RWU5KQi95Q2l5SUswbWNxM3dUaWhZRTYvcm5YcUFkajBvL1Rs?=
 =?utf-8?B?UnFvaklyeDBLV2VVTG82bFJYZE5LQnp6dW54N1Qydy9tSTJWNTBMZk96bm52?=
 =?utf-8?B?OFlwRFpONVFrTVZTYTh5L1Z4ekJXVk1KRlNrKzdFd1ViUFFMWEdWWEgvc1g5?=
 =?utf-8?B?N3V0SzZZSTZwNStmK3VnT0ZCQ0M2Zk84UlcvN3Q3bWd6Z3d5YXBScTN3cUpB?=
 =?utf-8?B?Q3FOUnl2Ymhxem5VUS9yVnRLSWRKYkYzQ0gxNG5MYVFBYXNveTlZd2F3ZHZm?=
 =?utf-8?B?Q3h3c09vMXo5a3djendQbGxoUEhZa1dsaUI5bjVpRS9oOFFaZ2tkemJ0d1dE?=
 =?utf-8?B?T0Q1Wnl6N0o3eE9hZnFEN1U1ZUVQQnVEcTJSUGxQa3hWcmRRYVE3Nm1SRDRv?=
 =?utf-8?B?NGkzZ0FaTjdZVE9pQWkvSlFRd1lYNTlCUWErOThSaXpWQllzTDFMU1FuNmJO?=
 =?utf-8?B?cExCcE9DVEE4TnA3TldPaHNZT2dNaWRzcnZGT0lEbzIzN0RuVEFIOFpCemxW?=
 =?utf-8?B?MHdEbm5LUUdsMWc4VFNvU1FLekIxNXFNTWI0VXhtMGNrTXpFN2hRYTZxc3lu?=
 =?utf-8?B?RWJFTFhNWWM0RmJFTXhPZnBOK1hKRnZWVWFDODQzV1RGbmFBMlI2alFjTVlD?=
 =?utf-8?B?d2NiZ0t4RXpnVDlsdjg0UnFVNC9KVzJOVGRRa1dRSDZadCttRXNaSkV4bVFo?=
 =?utf-8?B?ancwNndiRWgrVmMwcDN1UG5IM0FpTjZDYVY5eGhEeURPamJmaWo5a3hCQXp4?=
 =?utf-8?B?MzZzNDJJZURTZkVGQ3RZUUFBUW83b2VtcjJtaTdnWGhGVEdJWmhpRzU4ZmR1?=
 =?utf-8?B?MDlxK2lId3NMaEFSR29lMmhyVEZpbjZndGdQZWxsZFJmcFFITjRMYy9waDdI?=
 =?utf-8?B?V3VBTm5hV2VTZnhqU1k5eUdSamhEYUUxclZwbjQwQk1Jbm1sNzdKZlhSME93?=
 =?utf-8?B?N25YZURSc1l0MmJxQ05yNCtEZFR2Ukc2di9kMStCbmR6TlJaYjI2VXJNZTJZ?=
 =?utf-8?B?aHdsWGJNQ0pKNjFaWFBraEpGSmliUnNWVUppRVN2RHFvUXVoYXcxV1N2TGs4?=
 =?utf-8?B?a3FNQlp3cy8rNndBYUpTcFBKNmlZbTVHQjVEOE03RmxOaFBJdm1VNXNQQzlX?=
 =?utf-8?B?QXVFNSsyekVPL1lPbVNxa3RiMEZxREZ2TjNVbFhscGZtUWZoMWhFSEVVYUIw?=
 =?utf-8?B?Y0FFQ2ppcVh0NGIrUFRxQ3QyQnEyYmRKZ0J0Q1N3MzlhWmpncy9aa2pFU3FV?=
 =?utf-8?B?VG5yVWVzb050MzNOVk8vRmcvZ09wMlNEMDd6VlJFMWFGTGZlTzVNcWdkRlFR?=
 =?utf-8?B?VmZwUWdIZ1VTdCsvNjBwcGppZFYrY1NET2tGeVNsMHlYdFZ2ZGZjTlFFbGRw?=
 =?utf-8?Q?vG8oSd?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5112.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RlZwd1h3bjJpa0o2YWRhTkNwWk1vUSthQTh4N0pMNjVhMGxubnhzMnFsSWll?=
 =?utf-8?B?eklnK0o1TEg0VG1aMDFUdW1oM09lTXp3Y2FrNzdjTEo0UWFaWEJkc2oyQzRl?=
 =?utf-8?B?d2Z3Y1N6bk9kWkVnU0l3VHlvNXk5N01OQW8xY0xtOWp2clE1TFhya0xHcFJD?=
 =?utf-8?B?S2U5UVFzQlRtbXA0TFVHdlAzdzh3Yy9mM3ZDMXhBRGRTMVBlRkJCMkFnRnlZ?=
 =?utf-8?B?THZwMC90MkdLU2dOd045MEJmK2JCTVJZamJzWnQ4czl0STk3WVNHb3dXUlBu?=
 =?utf-8?B?SWNGRjRRNENDdWtzMURIanhxSmZPaExBOUJYOHpwQjlZR2hkSEhTZkRGb0Iz?=
 =?utf-8?B?Tmp1cHZxWVBzbnVNYlVoazdFQ0FhVm82MHMxVlNFenlnUkVCbUNsU2toN2hX?=
 =?utf-8?B?THNNZlBBa1ljWEIvQWt5QUJWUGpQM05UYXZVRExzZnVHVERQOTE1d2doR0h3?=
 =?utf-8?B?WGUvYmhDTFFpcE1zaTA4TDRJYVU2Z1ZMVXpjZ1MxNWFBNWNYd1dLU1ZIUDJJ?=
 =?utf-8?B?M2l4cjZaTDR4aUt2OXdIeklZemR4K1BqeFdvcWY0VE11cFF3VTk2dzlPSXdW?=
 =?utf-8?B?czlkMTFVVUVUMDZHZk9nbFJycXBLSHhNaVBkcGYyckJVQ2FMR3NxZVJweUEx?=
 =?utf-8?B?ZzZkS0p5Sk0xRkxzUno4RzJUSS84R1pRYzNIV3RrVy9LdVlDOU45L0J5ZFN1?=
 =?utf-8?B?cW10TmdhRjVNY290clEvY3ViZWhoMUNPY29rbHNHMXF1TzZ5TVZ0Nm83UnNY?=
 =?utf-8?B?cE1WY3lKY3lIQ0syZmJXU25yOVVnTTMzTThpa24vRE11TENPUWZKV2hka3di?=
 =?utf-8?B?Z2J0QVpiRmpEanh0NUU0YUF2WXhvR0pvZTRXWW55UW14dFJRTDlNelVtcnFP?=
 =?utf-8?B?RG9ySEw0QklLM0grd3BEajRTQXFheEFqVU4vaUdDK3pjdnZ4NE1YdkhoL1h2?=
 =?utf-8?B?YkkzQTNYS1BjQjVtakIra3lURDJGbVdHS0hlTTF5SjBoYUtuaXZBZEc4Q0pk?=
 =?utf-8?B?Y0txNzJXUHNsMm0vdUIyMkxCQklzbkhaRWdzMEFzK2ZqRTFEVTNiQTI0bXll?=
 =?utf-8?B?K08vbWt4NkEvQXJybThmeXdKQ0paelRDcUowSUMwTnllalU5YjVuU2J1WjAz?=
 =?utf-8?B?MHJobzY5ajdBRm9WRU1xTXFHWmlEYlpZVVdrS3Y4OVNRbXhWT1YzTDZ4V01U?=
 =?utf-8?B?QTN5bThjenVWSVpUVVZiNnkrQlJDN3AvbGxialN4SDdEbFZzais0TTdTd1RU?=
 =?utf-8?B?dHU1bzVRS1dCOW5ERTNsbE9pQm5QSXdOWUVEcWt5eitiTWNaSU16Qk12USsz?=
 =?utf-8?B?aks0U3Q4bnlDaGNMOHNDMkFuTGdLWi9Ib1l1TithaXlVLy92UCszTFE3K0xr?=
 =?utf-8?B?RHVQVEtWUG1SUHlYbTNMRUZ1ekxIcEhrYzlPandYZG5UbTJ3cUNXVHg1TEVH?=
 =?utf-8?B?MHV4Ylg2WUo3R2Q5Tk45U1E3UTFwV2NvNlVGK3hrTVM5UmtZaDJhWjQ2alo1?=
 =?utf-8?B?MTE5VU13UXR6bkVpa2tRTEoyVlhSQkNMb2xGU0ZLQ3gvYlJueTg3YjVhVlpj?=
 =?utf-8?B?OGZLbjJnMnoxMm14ZlU1VkREZjNsR0k3anJJN0YreEkvNzFEeHREMEhDcE1C?=
 =?utf-8?B?cFZRbllnMUFpbFNPWFdQNVpOcFBYcHFaeW9tT01xSUdLTi8yS0V6aE9ETTQ4?=
 =?utf-8?B?dkN4VGdXQnJiZEF3SGtLbmFaUFRQb1RONFdndzJQNHl4amtJc0duS3drSksz?=
 =?utf-8?B?U3pldFB2NTNEWUIzL0l4RVVod1ZGKzVSYlR5WVBCdzVjY3lKRW5NWjlJb3A4?=
 =?utf-8?B?MnZWV3lnU3YyeStVMDM5TEVRaGJtcnNtdFdvdWFYZitYM3RENHFDK2RRMGtm?=
 =?utf-8?B?NEdUTFJaeGdnQTZkR3FWTGFQdlJGc1RDUGxydHBObDJleHArRGhEM3RRVlFG?=
 =?utf-8?B?aEJVRFZ6K2RaYnYrWmFiSHZjVXZ3VndhSTM5QkVnR21lRktxTXhwOTNrc1ZS?=
 =?utf-8?B?N3Z1SW5iWkxFcEQrdWVMWXNabnhrd1VuWXMyRHc5RW1mS1hFaGZ1YkZsOVJL?=
 =?utf-8?B?UVk1WGZkUzlQcFAvWDJyL0NVM0EzRlVabzRNSG9GN0FBbzRxVkM4Y0JpaGpX?=
 =?utf-8?Q?gRogZtraNtBfom4HjBAelhdyC?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5112.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6ff85d3-3c60-4cf1-bdcf-08de029e7f50
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2025 17:01:29.7024 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WmamW7pb+3kBDPMIoEVDJ34huKMyjwkWrO4cY5FzA1ACiNZZBsBYWNwq7RAOL3xS7FWVkQ6EEw7xKGjawnfXRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6786
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

SGkgRG1pdHJ5LA0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjUgMi8zXSBkcm0vdmlydGlvOiBB
ZGQgc3VwcG9ydCBmb3Igc2F2aW5nIGFuZCByZXN0b3JpbmcNCj4gdmlydGlvX2dwdV9vYmplY3Rz
DQo+IA0KPiBPbiAxMC8zLzI1IDA4OjM0LCBkb25nd29uLmtpbUBpbnRlbC5jb20gd3JvdGU6DQo+
ID4gK2ludCB2aXJ0aW9fZ3B1X29iamVjdF9yZXN0b3JlX2FsbChzdHJ1Y3QgdmlydGlvX2dwdV9k
ZXZpY2UgKnZnZGV2KSB7DQo+ID4gKwlzdHJ1Y3QgdmlydGlvX2dwdV9vYmplY3QgKmJvLCAqdG1w
Ow0KPiA+ICsJc3RydWN0IHZpcnRpb19ncHVfbWVtX2VudHJ5ICplbnRzOw0KPiA+ICsJdW5zaWdu
ZWQgaW50IG5lbnRzOw0KPiA+ICsJaW50IHJldCA9IDA7DQo+ID4gKw0KPiA+ICsJc3Bpbl9sb2Nr
KCZ2Z2Rldi0+b2JqX3Jlc3RvcmVfbG9jayk7DQo+ID4gKwlsaXN0X2Zvcl9lYWNoX2VudHJ5X3Nh
ZmUoYm8sIHRtcCwgJnZnZGV2LT5vYmpfcmVzdG9yZV9saXN0LCBsaXN0KSB7DQo+ID4gKwkJcmV0
ID0gdmlydGlvX2dwdV9vYmplY3Rfc2htZW1faW5pdCh2Z2RldiwgYm8sICZlbnRzLCAmbmVudHMp
Ow0KPiA+ICsJCWlmIChyZXQpDQo+ID4gKwkJCWJyZWFrOw0KPiA+ICsNCj4gPiArCQlpZiAoYm8t
PnBhcmFtcy5ibG9iKSB7DQo+ID4gKwkJCXZpcnRpb19ncHVfY21kX3Jlc291cmNlX2NyZWF0ZV9i
bG9iKHZnZGV2LCBibywgJmJvLQ0KPiA+cGFyYW1zLA0KPiA+ICsJCQkJCQkJICAgIGVudHMsIG5l
bnRzKTsNCj4gPiArCQl9IGVsc2UgaWYgKGJvLT5wYXJhbXMudmlyZ2wpIHsNCj4gPiArCQkJdmly
dGlvX2dwdV9jbWRfcmVzb3VyY2VfY3JlYXRlXzNkKHZnZGV2LCBibywgJmJvLQ0KPiA+cGFyYW1z
LA0KPiA+ICsJCQkJCQkJICBOVUxMLCBOVUxMKTsNCj4gPiArDQo+ID4gKwkJCWlmIChiby0+YXR0
YWNoZWQpIHsNCj4gPiArCQkJCWJvLT5hdHRhY2hlZCA9IGZhbHNlOw0KPiA+ICsJCQkJdmlydGlv
X2dwdV9vYmplY3RfYXR0YWNoKHZnZGV2LCBibywgZW50cywNCj4gbmVudHMpOw0KPiA+ICsJCQl9
DQo+ID4gKwkJfSBlbHNlIHsNCj4gDQo+IE5vIG5lZWQgdG8gcmVzdG9yZSBibG9iIGFuZCAzZCBy
ZXNvdXJjZXMgdGhhdCB3ZSBkb24ndCBzdXBwb3J0IHJlc3RvcmUgb2YgYW5kDQo+IHRoYXQgd29u
J3QgYmUgaW4gdGhlIG9ial9yZXN0b3JlX2xpc3Qgc2luY2Ugb25seSBzaG1lbSBvYmpzIGFyZSBh
ZGRlZCB0byB0aGUNCj4gbGlzdC4NCj4NCiANCldlIGFyZSB2ZXJ5IGludGVyZXN0ZWQgaW4gcmVz
dG9yYXRpb24gb2YgYmxvYiBhcyB3ZWxsLiBJdCBpcyBhY3R1YWxseSB0aGUgcHJpbWFyeSB0eXBl
IG9mIHJlc291cmNlIHdlDQp3YW50IHRvIHJlY292ZXIgYmVjYXVzZSB0aG9zZSBhcmUgdXNlZCBh
cyBndWVzdCBmcmFtZSBidWZmZXIgd2UgcmVuZGVyIGluIFFFTVUuICBDYW4geW91IHRlbGwgbWUN
CndoeSBpdCBzaG91bGQgYmUgZXhjbHVkZWQ/IFdvdWxkIGl0IGJlIGJlY2F1c2Ugb2YgYW1iaWd1
aXR5IG9mIHRoZSBsb2NhdGlvbiBvZiBiYWNraW5nIHBhZ2VzIGZvciBpdA0KKGUuZy4gVlJBTSk/
DQoNCkFuZCAzRCBpcyBub3Qgb3VyIHByaW1hcnkgaW50ZXJlc3Qgc28gSSBkb24ndCBoYXZlIGFu
eSBpc3N1ZSBleGNsdWRpbmcgaXQgYnV0IGl0IHdvdWxkIGJlIGdyZWF0IGlmIHlvdSBjYW4NCmV4
cGxhaW4gdGhlIHJlYXNvbiBmb3IgaXQgYXMgd2VsbC4NCg0KVGhhbmtzIQ0KPiAtLQ0KPiBCZXN0
IHJlZ2FyZHMsDQo+IERtaXRyeQ0K
