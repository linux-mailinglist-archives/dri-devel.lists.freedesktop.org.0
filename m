Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4755A6A473
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 12:09:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A73F10E5E1;
	Thu, 20 Mar 2025 11:09:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BvTWe9WO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 977F110E5E3;
 Thu, 20 Mar 2025 11:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742468978; x=1774004978;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=pGenS0jdjCavANN8tu7obTgo/3vZCXrShtkNWm4yQxU=;
 b=BvTWe9WO8eaAo+UYKKYtspeelGVcyQsl1hDJOaMtzqDw1oxVB+LBx06C
 B7RtkOqhY+k+W3cR4lxdxGFOpnvmcOrhMyeFQzpOiJFG02D01HoasdNbN
 CI6uJ4hLO7hM3dB41SbFczpFpR6g1eMDpS3Lxxl+TVNzRRMR2A0BskPki
 VVnkrgfOmbeN7yb2kwNIIY6ljCEZddqQXWPmxp7WdI3Tbd1Q31MFrELwq
 kfRXK8mYSLsLhxLGUW9+G8psysK0NrGfNzybjeGs3wDC23Vtbg6j8RpNs
 JwuIh4KRzS1X0Z7LpuuSelx9RiDSNMDJysDpx3hvIw8Igg45HuocbV1X7 w==;
X-CSE-ConnectionGUID: 9x4UOqcTSpyGBEAkESl3aA==
X-CSE-MsgGUID: 4R8uShHoRJK7+JNq72T3OQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="43862541"
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="43862541"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 04:09:37 -0700
X-CSE-ConnectionGUID: 1Sdl8fUzRE+m1+3gdMC+0Q==
X-CSE-MsgGUID: I+ILEw+7Sr2iGTkbabCe1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="123073990"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 04:09:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 20 Mar 2025 04:09:36 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Mar 2025 04:09:36 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Mar 2025 04:09:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bnwhm2Txi8I9XAH92cigpKrbvtnGN5Cv2DF1F1TMwoena+dvZUSEJNc/jpanWvpOqxpdipCzgwauO7FFa9npXHifc018BhjRUxYO/NFt/GRL7pPxbsxdICO/0IzKqQgALDa7LqT2WcbLu86XaQdxzc5rD4FKYgYMWQS/3pn6Puw+7fcnR24gnP/lzIg/Pduc9AT6Yvc8T9QM6YxyyfiPkKrOSocgzXadshG3f6vfXqULZJS2vvuwe2eH5rvcXLo135/H388tiWbke7T8tjl022LCwO1QVfwrn31lWbY1lF5HzqeHB9hzN5mXgHZVIrw+zS4Hh8UWZvXhwDDg4WGvlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YbJ8xxrQh44IfpvjHkN8qitPtzYJ0kzF1g8+h93xxbk=;
 b=MWaCzN1jBwMTVFI+fh/OBrh9e6q/Ut9jBIL/2J+OwjBzSDRAAhMgBRGz9LPyvHHo9Yf2RWOJHxzR/ZilfhzQLFaQ1VrVoeD565aLsxAUsEjbEv7qrNumoAeXGzKHW99NYaFAENvsLWETYBEG+Zn87SwCdJ9rl5Ki5zesCMuXfb6pbGHAjwih+zC448J1iNFlhmx8RnwqVki3+iBARYMa4HfXU7v7GUMaboyOR3Dixbgzv1v6Sa0tSt7w1ivZ48zq1apH8UaYQrAsprtqysqyzQxGnLXdAupYgDqExkUW50RET6CLV9859L49iDKnSypgYpqlGgeXeUVBr1Q6DunQew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SN7PR11MB6875.namprd11.prod.outlook.com (2603:10b6:806:2a6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 11:09:34 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%7]) with mapi id 15.20.8534.036; Thu, 20 Mar 2025
 11:09:33 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <linux-pci@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?=
 <kw@linux.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matt Roper
 <matthew.d.roper@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v6 0/6] PCI: VF resizable BAR
