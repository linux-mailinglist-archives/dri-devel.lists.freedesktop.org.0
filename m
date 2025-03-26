Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1B8A7100D
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 06:14:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8150E10E0DF;
	Wed, 26 Mar 2025 05:14:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I3HKquVo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A02F10E0DF
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 05:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742966053; x=1774502053;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=O5AM5PPuRmoA/5X6Ct9OOJTxSxaEG5DUTK/hnyvUvGQ=;
 b=I3HKquVoZRtqjhAv7Ka4AbdAF54Sb2RggUbtKrbRhBi+/mQLJz40qZQ2
 lh1jURvyXjZRbYt7FqmVY+D00UClA8fFjt16mz45vn/CcnvW88undevaQ
 Q29PaUgCVOIXBKRQLD6pzf0hLDX081qgHp/ugcJiWgeCpGxnrxNt0jpWP
 ReIY5kUX7k08GmUfEF7UAuqeiJLz44H5aQrmRKzsVjxw6PSWkNOGLqVq1
 zLe9xlDz1jW+wycgKOcPH1W9h4CRN52gqKGkdx/Cr0GBL+Iy1pKyt8TSt
 /PmkCMSTLpziEAo51wjlzLdpBG1/I58JppYNOkUqnQJOsZiRBVQevhVnz Q==;
X-CSE-ConnectionGUID: sPbJOQUEQeOZvuzQsLSHpw==
X-CSE-MsgGUID: sJnzRjQcSfqBoPotvQdsSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="44399312"
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; d="scan'208";a="44399312"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 22:14:12 -0700
X-CSE-ConnectionGUID: 2OE39lV1RPGkdgR3xYED2A==
X-CSE-MsgGUID: /ec2Q210SzGydF4Qvm/baA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; d="scan'208";a="124576981"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2025 22:14:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 25 Mar 2025 22:14:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Mar 2025 22:14:11 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 22:14:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tu8jjTDGJyA2pk/nzPWRQmEWD04VqNQx8f4MYE9CpyvzqwbaNqWj5ag8MEs2h/+UbUoAhtdaMj09Yi8xh9N6EMUy/ongjXyvWmjYyEBauZUo098eKO+HQq6rii1DLvNkgu3x7Vt2YYi/7FZfQv6eMe9pwxBnGko5IjlAjJqFtQSqI5EQRIF8RrAL/L6nEWeogKQ9biONCwDSn47pTo+BPEesjgVmMkLpSaTy42FyHPyBrLKkOmaxAzhjjpnoQb+MPoqo3K2Z2JHF62DT18kh2dT8QJHpOP7CYR9ySy1Fn3/18TTUMIcQ7IpUI2+jPtYXxX1IaoH96rdUG0EE4CN/Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O5AM5PPuRmoA/5X6Ct9OOJTxSxaEG5DUTK/hnyvUvGQ=;
 b=mi8Aa6LZBpaLHj1Se7i3Xs4MZmdkKk20JvLaCQmCU3lIwcRbAhKrrzQTTi99EhSjODTCLbfB251dciO8tm+p/xYxVyIG1dbYdu/v/FDkBvkLpghccstX0mmdQ7eOGfX/UTFtdsyvl5Bb/QJKnkiAXQFZuZizDe85dElZG+WY6R/0DQO2malmIslbvFHp+tIrYaFTwAmlmPG3/slxe3cfg6mnu4dXUViZZSJYf4iFvzUsyiKwAN3ikozl5g7EMfNHw6BOssIaERDakXuYn25cAMdmHpK465bb8saFBtAHw744f/Q/zDG4spCuz33IXiAbxiG7xrtHi3CMEXZ/153Pyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by MW4PR11MB6787.namprd11.prod.outlook.com (2603:10b6:303:209::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 05:13:23 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%3]) with mapi id 15.20.8534.040; Wed, 26 Mar 2025
 05:13:23 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: Gerd Hoffmann <kraxel@redhat.com>, Gurchetan Singh
 <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>
