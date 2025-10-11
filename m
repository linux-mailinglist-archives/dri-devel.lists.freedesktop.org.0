Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C45EEBCFBB4
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 21:41:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AB0F10E34B;
	Sat, 11 Oct 2025 19:41:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UY0ULRhl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D9410E34B;
 Sat, 11 Oct 2025 19:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760211683; x=1791747683;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=RP+etK7fWMaReKZOUL/D1vWYIuxy/j5zJdEuZVQoLhQ=;
 b=UY0ULRhlSs32A9Ag2ZiqFVRzrh5iqcYsYg1eI4lXcQRulv/egjp4viWe
 jCOL0WPja+cpN/fOtmji5CfSN35xjZfD16SCrknuMjWlnEp/6R8jFZOaC
 kGGCKOQt172WtK9KP6UIKZSZIfAJxGoZKFJE8B5ys5eOYi8EhnmUG2Te4
 k9mi1HsmGBrVhKnV1x6/lr6xzBKgr9Pieuu0DpfUAuaufrgToSLAYMApH
 EjVpiLBEXs+HWFUCMqGlVkOiBLP5TYbfnN20t5T13ISMPGrzZaT2bjLBH
 h5hXic8cospA6VZkO9/e63YRU+cKOyWcd3xotK3f8h7B2jHijhWZ/j8wp w==;
X-CSE-ConnectionGUID: yFLCHLpHToWg54V3Hw8kMg==
X-CSE-MsgGUID: qJXF8N6BTdC/sDUQ0kGRqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62342212"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62342212"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 12:41:23 -0700
X-CSE-ConnectionGUID: TyNELsvERxymnV5ZEhMVow==
X-CSE-MsgGUID: r7tExwWSQgmE2UfYQIIp9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="181661734"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 12:41:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 12:41:20 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 11 Oct 2025 12:41:20 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.45) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 12:41:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BsmSAp+mCNMHgBO+t7t4B0fK7SM7hTPpIniXQUcLmvG9CfFtw9oVsr6aYJqU494ZcObPiyVQvxlKPiTbH8jDjI5YtzmesTDT2bv64pvo7hJVBlj4sApUAI2Pa9p1lKJPYx18OhHBvMumzYFbFmO99GnTjFpGcCNyLigcSPyyErGNOfBbLRWfY3lJf0zS/kiMxbm17mrveNVlGcDRXds89egn/fedgPjlLDnD8DHNW8BBg/YefU3mrP7LpH2uPf//zVvAlkNghYmnxFWDHMRrZ9e9LyT9IdRZ3AJI6TrKxVOqOlesPKu7FY1BPML2AUllmeoRf9reoKwXEr1fmJqRZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/GkwtJoy3eOGFBIqCvrQXG6TY54Xk5yYOoidPTaATHw=;
 b=OYJIqy+lTpDwFrW0WhmOkHMiRJ9ugqvszQALYFqaUO3tUKEnGoMCS6Zqm+aWO3u9G1CdCgYd9eIIoz2hQwm5fOPp5WzNFQy74wqDA+mS2VLtOE+UuktkXH59+5dTgC9V3B2fGv7LLfKBNH2s5kHzaDrb1Jwg0lhGOjwpKXxMmjHEvoLdvKfQNliCOCUZJ+Nfe3eKIFWO4JA00AtEBhut1VpeczbOTd75XazfarIrCo0pFK6XldSq3GCZOpgmiu2u7/J5qcXaXCpRJA7Mjm5CdV//DimQc3aS+WsthAW3XHyitQWG9m7A2ZccP820fyrIoBiSb34B+u+zh0oPPcKrJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM3PPFF2E67D388.namprd11.prod.outlook.com (2603:10b6:f:fc00::f60)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Sat, 11 Oct
 2025 19:41:18 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9203.007; Sat, 11 Oct 2025
 19:41:18 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>
CC: <dri-devel@lists.freedesktop.org>, Matthew Brost
 <matthew.brost@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH 14/26] drm/xe/pf: Don't save GuC VF migration data on pause
Date: Sat, 11 Oct 2025 21:38:35 +0200
Message-ID: <20251011193847.1836454-15-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251011193847.1836454-1-michal.winiarski@intel.com>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR04CA0048.eurprd04.prod.outlook.com
 (2603:10a6:802:2::19) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM3PPFF2E67D388:EE_
