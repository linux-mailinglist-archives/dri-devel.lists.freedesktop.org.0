Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E374AD24BB
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 19:08:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0403510E406;
	Mon,  9 Jun 2025 17:08:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k6XybNi2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3517810E3C6;
 Mon,  9 Jun 2025 17:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749488894; x=1781024894;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=apTcFCicXR3dCcMhlqcn6TSQGOq+inhCrYM0LiZXDXE=;
 b=k6XybNi2L22/uzmnxQCPblYMTgfOlcOIGXbn242xdSkeRlgDXr5ZmCsf
 y6bBazfpUU677tkHPMdZBnrFsd2mTRuECmX45zZgas8kCLFRiRpyDj+32
 VxTN79yLck56z76Jzoh355aYUKaDSykouMHkKind4LG7HIqBdv8RgdtLk
 L/xUgZEd59s7gxoOWvDq2XSVLg0QiFxede8tOzvfy0EKv4xpG+6N0HHZM
 hQRBlLYMPhHnzaame2lMeAXQu5oi7fhs7x/fSr4qUJK+vcHbzprendKRf
 7wly1wMeOmCkLD1BqN8TXfDqGlE1Q7MKd7siQJvQneSsSrYgHXeRIaMxh A==;
X-CSE-ConnectionGUID: 2jnHHp0YRkOSzwZMhNs1qg==
X-CSE-MsgGUID: qKhzC0JvTYmD/PbBuGxVdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51484471"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="51484471"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 10:08:14 -0700
X-CSE-ConnectionGUID: Bm+Fm4fRRPeB5iyOZz5gzw==
X-CSE-MsgGUID: KXnnS+JDRmGYhZVVxbEdDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="151380550"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 10:08:13 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 10:08:13 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 10:08:13 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.86)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 10:08:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qwwXHi5XYFEFSG/IIJuqzb3VZeToY/q7IhJmVVwsCeoPdA422jur6l8ym8+E+0Cy2X+i60FsU8IwwCJ1Wf3naL+A9/1TXtlAdpI9oXMw8pZ8v6iMySe5nX2eeu+F6amh2gWepvNyBs1SMQE69hbtb2F1/esbQSc4fXd5VJcwRuVseD6ByaBoWwyDhzfrFi0Zjf7QtDwrNMUBCK/yLWIl2xOu/ru30Ui5EooTUYW1jlBiKS6FV8al08g+eBdSoC0Mir0X2blFIf9/luEwHHUwmtnv+iXrhrgdT/8oB6VVUXxKzr/8eCv7uJBgAUo2R+u3vwiWEWNzuhte5h61oJJ5ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vSDdndAh3DapcBZa3UiPZTuAikBtzDFH3kNYGbwhqGE=;
 b=jGBJVJuVeIit2t/4lNxR2FwRWoWn9PPGN0LQc7kZTIPzTX0Zm+2dvFk9v+12rKUavF3XkgwTRxjIrz3RE4goamqXvuhuVA4loMefot+p6tCbClxBxF5+R69dSqs2UFDz7uHvfGCDWSa5975clGuTg6Pu9mZY8vfiIQvZcJg3fV/Hjl+bWl4w+XRUlWa1J6SfidmbX/5QYbMc6oDQ5P7okbI2gGA0MN+hPuzUmjb2veygk7BBA3jBjoru5nFSHsRxzlYb58W1MMyxf/VVfVo0UauFB4N1RiTAm2pEXWI6Rn5MnQOHhl43BjTXWnXavRPe7nWXuZ+1xqTlpwa/Y3HFMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV8PR11MB8463.namprd11.prod.outlook.com (2603:10b6:408:1ed::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Mon, 9 Jun
 2025 17:07:56 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8813.020; Mon, 9 Jun 2025
 17:07:56 +0000
Date: Mon, 9 Jun 2025 10:09:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, "Dafna
 Hirschfeld" <dafna.hirschfeld@intel.com>
Subject: Re: [PATCH v4 7/8] drm/xe/userptr: replace xe_hmm with gpusvm
Message-ID: <aEcVSkuCvu4uQp30@lstrano-desk.jf.intel.com>
References: <20250512150637.61462-10-matthew.auld@intel.com>
 <20250512150637.61462-17-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250512150637.61462-17-matthew.auld@intel.com>
X-ClientProxiedBy: MW4PR03CA0242.namprd03.prod.outlook.com
 (2603:10b6:303:b4::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV8PR11MB8463:EE_
X-MS-Office365-Filtering-Correlation-Id: dd49cb45-da04-455b-31a2-08dda7782de0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?NpktWRz9e4AOzpFZSxtana9nrxQtSwhAHx5bEaUypGhSo6aLa/l4QekehO?=
 =?iso-8859-1?Q?XbqVBER0jc7qvseR7IydUe7lLAo1GVg02waw272q75sX+XwfscEezk97PM?=
 =?iso-8859-1?Q?g2s5UcpT+ITt5/Vjl1LiKxf53NwihLy34WcRwpmohVYn7hwIf5BQd2xg7R?=
 =?iso-8859-1?Q?x9wBQp77yjyxsnUNB9zzfO5t7x+8/fv9XrKdwmLR1yTtyiWVg2NGl2OG5s?=
 =?iso-8859-1?Q?yp6cfZgP2X833G6QV4WIGCwT/VQLedLRFDDhh143Eja5Od5u3Kt9fVtEWU?=
 =?iso-8859-1?Q?8W8SfPSNYngFcSpoDpH3y76KcPLDxrbVjhvy9WdQ+VY8ikvqR9ITmFHFbj?=
 =?iso-8859-1?Q?KnZhKkli9txSolI5S5skkNq1c8a6mlfOeJuRkc4GWpe42UvGNjlobomZ5V?=
 =?iso-8859-1?Q?SFeFMHoGiSh8TNrgnfGX2oot5FRlv6d16ZllfZrwU18yJQIsfAFFC2X9Y1?=
 =?iso-8859-1?Q?7LD6UUuMa3RazSUeJKbEovek8g02+1RiPvTQE6bozwtG7hDKWT1u2TI/Hd?=
 =?iso-8859-1?Q?HMD2MbQzvnti0JteifVjKzw+qVJJAKZZwGPMU9EETxVnb9K3gMPIHAKSVL?=
 =?iso-8859-1?Q?aGv/Kl9Zeke7PrvTfrj6O8ZQV7WdzCv2Y5Wk9L05rqhV6nZ0oAcNQE9GsP?=
 =?iso-8859-1?Q?hjfu8foRFEUICxrrhscTVWuGMz/pZWh6emQV6tqHWIBJSeRofnqPpkEF/K?=
 =?iso-8859-1?Q?7HH1gdQSrF1KJIAyJ1F0EMHwdKfVzKE2XQE2iaB7mATB9aEBY8VaiZ/xlz?=
 =?iso-8859-1?Q?V1mxU6pxwaHDIYpe+3BK2dIfc2YcDW/NmUcssaI8NmGPqQhCjh7sTmQfw3?=
 =?iso-8859-1?Q?GPYsIN6WwshX7oFFvZxuuazS1klkJm3YJTswGnmOAA6WPgQqIj1D8JkJtY?=
 =?iso-8859-1?Q?KQrpMLwnh+ZdByY4NR3sCxMz6QoOGQqfUsNY65MNQfkJF8QpJDrlOKPQYV?=
 =?iso-8859-1?Q?HAN1QUpSgAHqFyi7fuVyjtRxTXkKmJiv8PW7rhGYFCTJEvgOW0r6xUhC2K?=
 =?iso-8859-1?Q?JqJaexTgxkOsJWIVUIrFTyDskOm+eXF8FMMaDNSJRgDqz0FtgsSQcEs7bw?=
 =?iso-8859-1?Q?liEl4Lhgkvsir8ny/xhtLbausbHlOul6WITmQ6t7tEMK5et+6pMCjomLRr?=
 =?iso-8859-1?Q?LKC4tRIW5Z7/I6ebnmwQ44nFV+4/Ja450EcbL9bTeIXUxdk4me6HvIIdkD?=
 =?iso-8859-1?Q?Ts3/ZSvArVcU+yrDoVXoD31TY7TYqYtCdaSjjpOUo/Zy2uqJ/PQQD6457d?=
 =?iso-8859-1?Q?9bbUx7PG1bC1f3bKeamVEoYFC72vwsh94nrGlLNpuWsMgFrlrGP40frYEt?=
 =?iso-8859-1?Q?X4l7irIUjwlLI/yDn0l3JmcZpjkGiPJabTGkXI5hO8B9YGytwYSiZpRNQP?=
 =?iso-8859-1?Q?oK5vVDSdzzxdulIo102IcYzB11l8F0FoGXJJDLYRC0QTriCJzsT7UoNTeJ?=
 =?iso-8859-1?Q?yYxwLDXqIDrsIJkq09UN4nSqECxIK09tu/cz087OWaqyA4aB9Io7o+ceGM?=
 =?iso-8859-1?Q?k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?CHywMwAS1Fq4AyB6UmdoS0zECc+UkI0FknbJxftnxHPDGxDhBMkgABVbxq?=
 =?iso-8859-1?Q?RNuNioHAvjdTuxWU06XfL/4dfdh2udaTT9DnnWBMsAzvMAq0Oyhq97Itca?=
 =?iso-8859-1?Q?PlrFs0Iom+i+8/ASk0x4iRLJovwUgQ9Zzzf2UFd3p4YhlrtEeNkZqQmdHy?=
 =?iso-8859-1?Q?yJ9lxNCktllBsXWmfZ0aV1C/lK8z7Aiz4KubITNcU1e3eGMpczdNoaexdO?=
 =?iso-8859-1?Q?ngiWxBfAXdX3qkyTNrFoRFuecTnvM66trk9SEWORPVO6mAy4eXcQWvYqNo?=
 =?iso-8859-1?Q?aOSBXlzfxey1/5gBMwmNLE/bkjRbO7TgaikDH7umKBW3Y/dxWpPg3x71Qx?=
 =?iso-8859-1?Q?52VxDNeUAazMTjOajp/XPIFh2mlKH2oCAjZm20HcB527nfZO77KDPGn29A?=
 =?iso-8859-1?Q?zIaN0seukYBLN7IldWi8UmNH1K0xcR6VdR9jpdqLJFvoECXmrnsnIxjAHZ?=
 =?iso-8859-1?Q?kmL5Osy26A2bw/eIRoUb0B91LfwsR1EoGvnfqVOcKbGFqkGrSp6Bdk6lfF?=
 =?iso-8859-1?Q?zQWeN1jgBqj9spdgj9VKB+xFt14z62oELtc6zhRyZpLvSgYE07xl2XQQL3?=
 =?iso-8859-1?Q?4tmGu2sDwCIyx95bdQmobLY1196HafNxJ5/Djr8D0cwjzbIP85F1NA/1FD?=
 =?iso-8859-1?Q?3N7R8RG9SsMfBQZGejIufLWJgFq9bMIS1Q2bfImcH1HnPu7IkUOWKPotMG?=
 =?iso-8859-1?Q?zK2vLC8hqUFNKv7OC4z7RrKm39CiQv8CgOOUHj7m4xX5wqjQp/pQDh+Gbz?=
 =?iso-8859-1?Q?jlFtjeSfB4zNrgYA135SqFGbOsk3KCiRjq4Hlfsr7/MxVNsMi0xSz6VsWT?=
 =?iso-8859-1?Q?LhodWHHwr5PYrkRytSm69m4H6T0LMJrzirMKJY7U+0JIlqI3OsvyYx9OHY?=
 =?iso-8859-1?Q?sfkoA9F2XIAbsVxAJyWaim+BjnkOA54lWy32/HGxT4ZHYEALvsFvKwS8Rp?=
 =?iso-8859-1?Q?nR3s9E4b1KnmV7aD6dD9YEQxqkvvAWF6EbdnLahKr559Ks8xJRGiFGODPi?=
 =?iso-8859-1?Q?JHA2GYpePKmUlVhNTqvOwe5bm0Av02LNMRq4YjydI9NwLUY7aCeYvc3ERs?=
 =?iso-8859-1?Q?k5c7QDl/GXnSggNf84HdU3s/LhDL2IlUDvACTeeADmCQHp/aMoZ1Vllpd1?=
 =?iso-8859-1?Q?c/kP32denv1M+o+R7Z0isFV+ORE1JecclE5D3Bh1+wtohQtvgNUYUz2K5v?=
 =?iso-8859-1?Q?NxHSVgiowutWBW1z5ei6DEaPJvx9MiXKUutBfnGYugS7GdQloYiC5kK86g?=
 =?iso-8859-1?Q?yAktCzMxSyuzPCTG8Tjj+HSFpYFz4svEahw4EEJd4RlKpmd+2aQ/vIcqSn?=
 =?iso-8859-1?Q?2smc1fRIAxR6AEuiIrXyngqSRzd0+r1rBXyJ/7zTPLKhDIHTFjDgajVGVU?=
 =?iso-8859-1?Q?liumJT0y5B7L0LWLlcMQLnfFYythlAO5W6qd2i7KB/5B28e7M7vFDDpibu?=
 =?iso-8859-1?Q?sTStXsY5t6kJgua7CL60NTbMoUzbovjrhoAcTEpvpyKVCJZI2pWvVuKq4h?=
 =?iso-8859-1?Q?gIg5C/q5nT5EAiHOQ5QdJq3T8lCEGbD0r3/gX5smTAi662HjFyaXSi83IM?=
 =?iso-8859-1?Q?Mh4v6qE79fJwFy1fnpW2P/qDv+oyLJE8+Oov3ZdfDU7rMlEKrQrYSUGf8R?=
 =?iso-8859-1?Q?ufdlzAC2uhhWr2zXtqJuLRMZ+UH7sorr8O2MSig+2182SzarqQ/kt57g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd49cb45-da04-455b-31a2-08dda7782de0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 17:07:56.6561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tn9IZZ2/pvn85wLDVVHUSXzajSQJswhcjnkPokgFOYNl7X3bwGZoEmGqf66fXZqzmVmAPreGHDJcoycbOZwsCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8463
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

On Mon, May 12, 2025 at 04:06:45PM +0100, Matthew Auld wrote:
> Goal here is cut over to gpusvm and remove xe_hmm, relying instead on
> common code. The core facilities we need are get_pages(), unmap_pages()
> and free_pages() for a given useptr range, plus a vm level notifier
> lock, which is now provided by gpusvm.
> 
> v2:
>   - Reuse the same SVM vm struct we use for full SVM, that way we can
>     use the same lock (Matt B & Himal)
> v3:
>   - Re-use svm_init/fini for userptr.
> v4:
>   - Allow building xe without userptr if we are missing DRM_GPUSVM
>     config. (Matt B)
>   - Always make .read_only match xe_vma_read_only() for the ctx. (Dafna)
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/Kconfig       |   2 +-
>  drivers/gpu/drm/xe/Makefile      |   3 +-
>  drivers/gpu/drm/xe/xe_exec.c     |   5 +-
>  drivers/gpu/drm/xe/xe_hmm.c      | 325 -------------------------------
>  drivers/gpu/drm/xe/xe_hmm.h      |  18 --
>  drivers/gpu/drm/xe/xe_pt.c       |  22 +--
>  drivers/gpu/drm/xe/xe_svm.c      |  32 +--
>  drivers/gpu/drm/xe/xe_svm.h      |  58 ++++--
>  drivers/gpu/drm/xe/xe_userptr.c  |  32 ++-
>  drivers/gpu/drm/xe/xe_userptr.h  |  44 +++--
>  drivers/gpu/drm/xe/xe_vm.c       |  44 ++---
>  drivers/gpu/drm/xe/xe_vm_types.h |   2 +-
>  12 files changed, 150 insertions(+), 437 deletions(-)
>  delete mode 100644 drivers/gpu/drm/xe/xe_hmm.c
>  delete mode 100644 drivers/gpu/drm/xe/xe_hmm.h
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 9bce047901b2..0187902e6139 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -38,12 +38,12 @@ config DRM_XE
>  	select DRM_TTM
>  	select DRM_TTM_HELPER
>  	select DRM_EXEC
> +	select DRM_GPUSVM if !UML && DEVICE_PRIVATE
>  	select DRM_GPUVM
>  	select DRM_SCHED
>  	select MMU_NOTIFIER
>  	select WANT_DEV_COREDUMP
>  	select AUXILIARY_BUS
> -	select HMM_MIRROR
>  	help
>  	  Experimental driver for Intel Xe series GPUs
>  
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 10b42118e761..5275a76d0b8e 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -116,7 +116,6 @@ xe-y += xe_bb.o \
>  	xe_tuning.o \
>  	xe_uc.o \
>  	xe_uc_fw.o \
> -	xe_userptr.o \
>  	xe_vm.o \
>  	xe_vram.o \
>  	xe_vram_freq.o \
> @@ -125,8 +124,8 @@ xe-y += xe_bb.o \
>  	xe_wait_user_fence.o \
>  	xe_wopcm.o
>  
> -xe-$(CONFIG_HMM_MIRROR) += xe_hmm.o
>  xe-$(CONFIG_DRM_XE_GPUSVM) += xe_svm.o
> +xe-$(CONFIG_DRM_GPUSVM) += xe_userptr.o
>  
>  # graphics hardware monitoring (HWMON) support
>  xe-$(CONFIG_HWMON) += xe_hwmon.o
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 44364c042ad7..25a59b6934f6 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -19,6 +19,7 @@
>  #include "xe_ring_ops_types.h"
>  #include "xe_sched_job.h"
>  #include "xe_sync.h"
> +#include "xe_svm.h"
>  #include "xe_vm.h"
>  
>  /**
> @@ -294,7 +295,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		if (err)
>  			goto err_put_job;
>  
> -		err = down_read_interruptible(&vm->userptr.notifier_lock);
> +		err = xe_svm_notifier_lock_interruptible(vm);
>  		if (err)
>  			goto err_put_job;
>  
> @@ -336,7 +337,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  
>  err_repin:
>  	if (!xe_vm_in_lr_mode(vm))
> -		up_read(&vm->userptr.notifier_lock);
> +		xe_svm_notifier_unlock(vm);
>  err_put_job:
>  	if (err)
>  		xe_sched_job_put(job);
> diff --git a/drivers/gpu/drm/xe/xe_hmm.c b/drivers/gpu/drm/xe/xe_hmm.c
> deleted file mode 100644
> index 57b71956ddf4..000000000000
> --- a/drivers/gpu/drm/xe/xe_hmm.c
> +++ /dev/null
> @@ -1,325 +0,0 @@
> -// SPDX-License-Identifier: MIT
> -/*
> - * Copyright © 2024 Intel Corporation
> - */
> -
> -#include <linux/scatterlist.h>
> -#include <linux/mmu_notifier.h>
> -#include <linux/dma-mapping.h>
> -#include <linux/memremap.h>
> -#include <linux/swap.h>
> -#include <linux/hmm.h>
> -#include <linux/mm.h>
> -#include "xe_hmm.h"
> -#include "xe_vm.h"
> -#include "xe_bo.h"
> -
> -static u64 xe_npages_in_range(unsigned long start, unsigned long end)
> -{
> -	return (end - start) >> PAGE_SHIFT;
> -}
> -
> -static int xe_alloc_sg(struct xe_device *xe, struct sg_table *st,
> -		       struct hmm_range *range, struct rw_semaphore *notifier_sem)
> -{
> -	unsigned long i, npages, hmm_pfn;
> -	unsigned long num_chunks = 0;
> -	int ret;
> -
> -	/* HMM docs says this is needed. */
> -	ret = down_read_interruptible(notifier_sem);
> -	if (ret)
> -		return ret;
> -
> -	if (mmu_interval_read_retry(range->notifier, range->notifier_seq)) {
> -		up_read(notifier_sem);
> -		return -EAGAIN;
> -	}
> -
> -	npages = xe_npages_in_range(range->start, range->end);
> -	for (i = 0; i < npages;) {
> -		unsigned long len;
> -
> -		hmm_pfn = range->hmm_pfns[i];
> -		xe_assert(xe, hmm_pfn & HMM_PFN_VALID);
> -
> -		len = 1UL << hmm_pfn_to_map_order(hmm_pfn);
> -
> -		/* If order > 0 the page may extend beyond range->start */
> -		len -= (hmm_pfn & ~HMM_PFN_FLAGS) & (len - 1);
> -		i += len;
> -		num_chunks++;
> -	}
> -	up_read(notifier_sem);
> -
> -	return sg_alloc_table(st, num_chunks, GFP_KERNEL);
> -}
> -
> -/**
> - * xe_build_sg() - build a scatter gather table for all the physical pages/pfn
> - * in a hmm_range. dma-map pages if necessary. dma-address is save in sg table
> - * and will be used to program GPU page table later.
> - * @xe: the xe device who will access the dma-address in sg table
> - * @range: the hmm range that we build the sg table from. range->hmm_pfns[]
> - * has the pfn numbers of pages that back up this hmm address range.
> - * @st: pointer to the sg table.
> - * @notifier_sem: The xe notifier lock.
> - * @write: whether we write to this range. This decides dma map direction
> - * for system pages. If write we map it bi-diretional; otherwise
> - * DMA_TO_DEVICE
> - *
> - * All the contiguous pfns will be collapsed into one entry in
> - * the scatter gather table. This is for the purpose of efficiently
> - * programming GPU page table.
> - *
> - * The dma_address in the sg table will later be used by GPU to
> - * access memory. So if the memory is system memory, we need to
> - * do a dma-mapping so it can be accessed by GPU/DMA.
> - *
> - * FIXME: This function currently only support pages in system
> - * memory. If the memory is GPU local memory (of the GPU who
> - * is going to access memory), we need gpu dpa (device physical
> - * address), and there is no need of dma-mapping. This is TBD.
> - *
> - * FIXME: dma-mapping for peer gpu device to access remote gpu's
> - * memory. Add this when you support p2p
> - *
> - * This function allocates the storage of the sg table. It is
> - * caller's responsibility to free it calling sg_free_table.
> - *
> - * Returns 0 if successful; -ENOMEM if fails to allocate memory
> - */
> -static int xe_build_sg(struct xe_device *xe, struct hmm_range *range,
> -		       struct sg_table *st,
> -		       struct rw_semaphore *notifier_sem,
> -		       bool write)
> -{
> -	unsigned long npages = xe_npages_in_range(range->start, range->end);
> -	struct device *dev = xe->drm.dev;
> -	struct scatterlist *sgl;
> -	struct page *page;
> -	unsigned long i, j;
> -
> -	lockdep_assert_held(notifier_sem);
> -
> -	i = 0;
> -	for_each_sg(st->sgl, sgl, st->nents, j) {
> -		unsigned long hmm_pfn, size;
> -
> -		hmm_pfn = range->hmm_pfns[i];
> -		page = hmm_pfn_to_page(hmm_pfn);
> -		xe_assert(xe, !is_device_private_page(page));
> -
> -		size = 1UL << hmm_pfn_to_map_order(hmm_pfn);
> -		size -= page_to_pfn(page) & (size - 1);
> -		i += size;
> -
> -		if (unlikely(j == st->nents - 1)) {
> -			xe_assert(xe, i >= npages);
> -			if (i > npages)
> -				size -= (i - npages);
> -
> -			sg_mark_end(sgl);
> -		} else {
> -			xe_assert(xe, i < npages);
> -		}
> -
> -		sg_set_page(sgl, page, size << PAGE_SHIFT, 0);
> -	}
> -
> -	return dma_map_sgtable(dev, st, write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE,
> -			       DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_NO_KERNEL_MAPPING);
> -}
> -
> -static void xe_hmm_userptr_set_mapped(struct xe_userptr_vma *uvma)
> -{
> -	struct xe_userptr *userptr = &uvma->userptr;
> -	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
> -
> -	lockdep_assert_held_write(&vm->lock);
> -	lockdep_assert_held(&vm->userptr.notifier_lock);
> -
> -	mutex_lock(&userptr->unmap_mutex);
> -	xe_assert(vm->xe, !userptr->mapped);
> -	userptr->mapped = true;
> -	mutex_unlock(&userptr->unmap_mutex);
> -}
> -
> -void xe_hmm_userptr_unmap(struct xe_userptr_vma *uvma)
> -{
> -	struct xe_userptr *userptr = &uvma->userptr;
> -	struct xe_vma *vma = &uvma->vma;
> -	bool write = !xe_vma_read_only(vma);
> -	struct xe_vm *vm = xe_vma_vm(vma);
> -	struct xe_device *xe = vm->xe;
> -
> -	if (!lockdep_is_held_type(&vm->userptr.notifier_lock, 0) &&
> -	    !lockdep_is_held_type(&vm->lock, 0) &&
> -	    !(vma->gpuva.flags & XE_VMA_DESTROYED)) {
> -		/* Don't unmap in exec critical section. */
> -		xe_vm_assert_held(vm);
> -		/* Don't unmap while mapping the sg. */
> -		lockdep_assert_held(&vm->lock);
> -	}
> -
> -	mutex_lock(&userptr->unmap_mutex);
> -	if (userptr->sg && userptr->mapped)
> -		dma_unmap_sgtable(xe->drm.dev, userptr->sg,
> -				  write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE, 0);
> -	userptr->mapped = false;
> -	mutex_unlock(&userptr->unmap_mutex);
> -}
> -
> -/**
> - * xe_hmm_userptr_free_sg() - Free the scatter gather table of userptr
> - * @uvma: the userptr vma which hold the scatter gather table
> - *
> - * With function xe_userptr_populate_range, we allocate storage of
> - * the userptr sg table. This is a helper function to free this
> - * sg table, and dma unmap the address in the table.
> - */
> -void xe_hmm_userptr_free_sg(struct xe_userptr_vma *uvma)
> -{
> -	struct xe_userptr *userptr = &uvma->userptr;
> -
> -	xe_assert(xe_vma_vm(&uvma->vma)->xe, userptr->sg);
> -	xe_hmm_userptr_unmap(uvma);
> -	sg_free_table(userptr->sg);
> -	userptr->sg = NULL;
> -}
> -
> -/**
> - * xe_hmm_userptr_populate_range() - Populate physical pages of a virtual
> - * address range
> - *
> - * @uvma: userptr vma which has information of the range to populate.
> - * @is_mm_mmap_locked: True if mmap_read_lock is already acquired by caller.
> - *
> - * This function populate the physical pages of a virtual
> - * address range. The populated physical pages is saved in
> - * userptr's sg table. It is similar to get_user_pages but call
> - * hmm_range_fault.
> - *
> - * This function also read mmu notifier sequence # (
> - * mmu_interval_read_begin), for the purpose of later
> - * comparison (through mmu_interval_read_retry).
> - *
> - * This must be called with mmap read or write lock held.
> - *
> - * This function allocates the storage of the userptr sg table.
> - * It is caller's responsibility to free it calling sg_free_table.
> - *
> - * returns: 0 for success; negative error no on failure
> - */
> -int xe_hmm_userptr_populate_range(struct xe_userptr_vma *uvma,
> -				  bool is_mm_mmap_locked)
> -{
> -	unsigned long timeout =
> -		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
> -	unsigned long *pfns;
> -	struct xe_userptr *userptr;
> -	struct xe_vma *vma = &uvma->vma;
> -	u64 userptr_start = xe_vma_userptr(vma);
> -	u64 userptr_end = userptr_start + xe_vma_size(vma);
> -	struct xe_vm *vm = xe_vma_vm(vma);
> -	struct hmm_range hmm_range = {
> -		.pfn_flags_mask = 0, /* ignore pfns */
> -		.default_flags = HMM_PFN_REQ_FAULT,
> -		.start = userptr_start,
> -		.end = userptr_end,
> -		.notifier = &uvma->userptr.notifier,
> -		.dev_private_owner = vm->xe,
> -	};
> -	bool write = !xe_vma_read_only(vma);
> -	unsigned long notifier_seq;
> -	u64 npages;
> -	int ret;
> -
> -	userptr = &uvma->userptr;
> -
> -	if (is_mm_mmap_locked)
> -		mmap_assert_locked(userptr->notifier.mm);
> -
> -	if (vma->gpuva.flags & XE_VMA_DESTROYED)
> -		return 0;
> -
> -	notifier_seq = mmu_interval_read_begin(&userptr->notifier);
> -	if (notifier_seq == userptr->notifier_seq)
> -		return 0;
> -
> -	if (userptr->sg)
> -		xe_hmm_userptr_free_sg(uvma);
> -
> -	npages = xe_npages_in_range(userptr_start, userptr_end);
> -	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
> -	if (unlikely(!pfns))
> -		return -ENOMEM;
> -
> -	if (write)
> -		hmm_range.default_flags |= HMM_PFN_REQ_WRITE;
> -
> -	if (!mmget_not_zero(userptr->notifier.mm)) {
> -		ret = -EFAULT;
> -		goto free_pfns;
> -	}
> -
> -	hmm_range.hmm_pfns = pfns;
> -
> -	while (true) {
> -		hmm_range.notifier_seq = mmu_interval_read_begin(&userptr->notifier);
> -
> -		if (!is_mm_mmap_locked)
> -			mmap_read_lock(userptr->notifier.mm);
> -
> -		ret = hmm_range_fault(&hmm_range);
> -
> -		if (!is_mm_mmap_locked)
> -			mmap_read_unlock(userptr->notifier.mm);
> -
> -		if (ret == -EBUSY) {
> -			if (time_after(jiffies, timeout))
> -				break;
> -
> -			continue;
> -		}
> -		break;
> -	}
> -
> -	mmput(userptr->notifier.mm);
> -
> -	if (ret)
> -		goto free_pfns;
> -
> -	ret = xe_alloc_sg(vm->xe, &userptr->sgt, &hmm_range, &vm->userptr.notifier_lock);
> -	if (ret)
> -		goto free_pfns;
> -
> -	ret = down_read_interruptible(&vm->userptr.notifier_lock);
> -	if (ret)
> -		goto free_st;
> -
> -	if (mmu_interval_read_retry(hmm_range.notifier, hmm_range.notifier_seq)) {
> -		ret = -EAGAIN;
> -		goto out_unlock;
> -	}
> -
> -	ret = xe_build_sg(vm->xe, &hmm_range, &userptr->sgt,
> -			  &vm->userptr.notifier_lock, write);
> -	if (ret)
> -		goto out_unlock;
> -
> -	userptr->sg = &userptr->sgt;
> -	xe_hmm_userptr_set_mapped(uvma);
> -	userptr->notifier_seq = hmm_range.notifier_seq;
> -	up_read(&vm->userptr.notifier_lock);
> -	kvfree(pfns);
> -	return 0;
> -
> -out_unlock:
> -	up_read(&vm->userptr.notifier_lock);
> -free_st:
> -	sg_free_table(&userptr->sgt);
> -free_pfns:
> -	kvfree(pfns);
> -	return ret;
> -}
> diff --git a/drivers/gpu/drm/xe/xe_hmm.h b/drivers/gpu/drm/xe/xe_hmm.h
> deleted file mode 100644
> index 0ea98d8e7bbc..000000000000
> --- a/drivers/gpu/drm/xe/xe_hmm.h
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -/* SPDX-License-Identifier: MIT
> - *
> - * Copyright © 2024 Intel Corporation
> - */
> -
> -#ifndef _XE_HMM_H_
> -#define _XE_HMM_H_
> -
> -#include <linux/types.h>
> -
> -struct xe_userptr_vma;
> -
> -int xe_hmm_userptr_populate_range(struct xe_userptr_vma *uvma, bool is_mm_mmap_locked);
> -
> -void xe_hmm_userptr_free_sg(struct xe_userptr_vma *uvma);
> -
> -void xe_hmm_userptr_unmap(struct xe_userptr_vma *uvma);
> -#endif
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 720c25bf48f2..92b6a4d63bb1 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -757,8 +757,8 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  
>  	if (!xe_vma_is_null(vma) && !range) {
>  		if (xe_vma_is_userptr(vma))
> -			xe_res_first_sg(to_userptr_vma(vma)->userptr.sg, 0,
> -					xe_vma_size(vma), &curs);
> +			xe_res_first_dma(to_userptr_vma(vma)->userptr.pages.dma_addr, 0,
> +					 xe_vma_size(vma), &curs);
>  		else if (xe_bo_is_vram(bo) || xe_bo_is_stolen(bo))
>  			xe_res_first(bo->ttm.resource, xe_vma_bo_offset(vma),
>  				     xe_vma_size(vma), &curs);
> @@ -1029,7 +1029,7 @@ static void xe_pt_commit_locks_assert(struct xe_vma *vma)
>  	xe_pt_commit_prepare_locks_assert(vma);
>  
>  	if (xe_vma_is_userptr(vma))
> -		lockdep_assert_held_read(&vm->userptr.notifier_lock);
> +		xe_svm_assert_held_read(vm);
>  }
>  
>  static void xe_pt_commit(struct xe_vma *vma,
> @@ -1369,7 +1369,7 @@ static int vma_check_userptr(struct xe_vm *vm, struct xe_vma *vma,
>  	struct xe_userptr_vma *uvma;
>  	unsigned long notifier_seq;
>  
> -	lockdep_assert_held_read(&vm->userptr.notifier_lock);
> +	xe_svm_assert_held_read(vm);
>  
>  	if (!xe_vma_is_userptr(vma))
>  		return 0;
> @@ -1378,7 +1378,7 @@ static int vma_check_userptr(struct xe_vm *vm, struct xe_vma *vma,
>  	if (xe_pt_userptr_inject_eagain(uvma))
>  		xe_vma_userptr_force_invalidate(uvma);
>  
> -	notifier_seq = uvma->userptr.notifier_seq;
> +	notifier_seq = uvma->userptr.pages.notifier_seq;
>  
>  	if (!mmu_interval_read_retry(&uvma->userptr.notifier,
>  				     notifier_seq))
> @@ -1399,7 +1399,7 @@ static int op_check_userptr(struct xe_vm *vm, struct xe_vma_op *op,
>  {
>  	int err = 0;
>  
> -	lockdep_assert_held_read(&vm->userptr.notifier_lock);
> +	xe_svm_assert_held_read(vm);
>  
>  	switch (op->base.op) {
>  	case DRM_GPUVA_OP_MAP:
> @@ -1440,12 +1440,12 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
>  	if (err)
>  		return err;
>  
> -	down_read(&vm->userptr.notifier_lock);
> +	down_read(&vm->svm.gpusvm.notifier_lock);
>  
>  	list_for_each_entry(op, &vops->list, link) {
>  		err = op_check_userptr(vm, op, pt_update_ops);
>  		if (err) {
> -			up_read(&vm->userptr.notifier_lock);
> +			up_read(&vm->svm.gpusvm.notifier_lock);
>  			break;
>  		}
>  	}
> @@ -2172,7 +2172,7 @@ static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
>  	if (invalidate_on_bind)
>  		vma->tile_invalidated |= BIT(tile->id);
>  	if (xe_vma_is_userptr(vma)) {
> -		lockdep_assert_held_read(&vm->userptr.notifier_lock);
> +		xe_svm_assert_held_read(vm);
>  		to_userptr_vma(vma)->userptr.initial_bind = true;
>  	}
>  
> @@ -2208,7 +2208,7 @@ static void unbind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
>  	if (!vma->tile_present) {
>  		list_del_init(&vma->combined_links.rebind);
>  		if (xe_vma_is_userptr(vma)) {
> -			lockdep_assert_held_read(&vm->userptr.notifier_lock);
> +			xe_svm_assert_held_read(vm);
>  
>  			spin_lock(&vm->userptr.invalidated_lock);
>  			list_del_init(&to_userptr_vma(vma)->userptr.invalidate_link);
> @@ -2457,7 +2457,7 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
>  	if (pt_update_ops->needs_svm_lock)
>  		xe_svm_notifier_unlock(vm);
>  	if (pt_update_ops->needs_userptr_lock)
> -		up_read(&vm->userptr.notifier_lock);
> +		up_read(&vm->svm.gpusvm.notifier_lock);
>  
>  	return fence;
>  
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 74301064004c..73a1ac850957 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -606,22 +606,26 @@ int xe_svm_init(struct xe_vm *vm)
>  {
>  	int err;
>  
> -	spin_lock_init(&vm->svm.garbage_collector.lock);
> -	INIT_LIST_HEAD(&vm->svm.garbage_collector.range_list);
> -	INIT_WORK(&vm->svm.garbage_collector.work,
> -		  xe_svm_garbage_collector_work_func);
> +	if (vm->flags & XE_VM_FLAG_FAULT_MODE) {
> +		spin_lock_init(&vm->svm.garbage_collector.lock);
> +		INIT_LIST_HEAD(&vm->svm.garbage_collector.range_list);
> +		INIT_WORK(&vm->svm.garbage_collector.work,
> +			  xe_svm_garbage_collector_work_func);
>  
> -	err = drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM", &vm->xe->drm,
> -			      current->mm, xe_svm_devm_owner(vm->xe), 0,
> -			      vm->size, xe_modparam.svm_notifier_size * SZ_1M,
> -			      &gpusvm_ops, fault_chunk_sizes,
> -			      ARRAY_SIZE(fault_chunk_sizes));
> -	if (err)
> -		return err;
> +		err = drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM", &vm->xe->drm,
> +				      current->mm, xe_svm_devm_owner(vm->xe), 0,
> +				      vm->size,
> +				      xe_modparam.svm_notifier_size * SZ_1M,
> +				      &gpusvm_ops, fault_chunk_sizes,
> +				      ARRAY_SIZE(fault_chunk_sizes));
> +		drm_gpusvm_driver_set_lock(&vm->svm.gpusvm, &vm->lock);
> +	} else {
> +		err = drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM (simple)",
> +				      &vm->xe->drm, NULL, NULL, 0, 0, 0, NULL,
> +				      NULL, 0);
> +	}
>  
> -	drm_gpusvm_driver_set_lock(&vm->svm.gpusvm, &vm->lock);
> -
> -	return 0;
> +	return err;
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index bf9792b66869..247bf19361e5 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -87,20 +87,15 @@ static inline bool xe_svm_range_has_dma_mapping(struct xe_svm_range *range)
>  	return range->base.pages.flags.has_dma_mapping;
>  }
>  
> -#define xe_svm_assert_in_notifier(vm__) \
> -	lockdep_assert_held_write(&(vm__)->svm.gpusvm.notifier_lock)
> -
> -#define xe_svm_notifier_lock(vm__)	\
> -	drm_gpusvm_notifier_lock(&(vm__)->svm.gpusvm)
> -
> -#define xe_svm_notifier_unlock(vm__)	\
> -	drm_gpusvm_notifier_unlock(&(vm__)->svm.gpusvm)
> -
>  void xe_svm_flush(struct xe_vm *vm);
>  
>  #else
>  #include <linux/interval_tree.h>
>  
> +#include "xe_assert.h"
> +#include "xe_vm.h"
> +#include "xe_vm_types.h"
> +
>  struct drm_pagemap_device_addr;
>  struct xe_bo;
>  struct xe_gt;
> @@ -136,12 +131,22 @@ int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
>  static inline
>  int xe_svm_init(struct xe_vm *vm)
>  {
> +#if IS_ENABLED(CONFIG_DRM_GPUSVM)
> +	return drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM (simple)", &vm->xe->drm,
> +			       NULL, NULL, 0, 0, 0, NULL, NULL, 0);
> +#else
>  	return 0;
> +#endif
>  }
>  
>  static inline
>  void xe_svm_fini(struct xe_vm *vm)
>  {
> +	xe_assert(vm->xe, xe_vm_is_closed(vm));
> +
> +#if IS_ENABLED(CONFIG_DRM_GPUSVM)
> +	drm_gpusvm_fini(&vm->svm.gpusvm);
> +#endif
>  }
>  
>  static inline
> @@ -174,19 +179,46 @@ void xe_svm_range_debug(struct xe_svm_range *range, const char *operation)
>  {
>  }
>  
> +static inline void xe_svm_flush(struct xe_vm *vm)
> +{
> +}
> +#endif /* CONFIG_DRM_XE_GPUSVM */
> +
> +#if IS_ENABLED(CONFIG_DRM_GPUSVM) /* Need to support userptr without XE_GPUSVM */
> +#define xe_svm_assert_in_notifier(vm__) \
> +	lockdep_assert_held_write(&(vm__)->svm.gpusvm.notifier_lock)
> +
> +#define xe_svm_assert_held_read(vm__) \
> +	lockdep_assert_held_read(&(vm__)->svm.gpusvm.notifier_lock)
> +
> +#define xe_svm_notifier_lock(vm__)	\
> +	drm_gpusvm_notifier_lock(&(vm__)->svm.gpusvm)
> +
> +#define xe_svm_notifier_lock_interruptible(vm__)	\
> +	down_read_interruptible(&(vm__)->svm.gpusvm.notifier_lock)
> +
> +#define xe_svm_notifier_unlock(vm__)	\
> +	drm_gpusvm_notifier_unlock(&(vm__)->svm.gpusvm)
> +#else
>  #define xe_svm_assert_in_notifier(...) do {} while (0)
>  #define xe_svm_range_has_dma_mapping(...) false
>  
> +static inline void xe_svm_assert_held_read(struct xe_vm *vm)
> +{
> +}
> +
>  static inline void xe_svm_notifier_lock(struct xe_vm *vm)
>  {
>  }
>  
> +static inline int xe_svm_notifier_lock_interruptible(struct xe_vm *vm)
> +{
> +	return 0;
> +}
> +
>  static inline void xe_svm_notifier_unlock(struct xe_vm *vm)
>  {
>  }
> +#endif /* CONFIG_DRM_GPUSVM */
>  
> -static inline void xe_svm_flush(struct xe_vm *vm)
> -{
> -}
> -#endif
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_userptr.c
> index f573842a3d4b..ccf453f96795 100644
> --- a/drivers/gpu/drm/xe/xe_userptr.c
> +++ b/drivers/gpu/drm/xe/xe_userptr.c
> @@ -7,7 +7,6 @@
>  
>  #include <linux/mm.h>
>  
> -#include "xe_hmm.h"
>  #include "xe_trace_bo.h"
>  
>  /**
> @@ -25,7 +24,7 @@
>  int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma)
>  {
>  	return mmu_interval_check_retry(&uvma->userptr.notifier,
> -					uvma->userptr.notifier_seq) ?
> +					uvma->userptr.pages.notifier_seq) ?
>  		-EAGAIN : 0;
>  }
>  
> @@ -34,11 +33,22 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
>  	struct xe_vma *vma = &uvma->vma;
>  	struct xe_vm *vm = xe_vma_vm(vma);
>  	struct xe_device *xe = vm->xe;
> +	struct drm_gpusvm_ctx ctx = {
> +		.read_only = xe_vma_read_only(vma),
> +	};
>  
>  	lockdep_assert_held(&vm->lock);
>  	xe_assert(xe, xe_vma_is_userptr(vma));
>  
> -	return xe_hmm_userptr_populate_range(uvma, false);
> +	if (vma->gpuva.flags & XE_VMA_DESTROYED)
> +		return 0;
> +
> +	return drm_gpusvm_get_pages(&vm->svm.gpusvm, &uvma->userptr.pages,
> +				    uvma->userptr.notifier.mm,
> +				    &uvma->userptr.notifier,
> +				    xe_vma_userptr(vma),
> +				    xe_vma_userptr(vma) + xe_vma_size(vma),
> +				    &ctx);
>  }
>  
>  static void __vma_userptr_invalidate(struct xe_vm *vm, struct xe_userptr_vma *uvma)
> @@ -47,6 +57,10 @@ static void __vma_userptr_invalidate(struct xe_vm *vm, struct xe_userptr_vma *uv
>  	struct xe_vma *vma = &uvma->vma;
>  	struct dma_resv_iter cursor;
>  	struct dma_fence *fence;
> +	struct drm_gpusvm_ctx ctx = {
> +		.in_notifier = true,
> +		.read_only = xe_vma_read_only(vma),
> +	};
>  	long err;
>  
>  	/*
> @@ -83,7 +97,8 @@ static void __vma_userptr_invalidate(struct xe_vm *vm, struct xe_userptr_vma *uv
>  		XE_WARN_ON(err);
>  	}
>  
> -	xe_hmm_userptr_unmap(uvma);
> +	drm_gpusvm_unmap_pages(&vm->svm.gpusvm, &uvma->userptr.pages,
> +			       xe_vma_size(vma) >> PAGE_SHIFT, &ctx);
>  }
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
> @@ -263,7 +278,6 @@ int xe_userptr_setup(struct xe_userptr_vma *uvma, unsigned long start,
>  
>  	INIT_LIST_HEAD(&userptr->invalidate_link);
>  	INIT_LIST_HEAD(&userptr->repin_link);
> -	mutex_init(&userptr->unmap_mutex);
>  
>  	err = mmu_interval_notifier_insert(&userptr->notifier, current->mm,
>  					   start, range,
> @@ -271,17 +285,18 @@ int xe_userptr_setup(struct xe_userptr_vma *uvma, unsigned long start,
>  	if (err)
>  		return err;
>  
> -	userptr->notifier_seq = LONG_MAX;
> +	userptr->pages.notifier_seq = LONG_MAX;
>  
>  	return 0;
>  }
>  
>  void xe_userptr_remove(struct xe_userptr_vma *uvma)
>  {
> +	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
>  	struct xe_userptr *userptr = &uvma->userptr;
>  
> -	if (userptr->sg)
> -		xe_hmm_userptr_free_sg(uvma);
> +	drm_gpusvm_free_pages(&vm->svm.gpusvm, &uvma->userptr.pages,
> +			      xe_vma_size(&uvma->vma) >> PAGE_SHIFT);
>  
>  	/*
>  	 * Since userptr pages are not pinned, we can't remove
> @@ -289,7 +304,6 @@ void xe_userptr_remove(struct xe_userptr_vma *uvma)
>  	 * them anymore
>  	 */
>  	mmu_interval_notifier_remove(&userptr->notifier);
> -	mutex_destroy(&userptr->unmap_mutex);
>  }
>  
>  void xe_userptr_destroy(struct xe_userptr_vma *uvma)
> diff --git a/drivers/gpu/drm/xe/xe_userptr.h b/drivers/gpu/drm/xe/xe_userptr.h
> index 83d17b58ed16..47c883e5fa33 100644
> --- a/drivers/gpu/drm/xe/xe_userptr.h
> +++ b/drivers/gpu/drm/xe/xe_userptr.h
> @@ -12,6 +12,8 @@
>  #include <linux/scatterlist.h>
>  #include <linux/spinlock.h>
>  
> +#include <drm/drm_gpusvm.h>
> +
>  struct xe_vm;
>  struct xe_vma;
>  struct xe_userptr_vma;
> @@ -23,11 +25,6 @@ struct xe_userptr_vm {
>  	 * and needs repinning. Protected by @lock.
>  	 */
>  	struct list_head repin_list;
> -	/**
> -	 * @notifier_lock: protects notifier in write mode and
> -	 * submission in read mode.
> -	 */
> -	struct rw_semaphore notifier_lock;
>  	/**
>  	 * @userptr.invalidated_lock: Protects the
>  	 * @userptr.invalidated list.
> @@ -51,31 +48,27 @@ struct xe_userptr {
>  	struct list_head invalidate_link;
>  	/** @userptr: link into VM repin list if userptr. */
>  	struct list_head repin_link;
> +	/**
> +	 * @pages: gpusvm pages for this user pointer.
> +	 */
> +	struct drm_gpusvm_pages pages;
>  	/**
>  	 * @notifier: MMU notifier for user pointer (invalidation call back)
>  	 */
>  	struct mmu_interval_notifier notifier;
> -	/** @sgt: storage for a scatter gather table */
> -	struct sg_table sgt;
> -	/** @sg: allocated scatter gather table */
> -	struct sg_table *sg;
> -	/** @notifier_seq: notifier sequence number */
> -	unsigned long notifier_seq;
> -	/** @unmap_mutex: Mutex protecting dma-unmapping */
> -	struct mutex unmap_mutex;
> +
>  	/**
>  	 * @initial_bind: user pointer has been bound at least once.
> -	 * write: vm->userptr.notifier_lock in read mode and vm->resv held.
> -	 * read: vm->userptr.notifier_lock in write mode or vm->resv held.
> +	 * write: vm->svm.gpusvm.notifier_lock in read mode and vm->resv held.
> +	 * read: vm->svm.gpusvm.notifier_lock in write mode or vm->resv held.
>  	 */
>  	bool initial_bind;
> -	/** @mapped: Whether the @sgt sg-table is dma-mapped. Protected by @unmap_mutex. */
> -	bool mapped;
>  #if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
>  	u32 divisor;
>  #endif
>  };
>  
> +#if IS_ENABLED(CONFIG_DRM_GPUSVM)
>  void xe_userptr_remove(struct xe_userptr_vma *uvma);
>  int xe_userptr_setup(struct xe_userptr_vma *uvma, unsigned long start,
>  		     unsigned long range);
> @@ -86,6 +79,23 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm);
>  int xe_vm_userptr_check_repin(struct xe_vm *vm);
>  int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma);
>  int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma);
> +#else
> +static inline void xe_userptr_remove(struct xe_userptr_vma *uvma) {}
> +
> +static inline int xe_userptr_setup(struct xe_userptr_vma *uvma,
> +				   unsigned long start, unsigned long range)
> +{
> +	return -ENODEV;
> +}
> +
> +static inline void xe_userptr_destroy(struct xe_userptr_vma *uvma) {}
> +
> +static inline int xe_vm_userptr_pin(struct xe_vm *vm) { return 0; }
> +static inline int __xe_vm_userptr_needs_repin(struct xe_vm *vm) { return 0; }
> +static inline int xe_vm_userptr_check_repin(struct xe_vm *vm) { return 0; }
> +static inline int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma) { return -ENODEV; }
> +static inline int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma) { return -ENODEV; };
> +#endif
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
>  void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index e5bf4ddc9d86..1373a51f75dd 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -39,9 +39,7 @@
>  #include "xe_svm.h"
>  #include "xe_sync.h"
>  #include "xe_trace_bo.h"
> -#include "xe_userptr.h"
>  #include "xe_wa.h"
> -#include "xe_hmm.h"
>  
>  static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
>  {
> @@ -219,7 +217,7 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
>  	++vm->preempt.num_exec_queues;
>  	q->lr.pfence = pfence;
>  
> -	down_read(&vm->userptr.notifier_lock);
> +	xe_svm_notifier_lock(vm);
>  
>  	drm_gpuvm_resv_add_fence(&vm->gpuvm, exec, pfence,
>  				 DMA_RESV_USAGE_BOOKKEEP, DMA_RESV_USAGE_BOOKKEEP);
> @@ -233,7 +231,7 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
>  	if (wait)
>  		dma_fence_enable_sw_signaling(pfence);
>  
> -	up_read(&vm->userptr.notifier_lock);
> +	xe_svm_notifier_unlock(vm);
>  
>  out_fini:
>  	drm_exec_fini(exec);
> @@ -497,9 +495,9 @@ static void preempt_rebind_work_func(struct work_struct *w)
>  	(!(__tries)++ || __xe_vm_userptr_needs_repin(__vm)) : \
>  	__xe_vm_userptr_needs_repin(__vm))
>  
> -	down_read(&vm->userptr.notifier_lock);
> +	xe_svm_notifier_lock(vm);
>  	if (retry_required(tries, vm)) {
> -		up_read(&vm->userptr.notifier_lock);
> +		xe_svm_notifier_unlock(vm);
>  		err = -EAGAIN;
>  		goto out_unlock;
>  	}
> @@ -513,7 +511,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
>  	/* Point of no return. */
>  	arm_preempt_fences(vm, &preempt_fences);
>  	resume_and_reinstall_preempt_fences(vm, &exec);
> -	up_read(&vm->userptr.notifier_lock);
> +	xe_svm_notifier_unlock(vm);
>  
>  out_unlock:
>  	drm_exec_fini(&exec);
> @@ -1389,7 +1387,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  
>  	INIT_LIST_HEAD(&vm->userptr.repin_list);
>  	INIT_LIST_HEAD(&vm->userptr.invalidated);
> -	init_rwsem(&vm->userptr.notifier_lock);
>  	spin_lock_init(&vm->userptr.invalidated_lock);
>  
>  	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
> @@ -1489,11 +1486,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  		}
>  	}
>  
> -	if (flags & XE_VM_FLAG_FAULT_MODE) {
> -		err = xe_svm_init(vm);
> -		if (err)
> -			goto err_close;
> -	}
> +	err = xe_svm_init(vm);
> +	if (err)
> +		goto err_close;
>  
>  	if (number_tiles > 1)
>  		vm->composite_fence_ctx = dma_fence_context_alloc(1);
> @@ -1599,9 +1594,9 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>  		vma = gpuva_to_vma(gpuva);
>  
>  		if (xe_vma_has_no_bo(vma)) {
> -			down_read(&vm->userptr.notifier_lock);
> +			xe_svm_notifier_lock(vm);
>  			vma->gpuva.flags |= XE_VMA_DESTROYED;
> -			up_read(&vm->userptr.notifier_lock);
> +			xe_svm_notifier_unlock(vm);
>  		}
>  
>  		xe_vm_remove_vma(vm, vma);
> @@ -1645,8 +1640,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>  		xe_vma_destroy_unlocked(vma);
>  	}
>  
> -	if (xe_vm_in_fault_mode(vm))
> -		xe_svm_fini(vm);
> +	xe_svm_fini(vm);
>  
>  	up_write(&vm->lock);
>  
> @@ -1877,9 +1871,9 @@ static const u32 region_to_mem_type[] = {
>  static void prep_vma_destroy(struct xe_vm *vm, struct xe_vma *vma,
>  			     bool post_commit)
>  {
> -	down_read(&vm->userptr.notifier_lock);
> +	xe_svm_notifier_lock(vm);
>  	vma->gpuva.flags |= XE_VMA_DESTROYED;
> -	up_read(&vm->userptr.notifier_lock);
> +	xe_svm_notifier_unlock(vm);
>  	if (post_commit)
>  		xe_vm_remove_vma(vm, vma);
>  }
> @@ -2375,9 +2369,9 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
>  		struct xe_vma *vma = gpuva_to_vma(op->base.unmap.va);
>  
>  		if (vma) {
> -			down_read(&vm->userptr.notifier_lock);
> +			xe_svm_notifier_lock(vm);
>  			vma->gpuva.flags &= ~XE_VMA_DESTROYED;
> -			up_read(&vm->userptr.notifier_lock);
> +			xe_svm_notifier_unlock(vm);
>  			if (post_commit)
>  				xe_vm_insert_vma(vm, vma);
>  		}
> @@ -2396,9 +2390,9 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
>  			xe_vma_destroy_unlocked(op->remap.next);
>  		}
>  		if (vma) {
> -			down_read(&vm->userptr.notifier_lock);
> +			xe_svm_notifier_lock(vm);
>  			vma->gpuva.flags &= ~XE_VMA_DESTROYED;
> -			up_read(&vm->userptr.notifier_lock);
> +			xe_svm_notifier_unlock(vm);
>  			if (post_commit)
>  				xe_vm_insert_vma(vm, vma);
>  		}
> @@ -2903,6 +2897,8 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
>  				 op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
>  		    XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE &&
>  				 op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
> +		    XE_IOCTL_DBG(xe, op == DRM_XE_VM_BIND_OP_MAP_USERPTR &&
> +				 !IS_ENABLED(CONFIG_DRM_GPUSVM)) ||
>  		    XE_IOCTL_DBG(xe, obj &&
>  				 op == DRM_XE_VM_BIND_OP_PREFETCH) ||
>  		    XE_IOCTL_DBG(xe, prefetch_region &&
> @@ -3379,7 +3375,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>  		if (xe_vma_is_userptr(vma)) {
>  			WARN_ON_ONCE(!mmu_interval_check_retry
>  				     (&to_userptr_vma(vma)->userptr.notifier,
> -				      to_userptr_vma(vma)->userptr.notifier_seq));
> +				      to_userptr_vma(vma)->userptr.pages.notifier_seq));
>  			WARN_ON_ONCE(!dma_resv_test_signaled(xe_vm_resv(xe_vma_vm(vma)),
>  							     DMA_RESV_USAGE_BOOKKEEP));
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 65e889f2537d..5d0391001e33 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -79,7 +79,7 @@ struct xe_vma {
>  	/**
>  	 * @tile_present: GT mask of binding are present for this VMA.
>  	 * protected by vm->lock, vm->resv and for userptrs,
> -	 * vm->userptr.notifier_lock for writing. Needs either for reading,
> +	 * vm->svm.gpusvm.notifier_lock for writing. Needs either for reading,
>  	 * but if reading is done under the vm->lock only, it needs to be held
>  	 * in write mode.
>  	 */
> -- 
> 2.49.0
> 
