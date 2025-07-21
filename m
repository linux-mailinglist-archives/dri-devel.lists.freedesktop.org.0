Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE32B0C6D0
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 16:47:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D871A10E561;
	Mon, 21 Jul 2025 14:47:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LmR/iKCH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1717610E55E;
 Mon, 21 Jul 2025 14:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753109264; x=1784645264;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rXQNdtBZVKsvQenD6CwIBawbpqxWLgvWaxuBCPCFNxg=;
 b=LmR/iKCH+b7xF+XtlGU7GFiDJ8t9JZTg37pAtBzEqE3sVX5nQ0VT3ayn
 jmdXu1zcHcGK7pZ7rhKajN8ZZL8ek3Q1FajaOL7yWvhPvb8UkQxZEpF9C
 XtpS0XjQYo86Z1XC/jqc/r5Y0QbM1SkVCnq3+B6GWo17NPWNBqaeePVyG
 1/uAJO2Ez55xn89ZzIob3HSzpjrPnZuWrX4OaLkfKCxDfPJwF1/+//kVn
 I96nPLYGFw55GbrRLDcnkTAGiFYy/kUTFshN6LKwg+py6f8PLdjiSKGFz
 CVocuRHQBNcSXudIRJqglOm1awPdqIsZ6m8eqm/YcUmY9lU4eVivGhrVs Q==;
X-CSE-ConnectionGUID: 6wmmFbDeT9GHHyCjKX4Usw==
X-CSE-MsgGUID: LyidvIqiSxeMeGx+9XkTuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="59123737"
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; d="scan'208";a="59123737"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 07:47:33 -0700
X-CSE-ConnectionGUID: RJBgL3FlQ5W1ROp+cN+2wA==
X-CSE-MsgGUID: 43q92c0PT3eErro1hcI27A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; d="scan'208";a="158644794"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 07:47:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 21 Jul 2025 07:47:32 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 21 Jul 2025 07:47:32 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.55)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 21 Jul 2025 07:47:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qfkrIXWlRe8pSKL+Kb7t/0wReRxv60A3IVYokQ8adQASe2MeLrF4v+/s+rEqFY/nhR9LKDC459KP+NUGCb2RFYGsH7JP/NP6fgXIVoQc/JDXPfwT+M0D4DuNXlnPTpTZw2rfd/BJgo18E+jNROP/RjrE/YWacqjMhY92SxqaVXMIOIswPiFrti6rFr0BJ466h8sL3r+R+gXsa+8Fz71cIjhZ7qmY1q9W1YRsVpsBZULNiWyv9F9YPW1Tt2zHJa8IusyTziNbdey/5uDXv9Qp0YkEAE79PMnS2G6FZJgU5Ul9yLgixFDrmPW1YFG1xc9ExX6vnndZnTfEDr3t8ujosA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lnjqdD4XFVn+Tn9QLO81A9R8M2LVa2rYhOQ6oe2wsvw=;
 b=Ai5YBNz1wTviwGwqEwJ3gfaNAlQuVHJdTrbmUU4sEGmnAZx8IaVcmC04yF1QnNlnI9OHetrmX2XIUp+13Xq/ioip/MKadv/bRLKoOp2BwgHdh19WjXOqCu1cSnBgfkYhysNZWQcebyoeJzEx4sihATIDPHAhOdi8JwSmLfQixMZQmjQZBoC7oti/FV4e7nWL1Is2TUhqTpt+EzJjlm4L7pKswSgXH0z4uMLMsVsT7K22U47MHr7oXlsmr4BJBw2Ui7gHfLbSHvp1nZiPScmk+TIugPFbW2hz5qisarjVmf6v29u7U7ty6u2so8ooQ2/TVzmd8jAy5OweuK5PdyTIUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH0PR11MB5903.namprd11.prod.outlook.com (2603:10b6:510:144::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 14:47:28 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 14:47:28 +0000
Date: Mon, 21 Jul 2025 10:47:24 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ruben Wauters <rubenru09@aol.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH v2] drm/i915: replace DRM_DEBUG_SELFTEST with
 DRM_KUNIT_TEST
