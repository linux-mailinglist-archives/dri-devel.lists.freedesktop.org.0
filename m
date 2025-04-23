Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C65A994B1
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 18:19:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D9C210E012;
	Wed, 23 Apr 2025 16:19:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QvEmg2Ms";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF1E910E012;
 Wed, 23 Apr 2025 16:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745425189; x=1776961189;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=diejS0MDQAgoqoB1jgDHqlV4dWfRH8hpZoGV7/0Gezs=;
 b=QvEmg2MsSBj1huR4i2XL1KP7yQTxJ+2vXw5SFWKYvgyUXbsbLBUjU7up
 FnHKeojEqPVnw3P/uOptRstyhE2+cAY3Zx1DMCJBbJPjKjsA0UIsA8F06
 yACby0BOrn/QsWRUeyuOjsycNpuhNsdnvyYHyrr3jFpmDBaGGwY+2V6iK
 2ZaIze4fDg5TBGVIlS24zgQWM0hqXZw1C3XyKJXYhhkiVvG4NxoqR5cZp
 cRccNREWm5561bHRbD4IPpFsqp6a6KGxYa/Aey3EwG6auBct14c20nJRS
 CWWhmreGWHDC42eW/ABIzRCDz/qUJTnhnN/HysIU5jahXTZbD6vlLO4mB g==;
X-CSE-ConnectionGUID: Ryy7aJqeTzO3Ay1AEhamug==
X-CSE-MsgGUID: EFt3BcZQQ5688HzX+CZZ6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="64554644"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="64554644"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 09:19:41 -0700
X-CSE-ConnectionGUID: ijB6bq6NR3So/p8VpTlp1g==
X-CSE-MsgGUID: xijEPdvxTz6SE7ZUhaOUvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="169567608"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 09:19:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 23 Apr 2025 09:19:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 23 Apr 2025 09:19:39 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 23 Apr 2025 09:19:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pwk4b7Krq23r8KMgG2Iedd/Gbju9/U2eDULR0y+iTZe33NxJHEkHEaMVbpT/9+G3z7mYUITlNBGK/A6zh0YdtPUZuYoKWn8tlTjVXVddUXYMnqMtMv6UWsPjbGhZZ47qi6P4nqVn+RF22cSn2pyJzXdwa28tzfNFK9X7RKBhhE0K5ZMPIHQNtFCCgS8vp/VXhJbi60Q+MfeHwd+KchvvUcnZYPswHIRIEj3VWZW9+l/aMi0DkU5djGWk8gRP4szAGf38LP0ykAjusUWEMfldz5TsfcBPnF5bule26zqFV8+qlpM/FpFgAm0+jNqb3ZY4S7EkEV2cO7YW15EoRi3bVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QwG4yltx9y8fIUGqTjBFQn2/yYA+o/Tut+rEe/DxBHs=;
 b=sd2sdmVCm0NK4l7kYcCHtoktEKW/YPhIYxiwdJltuOfvx1x9DhAWjti/Y362MEj68UwUB03OUmlWZ7lDbkd3G77UUQX9ooioI3Xl63pwZLEo3dOZj7dD2ZEgttUyj30rFBgEYRdKOxUFPGjzUK2HoxGdiRx1w3f/sR4WkAymAF6p6S3WKQh9W4ZRuGmem2yx3OiB8E9QcBfjOkFJFYhJMSpXaJKkNmVcMgoEoy9oo8Ln2n7LfZsjze4y4xbtXvfytVhMkpssgz5vSOePSgYegc7AHlFC/6Rld3Pe0Id79QpN8KRrL8uvIjW9oVNueDbIOWfWq19Qw6CL6DTV5ZPTqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4710.namprd11.prod.outlook.com (2603:10b6:208:262::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 16:18:56 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8655.037; Wed, 23 Apr 2025
 16:18:56 +0000
Date: Wed, 23 Apr 2025 09:20:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 7/7] drm/xe/pt: unify xe_pt_svm_pre_commit with userptr
Message-ID: <aAkTQF0NOmV4ET3f@lstrano-desk.jf.intel.com>
References: <20250328181028.288312-9-matthew.auld@intel.com>
 <20250328181028.288312-16-matthew.auld@intel.com>
 <Z+78wBNpgGG+D7h9@lstrano-desk.jf.intel.com>
 <bd0476de-fd5b-4ea6-806f-ca49b33b9404@intel.com>
 <Z/AQk2fRiIfNRF1I@lstrano-desk.jf.intel.com>
 <2f6914f1-161b-473e-be7e-603540a8eb8f@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2f6914f1-161b-473e-be7e-603540a8eb8f@intel.com>
