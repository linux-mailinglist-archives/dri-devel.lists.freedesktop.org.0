Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F2DBCBB23
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 07:18:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E3C010E31A;
	Fri, 10 Oct 2025 05:18:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MVxWw1k6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DE1510E267;
 Fri, 10 Oct 2025 05:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760073494; x=1791609494;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=E7j14qcwzWpTxL+k0qaacvD1pC0B2f50TVA8EF8+v48=;
 b=MVxWw1k6KR2SZRkaALyuYjg0PhHD2g9BOGxxH6a8aWyzvIFrmQqjNPBO
 pJwuz8hMBZC6QhSJESg2sYiM+0wMy/OOncpWm+7U282XFo1fPQ+JNLb3i
 MxwqoK8UgOSmpOUkKMKeL1rqoWw7PtvL+//W93xI3k2LbBfGPIOf9M30F
 rez+kkeUnCjKMObyRjnUZWTcQr3joL5LUa/qIObgvvBg0AItBIXLbCbgY
 0WwPB8xCVihE4SHtTUJLXUcDcbE+GqaumCLIdZRNn3c3WeqSSazbluxV8
 RSCXZHo73kwfmzaZNtx/nEyvKlzWQ0sSp2OBP2ZTiI4JHmTIr4gTcKR0t g==;
