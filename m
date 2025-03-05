Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA9CA4FCA8
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 11:49:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15AAD10E73E;
	Wed,  5 Mar 2025 10:49:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ldT3oIAH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53D8C10E73E
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 10:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741171745; x=1772707745;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fqbbBAGrRQjqz46EESftVyE1bp/jTmnrSMJFyQNYG8s=;
 b=ldT3oIAHZOOpeykZJgmbx/nfj7XoFADpL2AuokFS8lqAJzB18C6mznib
 H7/Ngixr+dFz8OGPH4D8+WRWwHqpzVCKw+W5J8QyROElAYxDmrMxEfBL6
 M7/XqCcjyG6cGh1rIcSDwy6I6XEIFtoxh9fq8YaPpFNaTUDdwv3OC1y4F
 htOqqVTsVdlScdzO1CSvA8AXbrj5i0n7y9Gujy42Gyk/DdIFpldyyxbXx
 4AlOJeurbED+RgG96Bba0alF86rrP3nfGAO5ZCs7CyN/VK32eRzCR+ytb
 U+VBuRFg6lca5Or+51lnThB1Vb/GT74Wzs7dtrRRCv7cbRzGn9dpDkzWW A==;
X-CSE-ConnectionGUID: jEgaWeVtSvyy5MPEKfgoVw==
X-CSE-MsgGUID: exyJT+U/SSKQ/QPneQ7JFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="64569557"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; d="scan'208";a="64569557"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 02:49:01 -0800
X-CSE-ConnectionGUID: vnx7LOuuTPaiZfUN4TFYQg==
X-CSE-MsgGUID: rHhIhCmqR7qwwSM4FybTXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; d="scan'208";a="123751149"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 02:49:00 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 5 Mar 2025 02:48:59 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 5 Mar 2025 02:48:59 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Mar 2025 02:48:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=br3zYsYvvd/qfNPaqGpw4zvBrngkD0Vzc3C+jWigT3frKOtZ4b0S3TCrWxpBvRmI+69Wist5Oa3NAidgu0BnrNJHr8y8egPLwjRrwg5cY/ZFO8Iaidyjt0fDHlqmGi6Mg953utsGZO70BodprkAXSsy3Hsp4iQ81SXzz1xjSnsypwORLDJ2JIbd/5bTT40fHnrmOteLpfAtDq+26QqMx6qbCrvXTPoKjXvO/WYOWUCsto0M2mu900qlg26dQ/ELB4X8QDLLK818ixLmuOB1UO/4LF89JvRsycNJ8TV0qaQRo/5IAiyK3kZbQrEn1cEBd32xltMlo30uLcU2uYMJfxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=78DE2yhkph1Z7d79yNQnmwi+h2MEiV+EhhHb9qcShYo=;
 b=bZNkoHUkMjAVBW+IhU9YBcrNyhCNDg1ujW1Rtg1nlpE6yhRZWAUoJ8eYFR6zkGZOmGrpfVduKTrXUi0K9XXBixAKd4YQ72kojK/nL5f6ZW1slWi+cNCJ+HlFV59SJiaq59zxJOEQQQPaLwrK/rOAuTa/85S/JekXSlCx1uYEMrGvE8DnAKgFd86WprClpQgFrJaS6B7CrsYFS5RFoLCbB7/XnSstatLdzzzYrdYZOrrUGzdXP1Uzc5DvjUIsMdzbTYxiaq/D/7rfjpLyQFcRG6/JyJ17ZVn7TNC/FINtqNzIFL2Y8k5vzCj2HbChu8cb+PwhQRhiuApNTHSGs6TMlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 MW4PR11MB6570.namprd11.prod.outlook.com (2603:10b6:303:1e3::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.16; Wed, 5 Mar 2025 10:48:57 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::6c31:ab8a:d70:2555]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::6c31:ab8a:d70:2555%4]) with mapi id 15.20.8511.017; Wed, 5 Mar 2025
 10:48:57 +0000
Message-ID: <dc139f06-3f5a-4216-93c2-1e8b3b9c27ba@intel.com>
Date: Wed, 5 Mar 2025 12:48:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] MAINTAINERS: Change habanalabs maintainer
To: Ofir Bitton <obitton@habana.ai>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "sfr@canb.auug.org.au"
 <sfr@canb.auug.org.au>
CC: "jgg@nvidia.com" <jgg@nvidia.com>, <koby.elbaz@intel.com>,
 <konstantin.sinyuk@intel.com>
References: <20240729121718.540489-1-obitton@habana.ai>
 <20240729121718.540489-2-obitton@habana.ai>
