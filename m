Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9232BF9148
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 00:42:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0FC610E647;
	Tue, 21 Oct 2025 22:42:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jzrmxn8d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66B9A10E656;
 Tue, 21 Oct 2025 22:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761086567; x=1792622567;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Bfi2642rY8UEWXdf0C9n0vxJURx0vODX+Lc9LdJxTDo=;
 b=jzrmxn8d80ivsnyhLB5cAF0uZPlFVeKt2RQW9dS+EQqb0EbYBk9iB/Lt
 95JME1rOyWJJCQtfY7eubUTc3e9Ws1OMcrPxnwp8cqrMpH/MMGT4Cj6n2
 RGyFPFqgadvbjxdgWc+MbXSkcBbU35yH22lXMlVUoMHSXJfGdT4MXr2Hm
 suKZrmizIatYmVgvEu0fJzEUFxGCcVH8ek8nzq9kFmyplY8oHsq1cNID2
 0Q2mxrMC+rieRKzO2YUnk+lFe0sU7u3l2ET/cGdZwDUXXI+9FSNaHnRJ8
 2IjBeM9DPqB3Q7WFSzXtG8fvdr9n25WklgQERVxpGftN4DHn4HinapY2t A==;
X-CSE-ConnectionGUID: dQcntOl3R2yoW7KWGcy/Sw==
X-CSE-MsgGUID: cqPMjClESE2OtZKWaJOM1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63263701"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="63263701"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:42:47 -0700
X-CSE-ConnectionGUID: VKfaHUK0TfmH0D3OTwQ4SA==
X-CSE-MsgGUID: IQqpKvNsToC45H/+RQ3VcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="214345510"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:42:46 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 15:42:46 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 15:42:46 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.33) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 15:42:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C3uDQ8lZd397r1R21NMni3yEGmcc8vo4NdB4IzDZ4idNQ5dCSqhXExics8J6NDJ2DJobcjPjoQ1YCSoauLAPKnKSfUsIvBALSpyjE/QAOny7kgroNTb6aNnJjHACtd2T/5kyb+y00Bk3sHJmDcBs1RpqFAJxgMV2IB+0nsb0voFEYihPK9m8zMdyvW++NG6Q86c1YHimN173lDmv1SoFRhQZoqEa77HZc32m/mpY9JtOG6sq8jGbb9ic0GS3QT1yu2i+8AEWOJtLVZAKA7Rz8D+r3LhYgq7cfB+PwDxbxFl0/6xYU2nHOaiCHWEzO5Oijq3t3++kTG6gJgpxu7sEhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=blhjKkjYtzaYN7fPaCYMgUK2fuqN/uQUwpaMBLdW+l4=;
 b=r4/gl42Xg0CvS2DbJh/f+J+iAaOikljEX1BJehxi/f1cn2I3FF1txw33wIbDrNnNHm7ZHedWQRx3QmZ2AZ5gz+X2lHs4kJ91LmSBD7rZCTuqQ3sztHdFaADMFNP7QFHF0w4UTW7qNs/qnFDPKtTUTYH5vHrzeCKGSwrCf8uLNYfpoPhVyEmquqDoEGnGKRpVy8mq0t3TRxNlgR6TfJ54VtktqU+cte7ScYc27lrKPlnv/P2NlMmxB+V8ZdZEIx5XQAXhBd9hkUB6tT/5j0HertOxomMwi2ekafkNgz2hT5fzkq2tsy6tlJm+DQbfDpnzH4Bnzr/t4JgMAwMoZ30ITQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB6753.namprd11.prod.outlook.com (2603:10b6:510:1c8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 21 Oct
 2025 22:42:43 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9253.011; Tue, 21 Oct 2025
 22:42:43 +0000
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
Subject: [PATCH v2 07/26] drm/xe/pf: Add minimalistic migration descriptor
Date: Wed, 22 Oct 2025 00:41:14 +0200
Message-ID: <20251021224133.577765-8-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251021224133.577765-1-michal.winiarski@intel.com>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR09CA0125.eurprd09.prod.outlook.com
 (2603:10a6:803:78::48) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH8PR11MB6753:EE_
X-MS-Office365-Filtering-Correlation-Id: 5082d626-fe56-497f-d2c7-08de10f3260d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZklDa2swRjM1OVZvc0U5anZYanJmZG1sWHk1MDBtZU84clhUdGEyTlFUNlRF?=
 =?utf-8?B?NFg2YUZoYVNIamhMTk9VREgzR3lrR09EcktZcU9aSkVDRElZVzYyaWFYYkgy?=
 =?utf-8?B?M1hsZHRhRzdsd2VGVFNVSkFKQmpRZWRJbDVyamNoa3FzQVJCRGtJdlZKZ1ky?=
 =?utf-8?B?cEZoTlJnMzRlcjFCbXJJQ3R0eURMbE5ISVg3amVJZHk5YjRZdjd5WUdtLzk2?=
 =?utf-8?B?UmJ4UmZDT2Z3ZTI5cTUxT3JKRVgycjJ4SzNwMkcyQTM0SnZrejY5emNGSEpp?=
 =?utf-8?B?QkVIbE5rK2svSE5NNkV5T3hsemhyUVlRVGxVVWlXeStIVWpSaVgydElKWnJk?=
 =?utf-8?B?QlMvWjhrUU5OS0IyQmt2WjU5YWhrMElnemdsaFo4My9uR0NSNEtqNTlGM3c1?=
 =?utf-8?B?Ym0vUGVhbldONW0ydFB0YkhId2JVdlFMdUJsUHNoSWY0Qis1V1VjbERaK1pj?=
 =?utf-8?B?M0hBbFdjRjhoSjZPcGhEREtBSVJlcm83SWMrdkhMN1dpT1IvMXJrQzJPUXU3?=
 =?utf-8?B?UExvdlRBM0VRc2llRWg3T2hPc3Y1blp5YjJCS3BCSVpYZ01OQnFBQ2NZV0pp?=
 =?utf-8?B?UEN5ZFpNVktBZzhyZlBNZjQrRk5nV3FBR0R1amNETWEzRXY3VExtSFhoVi9H?=
 =?utf-8?B?K21GMEw1OENmTklZYnlUVmJzYnVIMFdxeWN2eUlDZi9BY0VKNVVCR2FYYm5Y?=
 =?utf-8?B?UlRDV0FuK1BobTBmT3ZBKzJhZ0dGaENOeHhFbUJDdHlwY1JGZHRQSjM1Yk5Q?=
 =?utf-8?B?Vkh5L0ZXRlBoV2ljY0tQenlSRCszZW1Dc2JvcHNhdWZVWFFsMXFFUVNkMmVr?=
 =?utf-8?B?U0hLNEN6MFlTcmwySUZWditDQWVDbHE5N3BwT01rZTZnZ1hZamRyb1ZRL2hl?=
 =?utf-8?B?UU9nQlZRemtYYit6WHNteTZhK01DdkJINzY4eENXZHUyeXNPYzhvdFI5dE5a?=
 =?utf-8?B?eHcwUlV4Skd3aWU2SnJKSnBzRWtjNThxN3g3bkVaREtMU2F2QTd2MFZobWdk?=
 =?utf-8?B?dmEvTjdTNjRFZm0rNVlDL0RCYllpd1pGYml6ZGM5RytPZGZYSVo5NW9HMWlG?=
 =?utf-8?B?NVlHYmpyamJjZ2tQS1ZZcVEwSCt1M0labHlKSXBXR0hCZVBRdnovOVVDbnU4?=
 =?utf-8?B?bGJFNVJqcXYrZ2JtenBVbVhMOHBUeGZpNllOWGV4WW1MRjlxdEQvOGpubXJT?=
 =?utf-8?B?M2FleGpWL1NPd29SWXlzNlQrSTNYSi9ueS9YSTFMYjV6K0VvZnpiWlUraWNS?=
 =?utf-8?B?Y1VVbTVaU3pLQnk3TC8rUTREeFpyNHIvT0QwY3pvL1dEV1dYTCszUTNUS2dh?=
 =?utf-8?B?T1VMZ0hWSjFBOHpPNSsxd1VWREE5Tm14R0xZTmF6YzhaTnJvcndQcmRHdDBu?=
 =?utf-8?B?YWcrNFEvUVhyWTVhMi9zOEowYXo3dVVrZytnazNPNml3VklMdGVuSTZsWnA5?=
 =?utf-8?B?L1dtSzU2QVNaSkdOWUVEWVRKZ2grWDJBTnVBbkFxTXBLczZqWFJDRXNnV29V?=
 =?utf-8?B?T0kyczlRVlVYeGJUaHQ1ZkFYdjFIMnFqQTZHR3k4YTVlTVJnVitodDZGVksy?=
 =?utf-8?B?eWRwbEhPb3loUFVETC9DblBoRVRtUEIzSFRxblMwVUp2SXBnLzU4ZzU4K1Yv?=
 =?utf-8?B?Ty9sc2tVVW56UFN2M1QrcG8zVFlBclI3c3A0TnFOZUZEWDNVcDd4bzlWazJl?=
 =?utf-8?B?SS9lVGpiaGR2bGpaZ3c5WFVYeUtnTU1BQVZzdXgxNlVEc2xBS0F2K2F6Qllu?=
 =?utf-8?B?SFkvSTIrWHM3WW1tUEJzRzVoTThHL2dFSXVVY0lieHJxVkFpbWkwazdZMnE2?=
 =?utf-8?B?LzI5eGFoazg4RmRXcDc3UnhaN21abzk2L1JaTDRhbUlWY3EvTXRXckEyZ3Fy?=
 =?utf-8?B?ODEya0hGakRIN2Y2YXFmbjZoOElhbTlTM0haS0RPTTFkMTRHcDJxaFNobEZq?=
 =?utf-8?B?b0YrWDczOGpEQnZ0dTNtd05PRGtPeW4vUSsyRnZKT0tIRHN4N3JuY09EQ2t2?=
 =?utf-8?Q?Mnn2hZlUrvoV9XJEyitqagxImMbF9c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3VYZGcxcnB4cW4vMGZ0Z1VWQXBjNVdYRmpmVlhzS2d4Qi91cmx0TnBBUlg1?=
 =?utf-8?B?UEM0cVpnckRjZkduSUZ2dlM1VGduc0Q3MklrWkoyd29lSnpBWWd6V00rWnc1?=
 =?utf-8?B?Nmp2V0tibWk5RTVYQWJYeEJUMmg5YUNmaXZ6SGNRZDF2elp5aDNQK2RLUkNZ?=
 =?utf-8?B?RFJUSGg4dkdmWVY1dSttbUd1WUM0emlTbzlQT29POGZtdG1nM0pVYlNWVllH?=
 =?utf-8?B?ZHo3Vm9aaG0vWndUc1VBMC9zUERBQTZrNWNwV2tuM0Z5d3lKcXduZ3JONk1l?=
 =?utf-8?B?ak9ZZE0wK284SnZ3V0JGUWtndHc5Q3RJYTBKcTlDUTI1TXVwWVhvdzFNKy81?=
 =?utf-8?B?UWZWSDkvRVRGa2Jlak5tQXhlalU1enhLU0lVRU5lS3NBbTc0WUorYXllbHhV?=
 =?utf-8?B?Uzk4bHB4NUoyUnZPTFQ0Vk1jMjVsYmJXMVBxYWJkWEZRQm5iZlh0WVdweFdU?=
 =?utf-8?B?eXRQOHhCeDNKYjlFTzRmU0s2OGxJTTJpNVFGajBpV1JwUGpoZGhscjJnNGFB?=
 =?utf-8?B?RWtWMjh6czk0eFN0R2JQb0VIYUtBY1ZqaDl5eW1XaThQcytza2JyaUVsMjRl?=
 =?utf-8?B?cmhodEU4eXU2eUk0NnMzWFB3RmY5R0tsbG5HaCtlazFMZS9uNnA1dFhBeXBX?=
 =?utf-8?B?WkVYRkpEVzBQQXNRZkRtcm9lSHlyNjREeTdxdmZ2OU1uU2FLMG5IaHMxZVpj?=
 =?utf-8?B?SWJqS1p0YjJUSmMxeWJYVWZ6OHJTemtFQW9JZGphbCtZelBGSXR3MUdkQkcw?=
 =?utf-8?B?d2UwN0lJbUQvcVloOW40MVJGalJ4bXJLSkJLTWJXZjhIajI3bWdQYnpvdHhN?=
 =?utf-8?B?b3I4SWNwNUlBd2tScjB4Z1lkTTg4SzU0cG96ZXRtZEU3QnErRk9tbDl2TW12?=
 =?utf-8?B?RDdJUFVjSDZlTlc4SWt3VTV2dGhHamJDRlFlWmhaRmVXekJnODNoVUQ1V0hU?=
 =?utf-8?B?Z3plSFZLTEkyZHd6MTU5a1pTbEZRWFZRMzNXMXZvNWovZlZmQXpGZUpoRXNX?=
 =?utf-8?B?aHBaYThYZGxXR0lpRE9ZTGRrT3ZkYlFTSzVPYzlNcTEzT1dBSXZXc1FweXZQ?=
 =?utf-8?B?YmZySGtVRUJrT1hVYnd4TGV0d25vVnZwSnE5bzh3WXV0eFlEUGdwV1dSclVB?=
 =?utf-8?B?L1ZtTk9jZEtNbk10YlVIOFFTcCsxaUlzdEt5TGJlTzFCdmRsUzRrbUVQM3c3?=
 =?utf-8?B?Q1d3NEl3NzB3ZDhvQzcxZUJVY09RYU13cERrVG8ybFBxRlJ1RE9ScGIvVjQr?=
 =?utf-8?B?cENMMC9IREViUW5Tb0FnNjFlZHJRcnl1NDZOMUhTa2FNSEwxYnJzY2FyNi80?=
 =?utf-8?B?NFFaTkNZbm1ranBUMVBsM25zVERBRi9mbWllbU5IYWF3ZmpLNEZ4bnJXcXpL?=
 =?utf-8?B?bGR5U0NyOGhtcmQxbCtnbUVKT053UU1yNmxqR0ZBOW8zcWdsS204M21lVS9V?=
 =?utf-8?B?TDBpb2tOVkJYOVJrNzdXY0ZwRFlZN2YyeHA1aWxDV2pkdUx6bk52Rm9wOHcz?=
 =?utf-8?B?OFBEbUprWFpTNkpMWS9JaEw1dGlZcmdLelRQNGh5RkFMWHRQRnZQK1IvaE9n?=
 =?utf-8?B?SjhHRm1FeHdnQ0c1Smtwc2JkTGNiOVU5bTBNbFMvS0I3TnpGUGE2Q0dyaitT?=
 =?utf-8?B?RG1WRFhyM3hEZjNFTW5FZU1zcUUzMWo0SUNZTEhlZC9YNUtNdmpRMVpoN3N0?=
 =?utf-8?B?VDVpQ08rZWNVa0tYMDRLMGhQeVRud0p5Q21FRW5mZExuTlIvUHRFcWFEcXRY?=
 =?utf-8?B?cnNrY1AxN3FaZ0haNm1xTU54aWFlSmV5US95cVUwUnRHSlU0Tk1BcllJb3dx?=
 =?utf-8?B?bFd6cld1UjJ6UGdOa0puSWh4VGhPWEc0U1l5N1VsSHhERkpmeHRJTVF1bHZM?=
 =?utf-8?B?ZkRCNVVQSm5Kb2JHS04rQVhZeXNPNmJnZ1ZYR1V3YmtNdnBmOFZJU1FMTGlB?=
 =?utf-8?B?eW95YUU0Y2xIQkwxTmx3azl5N2hUbkFnQXpieDhHMEl4TXFhM2t6R3lWMXJS?=
 =?utf-8?B?QnRsOWVPazI5UVhIeEhOTHkzQ0hqZTUrcXUvTjBQTjJCNXpRbDlvZjBGa0dK?=
 =?utf-8?B?N0I3bXlLUnlYZnlVTnlEQnNoWG11THNzS012RGVncUUvUUJiUWJ4Rkh1UjlL?=
 =?utf-8?B?anFlZ3Y4bGorNXV3NGR0UTZycWR5NWZkYlZPVWNnRlY5S2Q2VnN3OVdLZ0NK?=
 =?utf-8?B?MGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5082d626-fe56-497f-d2c7-08de10f3260d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 22:42:43.5822 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5xndyj2Vljf4d3TMDs3udvfTot+5526UENLHe2dig9DPfJ9iFZI2HFAb3I8rQrpdeT9FzL6qDR+cPwU4eT0lsuIXm9m086zp4sJHmnxC6Ps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6753
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

The descriptor reuses the KLV format used by GuC and contains metadata
that can be used to quickly fail migration when source is incompatible
with destination.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_migration_data.c | 79 +++++++++++++++++++-
 drivers/gpu/drm/xe/xe_sriov_migration_data.h |  2 +
 drivers/gpu/drm/xe/xe_sriov_pf_migration.c   |  6 ++
 3 files changed, 86 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_migration_data.c b/drivers/gpu/drm/xe/xe_sriov_migration_data.c
index 4cd6c6fc9ba18..b58508c0c30f1 100644
--- a/drivers/gpu/drm/xe/xe_sriov_migration_data.c
+++ b/drivers/gpu/drm/xe/xe_sriov_migration_data.c
@@ -5,6 +5,7 @@
 
 #include "xe_bo.h"
 #include "xe_device.h"
+#include "xe_guc_klv_helpers.h"
 #include "xe_sriov_migration_data.h"
 #include "xe_sriov_pf_helpers.h"
 #include "xe_sriov_pf_migration.h"
@@ -383,11 +384,18 @@ ssize_t xe_sriov_migration_data_write(struct xe_device *xe, unsigned int vfid,
 	return produced;
 }
 
-#define MIGRATION_DESCRIPTOR_DWORDS 0
+#define MIGRATION_KLV_DEVICE_DEVID_KEY	0xf001u
+#define MIGRATION_KLV_DEVICE_DEVID_LEN	1u
+#define MIGRATION_KLV_DEVICE_REVID_KEY	0xf002u
+#define MIGRATION_KLV_DEVICE_REVID_LEN	1u
+
+#define MIGRATION_DESCRIPTOR_DWORDS	(GUC_KLV_LEN_MIN + MIGRATION_KLV_DEVICE_DEVID_LEN + \
+					 GUC_KLV_LEN_MIN + MIGRATION_KLV_DEVICE_REVID_LEN)
 static size_t pf_descriptor_init(struct xe_device *xe, unsigned int vfid)
 {
 	struct xe_sriov_migration_data **desc = pf_pick_descriptor(xe, vfid);
 	struct xe_sriov_migration_data *data;
+	u32 *klvs;
 	int ret;
 
 	data = xe_sriov_migration_data_alloc(xe);
@@ -401,11 +409,80 @@ static size_t pf_descriptor_init(struct xe_device *xe, unsigned int vfid)
 		return ret;
 	}
 
