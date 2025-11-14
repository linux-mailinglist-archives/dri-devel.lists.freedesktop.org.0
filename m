Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D9EC5E051
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 16:55:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D19410EABE;
	Fri, 14 Nov 2025 15:55:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L3veNE0K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC5EC10E247;
 Fri, 14 Nov 2025 15:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763135732; x=1794671732;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7N2zITchSzm88PyZtWwZiRP3wdelSvk+wdCuJvy9Ttc=;
 b=L3veNE0KVJ1CrNBYME5voByXiDZH98p0YoZwQ7e0grw1xqnmchLGdDz6
 DPrlSG97i8/a/zcGY86c9Z2GJo3zOIf6074QW0a/yfy7j9kPUQveQdoMs
 FgI73/4MdK4sYbJ5J1qk3f3u3T7tqpQgFIDUnd4M75WLFlvfuXhpWgY6C
 nQjxGA6L5VKnDJQumUmJUyvEiyOcOm0s4ixF/LCn0vf0boZn04VFVZUTK
 FcVdrrRAecDXBVmIEFNI/O4rCd2/m5g0pcU3R0LtDj4NKBA1IW/U+/yqg
 S7Z56F39vbqtwAx+BWKoeJE1ZxbZDMLeasUddF8UJ5dSnymUHb0yqmQXz A==;
