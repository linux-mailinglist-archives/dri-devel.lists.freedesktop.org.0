Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9673C52761
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 14:24:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B20F10E738;
	Wed, 12 Nov 2025 13:24:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JgmYAocz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C4CC10E733;
 Wed, 12 Nov 2025 13:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762953856; x=1794489856;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=4VF0RAikKtzBj4kzvOaF+CqAFsE+aHoB8WKbIKI5/d8=;
 b=JgmYAoczcRUhkrGEOvvS5Kq8N2f3aSvlTvncyY5aXDGrVdIv9zy9giwu
 kgY7ImMgGHa7/s1GE77svueAp0BQZsYuEnMZYKUuBlYQ2uSwNFCYBAsGY
 WvKDrx6dPLhGQZv1GD5LHKbJKmC1FxNUdyrJpnpdgq3jsxL11VF/DuSXq
 6A+vHR3hFrqEfOPQpjiI15iVd7+/K6AnXwu2HW9Q7Erhvc7y3KOFtuFeC
 uk3puJ2x/0v1kfF7tsXKN9kHdktolio2PqFmVLOtiQPaK0MX+L7tzFRgg
 yTwSMerDfOnrSgolOXxEHdvT/YzNZfgAsG99AA8XYXoFMQ7MytJ0eOwM5 A==;
X-CSE-ConnectionGUID: 9oV8zI4fRKWPNXJLVuvEVw==
X-CSE-MsgGUID: 2GaWxX1sRUOztfsFVCVf0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="87656374"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="87656374"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:24:15 -0800
X-CSE-ConnectionGUID: BL5UTBhsTz6Dr+pb/V+l1A==
X-CSE-MsgGUID: B39SlW6zSJqSLXFNomnR1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="194199813"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:24:14 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:24:14 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 05:24:14 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.19) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:24:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gG79w+EXLj7V9tas4vNeikIZnRnjTiaotY33NzUP+QIC783iJ56iF6OB4M6+CeQ9kZNKbZ4shHSrFJnwQoHTnlMJ/vx3Ri/sho3QSb2JemrqK/uEQW8N8FNH554STiBrqKXYHh1IuCnsKcrb7bsax/omBeKKaUt/9CK0xbZbpFPAOYyrQgzT9RWHfBL15r6jHNzWND7CIh65/26sPQ/5ZZlhJbu1acVyHlXw8ADw3NlyLfwa1HJcpawi7gc+1l4DkckPNONwalBoAgaZ+rUggrrr/rU/vCo4dJ61G0bsezn0nf6GPIak3OdFtTt47XwUGtiXvbS5u0q0HxOzRWN2WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LINXM4QORRiAO83qn2eDYSR3pnrycacG+j22bdOytwU=;
 b=D7nCnHkI1+pZUQrMdUoVpmDjgGxkEjbZGDSVi36GgUUOXvhNYWwRozbNKGr3ZbWcEIyOuov0+LiYztftr2RPTpnGSC7GvD/sdYnySfpdR54me4wqruKdYY+oLyNguQ/4tIxTxe8pySvFrpUsLnusQ5vOWBNpaKkVxSy/GfaDLVdyd2CZU4lcBfIajTjhPVsHhvsak2TTfweLNLNV8vFavVIzZSq4rew9hUwlsXWTDtv+De0GOOAXugdEc2Tfb8ssPJ7BWpQZLEdSBrmIx9B4qrsNCqRH6QAVyuhGDRI7MdDk82Ib1/560oTFl4cPO275KgP+zWI9OiYflejPOEm+7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CY5PR11MB6534.namprd11.prod.outlook.com (2603:10b6:930:42::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.16; Wed, 12 Nov 2025 13:24:11 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 13:24:11 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 Matthew Brost <matthew.brost@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH 19/24] drm/xe/pf: Handle MMIO migration data as part of PF
 control