Date: Thu, 20 Mar 2025 12:08:48 +0100
Message-ID: <20250320110854.3866284-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P190CA0039.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::20) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SN7PR11MB6875:EE_
X-MS-Office365-Filtering-Correlation-Id: b6d7135f-4698-4753-c433-08dd679fb1bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eDRiSUo3QlZuUFdQUHJVK3gwdUJHSkVqR2cwYlJjcVpzd1VsVHFnWUxYaHFO?=
 =?utf-8?B?L2xRMzR3N1c4WVZzSEJXWS9CWURjamMvR3lJVTRCNzJJMGRtbnIyZmZlWE15?=
 =?utf-8?B?UllLWnZGeFJqdWwrdjNZWHFRalJoVHFobjBIdlJKdEhqb1pwOERVOFdWZlB0?=
 =?utf-8?B?WXhJd0ZMSU91UkpmdTJPemU1eTZFSHNnWHJiSW1RQ1ljM0ozQU54dmcwRFZN?=
 =?utf-8?B?ZHdpd3VHMW9jN2QzVlZWM2dNOXBhQWhRRjI2NEk1V1RqaHp5REdZR2xrWXhR?=
 =?utf-8?B?aFhTOFVMeDZVRWxrcWx0YmpraXl4QXRudXRZTVFlLytPbmJEVVVPZzVqbk1V?=
 =?utf-8?B?OHFON0pUNFRPSGtGRHVVbVVPQ3JpemJRVk9yMHpjK1NlbnBpNVNUNjk2SVQ5?=
 =?utf-8?B?V0NMazdFZWZDNXJnNjU5VWVJSThPMGtsODFsejR6b1FGQWRzNmI0VjRaR0l0?=
 =?utf-8?B?amNyRzluTDkrQkt4Q1VJQ1A1ZnpLbkxOZHJJazBYSWxHUHhqT2FGeDZvWUJy?=
 =?utf-8?B?VHFyYU44MVpjbFkvZ3RkVGZHdW42TGxqaldKcFBNbGhoSkJlMU4xYmprRHVW?=
 =?utf-8?B?bWFuekprakdiSXNHdERmYWFrVit5UUxVdnVnbHEraS9ZLzB3Umt4UmhRWis0?=
 =?utf-8?B?NDNGdmVXdGlvak9rMDBQcXY2SG0wajREdXBjM2dyVERod2hjZzJyT2pGTlRR?=
 =?utf-8?B?bjR4d3ZteHNYZm9BV01kWGhvMTBRZm01RVA1Y25rcXJac1B0azgyZExCR3Zi?=
 =?utf-8?B?QiswRlVTUVVyNW8zNTAzYjcwVC9vWmczWWRzbWZZd0IvMlQ0NlA5UE15Nlkr?=
 =?utf-8?B?TjlnUjlXczJBOHlJVVJWNjlmQTBzaU1rRnNRTjZTMFRwZHVSSHRBMko2TVo4?=
 =?utf-8?B?b3lDQThtd2dEQWxscjI5MEU1Yi93S0h6UmtnTk5YeWpNUndhQXNlai9LckJo?=
 =?utf-8?B?ZkJhN0NMNCt3RFJhKzcyQjU0YVZReGttdWVUVEVaREJRdEx1Um9SV0JEV1VG?=
 =?utf-8?B?OTFsemkraWdEUVBMckhPd215V2QrMlF0VW5ZeWtIVVdIQkVmMmx4aDNHcjNZ?=
 =?utf-8?B?QWxzRHV0MUdwbUhlN2pwSWthNnFSRk1JaVdKamppcUJZcTlIbFJNMG1LeTZG?=
 =?utf-8?B?TmFKSjdFaXJ2WmRhd2FOZVVuYi8vMWhGLy9aZ1FHOTJCcXZnaU5hcmVFNVV6?=
 =?utf-8?B?L1B0elNGTDZLUTZ4UDdzdEU2ZzZrb29EVDM1a3ZObmJ4V2JQcVA4YjF0YVhF?=
 =?utf-8?B?Z3lEaXJHdjYwY29YZWdwOWRMN0luTHUrTjA3UEM4VUowM09SNisyV1pxNUdH?=
 =?utf-8?B?UUszT0VMYTJQWnA2MDc5NkRhWDg4WllreG9STVRKQzRhV2ZaQzQvZGlORkdF?=
 =?utf-8?B?L1hUemZodi9YSGY0ZFRZcWpCOTFhTTdPOVRDelN6dVBJc1FRaXVwMjhrME13?=
 =?utf-8?B?QVlEVVBBOE9OYlU1bk4vS1EzOFVjd2ZUbXhrWmt3Z1BQRmcvRldNNkdwZ0Fr?=
 =?utf-8?B?MUUwY2dnVGNxQ1RUc255Qkp3QUp1MytjTHVUK2s5ODRGVUZMbkNObnhUMU52?=
 =?utf-8?B?MFoza1ZOV1NCZ2o2Yk1QeURwS1ZBZHVtck1jZ09McXNQZnhoTkg5TGNpSjZU?=
 =?utf-8?B?eXZ3bDhxbndiNStmempKYzhhUVFFcDdrQzVVRjZsRlpwNEJOMVgvMVI1NmNx?=
 =?utf-8?B?U1I2aFJrMFc1VHN4N3BCOElWUTR5dldnZk42L2tvNFdaL3IvR1ZRTXBNOTZB?=
 =?utf-8?B?V0pod0ZyV200NnMzNkJjSVl5cWJ5M0JJSDhkekFQMUswSE82WTdUdXdhWVVq?=
 =?utf-8?B?Y2NMVlE0b2VmdU5vMzNqTEJkS2dubmtzRG1JcmZ2dUVkU0ZHVzdOblIzbWtW?=
 =?utf-8?Q?I0DXTIaP0l1mp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVpYWnlYRWZaYmE5Q3FHYkpyUUFHRWNBcXY5N2hWaE0rd3o2dXdIbFRFNUQ3?=
 =?utf-8?B?YzNkRWFlMFk5OGNMY2dQYTN1bk9SRi81TTQzWXFpVGcyV2RzazYxeWxvVVRR?=
 =?utf-8?B?UnFQZWZ3TzE5elk3TGVKNm9DZDBsZnFsVnVkWjVhMzFPQnkxNzk1VVo0dW5i?=
 =?utf-8?B?ZUtjcDVRb01CMDRDVTdhNmNuOEM3U1BBUmh5ZlNHNU1UTGR3M0NtTk1CVTc4?=
 =?utf-8?B?d0hyNm9jSGdXbkhHK1o5ZllHem5FM2xpRURLSHJUbzBKU2pnQ01uV0F1bUc1?=
 =?utf-8?B?R3hIdFpxaHpHenhlb0ZkTDJSVkxKS2xEL3kvSDJXNVo5T0RlTHFuS0I4UDJ3?=
 =?utf-8?B?SDluWnNpd1NpQUJOTVNQbE9Zd29NS21MbGR1VEMzby80elR5dmtrK2xCbVV4?=
 =?utf-8?B?ZDFEbVR4YkcvY3FoZXVRcHhlbCsvQ3p2VEczdE1KYk1BS3Y5a3NyR1VtK0lX?=
 =?utf-8?B?aTg5anU4ZytNS0V2ZEY0c01XeHNKSEZ6ZkRNTVB6N3cxbmpqT3pIWkhLQ21X?=
 =?utf-8?B?Sm13djB5cVJaY0tvUHBzalZXYStYZzVlNG5IUVdGUjh2OUV2Y0tDTUY2Vzh1?=
 =?utf-8?B?ZEtEdXQ0ZjVCdkowdW1HNzlUL3hYVG9ldVloSU5SQ0QraSszQW44eUFuN1NB?=
 =?utf-8?B?S0Z1MnUvUHUwYlQwV1hyR3ZFd2xqTVlDMTAzUzFZM1NCWURyOTd0RWxKQzF1?=
 =?utf-8?B?S1RJSklMNVlmRlc4eXhhR29XNVlVd3dxODh1TTNaalZqSXMvWUFyQkVCSVA0?=
 =?utf-8?B?aWl1bU12SC85amd5eUMvOVY5QnZxczZtYnhZcjl1QUlWV29rQkl1Z0dnUVJI?=
 =?utf-8?B?aUl0TFlUVjZqSzZDSnpESzUvMEltKzFPYmIrbDJDM1NsRTJiTWhFRUIvdzFW?=
 =?utf-8?B?Q09IUUJqVVRlT2xvYTJJVTAzN29JWFlmY0puLzkyc1R1d3I2TExYQnQyMnhO?=
 =?utf-8?B?eDFSUFJWaGdvcis3ZUM1VGIyQTlxNnNjakd1aFNUeVVCRjhDVmdNK0FsbjNj?=
 =?utf-8?B?eVYrNzArVjJQMkxhd1ROWDY0aFc1cG9udHRqcFlXNFNkMFhaTWgyM3EyVG8z?=
 =?utf-8?B?RTZSR3pSYk1YdXV4MkVsSEI4ZThJdXNwT2ZzREhrOGVSald3eHFuTm1VNzdQ?=
 =?utf-8?B?RDlIcklUQXlMS1FZbkorYkNFczFMR3RONDF5RGhIVjRDUlFxNzJ1Z0tPeUY1?=
 =?utf-8?B?NGYrY1RKS3NvS0UzdGd0Q2J4amhlRm96Y1hSWlgyanp3TjZBeThZQUFLSUpv?=
 =?utf-8?B?ZDEyaENhOU5pelU3ZkQ2LzNOaG9PUlc0cHRnN3hRWUNLcldUS1hsalJtelVW?=
 =?utf-8?B?ZGNkM0dyVnhYRVFhZjFzbCtiU2hoS3VPaXlTeU1lN3NOMXBUa3k5N21FZlB1?=
 =?utf-8?B?SVU0Skg2akVERTFtRmJRekRZRVBlMmRYYzZUSFRsdHovZG1HSDFWbElEMUFt?=
 =?utf-8?B?UVF4UElBS1I5WTBxblIwaDJENjZ0VDBKTWlISjRkN2I0cVpqclM5WEd0RmNk?=
 =?utf-8?B?L2dBQSt1MEhOQlFUTVYwUmFkb2lwaktYK1JTUk1LbTlwcFV0cVN3Q3NScjg5?=
 =?utf-8?B?dm5ud0NPclNHc0x3S2hSWGFRVldrSUVPelV3TGdBaHEyMmpMRFhXUWp6ZjB1?=
 =?utf-8?B?RlJyOVdKUXlzMDhZa0szV3RpWW5uMEVmNFpSQWtpMjJRVDA2dWJZWjBveDZt?=
 =?utf-8?B?VVNZazFMUEl4K00vWTQxYlp5NkZRNXpobzh3L3d6aVc5ek9ISHU4eG9odXZq?=
 =?utf-8?B?bW90eWQycFowYUhBZ2IrVWRkRVNEeVk4RjI5dlNEdnhnU3BkQ0M2ZXVXZjBB?=
 =?utf-8?B?Y1pOTitLZGNGZVB5ZlQ3VVZHWU9tU21pRmpqT2FmVUZJalhZZXdOcUJvVm1t?=
 =?utf-8?B?WXNoQ1BESWJkM0JwTzZvYXdyOVY4dkRxVjd4ZExOOEcwRFY0S2grWndoRVJN?=
 =?utf-8?B?ZTErSnl3cXN1dGFSbmgxSnEwWGtSb2NXUkdGbjFRRjNsaEZtNEloQ3ZlWUlN?=
 =?utf-8?B?L2dhajVKU294Ky9NMElTeXlQNHExTk53K0ZyNFd1YmNDbVBSbjZwbXhVcmxV?=
 =?utf-8?B?UklkaWZnbGR1UnF4SENSNDM4WnlSTWcxKzJvVnE4QkdTQlZBMUpLcU5lR2pE?=
 =?utf-8?B?UGRMa1pLYnJBTnpmTEtqcnpnY3N2VVk0ZG05Vyt6bVNEOGRyeVBFLzMwUjF4?=
 =?utf-8?B?Y3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6d7135f-4698-4753-c433-08dd679fb1bc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 11:09:33.7926 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WtHPOt0XK83n7nd+XZI3xBGENdfd8i0jRjmhDOIb8pX1WDN83B8faBtbjNISITsh+NjS6vICVbnE5x7tf9IKVvXCqtg0AQclme0dTYrLRjU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6875
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

