Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FCFBF9175
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 00:43:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D390110E66C;
	Tue, 21 Oct 2025 22:43:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="li3QSpQl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C655810E660;
 Tue, 21 Oct 2025 22:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761086611; x=1792622611;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=dJ8FHmteLGfUfy2aeybikTUUTgyWKxVcvzUx+XG+yeA=;
 b=li3QSpQlZm4pfLUVnLW3K+FWxZoADqJ0ryrdeOa/dZFWX++QUsdI4l+9
 +n4ZWTzbmITDJobB4K0moL25Y9YC4227gSqj/YKHKNk+gIQWbfyOOSrYu
 EiP1D9SIpRzEiSQiQtKhKXBUqUbKIZpXLBLgCY9QmQTVjzl7fu2qBOgIS
 oM7/0J3/Llsbs8wSDyOpfnUw82C/6bVeTy2cZOo4fSWAEaGsKEzpdLx7U
 9Rc2OsiS8fBmqynUsor2FjxoPgdwN2w7cEkEjMQu5BfpvPxcCuLVxdPTg
 x1YZ/xBNOXOjCZUVKclqT17gUVS/D362678g0lrSdICy1y2dN5eDPk+9m A==;
X-CSE-ConnectionGUID: vWktDRybTvOxaZURL5axMQ==
X-CSE-MsgGUID: IOkzVj47QQ+qLUEuqBcM8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63135536"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="63135536"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:43:30 -0700
X-CSE-ConnectionGUID: M2OuN+WbQCGitFhiOZl3DQ==
X-CSE-MsgGUID: zdbbO1XVRKuox5whLP5tfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="188988709"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:43:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 15:43:29 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 15:43:29 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.56) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 15:43:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lAsuSEMFSUhp4A6u6mLkT3rMtSJORSqbnKbKuRfkXPUJTX1ce9GPZiQapBGeXmKkWYftTKxnzmv04M2DLZP1GlFa7X0ir8E+07ORp7+T5cZ0InVP5ysSOEc6V2nnJ+L4i+KDKf8Pw0gRK3xWnj4O4q6W3vto0JckE060Y5bzZPU+6KYhToL766T/79tCSFNxRC8CkKW63DjYR2pyC4Myay3rjv7zzaEcwm3qrAhsU04v/JkUcmwltK49c+iTXdwEawIN98VAYEr3M6YbNe+X8YNlQYpi676qH1TpPRjFVQ97DDG+d+1eqGn/tF0lkdMsQMATcMc1HDU8NWzaTaXypg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B1EXMLysIqjGkRvBJLZMy/SmMvt3/7p1P3TCa8fy5d4=;
 b=vu4IRhdLMijLMqLnXhSos1qeaul+MZNraCLuzbnfX1LewgrPE9NONzxcja2csA8c+LVMZwrDFAM/CKD/Vht6ktlzMP7TQfWcZ7xaL0VzAwxGkAPwdpheDVP12XiG9+5iKDmUwn47Pvyzj5H1+ZdUNPvwsUKf54efpQXsazWS4iMmWTLID7q8WP0PKrXn7duqoKFkw1LaqD045nFySahktcD70esFB7jHTyB2xjyifZLEnT/s45/Jc6+EUUz4YXN1AnBO2cFe/0bXEOUP3x48cTw0kSFQzz6M2mm+Za3N2j31egz6P87jKOtH5I1yR8W4U+JvotZNgPR4iOFfHhk9YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM3PPFF28037229.namprd11.prod.outlook.com (2603:10b6:f:fc00::f5f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Tue, 21 Oct
 2025 22:43:25 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9253.011; Tue, 21 Oct 2025
 22:43:25 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH v2 16/26] drm/xe/pf: Add helpers for VF GGTT migration data
 handling