Message-ID: <aH5S_IlGAp5Myezx@intel.com>
References: <20250701115511.5445-1-rubenru09.ref@aol.com>
 <20250701115511.5445-1-rubenru09@aol.com>
 <ea5ac37cfae72d312c47ab1983dd1fcb59edec28.camel@aol.com>
 <aHp0HYR0pfZ-qArI@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aHp0HYR0pfZ-qArI@intel.com>
X-ClientProxiedBy: SJ0PR03CA0196.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::21) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH0PR11MB5903:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fa9be38-117f-4dae-c47a-08ddc86583bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?J5i1zq3S0Ob8RigFq5VqHbh+3MNjpQ0Tj5mpz5g6AaT5Wl+qMb7msx+qRa?=
 =?iso-8859-1?Q?UttSlgKLdNowBO7m3opCvWOtyU327Mppchv7MtGmaxLiV8Mc1wfGj6RDUy?=
 =?iso-8859-1?Q?vefyzaoNwugsfz3D8Lx4YRt0XfAKJ/5W1tMpHWZYOAsDx9mRCewyPsL8Jl?=
 =?iso-8859-1?Q?Znoyw9nPGTAG8RUz7WkD4oEUYp6kNeaMBZW6kmA3yAKNc0gfL3sFs4ma5x?=
 =?iso-8859-1?Q?AbZQdmQPik7azsbmI5kjSeowJy1qcJsOc8sapwLwq2h2ilVs1kAAErTsUb?=
 =?iso-8859-1?Q?kMhu104p+esEuRj86cE347KNcjoDUZJkwpPluE53mHlxvi6oQIp/Nzijl2?=
 =?iso-8859-1?Q?YqT8hndGPsp9nNCZPq8NHxL09laYFC76QpFhyIHogWWd21V1sbPOXQbRoQ?=
 =?iso-8859-1?Q?aFqIVZ8fqH70jk1VnqahfXbUjhcix5MWsak43X7DiaHUAFd8oujH9FurDe?=
 =?iso-8859-1?Q?rKU8fVsWfrVBSfg8s4HZ/xlgHfdiNvEL2hDHQQb+hiutPeFNeB4A34oJQw?=
 =?iso-8859-1?Q?f5S9F6tIpj1/3IUNILd80230NDKIuvgbi7M+Nf+XCuTwn9X2GxDWXngZ3t?=
 =?iso-8859-1?Q?mekqsLVFtvOFdbibNrdjV3zWpwrQ0ibUlKtckK01qLVG8WAO+rgXMHWqfS?=
 =?iso-8859-1?Q?+KmighAxOEcYVZOffr/lM9gIwWfAowYl6s49isc5M1F/h9KXFqWWi9eKkA?=
 =?iso-8859-1?Q?TsPZIgfdMyod+jtLg83vEOkzO8QkMhSEPP7c/wNsjGYCX3FhbEfkZJakbI?=
 =?iso-8859-1?Q?kIC7//yMx8rrDxGMhg+SBm7IGQ7NsVHkP9lw9FRXjn5Mu5al4syLquMDgt?=
 =?iso-8859-1?Q?8V+e5W/gs17kSCRQiG89NCfbx7SEOmKVkqVBBMol8t/VPeA01JI86AdbDn?=
 =?iso-8859-1?Q?JFIjuUJxxILh929MS5vwQo+xwx8WhObNbgE/+IRS+k0JmtVHpV2Mn1cLz1?=
 =?iso-8859-1?Q?KXvDK2wk5hnu/X13FzSxBYMbOcxJb5x/dwI015fm6IpbhYiyJ5YFYcBdao?=
 =?iso-8859-1?Q?LrgU1Sad7sEeFziX5m8nPPEpk2IsWfWl5GrRqMyeFBEQHd5PHFpJRLZ6sH?=
 =?iso-8859-1?Q?XPLA/Tdh+Vy2oML2Cw77NiYE6iZMEZwZ/bxohUoP+mS7T4+ZlNl+iLiDc6?=
 =?iso-8859-1?Q?TtIjt6aogmARiKESr18Olmi1gi9QDSe9jC4hptGWRleleIP/EK55czFLRx?=
 =?iso-8859-1?Q?A0jymRcbT/1mUTAKsalVbixNgj6JKtMo4sEO9h7bTa/TVpWRbsy5YCYsOr?=
 =?iso-8859-1?Q?8JF+FGRndJW2CMQ7CTPFNSNv7+/oTNQOh9jroadKJV0miKAA9bgbjChAzA?=
 =?iso-8859-1?Q?mz0FIQTyxsqOqZA/oaVMrXSPmbF4GRUOw/Q4b5+V5mr4Ozjtlafu0WabAm?=
 =?iso-8859-1?Q?s0+rizFY5S7+vwWOGol5d3NmqBfn0aUX5UGMKnsWNpuP3Zq7tOi8RzP+a8?=
 =?iso-8859-1?Q?PQP9Qfw51wjsuCOybzlApimlg6D300AHchirtScERYk60g6IjxWJv/ctBx?=
 =?iso-8859-1?Q?E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?3a4MAVQG0xfv5d9K42DMiSNSh037pOa+mW30glXCE1u/sYUt0KW/eZqmvu?=
 =?iso-8859-1?Q?vDDTyu6/LnzfLcLq+ymTxfSRTse7LhwD0ag4y/+EObZR7pH7T8mLpLWVUL?=
 =?iso-8859-1?Q?17zA3JFTOUjpVxUe2pRZ2PC4wulOpV0/It42paMX8CZWY7g2rQunGj/S7X?=
 =?iso-8859-1?Q?fea0dtvwAivJQUkKwsbwn2q+nN2WPfB6brJXU8gwXsZ52xS6RIHNPUdEfL?=
 =?iso-8859-1?Q?pXtyhNkR08xOuvJBwSxAI4C+dmwxenE+dH7AA06UOnWNixv4qxD3Fw/ENI?=
 =?iso-8859-1?Q?2lq/HmNTAidQpCqyDMBVejL0MH598MPX5ALGfUY+pFNSIc0q7lLISWFXch?=
 =?iso-8859-1?Q?HiQCKjA+Mr0sU2Spm8rxbmngLgyajdtAXqX+jltD0LYPfCbewCHOwn3t3M?=
 =?iso-8859-1?Q?93FJnp+uDWpSYt+BVIp4k5SIxUnaMkUqmneZO8U3j/eld6NdxjYdgS2Qlh?=
 =?iso-8859-1?Q?LUubCkEtP9d1OC2cPAjfiRovE5xTEZdeXbckCEQJsQ4i6lR7gfcwBrfQf6?=
 =?iso-8859-1?Q?rgPiBM1q7ENKSmO1vyyOgQh8vS6gkspLiZHs86jt0IrZbSHgYPGl/fCVIW?=
 =?iso-8859-1?Q?0zpqxD5IDCTITsJ6EJvpXDypT98y0PsfkQZc08zKjTCR1bDEsHOAbXd7/D?=
 =?iso-8859-1?Q?6xBcKRN2TA6Y+Iihu0YxGw55Vu50rkDQBOFkEoDoV1Vu97DO1/RtXIaIur?=
 =?iso-8859-1?Q?iHx0p4w0fG3TWKcBRarF7WbbbkbfxgfCyfubr2J58p3BczDdGoDFVFr+Ft?=
 =?iso-8859-1?Q?lKc+ww9Wjy6eoMCIwdYz0nQm/re2atNQv9MqiyxbA4MplnThxc3s1nQ/A+?=
 =?iso-8859-1?Q?/Lk5Pr+IzSzuJ/7hT6oGeVvdEvww2OdCYAplPSiI1Dry+6kg6aoGhV3FXu?=
 =?iso-8859-1?Q?7NEW9vPpcv41U3HO+RkLAeWg3rzqGC2DlKAn9fLddPASxvme+9bGhlm207?=
 =?iso-8859-1?Q?doBO/YRUCxYU0Uc3B21Jy4qxb/Nv5glt0Pj7qX8Rc1joEV1X1x4iqFCzLM?=
 =?iso-8859-1?Q?EmsHO5a5iWSpFw1leDDQihOfY9EU04DkzmQlSv6Ro6Zd/qajGb8W5suqLh?=
 =?iso-8859-1?Q?ZwbqEQmWG6PR6/5+TUsN77s7dxCrvJa4tTDIcBCkRV9kW9MIjnYH5RFc5d?=
 =?iso-8859-1?Q?2835krTVbuYIg8YXg/vXoZ1NvGt1vpJPRVIiVN6YT0DQR1IR371qQLDCV2?=
 =?iso-8859-1?Q?W4t9GntvIU6EVNM5dGE9wzN8VNCDD/9f5ZgvpJUX3oyvooaXAGLse1n7H6?=
 =?iso-8859-1?Q?8QP6l8r7wQkA76sCYdVuzh+u9d5F/T1RglX88U1abovVxK752B7C27PiZ1?=
 =?iso-8859-1?Q?Qjw6gLmalRBKygLUewC5Vws1mUBwsVYyWEBCwsQdYq6zBzoXLsqZN1+uCS?=
 =?iso-8859-1?Q?m/Bp82jHC9j+g+taoX7v0FyYdVPMSpCBxTE24kxhjoGkPBG6OWlaNGRCcT?=
 =?iso-8859-1?Q?mEu93wcmQ6AjFjBAD/kdA0YYE8yIhYDYuggQdA1HIW+ugqqBNbFdDYyIRV?=
 =?iso-8859-1?Q?5lmOmczcZZ7Fde/QM/gaPHuLHMmEZlPwq0re2Nxj5+EekW+9Rj8s2oPyIX?=
 =?iso-8859-1?Q?Nj+sqqbCzR9E43myReGRqtPgEawMJeOsJDKFhH1e/UxB7pq9o5nGo9zO1G?=
 =?iso-8859-1?Q?OdZxYQf7eBlmdcV8fG61AJPTsCIk9FE4OF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fa9be38-117f-4dae-c47a-08ddc86583bf
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 14:47:28.5900 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qUrWtZ24Ko+/PIr50X5e2oq7T0TRBvX2h7Wf7DZmJ0Fs89mmIKevkc1RZNji93cdJmVm/EVwax5c97bLJ1VH1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5903
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