Hi,

Next relatively small update - now that the PCI cap for regular
resizable BAR is cached, we're following suit with VF rebar cap.

v5 can be found here:
https://lore.kernel.org/linux-pci/20250312225949.969716-1-michal.winiarski@intel.com/

For regular BAR, drivers can use pci_resize_resource to resize it to the
desired size provided that it is supported by the hardware, which the
driver can query using pci_rebar_get_possible_sizes.
This series expands the API to work with IOV BAR as well.
It also adds the additional API for drivers to change the VF BAR size
without resizing the entire underlying reservation (within the original
resource boundary).

Thanks,
-Michał

v5 -> v6:
- Rebased on latest pci/next
- Cache the VF resizable BAR capability position to avoid multiple
  lookups (Ilpo)
- Use pci_resource_n helper (Ilpo)

v4 -> v5:
- Rename pci_resource_to/from_iov helpers and add WARN if called without
  CONFIG_PCI_IOV (Ilpo)
- Reword kerneldoc for pci_iov_vf_bar_get_sizes (Bjorn)
- Reword commit message for VF BAR size check, extract the additional
  size check to separate conditional (Bjorn)

v3 -> v4:
- Change the approach to extending the BAR (Christian)
- Tidy the commit messages, use 80 line limit where necessary (Bjorn)
- Add kerneldocs to exported functions (Bjorn)
- Add pci_resource_to_iov() / pci_resource_from_iov() helpers (Ilpo)
- Use FIELD_GET(), tidy whitespace (Ilpo)