Date: Wed, 22 Oct 2025 00:41:23 +0200
Message-ID: <20251021224133.577765-17-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251021224133.577765-1-michal.winiarski@intel.com>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR04CA0129.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::27) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM3PPFF28037229:EE_
X-MS-Office365-Filtering-Correlation-Id: 26290032-cf90-476d-9744-08de10f33f02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UlN3elRYdUpiVXNHNEFxRm41ZjR5bFJETnVHaVJ0T1dQTTZ2ZGpDdk0xR2Ni?=
 =?utf-8?B?WVlielNaZllUYlQzNmZ4REdNUXNlSWxRZThUbVE3M2l1ak1YRHlreTBDVHAv?=
 =?utf-8?B?VDZEL2FyU0hGT0dmUUNSdjVwZStmV2MzQXRYZmJ1NWp2bVJsdWxCenU3QmtZ?=
 =?utf-8?B?bmJROUdON1FSRDVZMTBERC8xdUkxZHR2WWsyeXA2TTYvWFAzR1VnOEJRZ2NX?=
 =?utf-8?B?eDVtcVo0ZGM2WWJ6SnE5dEMyWjNvMlh6U2xNdkY0aHgyOFJjYWVvMGZ3T09W?=
 =?utf-8?B?d1FmcFNya29Na0V1d0tvTkpHMUUwY2d0azhkOVpVZDQzL00rZXRzbU5xVThs?=
 =?utf-8?B?enpoMS9qNTd4M1BXRUtsSzQ4eDVSK2QvcTNFdWVMLzhtcGpJcVFYdDVsUmd0?=
 =?utf-8?B?czZqTVpZTjk0OUFGZDFlTGRLc25pQnNJaWU0bVJDZS9FcjdIRk5vclA5cDdQ?=
 =?utf-8?B?SlUrRWZxYUhsMFpWV1BqV1E3R2FHalJiazhQR1VPd3huTU1GdEhnNk5iNzJt?=
 =?utf-8?B?bTJ0WXpkdCtlWCtDSTVBaVhma2JRcEpFQTFCa1lXZEc4TXREblRoako4b0c1?=
 =?utf-8?B?ZFd6MFBiamVSVmNrclpDZThhcHYvWDB0U05qblNaQWxueHplZ3p6M2tpOFBD?=
 =?utf-8?B?K0xVTi9XOVdBa2VIU29MSXpWd2U0SHEvWFkzQ2hKdlFsb3NrMUNTUGVJbEdm?=
 =?utf-8?B?eGN1VFhRR3FxdGN1QTYxZ3RmSVQ3Y0hKWGtJZWZMSDNlK2pKR0RpRjhVM24x?=
 =?utf-8?B?dVFPYWUrV0RVZitYVUtXcmlUQnhEalZXVzdHdnNFOElXYnhNamNmS0s5Szd5?=
 =?utf-8?B?dlFweEYvRnllNXhDUHZsWEJSS0gvYTVNZXZybHZzRlVpVEc3eGxoMVdLYXhD?=
 =?utf-8?B?M3YyUm1YRnNtaGFuc1dvemg5cndFL1J1ZHpmc29EemliRHgzMWsxN2UvRG1w?=
 =?utf-8?B?ZmprMmJXS2JlL2E4Zk53bXlpS3RqWS91a1Zzb0haU0VHTW4rWHlZVXFiejBE?=
 =?utf-8?B?SHJtZGo5Rk9IT1daNkErVDJzcWozOWVWSFBPUzNQbFlMN2NpWmJERFNqNlhY?=
 =?utf-8?B?bzlrUUs5bmdWQmVaQ3h6Q24yeWtCK3Y0RjlUUHJOc2xpdTlqdlFCN0UzMTNx?=
 =?utf-8?B?VlRROUF1TVRDWWZPVkJjQmNSdnlXZ1JFZGJ6Wk1IUFR0YzBobXhWUG5OL0Yy?=
 =?utf-8?B?Z3Q0UHE3RWpPbjljcUEwdUVuY1VUSkRCT2tPdGNUL293b0h2L1R4NXYwclVo?=
 =?utf-8?B?SmhuT0JPd2NNTkpTYmJKU0hGUHU0ODhzV05FamUyT2VKclExeUxhVDA0b0dk?=
 =?utf-8?B?SlBlMGJWVFlKV1owLzNEeVRINjRsRzJTR2hZcFpZb3h4VWJUSEhBcjNHbkxE?=
 =?utf-8?B?d1dMQzVFVkYrV3Nkek4zbUp6VEtKbk42Zjl5bjhWbkg4R1p5Tm90ZzNrN0l5?=
 =?utf-8?B?ODNRd2ZLUjFBZno0c1ZHSkxUcGcxZVJiQ1ZRVmwwNUZoalZmZDdudWltTEhO?=
 =?utf-8?B?U2pJUFZzd2FRRURzTnQyZmd5SkZDcU04MnJUdXFmRTdWU0ZQUGNsa1pnbHQw?=
 =?utf-8?B?b2VHdm1VM2wwbXE4azRGTWRMUlF0a0RwWldEUTJJR2xYb3oxZVJmWHAzVnRD?=
 =?utf-8?B?ZHduVmluVHRvOFdDeElCdTk2a2ZXcE5YRFRuekVLVFlzeXZvd0tWZ0lrQ3VP?=
 =?utf-8?B?bWVOaXkweUprVUd5aTN3YmtyTFV3OXZjZ3FVcVNLMjA2WHc0amJrc1ZXbE5E?=
 =?utf-8?B?a0lsYzdqMElpT3gxSHhLbm9MWVFsN0lINUo1bFlqdEIvOERPQ1EwTThDZVZ1?=
 =?utf-8?B?L0ZNT0ovL2JsdUJWOTI0dXlmZFdlUUhFSmJaNUQraS9jTkNOUzBvRndKOXdF?=
 =?utf-8?B?K2hyS1BQeGNiM2gwRndHRXFGdiszNWNQc2RxK3RkU0JkUzBPSWdEWXVyZXRi?=
 =?utf-8?B?cFMwTWtsRVdJYlFia0JtdnRJVDMrSitDM1ZWajZualZUR1JUZ3ZiVER6TEtM?=
 =?utf-8?Q?qYDAAwGlWp35g5oUd4ef78M4DZKuhM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzFzenFkRDd0SVI0NkRwL3ZlVXczQ3BPR2FtVWFPeWd1Zjl5UVhsNGhaQUVv?=
 =?utf-8?B?N0RoaGhMSzIxODgxMUtnSWoxQUpDZjVCeEg3TW10QkVJeVZGZUxQVklZSWpX?=
 =?utf-8?B?aU1PUFd1YkZQS3NnNS9xTWh6VlZPdEo0RTE1aENlb25hQkNYVEI3dEFlU01J?=
 =?utf-8?B?SXdqcjdkcVF0T1FPY1dDSHJZUmRsS2J5TERuclpJZHovWmJnRGF4THhHZDRD?=
 =?utf-8?B?NjNTcFNmQTlUQ3RiK1J1anhpVXBVN3hnZkdoTDVja1hJWStpU0JMVUV5NEYv?=
 =?utf-8?B?bjI1MHhQNlkyRTRSZTVxUUhXUFNwOUZOeDZGRnU2S000WEFtaUl3ZzJJWERB?=
 =?utf-8?B?emR5WlhNZnhUeE9rVWJodHBmeWJFMCtYeWVIeWpNMmM1YUlabmV4bGtkWFNE?=
 =?utf-8?B?dkd1YmVFSmgzcWJyYUl0bWlHTnZTV3BIZTRFMlFwWjF3TlF3VWdDT0FHa2dI?=
 =?utf-8?B?b2pndlJsb2NJUXNrNlFYRThXU3pYZjNSNnl1YTM5S3p3RW9ISXhUdUdaRldx?=
 =?utf-8?B?cFZQL0JOcFNKaHhSQnUxQnZLRE5GM1UzdUN4MDBQRUJodmJlSi9qS1JVblFr?=
 =?utf-8?B?V2JZL2FTZkNPQldLV1BxeVhqWnpBWElIeGJ3RTIwM2tPRWN3c2JrOTBGMG9U?=
 =?utf-8?B?RlNpSDlHcjJBdWUyY1Z3aTV3TGppSTd4d092MHU2QUtXVEdpQkdySEhTdzhv?=
 =?utf-8?B?a1NUb1BHU1RYRW1pWE52akFrNmYrRzIxT2Z4LzNLeGUzaVBnSVc0TlhQSWp0?=
 =?utf-8?B?Tm5aSFNFL0NTTHpOaWduSE55RDVuK1JPek90YmppeWc5dXhwbWQ5MWQ5d3l1?=
 =?utf-8?B?RVBOcHA1U3FiRXZTbXBJUW82WEJDK3pEN2NCbXI3a0ZPdFdJSXQzMDBKYmlq?=
 =?utf-8?B?bllyY1hKb0htRXVRL1ZjUW00cTZ1ekpLQi9IeHcyZjE4aXhKblNuNmN0ZDRE?=
 =?utf-8?B?RFE0YlJ0K3V4RVpvOVZpdWFldS92QUsvSlFLaG41UHRGOXNsU2MvUFNuT2dK?=
 =?utf-8?B?ZCtKVGZOVjVzVzUwQk9rU1JZU1dTQTE4OVJ5WTFnUG5yRlRUaWdtdUlFZ3Fo?=
 =?utf-8?B?WmwzR3gyMFQ1eE5PSHlFdGFkK1ErWUticndzS0MrNkFvL0pnQjZzMDU4T01n?=
 =?utf-8?B?WllrVVVDTnkyZ0JWaFFQMDE4N0ZheU9aNmxrMm8xQ2tPZS91enNxSG5hQU5h?=
 =?utf-8?B?QmhMWmJoM0JVRW5YSC96OHZ3WW1sdm9CMi9ONEMxbE9uSFd2QVkyT0d6bEVS?=
 =?utf-8?B?SmN3RExPMUtqcVp2OEorUG5selh0K3ExMzFhblFiTWFjRERtZTRha0ZrSWZs?=
 =?utf-8?B?aXFsNUkrRlB3N0lkaEVic1Jsb0JzNXhTdVM0YVZ5d3dsd1dld3dhNjU0ODVF?=
 =?utf-8?B?YnJXMEowYlp4VnFHY2VZT3FadGdDbTZ3czBtdGhkc1gzdmlZK2NQYVZPY3oy?=
 =?utf-8?B?MVFSZnR0TVBOdnZRbkdSV1VZZHRUQzEvYVE2WXBqcmF3STVpZ2NmRjRGQ21l?=
 =?utf-8?B?bWxXc3JENTExSkROZHdqK1QvUk5IazhDWUdwT2Vab1lIUEo2aytabE45ZnJk?=
 =?utf-8?B?bFdIaEQ0Y1hQT2pISEtNNHUwN0YvRW5ITDFoUkdWeUlmNWJhelJsZFRDRHBF?=
 =?utf-8?B?cmVFMHdqbHY5VTJ5c0tmTHpwSkFNSTM5TS9HTnBobWk2azM0RWVKd2h4SkVw?=
 =?utf-8?B?NHJqWEg4VE4vaStTSzBwRWUxSHhPdlVrYy9ueVpWRXpVdDlia3ZjejhhbXJR?=
 =?utf-8?B?YmJpN3gwNmJZV2FQSWR3bkZBTStLR2hFU1hxNzZiOW5UUE93TkF1RGUzWmNL?=
 =?utf-8?B?QzJlZXF4d1hoU3IrbzZ2WTkyc0NLdXowU3ZFNHNLbzdUUnZtS3dXWkN4bFg1?=
 =?utf-8?B?dlJGaWlxWHlMWkRManRabGF6TEd6eU5UNnYveG9qSWJ4NDNyTEl5WkZHeXNC?=
 =?utf-8?B?OWpnSC9FZ1d5Yk5QVkhGcEg0Y3RBN2VXNzQwNnJ4ZHR0SWozaC9uMlBRbXd2?=
 =?utf-8?B?dlNyTW40SVhZSytoU2JyNVJQWGwrYUdjVWtvb3FLL3MwTjZlMUZGMU50NU9Y?=
 =?utf-8?B?bWVTNThWWllqbVFpUjgvM0NuL1IwVzlMUko5Tkh2YThiRmZqSUVqdnM0MTkz?=
 =?utf-8?B?VXBuUkdHdm5JWHJ2YmZTYTY2MEMvYnlldTZMRUpGSjhFMExJb3ZYUGZIUDRI?=
 =?utf-8?B?ckE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26290032-cf90-476d-9744-08de10f33f02
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 22:43:25.4957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ez0JGtIHnhXuNLYkVJ0oMQyHCaGcfqbz/XRnWMgpDxTX270x/7O1AjHmFlKEsSXtBAbUOJFfec40+NhUeqHhcUg9/SpeTk4rRB6FfLFGMqo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFF28037229
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