X-MS-Office365-Filtering-Correlation-Id: 39da8c88-8b59-4ff5-8546-08de08fe25f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M3hsNEc2aDNIYzI0NkE3bEJjY1B0dzBVNm95c0o1czRENlRMdDdPZzYwdXJi?=
 =?utf-8?B?YXhDVjhaRmtnaTY4ZXZPMjY1cG5UOWlieE5ZbEFlUUpjRnJWWEM1bk9neXJp?=
 =?utf-8?B?dVJJem5LU3B3OFZ6NTVuaGxwbHAxaTBqakUrZkFOdDR0Y0ZWL0MzUmY5TGt0?=
 =?utf-8?B?RjVpVnZsNisxWFV1SVBSeXlFZnBkQXhkMVRsUUxDZVQzYmtKR2N3VVBSK2dR?=
 =?utf-8?B?clZ5OUpNNWEwTzA1YStncnR6ZFc3T3hxa213aFd1M2pwbklmMjJvQ21PYW82?=
 =?utf-8?B?eHlQd1ZwV3NRM29aTkY4bStnQjQ2YjVFVEQ0dnJmNkt6OXZyUDJwZVZxZmc4?=
 =?utf-8?B?MjIxL3hLM0JkYTdrdWNlb3prcVdMNzRJTFowdzZhSWphOFlsczlUVFcyUURz?=
 =?utf-8?B?bDhjcmlnMmM3S28xMU43dUJ2enNmeXFFVFJCdXRSSmJIUHN4R2JEOS90N0Fl?=
 =?utf-8?B?VkliQ1dOM0VLa3FxZHM2Wkh2K09aREJZeDc0RXV1bTkzUnZ0Y3NScjcvVjRq?=
 =?utf-8?B?UkJSeWtpZDBSdG5sLzdHWkd2V2JtdS9Pb256YngvdWRKbjNuOUZtYnl1NVpa?=
 =?utf-8?B?WDhybGovNlBYQ0l1aU5DTGVsRUZOallxMytzVEUzWEgxZ3NnMldKaDVEc2lZ?=
 =?utf-8?B?bDhsL0FUK3A0VlRsLytiZ2hHUk1HUU5aRzJZTFFLRm1tY090UUlKSXdqRnlG?=
 =?utf-8?B?RStLc2N6a2ZNZk1uWEx2ZXhFbXpIOG1jcEtrQjJ2bmtYV1N0VHB0aXNibysr?=
 =?utf-8?B?T3gzc1FZRzRmRE9LTnNUb3BrbHFPZ3UxMEZIaXJJc0w4eVUrekhKbW5adzV5?=
 =?utf-8?B?Y3ZyMENaS3BMMjdHbTgyWXNDYzJrQU9kOGlDK3lPd3ZkNlNWdSt3ZmNoMlEw?=
 =?utf-8?B?b2dZTmRnTTEvaDFiVnUxVjlJLy92WTdveVNvV0VkWXhhcUFJVkVTYnFQMHRX?=
 =?utf-8?B?UDhmL2IvYWlxTithMVdlZGdGc1ZQTDByN0o5RTcvNHJPcm03N3MwUkFBajYy?=
 =?utf-8?B?Rzl6ZXdiT3dMWEpueXY5bVY2aFRDSkZ4Rk9GNWFLbFdmS2U4K0JZZzdRMDBB?=
 =?utf-8?B?blR0YXRraDRmbFYxd0E3YmRZM2N4ZTEzWDlDSWlyTmxnMHhEb3lvcFk3UGdH?=
 =?utf-8?B?Z2lXcDJJbnZjaGh0OHByQ3FITENpdU01RTNMcm1Vc012WW5ZRmVtb2FnMkx4?=
 =?utf-8?B?WVpXMVRwRmhidVpjTVE0d2lsWFkvSkJWSU81aXhrbmZQUGlvNzZWVGdsa3cx?=
 =?utf-8?B?cE1wb3RtWXZNQmpMaFlpRXc1c2VlZHQxUExkeUo2em9zQnkzOGNacjVpTDM3?=
 =?utf-8?B?L2JId1NRRzZjay9TSjNOZ1M2Zmp4RUs5UlVhZVJYK2FuTTZXOU92R01MaEtQ?=
 =?utf-8?B?VUw0eU9MY2tGcEw5QzBaU2wzMVpsRlowSGEvTFN5elFvbWhSdXdMRFI4dm5C?=
 =?utf-8?B?OXUzL1UzMkxmQUsyMm1PMTk2OHZZL1lRNDZ1UW44RHRNOWpxQlpNWExWWEZE?=
 =?utf-8?B?YWNvUDB6TGtUQkZmb1ZONXQ4K2QyTFI4WVdJNnBHMW81bC82cjVjQWdGWnNp?=
 =?utf-8?B?YjFMMjFCT0RtOU5oazVOcmIrUktxYmpNbG9sSmpaakJTYi9YVVdPRWttc0hB?=
 =?utf-8?B?ZGJaWHYzMkNMTEtmNFYyUGhKNTBqdC9DYU5EYlhnc0IvZXlmbEVLM0xGWjJp?=
 =?utf-8?B?WUsrMlliOXdFMzBUQWphcURmMVRtMUdvakw2Y2FMUVY0anhpNXUzL3hoSlNi?=
 =?utf-8?B?MkpsdUEwc3NEeHljWlhsZE9FV1J2WWEwM0NodEZwSXBISWFoczZadXVYU2Zn?=
 =?utf-8?B?N0x3VUhxM21EM1M1eHYzZElqNjJXdGk1KzVsQXVLay92djJ6eVVVb1pFY3J2?=
 =?utf-8?B?TTQ3ZTk2RkVJR3g3QThMTERNYWdoMklPR3BITGQyeFB6UFFWUTlFRnpHK3po?=
 =?utf-8?B?RXNaTWhWZElQVDY0RWhUbTIvNjExK05oS2U2ME5VU0pxMkMwdnZMd2t1N1VF?=
 =?utf-8?Q?0et3NZ/B5ITE+T5Utr9nAj/M1vJevQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGZPejNsUjBBaml2MmFtbmFYK1RvanFrZjRIVmRXQ0ZPSmk2bjVCS2lnSERP?=
 =?utf-8?B?ZElmbnJRS1daV2hjcjJwY0VvVEhmODVVa0I1Z0dKMm5yQUtweEl2cHJEWkM4?=
 =?utf-8?B?UzE4UmdUZGtYakQydHRYd2t4eXJyR2tGV0o0ZUg4M1hWWUxqbGVjTHNkUkxE?=
 =?utf-8?B?dFcwclNtQmVlSGYzNGRGT3dZcFkxUWo5SE5xV2o2WWg5U3J4M2ZvZGl3YXhl?=
 =?utf-8?B?SjAwaWNsMmROZTkvZVhQaUtPUC9LbFJzK25pUEpMQ2Z2QnhaMTZBQjlpT2Ns?=
 =?utf-8?B?N0c2a2hwa2lJZWU5SVZ6dngrOFR3RXBBZ3ZLbWRxdFZHTmdSekxMRWhLamU2?=
 =?utf-8?B?Vmt6UFF4ZlBYMjZYTFJkMEpzaHIwMGNiMmxsRCtwb1Uya2RZZkExYVp0K0c2?=
 =?utf-8?B?bHdULzEzeWQrVkVkcVJLY2w1YmxHVWZjaHVZQTVIUkxpeUFQVmk0c1g2WHRL?=
 =?utf-8?B?azQ2RXZBSHhpOUlNbXQxYnMyNkFEVDdwZDRYUVM4Ynlub2lFSE9FNUloamhQ?=
 =?utf-8?B?RTJyakVOekl0ZUdYNGtSYWl3Y2pscnFFV3N3QUxWcTdvTVlGU1Q5a3BjS2Y3?=
 =?utf-8?B?Y2pzLzhmQXpiUDFiMFhCQk9vY2loZHpxV0ZmczFFUmRPcW9FTUZPWnVCNVNZ?=
 =?utf-8?B?ejZ4cjFPaDVvaUVGbjZFSUdGOGkrNDd5V3JZTnpZNmZUUDA4V0pCdkdjeUNj?=
 =?utf-8?B?K1NqVmJmYlExNjh5dGVMVmxJRld2a2dyTm5NeUgzSlBqNmJ2MGhrektSOXN4?=
 =?utf-8?B?ZnVxOHBCS3JvM2xkdmM3YzAvTG5BeEhjb1NrRG90cUhGc05xOTBiaWNBNXJx?=
 =?utf-8?B?dFZqaTJ6aWdyYmlNYXJ4cDRmSENhZlJQRFkrVWZuS3ZmUXRPYndUZkhVQ2Zl?=
 =?utf-8?B?Q3R3R1VvdVFrYXBZelcrcVl5QlFGT0I0Nm5LTEh5TTloRXRFNzFOeG9lcDQ0?=
 =?utf-8?B?SHZ4OWNqQUVvYXdkdFc5SmREOThDc3NYeU9vY3F1aEduWDkwYjJPWEVnUmdO?=
 =?utf-8?B?VFlLc2dDM0F3VVM0SXE2a1RpOG1UOUc2eDM1OUZJcmY2ODZHanJJWmRodFd4?=
 =?utf-8?B?ckFvWWpVU3M0d3ZMdStDcSs2a3NvaFZZdFNqWUQ0LzZJV1lVMHkyRzNXZ0hk?=
 =?utf-8?B?S3RtT2tpUDdwRk1OemZzYU9FVmZHOTFyajErZGZTeTQ3bzFkZEthN2IxOFNm?=
 =?utf-8?B?ajZhVFAyak9BRkg5enJETVV5US9mQXpjM3h6S3hmVExTNzM3N04wVXRjYnpE?=
 =?utf-8?B?dUkvKzg2TUM2bU5qVStpUzFhZCsyUlZUTnFuRFY4U1NTZmpIaWhyMWRORnc2?=
 =?utf-8?B?K25rRDF5N2FRNGpaV00yYkpTVG50aDZaVlVNNUFxa2dQcllrR25zTklGTjla?=
 =?utf-8?B?WkNmSlBUdDNIbXprdFlkdDF1SG9uWWRxTVhlenJoVllEY2ZteXlUbUtkVWdL?=
 =?utf-8?B?NGhseVBFZkxvMzg0UzdjZDNNSmtHT3BaQ3F5VTA5dmx4dFhzbXlrdGJ5MGZY?=
 =?utf-8?B?UWViNUl3UDZiUHNPNitaYzFxTFYxTWFOUTdGYWU5aXF4TFRRL29Oa3A5ZWMz?=
 =?utf-8?B?YktTTVFuY0pJRitnSk41cFo1YXdiNlJPYXh0RkV2VGRUSnhVTVV1b2gyS0Fo?=
 =?utf-8?B?emUrZ3FFb0cvL2NlaTJNd2xNKzZSUEIwTVUreTYwRDNDTTRnVC9xR1Bvcmhl?=
 =?utf-8?B?UzE0czZ6OVBpQ293SHdvWExUaERGLzJ5VWVpamVOanpmM2dqRFpwVVpSclB0?=
 =?utf-8?B?azJ3S0NWMGVmN2NjaTJVR091M2d3ekpHSUpMZkxMT2ozOWpybkQxaW9lWGsy?=
 =?utf-8?B?N01ISWZNY3VkQklLSnV2aE9ndU5WQnp4NWltb3NJSjJRZ3dRT2plOVRMZzN1?=
 =?utf-8?B?TVNJVzFZWnFMZlpRWEo0WWd5SFJ2SzFtay9iTStzUnJ5VEplK3NYazVyaFJk?=
 =?utf-8?B?UVJDN1pndXVJWmI5eldtUmZiQjhTWmQ5MnRVVmtvNTRqS0tHQkc4Wnkway9y?=
 =?utf-8?B?YUgxc09jbktRejg2SFdNNTZXaCtVd3dHVzB3OGJ6WVYxS1lKMVNtdFNtdTFi?=
 =?utf-8?B?bTNGejU2ZGNnUFE4WGdQSWszVXcyTGkxK2FodTJZbm9RRzMzTjBHYU00dW5a?=
 =?utf-8?B?bFUwTy9lWlE0RnpKdWFpVmQvT1BOdFQwbGJGQktuaWdUTVdqd0JFZzNkblFG?=
 =?utf-8?B?bVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39da8c88-8b59-4ff5-8546-08de08fe25f2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2025 19:41:18.5715 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bEV3X1t6wIofe9UaomgXk7FVu+zQlEYrEfH+OS82l5I5QEwRhTpBPX0PMR0TTeauk+6McVyz9ORVd87aPQFakJ6iC/s1kGMX1wERuRrBZ7M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFF2E67D388
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