Subject: RE: [PATCH] drm/virtio: Fix flickering issue seen with imported
 dmabufs
Thread-Topic: [PATCH] drm/virtio: Fix flickering issue seen with imported
 dmabufs
Thread-Index: AQHbncIWrnL4C+g7REiZEUtQFJbl3LOEn7oAgAAevYA=
Date: Wed, 26 Mar 2025 05:13:22 +0000
Message-ID: <IA0PR11MB7185CD8F060130F041A5A209F8A62@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20250325201021.1315080-1-vivek.kasireddy@intel.com>
 <314238f1-9c89-4dab-a338-a40765076fd9@collabora.com>
In-Reply-To: <314238f1-9c89-4dab-a338-a40765076fd9@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|MW4PR11MB6787:EE_
x-ms-office365-filtering-correlation-id: b66aefb3-ba3c-44d2-2d34-08dd6c24ee58
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dGoxb3kxN3lpNURUQ2I5VHczNW85ZEVLd2dwU2Ewb1NzT1Qvbmxsc0JNMTRo?=
 =?utf-8?B?UUY3RkFKT1BkTzNYQStoVHQ4dXFsUmRkN0xJeGJ6am5qME0wajVOV1NKMzR5?=
 =?utf-8?B?UDBYUWxZSFd0UDEzWXdhcEttRlVRcm9adGpKMDlja2IvZTdlRGFkRDNkNnBn?=
 =?utf-8?B?WVRqZTZ2NWRKZ2MwVm9nZmxvVlY0TW0xQytoUDN3V2p4ODFKOG54Uy9yaVNQ?=
 =?utf-8?B?TGJPYTR6Q0JDYkFVTi9hSHloUjk3dHRaTE16WGRLVHNyajZyWncyelJIWVRN?=
 =?utf-8?B?WWhBazRycG5CQVB3RXplUmJ1U1lrL2JITi9SUUVvdGZYRGJiTHhEekxXRW0w?=
 =?utf-8?B?Z0s2MVBkQUxuMWR0T3lEWUE1dlcrR0oyUHBkbW03eXlYNkE2M0RCd1hVRk16?=
 =?utf-8?B?bDlsdVA4bHRneDRWQ0RFWm5xZUJ2VGx3QTJKLzZRQjV4WmtySzJkWkZXV1FM?=
 =?utf-8?B?WEhIcFlwWENXZ2xXOXFTU3U3Y2xzQzJoN1l0cmhRYnd1bVJzZDk2cDdHTEl0?=
 =?utf-8?B?Wi9sVE9tRnlNOGtYOHZOaU0wV0orVXdJWW5VSllsUjIzSXVwazJMYjJhT0FE?=
 =?utf-8?B?WGRub0dSeHNSQnE1Vmp4bE1TelozNG9QVStONU9uMm95QWJUSjlmbENScGdv?=
 =?utf-8?B?RFBac2JiaTE4NE1lU3FGays0Smc1WWlDM0dYT1d2clllUldtWjhKaExaRHJ1?=
 =?utf-8?B?c3FNMjNRUDFlTXU5UUdjZ2I0UHpsZElJb2gyOThZUVRTYXcydmpsMDhIcnNL?=
 =?utf-8?B?b1I3a1NmK2hLUzBNc083Umc0VXE2ZmpoWllLdzlZbVZHSkFXemVoVXRsNGkr?=
 =?utf-8?B?dFdpOFZidnZ3anlmRytvUTZZKzVYZDdHbWZHQ1ZWTmpnTnoyWlhLTnRNOFpk?=
 =?utf-8?B?WTFLRURvZU84aWNONWp1VmlWcDhUbkVwb1Bnb0xuODZEZ1FyVlBXa2pMOTBH?=
 =?utf-8?B?czFacE1oZlEwb3JKMk1sWU1VMCtGWTBBMDBZNEI0OGZCT2daYlRVNXdqRVpq?=
 =?utf-8?B?b2FWeGR4M01tbG55YzdBcW5CT3FQYitHMjl6SEFhLzF1VFU1UXArZGsvMlRt?=
 =?utf-8?B?SFpOUkQzQlFtR1NjZG1SWU12dHlHWWRnVUNmbDNyazhsOFE5b01hR0p3WTFG?=
 =?utf-8?B?eUc3bkRMQTNrTlRzT3p6QzRnRFcwc01jYVJtcWVZbzVFWjVEM2dIMXordWJo?=
 =?utf-8?B?Z21BWFdTeSs2bW9Td2NoZm1rVXVlRUNNUGRCdGpTY0dsbFRwT01HeC9Wd3VZ?=
 =?utf-8?B?QXpPTFN4alp6QTNOWk1DaldsMVVEUkcyWWtSY1FZbHo0NHV4a0FJeHovY05D?=
 =?utf-8?B?ZmZwNHNLWVRYaUZEQStOK1BhdjVxOEdtaVhYRFZGUkxKNnBtVEkzaFV3cnlD?=
 =?utf-8?B?ZlIyK0xFR3VNb1hJcWtnajg5UWNGcUJ3RWZPdW82L3BZOVhQRkFzL3BNRDZQ?=
 =?utf-8?B?endxa1VsTVV1MHcxcXdiN0pLUjRZN0IwaXNBakd3U0lYVjJlK2ovUHVXWU50?=
 =?utf-8?B?eXNhRC9GUVdpYWs2ZzRFZDJ4VFlPeHIrN0thMGIzeDVvZ1VsQmtjbngyNVhq?=
 =?utf-8?B?RmdYNUFyRFNMZnhsZTlyaUdWU3Y2bFhZUTdTK3Qrd1JSeExSbVdWTmE2cWJw?=
 =?utf-8?B?V0N3YzdwNFA1ZWdZOENlSFNVZUhaem1xOHNMQ2hXTUJHc0J3OG5vNkRsaGhi?=
 =?utf-8?B?NENmc3czN05remVRc3FIWjRpYm85cjhnckJjcTdyUHFlVVc0SGowRjFDUllM?=
 =?utf-8?B?SVAzQk9XQjA1V3BMRE9DemdRYmxiTGl3a2w0R0FSZlY0V2Jxb0M5QjdabXho?=
 =?utf-8?B?VmRpdEQrOWNkTUlWVGF5R0R6MkdaWURoL2hkaUZvSVpveGg2VGR2azVvcG9x?=
 =?utf-8?B?N2tpbHQyd0FPVm0zK04vNUhPd2Nvcm1WUFNsZ1lNZUlPZ1pLYWJqRSt4QUQr?=
 =?utf-8?Q?MYozF14DFt2sGmzbdEC+AC2Z0G+DL+pY?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aklwby9KQk1GNGNteEJLeHNmSjUreDQrRHQyaFZJcURjY2lnOUZkUmVyY3Nk?=
 =?utf-8?B?dEJlcjJWRG43MjVXVGFINExwTXhPLytVN3QrMGpTeWw2V1IwN1RjSmI4cjNR?=
 =?utf-8?B?QTVYWlh0dTF6dWtySUQvdi9PQWgzQ1NwNVlqR3o1dkJ1SGFZTHVuNWlzM0lt?=
 =?utf-8?B?RHN3NEFibGNJcjBGTERzZ05EMk1mV1pKZlZBRVFTSVFxRE10ODdCdEJRVUVC?=
 =?utf-8?B?Umt4VmJoQ1NPd01GUk9INWRSc1djUTM2U1F4TCtPa25EcisrU0RhamsxbUM1?=
 =?utf-8?B?dElMbndnKzg3c1BFOW1laSs3WVlvSWFQQjFJMHlGRjZmTEh6WUhCdnVnR0pP?=
 =?utf-8?B?UUl0V2VFMEVLa3lDK3hGTnFMSFYvQ0xDTnRwSmkveWRGTE9YM0dtSm50Smhz?=
 =?utf-8?B?MGNURUFMTGxBdVA1UzVqdzM0RHRsMmpHemdXN0dKU0JNNmw2Z1pHU29YRnZ5?=
 =?utf-8?B?Qnk0YUdXR05nYkRRSXpiN0llcWhxTG9NRXEyYzIwOXU4bWVLMEVoNzlNQThI?=
 =?utf-8?B?cVlwT3RHQnVDQ1dxTitMcTdpc2w2Zk03YkJFaGVQU0FwOCs4S3FYRGYrUkwr?=
 =?utf-8?B?NXY3YThXVGhIWDhVM0ZtYUJHV1NveDNKcHJWMFVjVXBmMnJqSTArbTN0TnJ1?=
 =?utf-8?B?T3plQnloRVFMdzlRbG9uQjhjTnZYTGlaQ1Z6NG1tVk5YYWptNjhKUVBvMXha?=
 =?utf-8?B?WjRBQmdPVGErZThqNGdJK3RhNGJIKytjMEJ2M3J0QVlNQjcrUEdHMmUzMG15?=
 =?utf-8?B?OGVXMTRUdmhUVFZCSFdNckRWVW9wTit0eHhGMGR2M3RhNFQwUEFDbFRISTFI?=
 =?utf-8?B?a0JJZnJ3UXVkc1llK2pzNythODYxQkFvZlQ3aWU4R1kvZVBabnZRQk52UUx6?=
 =?utf-8?B?VU8zNzBXUHFiQUFWWnJia2JmNE1uNHBlVVF2L2Z5dmczUXBkT0J3ekxoaGMw?=
 =?utf-8?B?eFR4TlViVk9uUElEY3ZPSjlqMDJDZVR3cnYvaXJ6a21RQlVKZkZvWWY1dC9U?=
 =?utf-8?B?aUczbXdNaUt5QVNDa0pZN1BXWFpaek84bG9waHZ4azNYN0RhTG5uSVV3UGhj?=
 =?utf-8?B?SWV6YmYwVW5UQXcyQUhKR0huUEU5dHFyNVlpdTR2eFJqYkdXRjliSVNmV2gw?=
 =?utf-8?B?eWp6eVpVMXgwSkpkbGZCdURQYnhKckRyRDRSN3hUQ0NsZzNKN25NRGFGeWwx?=
 =?utf-8?B?bUcyNE1YT2UvWk5QdHBOL2VhRUMwMW53VkJWWTRleUI1djA1SW93enVZL1RS?=
 =?utf-8?B?Rm15Z1BtazZYRlI4N2RRUHp5NFY5RVhjR2FGUitpY3ZBWHJEZmJKWDd5citU?=
 =?utf-8?B?RGVYK0dXeWdzb29OMGhMbmRTa2lXVVRhUzdsb1h0UFdtdlFSQlYrZXl2aTJx?=
 =?utf-8?B?ZWNjTUNFamc0WVFzME5PaDNEd1FqS3hJVXBSdjRTN0EzUXpLUmxTVXBvN0Zw?=
 =?utf-8?B?bWlyTnF4Q3lTT2pOVkRLSVZBc0UxMjYzMlUwc3ZOb3VPenpVMUg2dVk0dDlH?=
 =?utf-8?B?OWdBQ1A3ZUZ0UmFxQkRaL3h4V3Q2MzVDanc2TzJyWTR1TjFnMHhQSDNVUmtw?=
 =?utf-8?B?ZFpCV2RLMDRsUXBFOGU2d05FQU1neUdYdk44RmFUMW1rRDZiQjhkbzhSM3Qv?=
 =?utf-8?B?dzg5aGJISFFiL1g0Umw4MVJtdllJUjVYTXBYNzE5aWdpUUV5elRuOHRjRkYw?=
 =?utf-8?B?SzhaeUNnSkRGem9KYUxURThBdmlSMEh5NnNXcXNmaFlLNENXMjVZbWN6ZVJY?=
 =?utf-8?B?MW9EU1RENzRkbnVmclB5NkJQbUFpOXp0U2FOSXBqWUI3YUpDNFJVTUI3UUhO?=
 =?utf-8?B?Q3lOTHZSeElVKytVQ2RZS1Y0UDYxTlBUQ2QrYXFWT0t1R1l6Sk8wUHpoUWJ0?=
 =?utf-8?B?NDM1bU9sRm9qaHloU0JqRlRnMm1saWwrd1ZPUUtIVXNKUlpyZHNqRFhrTWNW?=
 =?utf-8?B?Z3RGemQ3V3RyWTRnb2hEcVBuQmhJbnZXdVNPUU93RjEyL2RMUmUySE05cCta?=
 =?utf-8?B?MG5IVHREeFVBTW1kbFJOQlFqalZtUzNGRGVqVjRrY0U0RDJVLzQxVWRUWUJ1?=
 =?utf-8?B?M0hXVElHWHkxa2RrQTVWNEtEd2RsdzBjeFEzaDcyc1U5M2loM1FxaENJZWM5?=
 =?utf-8?Q?0nsX/sXswSAAYi6VPHpzc8ETU?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b66aefb3-ba3c-44d2-2d34-08dd6c24ee58
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2025 05:13:22.9455 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VHdtxfbldryWMaFJ3AGsBKNRAkdtw9Vt4jAzw/V//5kxdFLuQMsgR30XiCOjCqTHRD7YJU4glo3+RJ483nkIsjXp6Wb70NPBMyXIIcEWgmU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6787
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

PiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0vdmlydGlvOiBGaXggZmxpY2tlcmluZyBpc3N1ZSBz
ZWVuIHdpdGggaW1wb3J0ZWQNCj4gZG1hYnVmcw0KPiANCj4gT24gMy8yNS8yNSAyMzoxMCwgVml2
ZWsgS2FzaXJlZGR5IHdyb3RlOg0KPiA+IFdlIG5lZWQgdG8gc2F2ZSB0aGUgcmVzZXJ2YXRpb24g
b2JqZWN0IHBvaW50ZXIgYXNzb2NpYXRlZCB3aXRoIHRoZQ0KPiA+IGltcG9ydGVkIGRtYWJ1ZiBp
biB0aGUgbmV3bHkgY3JlYXRlZCBHRU0gb2JqZWN0IHRvIGFsbG93DQo+ID4gZHJtX2dlbV9wbGFu
ZV9oZWxwZXJfcHJlcGFyZV9mYigpIHRvIGV4dHJhY3QgdGhlIGV4Y2x1c2l2ZSBmZW5jZQ0KPiA+
IGZyb20gaXQgYW5kIGF0dGFjaCBpdCB0byB0aGUgcGxhbmUgc3RhdGUgZHVyaW5nIHByZXBhcmUg
cGhhc2UuDQo+ID4gVGhpcyBpcyBuZWVkZWQgdG8gZW5zdXJlIHRoYXQgZHJtX2F0b21pY19oZWxw
ZXJfd2FpdF9mb3JfZmVuY2VzKCkNCj4gPiBjb3JyZWN0bHkgd2FpdHMgZm9yIHRoZSByZWxldmFu
dCBmZW5jZXMgKG1vdmUsIGV0YykgYXNzb2NpYXRlZCB3aXRoDQo+ID4gdGhlIHJlc2VydmF0aW9u
IG9iamVjdCwgdGhlcmVieSBpbXBsZW1lbnRpbmcgcHJvcGVyIHN5bmNocm9uaXphdGlvbi4NCj4g
Pg0KPiA+IE90aGVyd2lzZSwgYXJ0aWZhY3RzIG9yIHNsaWdodCBmbGlja2VyaW5nIGNhbiBiZSBz
ZWVuIHdoZW4gYXBwcw0KPiA+IGFyZSBkcmFnZ2VkIGFjcm9zcyB0aGUgc2NyZWVuIHdoZW4gcnVu
bmluZyBHbm9tZSAoV2F5bGFuZCkuIFRoaXMNCj4gPiBwcm9ibGVtIGlzIG1vc3RseSBzZWVuIHdp
dGggZEdQVXMgaW4gdGhlIGNhc2Ugd2hlcmUgdGhlIEZCcyBhcmUNCj4gPiBhbGxvY2F0ZWQgaW4g
VlJBTSBidXQgbmVlZCB0byBiZSBtaWdyYXRlZCB0byBTeXN0ZW0gUkFNIGFzIHRoZXkNCj4gPiBh
cmUgc2hhcmVkIHdpdGggdmlydGlvLWdwdS4NCj4gPg0KPiA+IEZpeGVzOiBjYTc3ZjI3YTI2NjUg
KCJkcm0vdmlydGlvOiBJbXBvcnQgcHJpbWUgYnVmZmVycyBmcm9tIG90aGVyIGRldmljZXMgYXMN
Cj4gZ3Vlc3QgYmxvYnMiKQ0KPiA+IENjOiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNv
bT4NCj4gPiBDYzogRG1pdHJ5IE9zaXBlbmtvIDxkbWl0cnkub3NpcGVua29AY29sbGFib3JhLmNv
bT4NCj4gPiBDYzogR3VyY2hldGFuIFNpbmdoIDxndXJjaGV0YW5zaW5naEBjaHJvbWl1bS5vcmc+
DQo+ID4gQ2M6IENoaWEtSSBXdSA8b2x2YWZmZUBnbWFpbC5jb20+DQo+ID4gU2lnbmVkLW9mZi1i
eTogVml2ZWsgS2FzaXJlZGR5IDx2aXZlay5rYXNpcmVkZHlAaW50ZWwuY29tPg0KPiA+IC0tLQ0K
PiA+ICBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfcHJpbWUuYyB8IDEgKw0KPiA+ICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfcHJpbWUuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS92
aXJ0aW8vdmlydGdwdV9wcmltZS5jDQo+ID4gaW5kZXggZmU2YTBiMDE4NTcxLi5jZWIwNDAxYTAw
MGIgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3ByaW1l
LmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfcHJpbWUuYw0KPiA+
IEBAIC0zMzIsNiArMzMyLDcgQEAgc3RydWN0IGRybV9nZW1fb2JqZWN0DQo+ICp2aXJ0Z3B1X2dl
bV9wcmltZV9pbXBvcnQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4gPiAgCX0NCj4gPg0KPiA+
ICAJb2JqLT5pbXBvcnRfYXR0YWNoID0gYXR0YWNoOw0KPiA+ICsJb2JqLT5yZXN2ID0gYnVmLT5y
ZXN2Ow0KPiA+ICAJZ2V0X2RtYV9idWYoYnVmKTsNCj4gPg0KPiA+ICAJcmV0ID0gdmlydGdwdV9k
bWFfYnVmX2luaXRfb2JqKGRldiwgYm8sIGF0dGFjaCk7DQo+IA0KPiBXaWxsIGJlIGJldHRlciB0
byBzZXQgb2JqLT5yZXN2IGJlZm9yZSBkcm1fZ2VtX3ByaXZhdGVfb2JqZWN0X2luaXQoKQ0KPiBz
aW5jZSBpdCBjaGVja3Mgd2hldGhlciBvYmotPnJlc3Ygd2FzIHByZS1pbml0ZWQuIEknbGwgY2hh
bmdlIGl0IHdoaWxlDQo+IGFwcGx5aW5nLCB0aGFua3MuDQpTb3VuZHMgZ29vZC4gVGhhbmsgeW91
IERtaXRyeSENCg0KVGhhbmtzLA0KVml2ZWsNCj4gDQo+IFJldmlld2VkLWJ5OiBEbWl0cnkgT3Np
cGVua28gPGRtaXRyeS5vc2lwZW5rb0Bjb2xsYWJvcmEuY29tPg0KPiANCj4gLS0NCj4gQmVzdCBy
ZWdhcmRzLA0KPiBEbWl0cnkNCg==