v2 -> v3:
- Extract introducing pci_resource_is_iov to separate commit and
  use it elsewhere in PCI subsystem (Christian)
- Extract restoring VF rebar state to separate commit (Christian)
- Reorganize memory decoding check (Christian)
- Don't use dev_WARN (Ilpo)
- Fix build without CONFIG_PCI_IOV (CI)

v1 -> v2:
- Add pci_iov_resource_extend() and usage in Xe driver
- Reduce the number of ifdefs (Christian)
- Drop patch 2/2 from v1 (Christian)
- Add a helper to avoid upsetting static analysis tools (Krzysztof)

Michał Winiarski (6):
  PCI/IOV: Restore VF resizable BAR state after reset
  PCI: Add a helper to convert between VF BAR number and IOV resource
  PCI: Allow IOV resources to be resized in pci_resize_resource()
  PCI/IOV: Check that VF BAR fits within the reservation
  PCI: Allow drivers to control VF BAR size
  drm/xe/pf: Set VF LMEM BAR size

 drivers/gpu/drm/xe/regs/xe_bars.h |   1 +
 drivers/gpu/drm/xe/xe_pci_sriov.c |  22 +++++
 drivers/pci/iov.c                 | 156 +++++++++++++++++++++++++++---
 drivers/pci/pci.c                 |   8 +-
 drivers/pci/pci.h                 |  29 ++++++
 drivers/pci/setup-bus.c           |   3 +-
 drivers/pci/setup-res.c           |  35 ++++++-
 include/linux/pci.h               |   6 ++
 include/uapi/linux/pci_regs.h     |   1 +
 9 files changed, 243 insertions(+), 18 deletions(-)

-- 
2.49.0