In an upcoming change, the VF GGTT migration data will be handled as
part of VF control state machine. Add the necessary helpers to allow the
migration data transfer to/from the HW GGTT resource.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c               | 100 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.h               |   3 +
 drivers/gpu/drm/xe/xe_ggtt_types.h         |   2 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  44 +++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |   5 ++
 5 files changed, 154 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 40680f0c49a17..99fe891c7939e 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -151,6 +151,14 @@ static void xe_ggtt_set_pte_and_flush(struct xe_ggtt *ggtt, u64 addr, u64 pte)
 	ggtt_update_access_counter(ggtt);
 }
 
+static u64 xe_ggtt_get_pte(struct xe_ggtt *ggtt, u64 addr)
+{
+	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
+	xe_tile_assert(ggtt->tile, addr < ggtt->size);
+
+	return readq(&ggtt->gsm[addr >> XE_PTE_SHIFT]);
+}
+
 static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
 {
 	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[XE_CACHE_WB];
@@ -233,16 +241,19 @@ void xe_ggtt_might_lock(struct xe_ggtt *ggtt)
 static const struct xe_ggtt_pt_ops xelp_pt_ops = {
 	.pte_encode_flags = xelp_ggtt_pte_flags,
 	.ggtt_set_pte = xe_ggtt_set_pte,
+	.ggtt_get_pte = xe_ggtt_get_pte,
 };
 
 static const struct xe_ggtt_pt_ops xelpg_pt_ops = {
 	.pte_encode_flags = xelpg_ggtt_pte_flags,
 	.ggtt_set_pte = xe_ggtt_set_pte,
+	.ggtt_get_pte = xe_ggtt_get_pte,
 };
 
 static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
 	.pte_encode_flags = xelpg_ggtt_pte_flags,
 	.ggtt_set_pte = xe_ggtt_set_pte_and_flush,
+	.ggtt_get_pte = xe_ggtt_get_pte,
 };
 
 static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u32 reserved)