Date: Wed, 12 Nov 2025 14:22:15 +0100
Message-ID: <20251112132220.516975-20-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251112132220.516975-1-michal.winiarski@intel.com>
References: <20251112132220.516975-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0007.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::10) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CY5PR11MB6534:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c05667d-713c-4335-b692-08de21eec481
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M2pKSU9VUjZSaTVtV2FDb1dzNDlwdW5vZFJNNURmeDJYN3JaeGlLV1FNNGUr?=
 =?utf-8?B?R0E1MEFiY1lYelVDQUorZ3ZhaEllaGw3c01CbUY2enVodVJkZ3VJV0grRFZD?=
 =?utf-8?B?K2FJblphU0NpVGVpeEpRR0RibGYxWTlJSXpmTTErUEROMThOMmlRNXp0ajN5?=
 =?utf-8?B?TWVmRk1LQWV1ekNidzZSYWUxQkd2ekRhRFo3eVQyL04xaEJqOGd3YlJ0dGFx?=
 =?utf-8?B?YXNTb1JNUjVoQUo0WXRUNklTUkhhMmY1TS9zS0I0S0NxOStuemxCM3ZuZzhG?=
 =?utf-8?B?WTlUeXBzcCtDdXZGbThXdXYyNEc1bG1UZXd5UFBTWXo4cmRtY1ZDTmIxaDdh?=
 =?utf-8?B?alNxQitkQ042QXZjazM1N1VlY2RTWHRlL2t2a1MwWnVOajFnT2hML0hSUjAz?=
 =?utf-8?B?aFJXQ2h6V0ZaYTNqaWQwZEh4U3FGT2RZQy84WVNkdXVzdDIxd3Voc28rcXcw?=
 =?utf-8?B?UkR2cS9hMHpaT2lTSW04TGovRTM1MFRESzd2UHZrUVRCSWRmNFBYUG1MOFFF?=
 =?utf-8?B?V1NXRlBkUlB6MlBVanVvanc3ZUMrMHkxa0xSSmpuZXhyVk9INklIQmpUdHVq?=
 =?utf-8?B?UExzeVRZUzFtcXNsTU5KUVB4akZ3NXZ3RjdYMGJlWFgxNDVjTSt5c1FrbE16?=
 =?utf-8?B?dFlCdXkzZDFPN2wxVnN0Smg3R1lBWEV6Sm1pVUFJVFFpOHo4RGhEMVZDRGFr?=
 =?utf-8?B?b1pEV1kvVUswN0NJV29EbTZiUW56NzVXdUpEZmozcUluTFhHQXA1bW5QZnZt?=
 =?utf-8?B?T1dFMnlzeStRakZycGF0TFNlTFQwR3VtS1BhQ0MwZ0xFTUNVZS84bEhyK2h4?=
 =?utf-8?B?SllqdGFMR2NUTDdZWit6MmV2aVF0d1dndXNwOS9hMEdjU2dKQkpKQW1hKzVB?=
 =?utf-8?B?VU5qT09rYnZRVFNUYkZkUldrME8wUTlmZlRhRGt6M2lzbVpoNE5ORUp0L0s1?=
 =?utf-8?B?azZkbXNHc3dvcW1HdEtHYVFicUhsYytldnVabzBWZ2hTcXNUUDZ6YzB4VFlB?=
 =?utf-8?B?Umt3MEFEREN6TVh2NUsydjdub0FRZ29DdWxQL2IyK241VHdvQ05IQ2c3blEw?=
 =?utf-8?B?eVd4ZEZuNWtoQUtiaDBwOWN4RlBTUlloWGRTSnJvT1MwRDNLWlhIVEJZaXZJ?=
 =?utf-8?B?UythRVdkM2lIRlI5K05hQ2tMS24zTythWG1yZWszMWIyQTJUanJiR0lnc3JK?=
 =?utf-8?B?U3Y2SEt3SG5jaVBmQVpMcE9kUi9aWnp2c2gydjQxcFlXR3JVeVcrN2Nqbitn?=
 =?utf-8?B?cDhXN0lobVZjZTNvUFNBSHVKb01taHo2VFg2QWw2M1JHMDc3Unc1VGdlUm13?=
 =?utf-8?B?TTVjV1hlcXQ4N0htOGs1TWhHNGZ0bEtnejlVdG5STXdtWmt6aStnWFlhOHMr?=
 =?utf-8?B?YWdmUXltTkJQY1NwVk04aUFKbmpUS1JjQUU3QXpKWHB4czhaWXB1aXJNdmtQ?=
 =?utf-8?B?YmRBUzYvSHdCMnk0SDdHTU82cHQ0ZGpCN0NlQ2dHWHhENU9KbFAraS84c3lo?=
 =?utf-8?B?NHV0RVk4S01DVzJCQ0lLeis2ZHkrT0c3MnRmQU1wS2JwZzZocHNDQm1udDlo?=
 =?utf-8?B?S0xkUFYwN1BCQzNzUUFXc0JRd2JrSGJkZUE2a25oWXF0dFdpdW15Z3lmYmov?=
 =?utf-8?B?VTg5YzVOUkpieGRDeUplRHBzeWQ2eTAvVE5UWkNVM2c1VFdDalRxMmRqcU1F?=
 =?utf-8?B?K2IzVlhqUitBYkRNcHZodkY1QjJQZnhUeTBhN0kwazl6ZWxOWGxNRUYzbTds?=
 =?utf-8?B?MEhlYkJqYjhhT0hKdUpVdTl6VDhvaDZkT002Q3B4UzNwWENLazhsNlZuTlZN?=
 =?utf-8?B?YU1WYmVWcjFzT2JGQ2w0bWd5d2lHVjQraWpUWFpiM1dybHZmS1VTTXFGcUZH?=
 =?utf-8?B?dHhPbGVRUzFsNElXb3ZUS2VzZzJKSXY4SHhRUVFzV0FROWJvT0UrRUdTTFZl?=
 =?utf-8?Q?2STSiKuOstIq3ml27erjhD/G6JWa2n+h?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVR3RlZyL0RqSWlPUHg3MWpiNGZnQzFWMXpockhhV0YwMHpPb0hMUlYvQytK?=
 =?utf-8?B?R1dMeXhPYS9PWUtXeG5HNWNkYU5HUjd3SDN5OVRWY2ZHUitPdloraTJ5aFlE?=
 =?utf-8?B?TmJnWHducWdWSEN1RTc0MDJwc0VPdWVIajdnT0RyQ0R6WWxDaEhrdUtjbDd6?=
 =?utf-8?B?Q2hCQ2g1c0JzZkdPTmFRTVBGeVo3N3NtR1pVL0w3UlQxNGlzWERzMkdPYzF2?=
 =?utf-8?B?dGpNUUZiQ3VlQVB5dlAyT0wxSmNwZURaR2h5MzZYQ1A1b2llSzdYYU8yMFRG?=
 =?utf-8?B?bnZmMnpURnJBVDIwNDljdENkNU50d3ZtS0xkWm1tbXdmV2pUQnRIU29hd3Q1?=
 =?utf-8?B?Si9nY1ltUGk2TWd4d2JBbW9RNG4xYmZXNDlIN29vamY3SkVuWjQxYTJDQjNI?=
 =?utf-8?B?UnBNRkZyQmxpRmgzYUZrcDI2VXEwUndodmlEYXdnUTl4eGZzZ25NbUtvSU9D?=
 =?utf-8?B?d28zendQMnhLSTFFRVdSMWV4MXhUQkVEU1NJUDNJN1I4V004ZmxNSjJ6WUxB?=
 =?utf-8?B?NnEwZnFuUVU4Nm9Rdml3Q3FySjczcEZEbGJrZjBOK2ErMjNWSEhMNG5Ud0tB?=
 =?utf-8?B?WWRPSEdFMFgyY3g5MGlPZ2JyQUlwZFN2cElMTVh5eEc3RzJVcTNJNzJQRGRM?=
 =?utf-8?B?NWJ0eGlPa01iSlVaejNnSkIzYVE2VWtycGV3UCtzd2FmaDRDNSthaFhnN3BY?=
 =?utf-8?B?ZVFrMDh6blhGTkxFdTBmMkRpcGltQWxkSmQzVndDbE9KTXJjQnlFRGRwTTZN?=
 =?utf-8?B?WXpOR0hiZnlJNVNsYUxVYjFoUHQ5U3F3dGZvZG5TbmdOVk1UdFBWa1hGQ3Jn?=
 =?utf-8?B?OC94RUdKSjgzS2Z2T25WZEliSjB4RTFjVjc3dU5idTVMQ3d3aytHUG0yZU40?=
 =?utf-8?B?MW52U3NKRzdOUlVSWXQxSTJWK3JKTnI3azhYS1NYd1BBaThuQXljZGpYV3Bk?=
 =?utf-8?B?ZU04QjlYZHpYNUlmQVVOaFpPWlM4UGgvKzhYZzY4YmRWYmhjTmNOd1h4Y3Fn?=
 =?utf-8?B?MVdrU1BEcVFIRmNJelFUTEMrME5KWlhGVnVzbjV5VllXdHVVd1UwREFQRDZu?=
 =?utf-8?B?VForMndQNmFrbDV0MXRhZjAxcjdFSy9IWFBld3FKTXFFbGdvV1R4V3NtYkJM?=
 =?utf-8?B?VUcrbFMrTE9BbitHRFVKdDZuVnlPd3hURE9LMzhHVmYxNENzSVExN1lYVDJD?=
 =?utf-8?B?Q0toOUV1US9jcnp1akJHUm12ejdkL1Y2Ny84dnJEaW5sWEpRMVV2bTZGU1RF?=
 =?utf-8?B?bE9JYStjbDZsdUJZT0dBVEdmMUFub1RmbEhpUmVwV2xiWFludWFHK1Y2QTBW?=
 =?utf-8?B?U1prZHo1bjdEMnBXWDY3bmN3QlY0cmptSDFWNmFjd09QMkYybGlOcnQyTStI?=
 =?utf-8?B?SWtjWmtDK0x3RWVHdXFQVFFSYk92SDYwKy9UWUhUNVJvSW9qbDhQSFpSYWo5?=
 =?utf-8?B?QUNnUjVEYWoxS0ZRbmxNQU55VUJqZGxCUDgwaVFFaTg1TDQxNjhWTTVybmFm?=
 =?utf-8?B?WDVLSjducHJDV0pnMitMTWRGZStqd3lnYXVGQjZuSnRkc2E1MTZGc0xtenNY?=
 =?utf-8?B?K2I5RVExMkNSNzE0VzFKZDRDbERBeHBFR3dyRG9CZE5DMytrUHp4Q1NldjN1?=
 =?utf-8?B?WDRXTDVjbjVLUFZ6eHAxQWZDZHJyUWkwN3NKc2g3Sy8wUlFuc1pzRFI4Qmw3?=
 =?utf-8?B?bk4wRWJiWVFYT3h1Yi9zUzdlSks2NGkvSmpycUVvRGJyMVpRbFpQY2pTRTFC?=
 =?utf-8?B?cElURlh5SGM4d3lOb3o5eTJPUjdqYWJnLzUvTy96azFYbEVZZmlVelVlSlYx?=
 =?utf-8?B?dWxNVDlrOW5RZWRkdGM3NEFxNzVNeVNyQllYU21IcUl3Y291N0d4dlh1NUxo?=
 =?utf-8?B?RW1Zb2c2d2Rvc3JEaUtDaFpJWm0zZ2Rxb2xoQVFHVENpRitQanVFdysyUVhF?=
 =?utf-8?B?Y3hvMk9tUVNCVTdkd1AxY1p0MTN1Q2NMNG1Ka0dtVUVjUGpKRzFhS012Q3dF?=
 =?utf-8?B?VGdXdlNrdEtpQ1ZGSVBBUW5CLzhDRXk2WVpubGUvaUhOVTIwWCtyR1dmWWU5?=
 =?utf-8?B?dzVleDQ2UDZxdElXck40VXgvbWowWFk5U3V2dzFnY21tTWVWYlNJL2hxZG5W?=
 =?utf-8?B?N0JIY1JXQUdYQlBWRTU5NXhaS2svZktHVkhKeTNCVnpaTS9QTWUxb0ZFZnZi?=
 =?utf-8?B?U1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c05667d-713c-4335-b692-08de21eec481
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 13:24:11.7892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VYG4hGJSQtyf02N658/Xrtbb0QLCw8FC3I88DJa5TNjiRo3JjThw1lVgDuydy2r33gjUZvKsUAMyb4WLZwmxEo05YBrGbfZhX2ksNtoYMeA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6534
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