X-CSE-ConnectionGUID: XaH5YsD/Qrmg2gQ+T5xk5A==
X-CSE-MsgGUID: 1xlWLK9TSS604aU4NVxxvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="64235244"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="64235244"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 07:55:31 -0800
X-CSE-ConnectionGUID: vj7D+rVeRqihkZqCBhc7dw==
X-CSE-MsgGUID: yAo8Z1JNQUOIsNNreua9hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="194968690"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 07:55:31 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 07:55:30 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 14 Nov 2025 07:55:30 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.71) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 07:55:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OkTsQe0vjI3RCSgUxvgKqSqg4vV4rQrk+35/0DG83aJWngsubVnwpSm4tftGxE0IEb87Cm9VlU/RzL3UKAsYH3f6VVd9JZz5SWY4yt+6oX1wND7t1vBJH4Q0UmzUq1xT7AEl3+P1B9YZaaxO+dY7EQxz7UWupT/f+g3V0jbwlmsUeh1eCoAZ3sw1QBRHnr00B5N5axrGRLe0knfJrSC+zHSYjvEWGT0AxLZtsQVJC4sFrcgs35RanB27pKQbLnraiSTWCSI2JIrqlzNijKO7pwbarLuBihvG4detJxb/zQ7TcH4ieLSEZhKu7awuy4HhwtwLiDkqBAdLTfULDog1zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1zFticTjjmG7SfG28XMSPoUtSQRf0rNmQxqWAm9uFMU=;
 b=REESE8/PnOPCz2jBSBHJDWoOCTK/rJe/YICT12CnHnMq+rMtheyHiV12jPG1sTn0RTTCFhooYFL4U8y6Ag3JuHkcSp0pwQ6Ra0luV089iIZ3Kti5yF114PvnjqGBuGeVXnqOKv1aoeqXGB8X1bIFETExZKtpJO0G6Ssd72qEpDoadRvjQXbsBhP0BX87OXJp+kSfcDoZoeuBx7qL60Gd29thgG7WaAB5xhr2cLcG39p1TD5EsPcfvGQRGZybKQihALBN72LbtseN/9RR1TFH2D3FtVnf3F4KzfQbVPNTA+Vm/GPxm7Yccf+eTmNjK1fGfiWK2aJmtOUltJSj+jIStg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN2PR11MB4613.namprd11.prod.outlook.com (2603:10b6:208:26d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 15:55:28 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 15:55:28 +0000
Date: Fri, 14 Nov 2025 09:55:24 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
CC: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Simon Richter
 <Simon.Richter@hogyros.de>, Alex Deucher <alexander.deucher@amd.com>,
 <amd-gfx@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>, "David
 Airlie" <airlied@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, <linux-pci@vger.kernel.org>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Christian =?utf-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 09/11] drm/i915: Remove driver side BAR release before
 resize
Message-ID: <gbr4vccrvzvnt2bbd6fqnqj2rdlj2ggokuu4j4bge4oxazvmfz@2lrm7bmbdr77>
References: <20251113162628.5946-1-ilpo.jarvinen@linux.intel.com>
 <20251113162628.5946-10-ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251113162628.5946-10-ilpo.jarvinen@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0214.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN2PR11MB4613:EE_
X-MS-Office365-Filtering-Correlation-Id: bafb6657-301f-460a-d145-08de23963b24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?IU+aztCaXY+qMZyC0/XMGvEu/EFk9XeVUbD5OMYcFABYwumg3RBKhURlYb?=
 =?iso-8859-1?Q?bs4iUSjMmK+embQNjMnmXbZ1RTS65TdnObmnhq/Y70wNzZH+zH+BI1VCrc?=
 =?iso-8859-1?Q?h+yabVFEIBu+wE+rIS5Q6n6TTeaUpjhlnIO5DgDVQ7phLrGNpLlacS5AEY?=
 =?iso-8859-1?Q?QktIypK06tzp4GyUJWPEXZ9EiLjlizAgPDqaL43VvWpaMJLb8CNjqHXgf9?=
 =?iso-8859-1?Q?Uix+0INPH6CuTZdy5tyfFIhrehcSWYXAphry3i9dZazA2CPpDFuufYpSY1?=
 =?iso-8859-1?Q?oHjKNt8Vr1NRGNHkRCDHSdwtvDWiLvxzhjtFCJttxI5OSBWIofWEYsxfAW?=
 =?iso-8859-1?Q?excJf/63WvvdBNtQDMoaR/svtcweKH2566XIJ6gBYmgEcNpkEZNXTllFWp?=
 =?iso-8859-1?Q?VQmXd9EF74cH2jTy0smGouvCgFei/4Gt70KN3UuWfiAh0/dPbqbL9q0MNB?=
 =?iso-8859-1?Q?BLfN/SOW4ItvEv7xlQS8q9gfNZltqV/7tW+Mr+nP1dkXen31cTANJKWmx+?=
 =?iso-8859-1?Q?hS2UvagmBnt4INYRw101V68bZbMetyduXVo7LAACwGiF/yXL2LTjpIfXZk?=
 =?iso-8859-1?Q?zsK/nHcwy6DQsbe5/N4uKSoUx+ey+jYhN/3Js02GvxE1yG7ay8hDfxlDkE?=
 =?iso-8859-1?Q?jv5nBCxuHUwulQpr5Z0NSYA6dEgbfLtBrZTfPz3Hv+ZR/WuchcIfjQFVsl?=
 =?iso-8859-1?Q?2cOB6cdQYNxGAGOL4efCLF+1MLhXHyfREHR0haR7s7Zi4Xhe6qNTv5Ti6E?=
 =?iso-8859-1?Q?MFU/imfJubWdvds5CRFOSERGT2Mc7jf8R5rcyNUkYorYQLuWc9SzzPD84v?=
 =?iso-8859-1?Q?2LlWoJkwjGauzVFydZ5ruGWLy1FOSOzJPRLxuI/zus4f/bOBZRX40l1ISu?=
 =?iso-8859-1?Q?4F8Tr3az5tfPk4SB7+sN/DM2ljsVGjuY/JiZDbLZq0VF42b6sUKlDlsLHc?=
 =?iso-8859-1?Q?gPL9zmYqMwc3/qHHxiflny4bJ3epNHa6awfZK+CymYAstJUUs0x7jk5SEj?=
 =?iso-8859-1?Q?oDuAwLO+L+SQLUKCImo/Yj6EIjcdqq7SRHEtNRnT3lkBoUyaoZWQX4Pa56?=
 =?iso-8859-1?Q?9q4sJGRO70K9rg9ANyVqwTR5nS/XG0H3hv/vMmssazDFpYgKtpvMhY5c+l?=
 =?iso-8859-1?Q?mvLF6tOmbdTdeDfvUnI8o+umzTrlI/L0uMmibwVF3D81shlYHwFlo810/m?=
 =?iso-8859-1?Q?gWCP+yHpz9I4z0qeHwe8dCRu3eqKqyH+RvkBaqYm9EPMxdd23bcTm/uqCN?=
 =?iso-8859-1?Q?umUDYqBy/67+fz8/G4QRV7xcCRBFhNsm3V8vkOWOWz1LwngZc7gqWPGwyi?=
 =?iso-8859-1?Q?rQxDvVuVz9/d/uJ2KsS7ewDS7nWuh1FIALbVgYVKy09fFflLhK0ulx6qLT?=
 =?iso-8859-1?Q?ZxPGL2i168oGISM6zXgo8HRY8DRj80ejnpyxDoTaHcIUrb421oQlik7qiU?=
 =?iso-8859-1?Q?J4iNH0Fa0M8/ydZuJn3u4DxosbqPSWW1e6DVMndDIAckYwSEj2D4SiVkaS?=
 =?iso-8859-1?Q?GeJHefqh8ieAHCyX+0C7V8CZf4MNkNBdWAVW6B4NEJ4A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ZncUQpbQQb2EylF2UPlz8bxpW+VAs7Xpw8ZrQzYCDOCk6OQuS5TzdZtXON?=
 =?iso-8859-1?Q?nztS6MDBM7OcVfjwi4XSU6zlJJ4QWRYtKJBZ/E/+5zgamvO2AIrS4/Vyvn?=
 =?iso-8859-1?Q?6FWJcQ4c+tLKrr19zqqWnbTISQ1AaCkTPje7Bc74u8OnMXjAFOdZDKwBvX?=
 =?iso-8859-1?Q?C2ICPjuzXkBtXTIN0UYBYN8j1dUY1/KQq3F91mkqOTLTJc8b4ADcCq3MUQ?=
 =?iso-8859-1?Q?i+vz9deYHfDrgbTH42QQXrBF/cna6C/G/tOoVLTyKK4Lqc65Gl/DuCzAt3?=
 =?iso-8859-1?Q?o/AyweJw0ima5JIAYHC90E9oc83hGKpFvp7QSPhkUDo5tgd8zu8mYnpJUE?=
 =?iso-8859-1?Q?VKEE42eG90sHX8UUnVujyWv8YD5ZXR97Mcrp+nESE6a5nY9gmRfbrVWfnA?=
 =?iso-8859-1?Q?8UnDGtXKt61uLsG29pADw+IC2ogkPrd20IcCyi5+z1+NjsR6Of3T+rMQpq?=
 =?iso-8859-1?Q?vR23oFU/ExIV9ctwY8NHx61k07z4YArgL9Xp7rgauF+S3ONawY6AX3oea6?=
 =?iso-8859-1?Q?BpVGMBdsFxcGLMdxHyF4kFPbCjbux2l0E79uFc2SiSC2egTSUNs46vu+lt?=
 =?iso-8859-1?Q?uFmmC9aVhflBYqdIjph89yS0HW0EtYUjFp2rzDjfvOUeWp0TfhdNLu74HY?=
 =?iso-8859-1?Q?TRty/c6zEaZdiW59Nyma5ANIcFGFzO8ceLE+Ask8UReNx0IqKLm+kxuvTZ?=
 =?iso-8859-1?Q?zYnwRjYRd6DdLf9kfmDZcBjRru9UwER8dM7afHojuMZA9K9iLqc14v3YLh?=
 =?iso-8859-1?Q?xRR4lXA7xh+dZ58/Iz41my0UeOUl1+QFbBxiq0pW5/BWOeyGod7q3cxlWG?=
 =?iso-8859-1?Q?PM9dLTeg5EI3AJw+Dd2o6wiQQwQjXjFm9FQkHgztrfAlhSOOkNwVMnOmar?=
 =?iso-8859-1?Q?wH7anF3dbynpt2z5k7zZgmRECpDfJoFPUBDpJpklYx6ywUHVDXzjG6iJ1o?=
 =?iso-8859-1?Q?g/rUl1eslPJ3gZD3ZIvubHXrcTrt18k9yWI+08lzyxCsKYnQejCVMThatN?=
 =?iso-8859-1?Q?sylUmTKewuW9yLOhY/gc0x1DaPdSFt0D/fzkt7K8v+F4DDxgIT/VeIhGah?=
 =?iso-8859-1?Q?xuuAa+qDP37ugptuQrO+2zsUSHUPWcfWJXTvB+VnrxMiZLI4Vn1HJJVKL2?=
 =?iso-8859-1?Q?x9cBge/fl9tAqccJQyqA5YiKRRnRZ6WZxVKXccKZgo9Je8HWlQXzTplh9a?=
 =?iso-8859-1?Q?tviwI19DrNmRHHzltAe3aeEImpOcSPK65MBVWD3/V/uOUwJuOHbyFrFITU?=
 =?iso-8859-1?Q?QwxvckysnmeYs5e03WvA3HZ70dRvZNpfKK1TTxPIZDfRAFWD8DBUr+3T4L?=
 =?iso-8859-1?Q?sp7eDbdY0i7BJ4ECQ6Y2S7KgURojgaZXeMRb2Ccum8h3D2U+6yu4QITtw0?=
 =?iso-8859-1?Q?CvY/qVfjJg8YpOwAnn0x/S/ya/khswi6yJoDzGkSAa8m4klmOeVftF7HR6?=
 =?iso-8859-1?Q?tvX5nI/0cG/vlAA5l15RNn7iQDvzXjUvpJqXnMVzEiXPJND5FhGTvb/Bwm?=
 =?iso-8859-1?Q?a0pqBCX5Om1S0uBfx9sva5BKj/1+N5qXtWMy6QXok8BZ2DFaSogy2Pq++j?=
 =?iso-8859-1?Q?VJUMb+KNo42CbuEDf7BJvuTRYdJhg0tylxtDFmNV689BYpZN9ABXFi6rQx?=
 =?iso-8859-1?Q?QAjiUcJSLaBK2/xNqWJWNAnpcJpQiOUNNIfx0IFv8/VvI0J3c5Ko6Lqw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bafb6657-301f-460a-d145-08de23963b24
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 15:55:27.9568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jq5OlK0GppB95yFN+uTiy6EiMErowOkWHb9txzgr5nHJqrzkF3JHcQNcbCItbE8jwQ5bBBMpGfSQS9T5r4EqTL9p5hNkw3GmEbEetMWt+qk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4613
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

On Thu, Nov 13, 2025 at 06:26:26PM +0200, Ilpo Järvinen wrote:
>PCI core handles releasing device's resources and their rollback in
>case of failure of a BAR resizing operation. Releasing resource prior
>to calling pci_resize_resource() prevents PCI core from restoring the
>BARs as they were.
>
>Remove driver-side release of BARs from the i915 driver.
>
>Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

I also applied it to drm-tip from today and submitted for xe and i915
tests: https://lore.kernel.org/all/20251114154338.4161137-2-lucas.demarchi@intel.com

pass by comment... the forcewake handling in the middle of BAR resizing
is insane but it's probably because it's already very late in the probe
sequence. Moving it to early probe like was done in xe would allow it to
be simplified too.

Lucas De Marchi