@@ -912,6 +923,22 @@ static void xe_ggtt_assign_locked(struct xe_ggtt *ggtt, const struct drm_mm_node
 	xe_ggtt_invalidate(ggtt);
 }
 
+/**
+ * xe_ggtt_pte_size() - Convert GGTT VMA size to page table entries size.
+ * @ggtt: the &xe_ggtt
+ * @size: GGTT VMA size in bytes
+ *
+ * Return: GGTT page table entries size in bytes.
+ */
+size_t xe_ggtt_pte_size(struct xe_ggtt *ggtt, size_t size)
+{
+	struct xe_device __maybe_unused *xe = tile_to_xe(ggtt->tile);
+
+	xe_assert(xe, size % XE_PAGE_SIZE == 0);
+
+	return size / XE_PAGE_SIZE * sizeof(u64);
+}
+
 /**
  * xe_ggtt_assign - assign a GGTT region to the VF
  * @node: the &xe_ggtt_node to update
@@ -927,6 +954,79 @@ void xe_ggtt_assign(const struct xe_ggtt_node *node, u16 vfid)
 	xe_ggtt_assign_locked(node->ggtt, &node->base, vfid);
 	mutex_unlock(&node->ggtt->lock);
 }
+
+/**
+ * xe_ggtt_node_save() - Save a &xe_ggtt_node to a buffer.
+ * @node: the &xe_ggtt_node to be saved
+ * @dst: destination buffer
+ * @size: destination buffer size in bytes
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_ggtt_node_save(struct xe_ggtt_node *node, void *dst, size_t size)
+{
+	struct xe_ggtt *ggtt;
+	u64 start, end;
+	u64 *buf = dst;
+
+	if (!node)
+		return -ENOENT;
+
+	guard(mutex)(&node->ggtt->lock);
+
+	ggtt = node->ggtt;
+	start = node->base.start;
+	end = start + node->base.size - 1;
+
+	if (xe_ggtt_pte_size(ggtt, node->base.size) > size)
+		return -EINVAL;
+
+	while (start < end) {
+		*buf++ = ggtt->pt_ops->ggtt_get_pte(ggtt, start) & ~GGTT_PTE_VFID;
+		start += XE_PAGE_SIZE;
+	}
+
+	return 0;
+}
+
+/**
+ * xe_ggtt_node_load() - Load a &xe_ggtt_node from a buffer.
+ * @node: the &xe_ggtt_node to be loaded
+ * @src: source buffer
+ * @size: source buffer size in bytes
+ * @vfid: VF identifier
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_ggtt_node_load(struct xe_ggtt_node *node, const void *src, size_t size, u16 vfid)
+{
+	u64 vfid_pte = xe_encode_vfid_pte(vfid);
+	const u64 *buf = src;
+	struct xe_ggtt *ggtt;
+	u64 start, end;
+
+	if (!node)
+		return -ENOENT;
+
+	guard(mutex)(&node->ggtt->lock);
+
+	ggtt = node->ggtt;
+	start = node->base.start;
+	end = start + size - 1;
+
+	if (xe_ggtt_pte_size(ggtt, node->base.size) != size)
+		return -EINVAL;
+
+	while (start < end) {
+		ggtt->pt_ops->ggtt_set_pte(ggtt, start, (*buf & ~GGTT_PTE_VFID) | vfid_pte);
+		start += XE_PAGE_SIZE;
+		buf++;
+	}
+	xe_ggtt_invalidate(ggtt);
+
+	return 0;
+}
+
 #endif
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 75fc7a1efea76..5f55f80fe3adc 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -42,7 +42,10 @@ int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p);
 u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer *p);
 
 #ifdef CONFIG_PCI_IOV
+size_t xe_ggtt_pte_size(struct xe_ggtt *ggtt, size_t size);
 void xe_ggtt_assign(const struct xe_ggtt_node *node, u16 vfid);
+int xe_ggtt_node_save(struct xe_ggtt_node *node, void *dst, size_t size);
+int xe_ggtt_node_load(struct xe_ggtt_node *node, const void *src, size_t size, u16 vfid);
 #endif
 
 #ifndef CONFIG_LOCKDEP
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index c5e999d58ff2a..dacd796f81844 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -78,6 +78,8 @@ struct xe_ggtt_pt_ops {
 	u64 (*pte_encode_flags)(struct xe_bo *bo, u16 pat_index);
 	/** @ggtt_set_pte: Directly write into GGTT's PTE */
 	void (*ggtt_set_pte)(struct xe_ggtt *ggtt, u64 addr, u64 pte);