Content-Language: en-US
From: "Avizrat, Yaron" <yaron.avizrat@intel.com>
In-Reply-To: <20240729121718.540489-2-obitton@habana.ai>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0023.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::12) To DM4PR11MB5549.namprd11.prod.outlook.com
 (2603:10b6:5:388::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5549:EE_|MW4PR11MB6570:EE_
X-MS-Office365-Filtering-Correlation-Id: 572a1991-dcef-4247-1109-08dd5bd3546c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cmVYa0tpOUNFb1p0bkVRYlB2STlHbSs2bEYyTWVqT2lnRFE2V3RpNHg0RUtv?=
 =?utf-8?B?UEtKVkp1S0t3VmxmM3paS0RkVyt3R2VaN3ZPS3h3aEMydUVQRWVSZFpYeFJB?=
 =?utf-8?B?Y3BQMDJBTms2TFVjVVJjc200WHRnQXFuMDN3aEVBL1p5dXJsbXkrQkF5SFhs?=
 =?utf-8?B?SENDVklaK0NiMGJ5Q1lXdHo2QnNsZytmR2lYb3Rsd1haN0NlODdIOCttL01N?=
 =?utf-8?B?dnJrS1ZodEljMVRxc0Z6WkxsbktIVVNXZWl6ZVJhQVRMWFZ3TVU1WHhVUkpV?=
 =?utf-8?B?emFoaTJydThoc2RVaGZUTXZjN2pQekxFMmdoRENPdWlpWkttZVg2SmZLeGU2?=
 =?utf-8?B?a2FPY24ra0tQUkhtcGpvZWpoWFdnNkFIYWVJZ1N5OE52WkhBSThGTmhEb3VO?=
 =?utf-8?B?LzZNcnUwcUpkVkVXbXBuT2d3aEZIa1Q0Rk5JWlZuWmFuZ3UzZXpqYWZiSTNK?=
 =?utf-8?B?enp5NEhoZE5nNnZvWmhSSDN3cmFkaVNuOWkwTTBJUzhXVVhVY2haUEgrdENj?=
 =?utf-8?B?cy9VdEp6QTkzSTQvREt3emt4TjRHQ3kxeTVNVjZaeFZJV1ZabHBTbjlMcVVT?=
 =?utf-8?B?WWR4SUg0RFlOU2tiVWZSYmRBV09NcVJmTURlRkR4amZyY0l0THFoVjJjZGk0?=
 =?utf-8?B?ZGVaeVRJNlVOQ25YMTFERWZXbWVDem9wd2NxbmVXR2MxS3FuWXljVXRyWk05?=
 =?utf-8?B?L09CWVhqUkJrWkNGQy9FMnBEL1E5QUZUbGpaVlhiWkcya1NQbXVEaHFyV3dE?=
 =?utf-8?B?RkN2VnViNXF0a1JYRVNmc0xWcXJ2T3dEeUZlYWdHSVg0RXUybjlybVlWYkw5?=
 =?utf-8?B?cXoxd2I0YlhpKzNIOWZMWGhkTHdBQnZzM1lOSEtkdTRUNG90Rnh6aUdCZ05K?=
 =?utf-8?B?L2NIWkREMkk4VEhCOFQrZTB3V1Z4bS9WYmZ4TGV2cFNEdk02NmNEYXQvSWd1?=
 =?utf-8?B?SkFhYWxZS09IeWJMa2hIV0I0R0g0M3FtMnp5TW80QmtzNWJiSGV1R1RvbHJh?=
 =?utf-8?B?Unk4QWwrWjVTNzBhVUJUTUJCZWo3SGlLWE5DVkxmZDRUWEtkUWIvMjMyVzZl?=
 =?utf-8?B?eGJveTJlc1MxZU0zQndlTjEyZE1LRHB5aExIS2FvUFBiNVhDdm5aSW5ieWJK?=
 =?utf-8?B?MWl4bTc0Y3Y5RnVEcUd0UWpwMEVjZzFRNEsrVXg0Y0EyZzFLWHpLbzJhaW8r?=
 =?utf-8?B?bFZuaFJDdm1iT01XL1laS3Z3Q0pMeVBIc2R2ellFL21QcE9TUllGQkoyRGlL?=
 =?utf-8?B?VVI0YlJhQlg5VUNEQU1GeE11UWQzRGV3L0NOWjVrTUtKcmJSQ2Z6MEk1eG5q?=
 =?utf-8?B?ZkhiZ3VybjhtcUt1dCtJQllCalpFY1pZS0hJang2M3E2WHNtT0tBa0NhQXZB?=
 =?utf-8?B?N0t0MHlpcWlRUkdPVDRDWWVFRGpIL2h3L2xlck5ENC9IV0pzcE1qejNJYjE0?=
 =?utf-8?B?cm8reUxxcllVVG9idkZhaU9RT3JxcFY1dllULzFJeDJrMnYwMFdDTXZJeWlt?=
 =?utf-8?B?eXg3QnZrSm9mRElMWlhGSWwwVWpMZElOUS9Gb3pBc1RaY1dHeEt6anhGclVG?=
 =?utf-8?B?bEtzWFdmVk5iRGNHTTZyVUhZbm9UR1owa0Jmd0RMOHpZOFoxK3R1VTdDWDJn?=
 =?utf-8?B?TjgxblZGc2tvaEt5VklJVGRuS0tMTUxMWHhpL0FIR0dGVGtkaHZEOWVJWnNQ?=
 =?utf-8?B?WW92cE1MdnpZYStuMFVWYjFkQTJ1azk5cGs2bS9JV0ZjWXhTdzJvcGM1c2Jp?=
 =?utf-8?B?TjFOS0xPN3VXbEVySldpM1dXa3phZ1hJU0JpODBEZG8xcHRCMEhzT3RWbmRO?=
 =?utf-8?B?dXJWQmQrbzlSa0gyR1QwQVFDaVdodG84ZzZ6L0R5bWd4ZCthbmVVMGd4Uk5m?=
 =?utf-8?Q?6EVt11F/nfvfK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUtvTi8xck1FTDVOQWhkRmdiWDdQcEN0ODFJeTZ5Tjhoc013SVdDSlh6MmJZ?=
 =?utf-8?B?eDBMZjVtOXZ4Yms0ZFhkSXc3Yk4xYUdTeUUvazlENVBrejVxeWlQL2Nod2tl?=
 =?utf-8?B?L2lWeWVqVGdQaFBXL2c5K3MvUDhsM29vcXA2L053bWcweWRhWHdGNFMvQ2tv?=
 =?utf-8?B?NEJsMExMYTd4VDZGcmoxRVNLVzhPWDlHL1h6QXlEQStFdDUvdkRXdGo3eVpT?=
 =?utf-8?B?azBqNjJpdlNOQmVqc3lzdW4rSkNQdFRQZnozdTVWVGJxdk1hOU9WNTVXWU9N?=
 =?utf-8?B?WEtsQVVRazY3dG9LNlpOeUY4QUZkSjJEQnlabDJ2OHkvNW5aN0VsYjVka3By?=
 =?utf-8?B?aWw2bGJKMEo1ZzBCcUthdXRIVmc1VjFZaG80Q3V5RlJENGF1d2hnS2FETEZJ?=
 =?utf-8?B?eGtUMGJYYm1weWJ3dXpoUFltb0RMdmJOQXVlRy9PK0FaRFVOK2VEenhhZnZL?=
 =?utf-8?B?eGJaZE9Ra2RadGlTWmlzUGFuOW1uRkJReDZRZlMvbGFWWE1BVzBUbnRERHRK?=
 =?utf-8?B?NFJqc0NpbG1hTHlaaXRvbEM5SG16OHZiUnYxYzdoMCtvMFYyU0FJVklSTkVY?=
 =?utf-8?B?SldOL05vMDZQempPMTMvbWFiY1Vwd0VIT3RXd3NZSUkyQUM5M2FnY1ZSTzBy?=
 =?utf-8?B?VHFnWWlRTmpvUjcwWkRrV0ZxZWxsa2ZTbmtSRjJ4Z21kOURJZnFDdENEZWZX?=
 =?utf-8?B?b2dVNy9wOXp5a1NkSEQ3cEpMT2JzNGtleG9wcXQrTmFBSmh1NnNlWTM0YW9D?=
 =?utf-8?B?ZVByOSswbmw5VUFYb0svNG5yZlNMYktFZnNpM1lDNHFlRmlKNjYyZUx2c2Zr?=
 =?utf-8?B?TUwxTHRHc05OUDVKR2k5RDJoRGtzZXFMVUc3MktrUHF2R1ZOSUlPQjVJYlNE?=
 =?utf-8?B?NG9QaVc5d3F5K0YwLzBELzRhR1NLQU1zQkZzRStmVHFqcmJoN3JvK05IVmcw?=
 =?utf-8?B?SVFBczRlcTJCbDdYN0dyeDBPMU9XUmxzdkV6bmtZUS90K3N0dVV4TXhROFZh?=
 =?utf-8?B?SWRzMEtnYllteG1JUkt6TWpSTFJlc1FiRXNnVEhET2o1U0FmTlRkcUpNblZS?=
 =?utf-8?B?UDhOZXM0SnJOVjdXVkhlNDV2UkFBbXRCb0gzaVoxTGFUK3lIeGRCQUg0ZFIv?=
 =?utf-8?B?QlFlWmlNanZVL1Z3R1lycW1uelAxZzEwdDFicHhIcWF2aXJycnI1ZmRLa1lx?=
 =?utf-8?B?bHYyTGZhRUFvMUxZWE5TNWhMcDhjMnc2NWJtUVNRd3h1QzVjbC9TM1QrKzBm?=
 =?utf-8?B?b0dHL25wSXByaVcwR0FUZnYzTGZIVnNPamc3RklPSWYxemkwUnUrM2tUQmtS?=
 =?utf-8?B?eWExTDNDcm9Wb05jTDVybHE1S21nMDd6ZFVUbUdpaDN3M0EvSWhjYVRTTXNU?=
 =?utf-8?B?VHVoQVhzZ2RQalRZcDUreWRBelNvZlp5SnlpSXVFZUtwanFSL3RtVlY0RVMr?=
 =?utf-8?B?RGtvRlEwYW1IdjBkM0hpYzM5ZjV1YVU5U2tvNmUrVlFqbWNNbE8vRW81UzJp?=
 =?utf-8?B?bDYvSld3cDFVTVM2WWpmM3ROVXhuYmdDWFk0dWFyMER3d295cjYrOTk0Vksv?=
 =?utf-8?B?RVZ0MG5naklaa1ZQbmhKS3JDMmR5QTdQdDI0Q0ZMdXFvT3pGUVlpQkgzSGM5?=
 =?utf-8?B?bnU2MjhXYVpYZzdZam8yRDhPcUlTTG5DQXFJNCtaVjVrRXc1cjJieVNKSEhy?=
 =?utf-8?B?dkhKR0xnM1BsTm9HbHdGQ3RIRkJ6MW96MXJ3a1lMY00vUU90OG1QbEZSOEY2?=
 =?utf-8?B?L25hRk5qcWpzTmpHTXZKTFZiV29nOTBIQUxuZDJVN1lmMS82dGxDTm9GcXdQ?=
 =?utf-8?B?bGxTN2M4MWgyLzdKdzg4TWM3eDh2WHVhOXlEdlVBeXAxaU13aHZ4WTkwajVG?=
 =?utf-8?B?WDd2MVl0aUlCVWQwTk1nbWxGY3BpeFZYeGxTTW9WWi9RQ1pQMnlINGxxMDBu?=
 =?utf-8?B?S3YxZkQvUDdnWnZNSm02QUYrOFBjdDg5anBVekdzZzA5eXdBeks1NlJVNnp0?=
 =?utf-8?B?SDFaZUllRGZES2d4SllzMjVmT1FDYm1jTnArbTVMUG1sNUladUx0V01tYmJx?=
 =?utf-8?B?eXA3U0ZueGo3OEwxTC9NTW8vWHB3Q1ZBNllaTTQ1cjhDbms1ekdnK3FLeDZp?=
 =?utf-8?B?WXdZZXdtOVBtbFVjRjVzTkZIRWErRlM5c3dHbHFpTmJJV01QU2tyZStsS29R?=
 =?utf-8?B?OHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 572a1991-dcef-4247-1109-08dd5bd3546c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 10:48:57.1627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g+7/uWj30WXgptuKgVaCo+9JWeHjtd1g3M9UCxyhg4Lqrt0rkmXLgmJsxrr5ptbq+0F0vMo3x+FDemaqvMr2Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6570
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


On 29/07/2024 15:17, Ofir Bitton wrote:
> I will be leaving Intel soon, Yaron Avizrat will take the role
> of habanalabs driver maintainer.
>
> Signed-off-by: Ofir Bitton <obitton@habana.ai>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ed2d2dbcec81..a4b36590061e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9599,7 +9599,7 @@ S:	Maintained
>  F:	block/partitions/efi.*
>  
>  HABANALABS PCI DRIVER
> -M:	Ofir Bitton <obitton@habana.ai>
> +M:	Yaron Avizrat <yaron.avizrat@intel.com>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Supported
>  C:	irc://irc.oftc.net/dri-devel

Acked-by: Yaron Avizrat <yaron.avizrat@intel.com>

Apologies for the long silence — it’s been a challenging period with the Habanalabs-Intel merger, but we're back and ready to continue contributing.

We'll be moving forward with our roadmap — upstreaming the latest HabanaLabs driver, including recent changes and full support for the entire GaudiX series.

To support this effort, Koby Elbaz and Konstantin Sinyuk will join me as co-maintainers on a regular basis.

Regards

Yaron Avizrat