On Fri, Jul 18, 2025 at 12:19:41PM -0400, Rodrigo Vivi wrote:
> On Fri, Jul 18, 2025 at 02:59:10PM +0100, Ruben Wauters wrote:
> > On Tue, 2025-07-01 at 12:54 +0100, Ruben Wauters wrote:
> > > DRM_DEBUG_SELFTEST was removed in commit fc8d29e298cf (drm: selftest:
> > > convert drm_mm selftest to KUnit) and all functions under it were
> > > converted to KUnit, under the DRM_KUNIT_TEST option
> > > 
> > > This conversion however did not occur in the Kconfig.debug file in
> > > the
> > > i915 directory.
> 
> I wonder if some deeper conversion is needed on the selftests.
> But well, I couldn't spot anything and if CI is happy, let's go with ti.
> 
> > > 
> > > This patch replaces the select for DRM_DEBUG_SELFTEST, an option that
> > > no
> > > longer exists, with the correct select, DRM_KUNIT_TEST.
> > > 
> > > Signed-off-by: Ruben Wauters <rubenru09@aol.com>
> > > ---
> > > v2 changes:
> > > - update commit message to contain more detail about the background
> > > of
> > >   the change and why it is necessary
> > > ---
> > >  drivers/gpu/drm/i915/Kconfig.debug | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/Kconfig.debug
> > > b/drivers/gpu/drm/i915/Kconfig.debug
> > > index 1852e0804942..b15b1cecb3aa 100644
> > > --- a/drivers/gpu/drm/i915/Kconfig.debug
> > > +++ b/drivers/gpu/drm/i915/Kconfig.debug
> > > @@ -50,7 +50,7 @@ config DRM_I915_DEBUG
> > >  	select DRM_VGEM # used by igt/prime_vgem (dmabuf interop
> > > checks)
> > >  	select DRM_DEBUG_MM if DRM=y
> > >  	select DRM_EXPORT_FOR_TESTS if m
> > > -	select DRM_DEBUG_SELFTEST
> > > +	select DRM_KUNIT_TEST
> > >  	select DMABUF_SELFTESTS
> > >  	select SW_SYNC # signaling validation framework
> > > (igt/syncobj*)
> > >  	select DRM_I915_WERROR
> > 
> > Hello, I was wondering if it'd be possible to have this patch reviewed.
> > Having an incorrect Kconfig entry isn't ideal and it'd be good if this
> > could be fixed if possible
> 
> I just resent for CI before we can merge.

pushed to drm-intel-next

Thanks for the patch.

> 
> Thanks for the patch...
> 
> > 
> > Thanks
> > 
> > Ruben Wauters