In upcoming changes, the GuC VF migration data will be handled as part
of separate SAVE/RESTORE states in VF control state machine.
Remove it from PAUSE state.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 39 +------------------
 .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |  2 -
 2 files changed, 2 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index 092d3d710bca1..6ece775b2e80e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -183,7 +183,6 @@ static const char *control_bit_to_string(enum xe_gt_sriov_control_bits bit)
 	CASE2STR(PAUSE_SEND_PAUSE);
 	CASE2STR(PAUSE_WAIT_GUC);
 	CASE2STR(PAUSE_GUC_DONE);
-	CASE2STR(PAUSE_SAVE_GUC);
 	CASE2STR(PAUSE_FAILED);
 	CASE2STR(PAUSED);
 	CASE2STR(MIGRATION_DATA_WIP);
@@ -451,8 +450,7 @@ static void pf_enter_vf_ready(struct xe_gt *gt, unsigned int vfid)
  *	:       PAUSE_GUC_DONE                          o-----restart
  *	:        |                                      :
  *	:        |   o---<--busy                        :
- *	:        v  /         /                         :
- *	:       PAUSE_SAVE_GUC                          :
+ *	:       /                                       :
  *	:      /                                        :
  *	:     /                                         :
  *	:....o..............o...............o...........:
@@ -472,7 +470,6 @@ static void pf_exit_vf_pause_wip(struct xe_gt *gt, unsigned int vfid)
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_SEND_PAUSE);
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_WAIT_GUC);
 		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_GUC_DONE);