+	/** @ggtt_get_pte: Directly read from GGTT's PTE */
+	u64 (*ggtt_get_pte)(struct xe_ggtt *ggtt, u64 addr);
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index c0c0215c07036..c857879e28fe5 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -726,6 +726,50 @@ int xe_gt_sriov_pf_config_set_fair_ggtt(struct xe_gt *gt, unsigned int vfid,
 	return xe_gt_sriov_pf_config_bulk_set_ggtt(gt, vfid, num_vfs, fair);
 }
 
+/**
+ * xe_gt_sriov_pf_config_ggtt_save() - Save a VF provisioned GGTT data into a buffer.
+ * @gt: the &xe_gt
+ * @vfid: VF identifier (can't be 0)
+ * @buf: the GGTT data destination buffer
+ * @size: the size of the buffer
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_config_ggtt_save(struct xe_gt *gt, unsigned int vfid,
+				    void *buf, size_t size)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid);
+
+	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
+
+	return xe_ggtt_node_save(pf_pick_vf_config(gt, vfid)->ggtt_region, buf, size);
+}
+
+/**
+ * xe_gt_sriov_pf_config_ggtt_restore() - Restore a VF provisioned GGTT data from a buffer.
+ * @gt: the &xe_gt
+ * @vfid: VF identifier (can't be 0)
+ * @buf: the GGTT data source buffer
+ * @size: the size of the buffer
+ *
+ * This function can only be called on PF.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_gt_sriov_pf_config_ggtt_restore(struct xe_gt *gt, unsigned int vfid,
+				       const void *buf, size_t size)
+{
+	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
+	xe_gt_assert(gt, vfid);
+
+	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
+
+	return xe_ggtt_node_load(pf_pick_vf_config(gt, vfid)->ggtt_region, buf, size, vfid);
+}
+
 static u32 pf_get_min_spare_ctxs(struct xe_gt *gt)
 {
 	/* XXX: preliminary */
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
index 513e6512a575b..6916b8f58ebf2 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
@@ -61,6 +61,11 @@ ssize_t xe_gt_sriov_pf_config_save(struct xe_gt *gt, unsigned int vfid, void *bu
 int xe_gt_sriov_pf_config_restore(struct xe_gt *gt, unsigned int vfid,
 				  const void *buf, size_t size);
 
+int xe_gt_sriov_pf_config_ggtt_save(struct xe_gt *gt, unsigned int vfid,
+				    void *buf, size_t size);
+int xe_gt_sriov_pf_config_ggtt_restore(struct xe_gt *gt, unsigned int vfid,
+				       const void *buf, size_t size);
+
 bool xe_gt_sriov_pf_config_is_empty(struct xe_gt *gt, unsigned int vfid);
 
 int xe_gt_sriov_pf_config_init(struct xe_gt *gt);
-- 
2.50.1