X-ClientProxiedBy: MW4PR04CA0118.namprd04.prod.outlook.com
 (2603:10b6:303:83::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4710:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f544cc5-6611-4251-5890-08dd82828bd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Cegx1Epgll2uMdvPX3XVIVNLBFw8Kl0DYawGrbRWaCVeJibjXoCrFV18nB?=
 =?iso-8859-1?Q?LfzN4ktZvZkQp8NxiMs40Ivdmax1MPwKeaoXaVO2FPa0MtBuJuyHrmsHnW?=
 =?iso-8859-1?Q?HcRRBGZ2nYOVbQgciy5Ea1Bwqt5MybGqV2rZJOVBUlXiwbH9azWvD/k3XJ?=
 =?iso-8859-1?Q?pm6SQaE/GbIEyi4+mMJv1J10Y18TM6wQRGj86ESDj/lOj/hwHrB539kVew?=
 =?iso-8859-1?Q?7VKKoIKmavIW23eJfgiEvdoMpPG1oxopHkFIpF4gar8olXEt8ewHrHdDpV?=
 =?iso-8859-1?Q?H121e9uSSd/+uErex48Pfu/VZb1gujv6PtzE3OAOOF35VkwCTOVLFUsSHt?=
 =?iso-8859-1?Q?JezIBhP8NtcYLVGGQLZj9Q11Z3d8PpsM+zM6VvSKGeKhGqv32wG3anzFcX?=
 =?iso-8859-1?Q?sZW7AmZLu1CjSiwiB0NF/4AuYmZ2biV6f+gBJdOvBHC0m9uKWsNMnmamdK?=
 =?iso-8859-1?Q?K6X9zj6OfOaPlwEvrWMF/+s4ol2oTKh90bL05zY9cvvGBRguevEkWdJlJo?=
 =?iso-8859-1?Q?ncn/IaTIkhv1I7ke68Fnvno6FOtnIGWe5d4qNTeuyUxR3XmR9zUd6Y0ngI?=
 =?iso-8859-1?Q?ikwayc6WaXYYbh2zJSQO+f+LwhZABRLBXR2O5Ql01ippgQYgiKrihexpzv?=
 =?iso-8859-1?Q?Z1FBgf551cWbFGuyNQaIXTeRLrFQRWkm0zV0mJZkNs8X1xLu+HqMLxSyAE?=
 =?iso-8859-1?Q?2rjE/kiartRBWBhP1gwavnNCG/ocGkkvP/0guowr2XzUyLdYXFdtrHrUvU?=
 =?iso-8859-1?Q?b1JrCW3CJOQZfKDc3pFIq22V1va6a0C7vXX81iUKnR22YezNxIwvn/m/GJ?=
 =?iso-8859-1?Q?lNCqE7Zk/TghrH5ChMYExmdu/zxjT4GsjeXtK69JXcY3wnJae/z3rDwgjZ?=
 =?iso-8859-1?Q?rEPeCoz+cT62UEtSbB/GAkwwYxuDSlUDdt5qk510MYxMcOOmNzRAR41qhk?=
 =?iso-8859-1?Q?hQlI95BDFGcwyONBNlXeqRL6LMAsHg/VqPBAvlDNwf+TSwo2c6047y7EIg?=
 =?iso-8859-1?Q?Fh80cXkLPjp/K0iA9Od7MKuvlRJFyipB9a6ajBFpDGC0sB27NUGsP7WqPz?=
 =?iso-8859-1?Q?2ZCBdP0n0YKTDg81AIx0ulSoW1LyXY5GO3ZdVL0ArGnwb1XRXDfXLADXp4?=
 =?iso-8859-1?Q?JOhbnHQeYqrupv2L0qt4UCzwpR5rln1efiRVHkWo7RzxXhvoRitw2K8L+G?=
 =?iso-8859-1?Q?TDExTuAqDVs31hOvQOL1/89qWT+KE2H9uSN0B7cX4xtlhKfcgukFoaZOVN?=
 =?iso-8859-1?Q?n4HrYGSMaRqUHxdJf5MeR3g2ElKvfPBG+YB4Txv9jFzZfPTX6Ymte1n/xs?=
 =?iso-8859-1?Q?2B/ogvrO9POkH+psahoWbgC1t4rVChGRoUyJtPWWorDnQ9pDiqAc4NFfRS?=
 =?iso-8859-1?Q?fpJBLhALpDc61CdYVGNceNKy7lpaDfgnHO1JaL+m/sRHRIaKAeHLGW1w5z?=
 =?iso-8859-1?Q?+L5gKoKPCM+X8/zn9Z4kVQg/Rf4kVt4r5MQjv3sO+O6okfbUF6i04Trhff?=
 =?iso-8859-1?Q?k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?E/LUzsuTWWEakPLNIt0dMYmkl018cAYr2CIXb02/yo+p0rwUiIMQtG9EjA?=
 =?iso-8859-1?Q?PKXcMPzI6fVo/7Sbv1QsClOFsotUoqquFMg2ghFU1kiS0xFBxx4fC8HzLS?=
 =?iso-8859-1?Q?7WiyFwRBYNNA4yFs0F8uIyCsfychS4F+aVu+sr3IIcxNkjwsf1+YZ1TXAJ?=
 =?iso-8859-1?Q?1aXVmSL74SKKAXPa/+LsGwX4ZWWf736QI3WNqLoeqz6GEiO6Io+DK1aAIl?=
 =?iso-8859-1?Q?DL65Axejntg6OsveJSA81QpSjtRHmZg7roMtJ6b30y67POn9BhISE0IRmT?=
 =?iso-8859-1?Q?hduot7lO3Vcn4D0OQBYLVZvY5OkjFyKQdiDQsjpTW55dkUrA3Ald+Zcpae?=
 =?iso-8859-1?Q?CcvBJ0OmU+Z/vxDdMYzVzma3J7gZ0EUQb414u05WoJcW6qFMC7AA/UxKcw?=
 =?iso-8859-1?Q?OtpV/An6QLBvOcjI/6rRC+xdrjAaEFQCE9wZXvCfgMwLsKtBRRDcOc9KaI?=
 =?iso-8859-1?Q?oPVl7ciN9qMDc9OujBJN6RBtVy32XJP/h0piQRiIyrVvsJT+F04orndRAl?=
 =?iso-8859-1?Q?souXo0A5QKA584figJDc96aNUM0GJ40RYkYmwPUmy1Gkg4wNfXagCJfwWA?=
 =?iso-8859-1?Q?U9ZOihFcxGAJUhF3wTDm//pf+n+hQccKap26MnqLqTq+qnFR5NebkKVqIu?=
 =?iso-8859-1?Q?nFdyMKBtDjfAvQz7qzwelWar2sJHl1qQQ4E/oXQno6RW7HFKGFH8k2eSV0?=
 =?iso-8859-1?Q?32bbmRHS7YHFOLa299NOVQ04GM0xmnR7BHG02CTmd/5UNmQVJgxwFA2pBm?=
 =?iso-8859-1?Q?G6VZC4YOpuvveUDHENg93ulGrS3eN8tRECTCrbazXTw/v9rLyoAKxpf+5H?=
 =?iso-8859-1?Q?Y+ltBXbF1jKsBZ8B9kG0T76i9a1Q9T+wj7/ddURZ85FbPYyjqQeYnxteWp?=
 =?iso-8859-1?Q?FihATYHNjo19Iu2Mw8UKefZ+L5nLWmo/34Wf8315r8B9FiLc/lSQ3NsPzS?=
 =?iso-8859-1?Q?I9kdQHV4H3/gC0yU8kNlfM7gLjt8D5JYnZZ9w/if4SO88N+AlwY9QjBuY1?=
 =?iso-8859-1?Q?akctcEqZhOiw/KfMbStaphST7Hj5YUrrAlVxZaWQCMZ8ltVpW9ToWEzFIY?=
 =?iso-8859-1?Q?c/nUGGrEXKERg8r4YlpY0r3/1anplfbcZ7Vgjpd9PvuNJnupLTUlYy9PST?=
 =?iso-8859-1?Q?S1Vk6oC2+AEpWNLxw/ZffB5S+7AgrfR6hw9y6NaHjb3wZqpNaHBGqOl/vJ?=
 =?iso-8859-1?Q?oKeoJU8XkFxTlq9C6HF+2aDo06tsZ0IFIH+59Kk0H6PrrapUmmqGgxZMu2?=
 =?iso-8859-1?Q?39zhTotZHH3kdSCpFBsrWrW6RlrzPJKH+0K+ZmGVaDYcjG4ZSfO0OmXldh?=
 =?iso-8859-1?Q?e8uOmLVDwAJZ1c8d36jYIQkieFZQOsON+EY3SdwvDfu9vgzyOnVw/O+K0C?=
 =?iso-8859-1?Q?uoNH59bX7UGWj36/6f2cgjCsoJ1KIQQcDM2Zk93OnlddBKrW+QT/m3jhky?=
 =?iso-8859-1?Q?Ucn055zC3RIYf5293GnIEQ9FOXOJboV20MRXJtLxOffRwhHvPnGgnIHNNv?=
 =?iso-8859-1?Q?j/CYsTO0o/erKgaPkY7uBypMrTiaA0wuc8YNQURLZWCPYdfJKFbyf/NtlI?=
 =?iso-8859-1?Q?MYVHhE//G7V/jO7FixI6yaJXlS24IrMNsHKGC4mZ8UMizS/lBaaF1EjGxt?=
 =?iso-8859-1?Q?sf8tRKLaTH+G+5SqzJJ39LlP3cJL0c18RQrJZdJZv9spJ1CmXYA4rj/g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f544cc5-6611-4251-5890-08dd82828bd1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 16:18:56.2466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b5RqfZfSEqnC411C/LYuxRuIScMviWxJSzvlFMfeU67N8l2stMYWSS+Z7RmtvdLYjx+GMJNF2tg85L9JhVp4ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4710
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

On Mon, Apr 07, 2025 at 08:29:11AM +0100, Matthew Auld wrote:
> On 04/04/2025 18:02, Matthew Brost wrote:
> > On Fri, Apr 04, 2025 at 09:19:34AM +0100, Matthew Auld wrote:
> > > On 03/04/2025 22:25, Matthew Brost wrote:
> > > > On Fri, Mar 28, 2025 at 06:10:36PM +0000, Matthew Auld wrote:
> > > > > We now use the same notifier lock for SVM and userptr, with that we can
> > > > > combine xe_pt_userptr_pre_commit and xe_pt_svm_pre_commit.
> > > > > 
> > > > > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > > > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > > > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > > ---
> > > > >    drivers/gpu/drm/xe/xe_pt.c | 95 +++++++++++++-------------------------
> > > > >    1 file changed, 33 insertions(+), 62 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > > > > index b097c91e2e02..947b82aa19a6 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > > > @@ -1396,7 +1396,7 @@ static int op_check_userptr(struct xe_vm *vm, struct xe_vma_op *op,
> > > > >    	return err;
> > > > >    }
> > > > > -static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
> > > > > +static int xe_pt_svm_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
> > > > >    {
> > > > >    	struct xe_vm *vm = pt_update->vops->vm;
> > > > >    	struct xe_vma_ops *vops = pt_update->vops;
> > > > > @@ -1409,55 +1409,40 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
> > > > >    	if (err)
> > > > >    		return err;
> > > > > -	down_read(&vm->svm.gpusvm.notifier_lock);
> > > > > +	drm_gpusvm_notifier_lock(&vm->svm.gpusvm);
> > > > 
> > > > Also any reason not use xe_svm_notifier_lock / xe_svm_notifier_unlock wrappers?
> > > 
> > > Just that those are hidden behind CONFIG_DRM_XE_GPUSVM, so looks possible to
> > > disable svm, but then I think we should still have working userptr. Should I
> > > pull xe_svm_notifier_lock out of CONFIG_DRM_XE_GPUSVM?
> > > 
> > 
> > How would userptr work without GPU SVM if we building it on top of it?
> 
> Here I mean CONFIG_DRM_*XE*_GPUSVM, which looks to be specific to everything
> around xe_svm.c AFAICT, which useptr doesn't touch. We do now ofc require
> DRM_GPUSVM by default, but that's a different config.
> 

Ah ok, that makes sense I guess. We could pull xe_svm_notifier_lock /
xe_svm_notifier_unlock out these functions to not be hidden behind
CONFIG_DRM_*XE*_GPUSVM though.

Matt

> > 
> > Matt
> > 
> > > > 
> > > > Matt
> > > > 
> > > > >    	list_for_each_entry(op, &vops->list, link) {
> > > > > -		err = op_check_userptr(vm, op, pt_update_ops);
> > > > > -		if (err) {
> > > > > -			up_read(&vm->svm.gpusvm.notifier_lock);
> > > > > -			break;
> > > > > +		if (pt_update_ops->needs_svm_lock) {
> > > > > +#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
> > > > > +			struct xe_svm_range *range = op->map_range.range;
> > > > > +
> > > > > +			if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
> > > > > +				continue;
> > > > > +
> > > > > +			xe_svm_range_debug(range, "PRE-COMMIT");
> > > > > +
> > > > > +			xe_assert(vm->xe,
> > > > > +				  xe_vma_is_cpu_addr_mirror(op->map_range.vma));
> > > > > +			xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
> > > > > +
> > > > > +			if (!xe_svm_range_pages_valid(range)) {
> > > > > +				xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
> > > > > +				drm_gpusvm_notifier_unlock(&vm->svm.gpusvm);
> > > > > +				return -EAGAIN;
> > > > > +			}
> > > > > +#endif
> > > > > +		} else {
> > > > > +			err = op_check_userptr(vm, op, pt_update_ops);
> > > > > +			if (err) {
> > > > > +				drm_gpusvm_notifier_unlock(&vm->svm.gpusvm);
> > > > > +				break;
> > > > > +			}
> > > > >    		}
> > > > >    	}
> > > > >    	return err;
> > > > >    }
> > > > > -#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
> > > > > -static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
> > > > > -{
> > > > > -	struct xe_vm *vm = pt_update->vops->vm;
> > > > > -	struct xe_vma_ops *vops = pt_update->vops;
> > > > > -	struct xe_vma_op *op;
> > > > > -	int err;
> > > > > -
> > > > > -	err = xe_pt_pre_commit(pt_update);
> > > > > -	if (err)
> > > > > -		return err;
> > > > > -
> > > > > -	xe_svm_notifier_lock(vm);
> > > > > -
> > > > > -	list_for_each_entry(op, &vops->list, link) {
> > > > > -		struct xe_svm_range *range = op->map_range.range;
> > > > > -
> > > > > -		if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
> > > > > -			continue;
> > > > > -
> > > > > -		xe_svm_range_debug(range, "PRE-COMMIT");
> > > > > -
> > > > > -		xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op->map_range.vma));
> > > > > -		xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
> > > > > -
> > > > > -		if (!xe_svm_range_pages_valid(range)) {
> > > > > -			xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
> > > > > -			xe_svm_notifier_unlock(vm);
> > > > > -			return -EAGAIN;
> > > > > -		}
> > > > > -	}
> > > > > -
> > > > > -	return 0;
> > > > > -}
> > > > > -#endif
> > > > > -
> > > > >    struct invalidation_fence {
> > > > >    	struct xe_gt_tlb_invalidation_fence base;
> > > > >    	struct xe_gt *gt;
> > > > > @@ -2255,22 +2240,12 @@ static const struct xe_migrate_pt_update_ops migrate_ops = {
> > > > >    	.pre_commit = xe_pt_pre_commit,
> > > > >    };
> > > > > -static const struct xe_migrate_pt_update_ops userptr_migrate_ops = {
> > > > > +static const struct xe_migrate_pt_update_ops svm_userptr_migrate_ops = {
> > > > >    	.populate = xe_vm_populate_pgtable,
> > > > >    	.clear = xe_migrate_clear_pgtable_callback,
> > > > > -	.pre_commit = xe_pt_userptr_pre_commit,
> > > > > +	.pre_commit = xe_pt_svm_userptr_pre_commit,
> > > > >    };
> > > > > -#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
> > > > > -static const struct xe_migrate_pt_update_ops svm_migrate_ops = {
> > > > > -	.populate = xe_vm_populate_pgtable,
> > > > > -	.clear = xe_migrate_clear_pgtable_callback,
> > > > > -	.pre_commit = xe_pt_svm_pre_commit,
> > > > > -};
> > > > > -#else
> > > > > -static const struct xe_migrate_pt_update_ops svm_migrate_ops;
> > > > > -#endif
> > > > > -
> > > > >    /**
> > > > >     * xe_pt_update_ops_run() - Run PT update operations
> > > > >     * @tile: Tile of PT update operations
> > > > > @@ -2296,10 +2271,8 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
> > > > >    	struct xe_vma_op *op;
> > > > >    	int err = 0, i;
> > > > >    	struct xe_migrate_pt_update update = {
> > > > > -		.ops = pt_update_ops->needs_svm_lock ?
> > > > > -			&svm_migrate_ops :
> > > > > -			pt_update_ops->needs_userptr_lock ?
> > > > > -			&userptr_migrate_ops :
> > > > > +		.ops = pt_update_ops->needs_svm_lock || pt_update_ops->needs_userptr_lock ?
> > > > > +			&svm_userptr_migrate_ops :
> > > > >    			&migrate_ops,
> > > > >    		.vops = vops,
> > > > >    		.tile_id = tile->id,
> > > > > @@ -2419,10 +2392,8 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
> > > > >    				  &ifence->base.base, &mfence->base.base);
> > > > >    	}
> > > > > -	if (pt_update_ops->needs_svm_lock)
> > > > > -		xe_svm_notifier_unlock(vm);
> > > > > -	if (pt_update_ops->needs_userptr_lock)
> > > > > -		up_read(&vm->svm.gpusvm.notifier_lock);
> > > > > +	if (pt_update_ops->needs_svm_lock || pt_update_ops->needs_userptr_lock)
> > > > > +		drm_gpusvm_notifier_unlock(&vm->svm.gpusvm);
> > > > >    	return fence;
> > > > > -- 
> > > > > 2.48.1
> > > > > 
> > > 
> 