X-CSE-ConnectionGUID: 1QQD3e+iTcaMZIZYt8RUaA==
X-CSE-MsgGUID: sEa3eW8+SviX5Wae5kkgMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="73634655"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="73634655"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 22:18:13 -0700
X-CSE-ConnectionGUID: RkdhuccrQnOQ//kCk3TvnQ==
X-CSE-MsgGUID: eK1ID/E9Ro+K0tdNluxQKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="180479565"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 22:18:13 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 22:18:12 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 22:18:12 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.23) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 22:18:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h5boiKLOgWHRYgc+lpxkhcyJDcDfDTVLxAhzmoX1scBYqu0YlekoJtzi/qqdTnpcgrs2evVwYuFY4wXE5D61geyata8r01EYGNAH12TZk59rM7OeQhNN5xSCMWQ5KnvENEnsWuK92ZXoVXqOiMN7qkQIKgdiz5Zukcm293soMwo4592MdOT3QCU6DA2n3+gtEKXUELuPWHsHfIcQBdVtWmmCDP0KYsBryEUatk3b68/DUnDinbZQ9YZG3u3vxuzkUd9GQ7/m1bsvLgYWtUNlor4Ir5uyv4RAai3A+jiVSFR8ccbKPQ0ye0XO2uU+b5YnkDyEXOBdG7sJmVvGQyXOgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aGlXz7D/WJKGc1zHLX27WxHmi9sV8NI+0SACgG+oyfU=;
 b=hUq97LCTZpbqqjoHcfVPOrkOB6oc/LZDYN8Vxkp4HPk4vJLEgxC9lVrwKJekQRGFtH3oHn3QFYW6kJUzhki/lNUaDVZdWEZ6bUAzXK/kxwt+BRf8J523tR5TE+Z2a4VVacfs54+jjpnJgDqvOa9Mu+rGEA4Q7+m9kOYkUZZf0i8Bo8+I9lSlupdvmE72RofbfAOtFsCrm7O8zbUZQtHwwBEAkQZlFRUqpB/UolktI8fPfmHwnnXpHiv47jI/6yDN9xWSN2nXB+ZGsUW6ymEnc2s2we3hPmYMZfUbEm2hc08wLlRTbfbGNFmZveWSiUY+rS9NdphmLSDvCrL0EZrYdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB5827.namprd11.prod.outlook.com (2603:10b6:806:236::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Fri, 10 Oct
 2025 05:18:10 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9203.007; Fri, 10 Oct 2025
 05:18:10 +0000
Date: Fri, 10 Oct 2025 00:18:03 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <linux-pci@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Icenowy Zheng <uwu@icenowy.me>, "Vivian
 Wang" <wangruikang@iscas.ac.cn>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Simon Richter
 <Simon.Richter@hogyros.de>, LKML <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>
Subject: Re: [PATCH 2/2] drm/xe: Move rebar to be done earlier
Message-ID: <epq2fe6hanziuyhvcihcrpgjgp24aik2wospyga2cjzbgsjk2h@7fr5zatwnbfg>
References: <20250918-xe-pci-rebar-2-v1-0-6c094702a074@intel.com>
 <20250918-xe-pci-rebar-2-v1-2-6c094702a074@intel.com>
 <5osrqzgrh47n6rpjulvsixwbhbh5vwxrrn6p6hpodnwisjfung@lmivgjb66oed>
 <dfdd45b2-5a8c-cfea-ecd3-495e947022d1@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dfdd45b2-5a8c-cfea-ecd3-495e947022d1@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0161.namprd05.prod.outlook.com
 (2603:10b6:a03:339::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB5827:EE_
X-MS-Office365-Filtering-Correlation-Id: d312291e-cf31-4c7f-8e18-08de07bc6759
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Ra4EtJH0FLbMr5elhncWG2RuxUgvoHDG/RR7z1mLArhIdknqyTwNDkMIUt?=
 =?iso-8859-1?Q?xWoOyL4IKf1Gn/Cp4zyVuyuuNe+KDDRdrPxD2rinvDGc8hH16CMOm8ZcTt?=
 =?iso-8859-1?Q?WmLeF5ay2nYilzk9+SaJA/G1kerSJnGJN0idOiwMR13xIPeGksB8dbSkMt?=
 =?iso-8859-1?Q?zXOIyUxZYdd5DJ3dlkMEfgkxglAG7ahcvZLj6o/sVEJwxI+F+rhSEyBlVS?=
 =?iso-8859-1?Q?1mB2SYoh1ipzJyMBNDYYcXbe5aw8uDO0xw17kY2kSlX9Dh4GKebdNLIMCX?=
 =?iso-8859-1?Q?TX+JQO00am2A2t3/UCRpA7ZPKnkmS2uHsuC5u9tontOiykn7vzhZq9xo16?=
 =?iso-8859-1?Q?esZqtOx+VIZxmOM7oPBr7EqVivzWrv9Lgp38l8kBCGrkQ/mAwoAOA7NaUS?=
 =?iso-8859-1?Q?Txip7Y7WHSrBoOBajxPNmAXAJbuSb5FVpMtBDOBZdX5e+gz31nqTy4rNpK?=
 =?iso-8859-1?Q?EaM/SdQef+spRM58kK3jySPMnLQtGL+Afkcl+7tfwotW6ZEdq7KvEcrYFg?=
 =?iso-8859-1?Q?gHjNd3RQDYABCUGJiQ7ABTBxiRWma86tqt6ruQoATudaStwpW65LiIxq58?=
 =?iso-8859-1?Q?cRrvqcYrrcY+uZVL+Kb+B2EXr2+s3xMj8dmRfWHMDFzpy96+q9MUs3BMRv?=
 =?iso-8859-1?Q?XNk+EN0hYV+pWs9vodq673LSGOhY4AelaJ8UfV+kUDAgLg0qzQOmaJv2/3?=
 =?iso-8859-1?Q?NEYgnGJ7+0XLySVmBrosM4kQm4ReKYYsjD8wJI34i/ZjauCNBCmXVamz2C?=
 =?iso-8859-1?Q?B0tHxb6FpYFCEvK3s75NnNN5cr+c1pA33EmFqxuVY69OamPk+XCRYYYWNK?=
 =?iso-8859-1?Q?M+EgCa6HUnnUm+UQgkXNDyi/Lkv53FR4rz24NSVZUWm3m/6l444GlYQ+IQ?=
 =?iso-8859-1?Q?fDg0vvIyXA3N/xEVzgkbP7rK+1V2hBWEr+sek6+2ae012QiKUggZJl73eY?=
 =?iso-8859-1?Q?O1WsyM9BBM/6Tji3/yGbS+yb4XK1k2aa3IvNdr1Uc2EMBQaCM0B/+F76NY?=
 =?iso-8859-1?Q?+IK8waDcfsXegk0jqfqLh+Ux92EtrHw150xpLqdFiFsMrjcg/jk1TdDZJY?=
 =?iso-8859-1?Q?036Sx4zLvjmGG1clXDxiIndRx3b9wIhPG00CGcCr2Nqb443qALYc1WY++x?=
 =?iso-8859-1?Q?zVJ5NEqofe3ZYuAbKpc3CVHjTzrHJn6ywlgo8wSgEZ/LNF6ZZTD1tIkwbk?=
 =?iso-8859-1?Q?qH9ZqnNz1lia4AGCr7E9fI1LKuhhBzo3MTRi2LKbJ6iN0zsZ0DJUPk4ZYh?=
 =?iso-8859-1?Q?nWxv3EE/MUJ7bzAbqOnTj+pKrjnpWaBmhtgHguPRIiGcqVrjTh4VFo2Ln+?=
 =?iso-8859-1?Q?kxPxKTBgCTRfxeXLsQCXKZxqgA7l4kh9xY2y6xn1YoNWUJsXWqKrIACRuN?=
 =?iso-8859-1?Q?qCtktRo5wfNFvHG1MqlJ46BaVWRpQNBsig4kKwDIMgVyKH/FTNctrfW0f/?=
 =?iso-8859-1?Q?UzApQPKzFlN1y/4a+GDlHrd6Jzz1NjJXi9UEtPc2pADO60ohedfJCVHrOj?=
 =?iso-8859-1?Q?nR8gUP1ac6nhZytTsnPBXG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?g1n6JSnuCJJtRCfO10oTIEPyJMbfMglStxuwRUlIEuZ+dh1HUIE7ElR/SE?=
 =?iso-8859-1?Q?/hCU7sHz0Z/y3jmIVOmNKGLSGtPLXe7jpXpqgHBAKgjEX7ddy04RgYUBcO?=
 =?iso-8859-1?Q?CGdfootQ0cPtIkLuabFF/vqu26aCvKGPQV9ThSeHNPHoy0MQ4bjh31tLoY?=
 =?iso-8859-1?Q?MZ8EcljzvCbPLX67ZzhC9B1MgM9SJAp71nA2xLTkKTK8kzNO6rdA2gzoqW?=
 =?iso-8859-1?Q?4M9AT6UVlziFjV2Wr8fx93lPADGxIlQ7BKA3p/IsIdQDfBEANC7MxQF73j?=
 =?iso-8859-1?Q?CHKlOmFlr6533VTUhVjWHTAh70o8pWiZJ9xrRcjHD5lNNRoejk82C53Al9?=
 =?iso-8859-1?Q?LRU19SnEx59Mdqm9nRV/n4G/hsseC2dhZrireowmbuPpxGJikcrO66Nquz?=
 =?iso-8859-1?Q?qhK2Rd536uBz/Wk2uuioOpOLi4xSF53+wYSDC1fk+Q6ZMbdRCAhjiRPkB8?=
 =?iso-8859-1?Q?a1xeol8YqU60aMUZWYX91df7ZXgrzUqvus8UgDzPdyXxhY8c6jxArpmyZ1?=
 =?iso-8859-1?Q?CYUlmoKXDEWMx6WCxiQ4ekKhfhEtdSCWs9zCRR4YGTUEs3b8bmGrOk+Bry?=
 =?iso-8859-1?Q?QJqyrq/7TlGJp077md2+O2wV2SLvvAfKNdO2r4R4k7IJxwrGzunOm1Ru5F?=
 =?iso-8859-1?Q?gC3F7U1yS9/1qUo/puiG+sA0imLJm3j0cw8pMdwXExD5mLlZJ2303roEym?=
 =?iso-8859-1?Q?B6ebOKLElfHerUah7QUlqKovjvTIEBkuEuuwXmZs9J8+1GhNVxz8i9FSGR?=
 =?iso-8859-1?Q?+I0QopLTX8d7fI/bIBDhxV+6TdQSqv+c6bOS6QQgLMhfAUrDgWwhKTLSjG?=
 =?iso-8859-1?Q?FRDBMMgkWgTbZZ+wWUAoVUo2V29TIzdLyz2FbVpcgzSeKbKdaC7OWEdSX1?=
 =?iso-8859-1?Q?X9cw6NIZZ5aIgqVwKwtf0CWvG+vyGGAV/+5SXQE9MsRgmRrjNZRwPR4gJx?=
 =?iso-8859-1?Q?6hlDqG6Q+2HKYfbm+c4YlKdtIeV6qPezIRzqy6f3Gz4m83xbI1+a4GQIRe?=
 =?iso-8859-1?Q?0TmhMJJQirSkc1JnYLoF1gp64kFDdekrFiinoQ9eb4CV94x9ktrxlXQQA3?=
 =?iso-8859-1?Q?ofLsK0X1Sr5GTM+TJSrQHWbSLqIMsfgd2Ophas36iRu+3Bw9IiOgruf7Pu?=
 =?iso-8859-1?Q?ScpUCOE494slVVMV5Z+X9/+9gxA5tRw3K6cQk2xKaRyPlZ4sLZp8UXzGcG?=
 =?iso-8859-1?Q?zf3wGr1IYSaDsd3I1W/uI5tKx1MsNjD2BN8n53SdTGvNUK2kRHm6StlcvR?=
 =?iso-8859-1?Q?QPU+7W3v9+69WLWMqtCTjH9udy5d4fVj663SNFwmFP7fMlrDoDAD1tLIYP?=
 =?iso-8859-1?Q?7qU75AIEL0eerrvEci0uCfIiaCUvdDtRTx5+HyVURmbuE9kMEX/f5xsxQs?=
 =?iso-8859-1?Q?11bx4kn1SIm5wd6U7pzRL6ohyywDKNxMW2KeQ84LXtO6fIyYnFTWCbC9vH?=
 =?iso-8859-1?Q?CFOqSo8UlACJcNAmybC9JzIVaCXkgyAgCRJd6KiTOdL5iBYWjlKPB4brxV?=
 =?iso-8859-1?Q?Zj9zQTJgzqT39/o4Q0RX392u+howK4nQM2v9Cw2dPGH2Sz2/3wS1eVz6b9?=
 =?iso-8859-1?Q?wc4yo+VFmCDRWjHeE1O9foKr5Q63hq7BTN1VUp0Qdf4KFiSU/NYnIUZsaW?=
 =?iso-8859-1?Q?XnTE5T3ivFiXRHPAjt99nIzANuWJVA/LEqYH9kWH4ZHZXiRGEFUeUT6g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d312291e-cf31-4c7f-8e18-08de07bc6759
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 05:18:10.5950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TkW+PNXHSrHVg4gPUZtAl9yuDJ8Chz9j/df9O8fvKFoD53sH9Zo0jh87mhQXA4W+zPrY5f0+6QHYAIcQhlmabThdjZpFfgy6rwqL5PvMFa4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5827
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

On Mon, Sep 29, 2025 at 04:56:03PM +0300, Ilpo Järvinen wrote:
>On Mon, 29 Sep 2025, Lucas De Marchi wrote:
>
>> Hi,
>>
>> On Thu, Sep 18, 2025 at 01:58:57PM -0700, Lucas De Marchi wrote:
>> > There may be cases in which the BAR0 also needs to move to accommodate
>> > the bigger BAR2. However if it's not released, the BAR2 resize fails.
>> > During the vram probe it can't be released as it's already in use by
>> > xe_mmio for early register access.
>> >
>> > Add a new function in xe_vram and let xe_pci call it directly before
>> > even early device probe. This allows the BAR2 to resize in cases BAR0
>> > also needs to move:
>> >
>> > 	[] xe 0000:03:00.0: vgaarb: deactivate vga console
>> > 	[] xe 0000:03:00.0: [drm] Attempting to resize bar from 8192MiB ->
>> > 16384MiB
>> > 	[] xe 0000:03:00.0: BAR 0 [mem 0x83000000-0x83ffffff 64bit]: releasing
>> > 	[] xe 0000:03:00.0: BAR 2 [mem 0x4000000000-0x41ffffffff 64bit pref]:
>> > releasing
>> > 	[] pcieport 0000:02:01.0: bridge window [mem 0x4000000000-0x41ffffffff
>> > 64bit pref]: releasing
>> > 	[] pcieport 0000:01:00.0: bridge window [mem 0x4000000000-0x41ffffffff
>> > 64bit pref]: releasing
>> > 	[] pcieport 0000:01:00.0: bridge window [mem 0x4000000000-0x43ffffffff
>> > 64bit pref]: assigned
>> > 	[] pcieport 0000:02:01.0: bridge window [mem 0x4000000000-0x43ffffffff
>> > 64bit pref]: assigned
>> > 	[] xe 0000:03:00.0: BAR 2 [mem 0x4000000000-0x43ffffffff 64bit pref]:
>> > assigned
>> > 	[] xe 0000:03:00.0: BAR 0 [mem 0x83000000-0x83ffffff 64bit]: assigned
>> > 	[] pcieport 0000:00:01.0: PCI bridge to [bus 01-04]
>> > 	[] pcieport 0000:00:01.0:   bridge window [mem 0x83000000-0x840fffff]
>> > 	[] pcieport 0000:00:01.0:   bridge window [mem
>> > 0x4000000000-0x44007fffff 64bit pref]
>> > 	[] pcieport 0000:01:00.0: PCI bridge to [bus 02-04]
>> > 	[] pcieport 0000:01:00.0:   bridge window [mem 0x83000000-0x840fffff]
>> > 	[] pcieport 0000:01:00.0:   bridge window [mem
>> > 0x4000000000-0x43ffffffff 64bit pref]
>> > 	[] pcieport 0000:02:01.0: PCI bridge to [bus 03]
>> > 	[] pcieport 0000:02:01.0:   bridge window [mem 0x83000000-0x83ffffff]
>> > 	[] pcieport 0000:02:01.0:   bridge window [mem
>> > 0x4000000000-0x43ffffffff 64bit pref]
>> > 	[] xe 0000:03:00.0: [drm] BAR2 resized to 16384M
>> > 	[] xe 0000:03:00.0: [drm:xe_pci_probe [xe]] BATTLEMAGE  e221:0000
>> > dgfx:1 gfx:Xe2_HPG (20.02) ...
>> >
>> > As shown above, it happens even before we try to read any register for
>> > platform identification.
>> >
>> > All the rebar logic is more pci-specific than xe-specific and can be
>> > done very early in the probe sequence. In future it would be good to
>> > move it out of xe_vram.c, but this refactor is left for later.
>>
>> Ilpo, can you take a look on this patch? It fixed the issue that I had
>> with BMG. It needs the first patch for the full fix, but the fixes are
>> more or less orthogonal.
>
>FWIW, it looks okay to me from PCI perspective,
>
>Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

I'm pushing this to drm-xe-next. The first one may go through pci or drm
tree when it's reviewed.

Merged to drm-xe-next, thanks!

[2/2] drm/xe: Move rebar to be done earlier
       commit: 45e33f220fd625492c11e15733d8e9b4f9db82a4

thanks
Lucas De Marchi