Implement the helpers and use them for save and restore of MMIO
migration data in stop_copy / resume device state.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |  15 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 157 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |   3 +
 3 files changed, 175 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index 16524bc18b1b2..25b77007767d5 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -880,6 +880,18 @@ static int pf_handle_vf_save_data(struct xe_gt *gt, unsigned int vfid)
 		return -EAGAIN;
 	}
 
+	if (xe_gt_sriov_pf_migration_save_data_pending(gt, vfid,
+						       XE_SRIOV_PACKET_TYPE_MMIO)) {
+		ret = xe_gt_sriov_pf_migration_mmio_save(gt, vfid);
+		if (ret)
+			return ret;
+
+		xe_gt_sriov_pf_migration_save_data_complete(gt, vfid,
+							    XE_SRIOV_PACKET_TYPE_MMIO);
+
+		return -EAGAIN;
+	}
+
 	return 0;
 }
 
@@ -1112,6 +1124,9 @@ static int pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid)
 	case XE_SRIOV_PACKET_TYPE_GGTT:
 		ret = xe_gt_sriov_pf_migration_ggtt_restore(gt, vfid, data);
 		break;
+	case XE_SRIOV_PACKET_TYPE_MMIO:
+		ret = xe_gt_sriov_pf_migration_mmio_restore(gt, vfid, data);
+		break;
 	case XE_SRIOV_PACKET_TYPE_GUC:
 		ret = xe_gt_sriov_pf_migration_guc_restore(gt, vfid, data);
 		break;
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index 9143ab328e5bb..f6edca9a0982a 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -5,10 +5,13 @@
 
 #include <drm/drm_managed.h>
 