-		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_SAVE_GUC);
 	}
 }
 
@@ -503,41 +500,12 @@ static void pf_enter_vf_pause_rejected(struct xe_gt *gt, unsigned int vfid)
 	pf_enter_vf_pause_failed(gt, vfid);
 }
 
-static void pf_enter_vf_pause_save_guc(struct xe_gt *gt, unsigned int vfid)
-{
-	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_SAVE_GUC))
-		pf_enter_vf_state_machine_bug(gt, vfid);
-}
-
-static bool pf_exit_vf_pause_save_guc(struct xe_gt *gt, unsigned int vfid)
-{
-	int err;
-
-	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_SAVE_GUC))
-		return false;
-
-	err = xe_gt_sriov_pf_migration_save_guc_state(gt, vfid);
-	if (err) {
-		/* retry if busy */
-		if (err == -EBUSY) {
-			pf_enter_vf_pause_save_guc(gt, vfid);
-			return true;
-		}
-		/* give up on error */
-		if (err == -EIO)
-			pf_enter_vf_mismatch(gt, vfid);
-	}
-
-	pf_enter_vf_pause_completed(gt, vfid);
-	return true;
-}
-
 static bool pf_exit_vf_pause_guc_done(struct xe_gt *gt, unsigned int vfid)
 {
 	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSE_GUC_DONE))
 		return false;
 