+	klvs = data->vaddr;
+	*klvs++ = PREP_GUC_KLV_CONST(MIGRATION_KLV_DEVICE_DEVID_KEY,
+				     MIGRATION_KLV_DEVICE_DEVID_LEN);
+	*klvs++ = xe->info.devid;
+	*klvs++ = PREP_GUC_KLV_CONST(MIGRATION_KLV_DEVICE_REVID_KEY,
+				     MIGRATION_KLV_DEVICE_REVID_LEN);
+	*klvs++ = xe->info.revid;
+
 	*desc = data;
 
 	return 0;
 }
 
+/**
+ * xe_sriov_migration_data_process_descriptor() - Process migration data descriptor.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ * @data: the &struct xe_sriov_pf_migration_data containing the descriptor
+ *
+ * The descriptor uses the same KLV format as GuC, and contains metadata used for
+ * checking migration data compatibility.
+ *
+ * Return: 0 on success, -errno on failure.
+ */
+int xe_sriov_migration_data_process_descriptor(struct xe_device *xe, unsigned int vfid,
+					       struct xe_sriov_migration_data *data)
+{
+	u32 num_dwords = data->size / sizeof(u32);
+	u32 *klvs = data->vaddr;
+
+	xe_assert(xe, data->type == XE_SRIOV_MIGRATION_DATA_TYPE_DESCRIPTOR);
+	if (data->size % sizeof(u32) != 0)
+		return -EINVAL;
+
+	while (num_dwords >= GUC_KLV_LEN_MIN) {
+		u32 key = FIELD_GET(GUC_KLV_0_KEY, klvs[0]);
+		u32 len = FIELD_GET(GUC_KLV_0_LEN, klvs[0]);
+
+		klvs += GUC_KLV_LEN_MIN;
+		num_dwords -= GUC_KLV_LEN_MIN;
+
+		switch (key) {
+		case MIGRATION_KLV_DEVICE_DEVID_KEY:
+			if (*klvs != xe->info.devid) {
+				xe_sriov_warn(xe,
+					      "Aborting migration, devid mismatch %#04x!=%#04x\n",
+					      *klvs, xe->info.devid);
+				return -ENODEV;
+			}
+			break;
+		case MIGRATION_KLV_DEVICE_REVID_KEY:
+			if (*klvs != xe->info.revid) {
+				xe_sriov_warn(xe,
+					      "Aborting migration, revid mismatch %#04x!=%#04x\n",
+					      *klvs, xe->info.revid);
+				return -ENODEV;
+			}
+			break;
+		default:
+			xe_sriov_dbg(xe,
+				     "Unknown migration descriptor key %#06x - skipping\n", key);
+			break;
+		}
+
+		if (len > num_dwords)
+			return -EINVAL;
+
+		klvs += len;
+		num_dwords -= len;
+	}
+
+	return 0;
+}
+
 static void pf_pending_init(struct xe_device *xe, unsigned int vfid)
 {
 	struct xe_sriov_migration_data **data = pf_pick_pending(xe, vfid);
diff --git a/drivers/gpu/drm/xe/xe_sriov_migration_data.h b/drivers/gpu/drm/xe/xe_sriov_migration_data.h
index 5cde6e9439677..e7f3b332124bc 100644
--- a/drivers/gpu/drm/xe/xe_sriov_migration_data.h
+++ b/drivers/gpu/drm/xe/xe_sriov_migration_data.h
@@ -31,6 +31,8 @@ ssize_t xe_sriov_migration_data_read(struct xe_device *xe, unsigned int vfid,
 				     char __user *buf, size_t len);
 ssize_t xe_sriov_migration_data_write(struct xe_device *xe, unsigned int vfid,
 				      const char __user *buf, size_t len);
+int xe_sriov_migration_data_process_descriptor(struct xe_device *xe, unsigned int vfid,
+					       struct xe_sriov_migration_data *data);
 int xe_sriov_migration_data_save_init(struct xe_device *xe, unsigned int vfid);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
index 029e14f1ffa74..0b4b237780102 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
@@ -176,9 +176,15 @@ xe_sriov_pf_migration_save_consume(struct xe_device *xe, unsigned int vfid)
 static int pf_handle_descriptor(struct xe_device *xe, unsigned int vfid,
 				struct xe_sriov_migration_data *data)
 {
+	int ret;
+
 	if (data->tile != 0 || data->gt != 0)
 		return -EINVAL;
 
+	ret = xe_sriov_migration_data_process_descriptor(xe, vfid, data);
+	if (ret)
+		return ret;
+
 	xe_sriov_migration_data_free(data);
 
 	return 0;
-- 
2.50.1