+#include "regs/xe_guc_regs.h"
+
 #include "abi/guc_actions_sriov_abi.h"
 #include "xe_bo.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
+#include "xe_gt_sriov_pf.h"
 #include "xe_gt_sriov_pf_config.h"
 #include "xe_gt_sriov_pf_control.h"
 #include "xe_gt_sriov_pf_helpers.h"
@@ -16,6 +19,7 @@
 #include "xe_gt_sriov_printk.h"
 #include "xe_guc_buf.h"
 #include "xe_guc_ct.h"
+#include "xe_mmio.h"
 #include "xe_sriov.h"
 #include "xe_sriov_packet.h"
 #include "xe_sriov_packet_types.h"
@@ -358,6 +362,149 @@ int xe_gt_sriov_pf_migration_guc_restore(struct xe_gt *gt, unsigned int vfid,
 	return pf_restore_vf_guc_state(gt, vfid, data);
 }
 
+static ssize_t pf_migration_mmio_size(struct xe_gt *gt, unsigned int vfid)
+{
+	if (xe_gt_is_media_type(gt))
+		return MED_VF_SW_FLAG_COUNT * sizeof(u32);
+	else
+		return VF_SW_FLAG_COUNT * sizeof(u32);
+}
+
+static int pf_migration_mmio_save(struct xe_gt *gt, unsigned int vfid, void *buf, size_t size)
+{
+	struct xe_mmio mmio;
+	u32 *regs = buf;
+	int n;
+
+	if (size != pf_migration_mmio_size(gt, vfid))
+		return -EINVAL;
+
+	xe_mmio_init_vf_view(&mmio, &gt->mmio, vfid);
+
+	if (xe_gt_is_media_type(gt))
+		for (n = 0; n < MED_VF_SW_FLAG_COUNT; n++)
+			regs[n] = xe_mmio_read32(&gt->mmio, MED_VF_SW_FLAG(n));
+	else
+		for (n = 0; n < VF_SW_FLAG_COUNT; n++)
+			regs[n] = xe_mmio_read32(&gt->mmio, VF_SW_FLAG(n));
+
+	return 0;
+}
+
+static int pf_migration_mmio_restore(struct xe_gt *gt, unsigned int vfid,
+				     const void *buf, size_t size)
+{
+	const u32 *regs = buf;
+	struct xe_mmio mmio;
+	int n;
+
+	if (size != pf_migration_mmio_size(gt, vfid))
+		return -EINVAL;
+
+	xe_mmio_init_vf_view(&mmio, &gt->mmio, vfid);
+
+	if (xe_gt_is_media_type(gt))
+		for (n = 0; n < MED_VF_SW_FLAG_COUNT; n++)
+			xe_mmio_write32(&gt->mmio, MED_VF_SW_FLAG(n), regs[n]);
+	else
+		for (n = 0; n < VF_SW_FLAG_COUNT; n++)
+			xe_mmio_write32(&gt->mmio, VF_SW_FLAG(n), regs[n]);
+
+	return 0;
+}
+
+static int pf_save_vf_mmio_mig_data(struct xe_gt *gt, unsigned int vfid)
+{
+	struct xe_sriov_packet *data;
+	size_t size;
+	int ret;
+
+	size = pf_migration_mmio_size(gt, vfid);
+	xe_gt_assert(gt, size);
+
+	data = xe_sriov_packet_alloc(gt_to_xe(gt));
+	if (!data)
+		return -ENOMEM;
+
+	ret = xe_sriov_packet_init(data, gt->tile->id, gt->info.id,
+				   XE_SRIOV_PACKET_TYPE_MMIO, 0, size);
+	if (ret)
+		goto fail;
+
+	ret = pf_migration_mmio_save(gt, vfid, data->vaddr, size);
+	if (ret)
+		goto fail;
+
+	pf_dump_mig_data(gt, vfid, data, "MMIO data save");
+
+	ret = xe_gt_sriov_pf_migration_save_produce(gt, vfid, data);
+	if (ret)
+		goto fail;
+
+	return 0;
+
+fail:
+	xe_sriov_packet_free(data);
+	xe_gt_sriov_err(gt, "Failed to save VF%u MMIO data (%pe)\n", vfid, ERR_PTR(ret));
+	return ret;
+}
+
+static int pf_restore_vf_mmio_mig_data(struct xe_gt *gt, unsigned int vfid,
+				       struct xe_sriov_packet *data)
+{
+	int ret;
+
+	pf_dump_mig_data(gt, vfid, data, "MMIO data restore");
+
+	ret = pf_migration_mmio_restore(gt, vfid, data->vaddr, data->hdr.size);
+	if (ret) {
+		xe_gt_sriov_err(gt, "Failed to restore VF%u MMIO data (%pe)\n",
+				vfid, ERR_PTR(ret));
+
+		return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * xe_gt_sriov_pf_migration_mmio_save() - Save VF MMIO migration data.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier (can't be 0)
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_migration_mmio_save(struct xe_gt *gt, unsigned int vfid)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid != PFID);
+	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+
+	return pf_save_vf_mmio_mig_data(gt, vfid);
+}
+
+/**
+ * xe_gt_sriov_pf_migration_mmio_restore() - Restore VF MMIO migration data.
+ * @gt: the &xe_gt
+ * @vfid: the VF identifier (can't be 0)
+ * @data: the &xe_sriov_packet containing migration data
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_migration_mmio_restore(struct xe_gt *gt, unsigned int vfid,
+					  struct xe_sriov_packet *data)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid != PFID);
+	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
+
+	return pf_restore_vf_mmio_mig_data(gt, vfid, data);
+}
+
 /**
  * xe_gt_sriov_pf_migration_size() - Total size of migration data from all components within a GT.
  * @gt: the &xe_gt
@@ -390,6 +537,13 @@ ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid)
 		size += sizeof(struct xe_sriov_packet_hdr);
 	total += size;
 
+	size = pf_migration_mmio_size(gt, vfid);
+	if (size < 0)
+		return size;
+	if (size > 0)
+		size += sizeof(struct xe_sriov_packet_hdr);
+	total += size;
+
 	return total;
 }
 
@@ -458,6 +612,9 @@ void xe_gt_sriov_pf_migration_save_init(struct xe_gt *gt, unsigned int vfid)
 
 	if (pf_migration_ggtt_size(gt, vfid) > 0)
 		pf_migration_save_data_todo(gt, vfid, XE_SRIOV_PACKET_TYPE_GGTT);
+
+	xe_gt_assert(gt, pf_migration_mmio_size(gt, vfid) > 0);
+	pf_migration_save_data_todo(gt, vfid, XE_SRIOV_PACKET_TYPE_MMIO);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
index 2d221b6409b33..04b3ed0d2aa23 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
@@ -22,6 +22,9 @@ int xe_gt_sriov_pf_migration_guc_restore(struct xe_gt *gt, unsigned int vfid,
 int xe_gt_sriov_pf_migration_ggtt_save(struct xe_gt *gt, unsigned int vfid);
 int xe_gt_sriov_pf_migration_ggtt_restore(struct xe_gt *gt, unsigned int vfid,
 					  struct xe_sriov_packet *data);
+int xe_gt_sriov_pf_migration_mmio_save(struct xe_gt *gt, unsigned int vfid);
+int xe_gt_sriov_pf_migration_mmio_restore(struct xe_gt *gt, unsigned int vfid,
+					  struct xe_sriov_packet *data);
 
 ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid);
 
-- 
2.51.2