-	pf_enter_vf_pause_save_guc(gt, vfid);
+	pf_enter_vf_pause_completed(gt, vfid);
 	return true;
 }
 
@@ -1788,9 +1756,6 @@ static bool pf_process_vf_state_machine(struct xe_gt *gt, unsigned int vfid)
 	if (pf_exit_vf_pause_guc_done(gt, vfid))
 		return true;
 
-	if (pf_exit_vf_pause_save_guc(gt, vfid))
-		return true;
-
 	if (pf_handle_vf_save_wip(gt, vfid))
 		return true;
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
index 02b517533ee8a..68ec9d1fc3daf 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
@@ -28,7 +28,6 @@
  * @XE_GT_SRIOV_STATE_PAUSE_SEND_PAUSE: indicates that the PF is about to send a PAUSE command.
  * @XE_GT_SRIOV_STATE_PAUSE_WAIT_GUC: indicates that the PF awaits for a response from the GuC.
  * @XE_GT_SRIOV_STATE_PAUSE_GUC_DONE: indicates that the PF has received a response from the GuC.
- * @XE_GT_SRIOV_STATE_PAUSE_SAVE_GUC: indicates that the PF needs to save the VF GuC state.
  * @XE_GT_SRIOV_STATE_PAUSE_FAILED: indicates that a VF pause operation has failed.
  * @XE_GT_SRIOV_STATE_PAUSED: indicates that the VF is paused.
  * @XE_GT_SRIOV_STATE_MIGRATION_DATA_WIP: indicates that the new data is expected in migration ring.
@@ -66,7 +65,6 @@ enum xe_gt_sriov_control_bits {
 	XE_GT_SRIOV_STATE_PAUSE_SEND_PAUSE,
 	XE_GT_SRIOV_STATE_PAUSE_WAIT_GUC,
 	XE_GT_SRIOV_STATE_PAUSE_GUC_DONE,
-	XE_GT_SRIOV_STATE_PAUSE_SAVE_GUC,
 	XE_GT_SRIOV_STATE_PAUSE_FAILED,
 	XE_GT_SRIOV_STATE_PAUSED,
 
-- 
2.50.1

