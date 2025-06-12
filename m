Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB2EAD7976
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 19:57:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB06610E0D0;
	Thu, 12 Jun 2025 17:57:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VZeAoR73";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A26110E0B1;
 Thu, 12 Jun 2025 17:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749751025; x=1781287025;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=vScIjYiuje0F0vpv1Xqitm2zqRyUG6etM16u3I+tq30=;
 b=VZeAoR73s2cFQ8H5nths5oEG3hjGLT+2yBiiabSDyu5Sj0HKMa1PAEte
 Gnpo0nQphPL4Ifx25VXXj9q2NzT2VGmseyL2AcXeyIuCTnj8UKzLxdOXB
 1ScPAC0OtLbYRu6cgCd35HjCRkWzeStoCz6bR/RITHSC88QdPx8wUwpMM
 h8QgaTO0pA4RL4szNXWu93f+W7lUmXKnS5xnEsPxmpMibxRuktpW8i/oM
 1GWY0nLb2p2/juzWIF/DPj5rirVLWfLflp7kxyhqo04TP2YotDeEcYBkc
 aEKcp2Jxwi/hIGQUrDfRzsPSclc7kKbdSY5HjYz0xVbru/1uvbK0yFyJw Q==;
X-CSE-ConnectionGUID: X9zFaHTiTnCD8sPOjh8Rjg==
X-CSE-MsgGUID: BMlfIh6BQOuxPmPc4mPp2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="52087642"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="52087642"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 10:57:05 -0700
X-CSE-ConnectionGUID: iYne3qqARoedH5meGavA9Q==
X-CSE-MsgGUID: W8t8SwWEQ1G4y01uFxEP+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="147503522"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 10:57:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 10:57:04 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 10:57:04 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.76)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 10:57:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e7hTfZlD37ZbFW9NxMMqtLv/61VhJuUazfIC/y004i66nKwYwe7JLm1exnT2o/Kum2btN0SDfnfJMXxw8S5mJhEEhvcRUEPZO9xgIDuV1TYDPaCBXw3VZ5sXpQ1wz40szDpbxs2YhpMjq3L2wPZPk83LFfUl4n9Ox+iW54wq+2048JX8wDE9HNnJo51PTUMEV76dGkVo1NBd/pl0/RWX5INp2fg6ElhhWp5Ecq8zYCKxjD3Xsf1Ck/W5JN6n6n+VuWL4X5LeFzv7gX+6IFaWmWUIdbs4A5tbsruSECiaf/TQjXB8z35HAlLR0nJqPcepM5XnBh1WoV5Ja7IpI/BhXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=68hSgHTvVAg11VMFj3NkZbdDj6BebLtpGWrekyIYZ34=;
 b=sPILO7osvrrFjPFvcY4G0KIPLdjLeQkcvPYXj44sFJQehEL1pvoLDONM8oqhcVja0m6lyd8bVnQ9P2Pfpar29EvrNiQD6T57z889b0Oqf836NdsmA7HbwDAaqt6VEOJs6Id26qtnWTHzzRpIpQ8DxxYVfknWjcuz5B2oiZDXGjB0o+flDBd/cW7c0mtIbG0cVWE1+7RGka6y//zlVcefbUgYrqovXgE/Iec37o+x5wyWcf4zTLWmNrtRIgMvPTEYwMsviic+RsjQiqnWlkMlqdjVaxxhoIRh7HaNCy+I/ybiAXAESqJuylKGOeyNMcvvE79oYwhXgMO3xBGLE/zvrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by DM4PR11MB6381.namprd11.prod.outlook.com (2603:10b6:8:bd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.29; Thu, 12 Jun
 2025 17:56:47 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%2]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 17:56:47 +0000
Date: Thu, 12 Jun 2025 20:56:35 +0300
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, Mika Kahola <mika.kahola@intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>
CC: Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Lyude Paul <lyude@redhat.com>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 0/5] drm/dp: Limit the DPCD probe quirk to the
 affected monitor
Message-ID: <aEsU06HmRMmVlL57@ideak-desk>
References: <20250605082850.65136-1-imre.deak@intel.com>
 <aEhSTIVTQyHqfmnc@ideak-desk> <aErWSEB1NpJ_t4BJ@ideak-desk>
 <d419ca95-afc2-4411-9cb6-d19e82ff1652@suse.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d419ca95-afc2-4411-9cb6-d19e82ff1652@suse.de>
X-ClientProxiedBy: DU2PR04CA0310.eurprd04.prod.outlook.com
 (2603:10a6:10:2b5::15) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|DM4PR11MB6381:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bfbd894-5974-4258-4e7f-08dda9da8011
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?RlQKp4Vj56Sgf0FgvfW5wFl2bNpHLKfpem+A+YDO4vibgWUrkoYU6C9WZQ?=
 =?iso-8859-1?Q?XgJh0YjUJZOLlt2oBUmmkdlwDRqWvT6SUzYg+p9mY9klsbLVA4+mKXASbe?=
 =?iso-8859-1?Q?EHAdmXocoeZNpYtAWSB2DwLhjcHbgfJ37DBVMUyZKoMwsZAOZcfDRu4Vda?=
 =?iso-8859-1?Q?eIKczUw6beZdn6XPQgDIqsujPyLS6wo3je0VKsllh8mbBNpRYgTg0Ua0Yc?=
 =?iso-8859-1?Q?/8i6ueAB5PyTSG/vKIW1kE1A6Oc7+JI5JtXk7kH3av3IWvdVvLABQtdKgv?=
 =?iso-8859-1?Q?z82mmoT6V5jNW/XSPJKOwCxzfrL5x3pk+KYkfgcJ/yxyyG6OrI+3hOOCPZ?=
 =?iso-8859-1?Q?QLdQ19Zd8DHuK/IxLi4NBYtYAQ8+tBx9aFC82OO93kgzADz6LxpOBeYCYI?=
 =?iso-8859-1?Q?baBJ0gRVU8FUswHizamz08w+MvrYeFN4HKVJnkxGp1bR/+ZW0DSBcH8L3j?=
 =?iso-8859-1?Q?dgTzxQMo56qTa0489xB+TqoEolDceU6Dd1Azajpvq8/aDCGIfbM0OkJV7k?=
 =?iso-8859-1?Q?VZtXUfapgiNAJrJ3qF1Fv3AfFOuTQmiCjddvyEj06HdaWyBO3H5RAlPnqA?=
 =?iso-8859-1?Q?FsBHt4EGunkSpOtZXSC6PcssczvsvFpQTGpQvWQa5i6OZOeQDTq4avqYJQ?=
 =?iso-8859-1?Q?2XS0g41DpjCnpKHXzPMamZDnFjXMXWi+fB8Ms75sotWMwWMIKHIdcKzlBG?=
 =?iso-8859-1?Q?KzZcOGnHmIDPFWnf3e8sfZQ7a9iD9RmF5XRqJRVJQE/gWMrOUzD9VE+ydX?=
 =?iso-8859-1?Q?FGWhibk0Y/a8xPoFa+7V4RO7CEKlyVpSN+uk4XsKAXHr8mxUsNVW6lk3R/?=
 =?iso-8859-1?Q?d56LDQXkk8dC9DFJpzF7Ee2+Rn44mDuxv04YkjdfsLHWHZHEXOjRS/0jPN?=
 =?iso-8859-1?Q?A/hxFkSr6t6//GTCqQeNxhlZ78h41tLNgjOvZjRvRyMRagjDUnBzsJU8Zm?=
 =?iso-8859-1?Q?ne3QjVUBObbPfGwEVkVfbkB+7GgYCaq9IAZ/aBLLMDmwa2pBT2Sk46M6EW?=
 =?iso-8859-1?Q?R451JOz/HoCGa+hTwR9U3Pp7cyoAqDbx/ffKdl8qrb2vfdZS5SrcgPLNnk?=
 =?iso-8859-1?Q?GD52tE729bqLdSQ3Uvr1rYAAMSGxg7VPQtzYSIAcYvwduIcDA0zgNHEqYp?=
 =?iso-8859-1?Q?84KBH9cbn1htFwavux8KtdgQuTH/OUvQTfyEmU9V+E4U8J/67SHbFvwl2t?=
 =?iso-8859-1?Q?PLPGfWOKqvk1MdWuQHYkCdJDpnpBW2fIGomOaW0dk8CUdpmkylvN4Z2m7K?=
 =?iso-8859-1?Q?9dXd6/97VlwgITBepjg9YoBH558+A+sIH80kOFW3OgIYGFfOw/mQNSkVwV?=
 =?iso-8859-1?Q?jk7ckSX3hKG9wTX6pWCQkITuxcPF7CuohXp/qmGe66w5P+zNqsfUGd02ra?=
 =?iso-8859-1?Q?y8z33I7uI7WKvspI7k07w1aV5mnfpbUhvZ/dOAtKOImMNOS2OIKuOHCQF3?=
 =?iso-8859-1?Q?LrJ5BOtXoUhSalqnghLn6czXTs5P2QhYYcz9lu1FvvZEQyyV4e6sEF2FjY?=
 =?iso-8859-1?Q?k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?k7AMibC5faT8ucv4uzONkrALiJdDS1YJDTAQh5dYVqE6VL5uMJEbvGmH30?=
 =?iso-8859-1?Q?h9OYRfYdMVfaYYD6hKLGxsDjm1Te0yKK9dlK41DIlgNnioGfPTomp2rb5f?=
 =?iso-8859-1?Q?9vUBYdFHk9nyOrvEktf1Cl1iC6KVn9wE4MoBoaaUctV6cElibktbRLO/kI?=
 =?iso-8859-1?Q?z7cJtsa7Z1G/vSoI1vDDn917sCbqD+Xa40IpRMyHXXeY4TI012w5V9IbOn?=
 =?iso-8859-1?Q?NE9RZMzsZMsQbUFz4+lWRvWMDTiLya3Jhvk7+X9Ue1zMNxIbahWIYKyGcD?=
 =?iso-8859-1?Q?dzZSJtMP+L4D3Sy02wY5Qfy9nTcbw6CweOlG8C2W7G9lj9q1EsV80g0yXg?=
 =?iso-8859-1?Q?L/YLrKXDFZ2w0avOGE5D9Yx2jkRK5XYs5ELwu8AYyiJy7P/A4BPbhjPERv?=
 =?iso-8859-1?Q?SsHbuzp3vbmekIx0PmKPaPud1gX9/lbMa3rZoVFAzJTSbqJ3suGtCpnuqj?=
 =?iso-8859-1?Q?ONkgerx/+fvn1KBxectCie6jRFRxJMAzM1Xx4dnPImHIUxHmzL6oQHyh4H?=
 =?iso-8859-1?Q?WRg3XeYBKWbvCmyLuVIrh4yj99bqnkTwSX7zG6Ex0E8X4hwtIPWNzhoTv+?=
 =?iso-8859-1?Q?lMxXykjK3eW6k8BxPY6497WTqnXZaeM0ICXRj7swCcjx5E+P8IjXP3Tnw6?=
 =?iso-8859-1?Q?DYVLXs5pbjkNYYP9/QNaUPJNKgWWZLBnajCGjAB/FfJ4yvz0EQ82D1oVxU?=
 =?iso-8859-1?Q?dXl2MAktsxvRQoz0f36olxqZj6IalZDXo0U5gedl6JN9o200YDxan1TFQL?=
 =?iso-8859-1?Q?qwb9Vgv4dk2ZRLt2KavBrFlgQGI0x/A3EFam2laurl75Q+wbq4AeDepsyk?=
 =?iso-8859-1?Q?U7pmEXSx6+AmZAIcWGaarVUn7NRCxfwCpAexkfIdpgeQz1XQnGYZv/m9IB?=
 =?iso-8859-1?Q?1AFr3VO3uoEDZWUqx9K5uAajS0ZF8TY2avD2LDGiG1wJhoQ8RWIHBFFGyv?=
 =?iso-8859-1?Q?sdcLUN+EnLcSbDxfEqypO9LO7LHrwVKYuvmHtyHx28LKsfHCte3SJVYc71?=
 =?iso-8859-1?Q?VoosfTERc4JRXlvFFxtk6mk+jfREOn1o10gDlhJDMt7rAPbskV4hPAZubV?=
 =?iso-8859-1?Q?1YMr0JA+gyReZ+nP8FmOJf/J4ajvSXyyo1KP0EB8dSksBsptc60P+muRPg?=
 =?iso-8859-1?Q?ozj0Fmp3+otd6Gy0sK3JOHiwi/Tfh6CEVO51spIZL11JVHkmgGXuabAvHD?=
 =?iso-8859-1?Q?fDis8lOm9F+kXu32i5m/n7tEbeZNU0XcFrKsyY/Ct7iIfFmiuvWuDeBqZo?=
 =?iso-8859-1?Q?EVVa4O1twp5laJfP5XLr9CBTUaEK+yqg4LHGYsywNFUsXSBmTkdOseQYsz?=
 =?iso-8859-1?Q?26oUDgCzRVXX5A5eKU9OPgccdD0XJIXmKLA6MdRjtynNUBiHxwr4DDGgce?=
 =?iso-8859-1?Q?+T7+1iv5kWOv7uZRLkZUO9g/hHutuRcQ0ywHFRSgxjXG4wNndixAzt41ce?=
 =?iso-8859-1?Q?J4HSHhi+k2pM053cZYe3lieIjERxuDpQqFn/Lv+8xl07sS/iAwoAbgN8OW?=
 =?iso-8859-1?Q?Bo+2tpBnzg9Psauu08mwNzhqfUo79JCGfAsGqgVdSDJP0sK8uC6QSaLRLa?=
 =?iso-8859-1?Q?/uVbvNGaEwGM762cQP2zVPdqxa1o9oMeEAcwqnUPVdY8kf4ggDL4hKhU47?=
 =?iso-8859-1?Q?S9hS66xmqdFUGN6cpzGxyyjA+WuulXb1xv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bfbd894-5974-4258-4e7f-08dda9da8011
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 17:56:47.7295 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +EzumFDOLmFXIrKNuwXQtxtkiCYN5079fp+J4qJCVnjulqhBk1lxdw25wB8MAbl/+V4CRnFkBHesOuNw8ZHH9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6381
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 12, 2025 at 03:54:51PM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 12.06.25 um 15:29 schrieb Imre Deak:
> > Hi,
> > 
> > On Tue, Jun 10, 2025 at 06:42:04PM +0300, Imre Deak wrote:
> > > Hi Maxim, Thomas, Maarten,
> > > 
> > > could you please ack merging this patchset via drm-intel?
> > any objection to merge the patchset via drm-intel? If not, could
> > someone ack it?
> 
> Sorry for missing that. I'm OK with merging it through Intel trees. Go
> ahead.

Ok, thanks for the follow-up, acks and reviews, patchset is pushed to
drm-intel-next.

> Best regards
> Thomas
> 
> > 
> > Patches 1-4 could be also merged to drm-misc-next instead, but then
> > would need to wait with patch 5 until drm-misc-next is merged to
> > drm-intel.
> > 
> > Thanks,
> > Imre
> > 
> > > On Thu, Jun 05, 2025 at 11:28:45AM +0300, Imre Deak wrote:
> > > > This is v3 of [1], with the following changes requested by Jani:
> > > > 
> > > > - Convert the internal quirk list to an enum list.
> > > > - Track both the internal and global quirks on a single list.
> > > > - Drop the change to support panel name specific quirks for now.
> > > > 
> > > > [1] https://lore.kernel.org/all/20250603121543.17842-1-imre.deak@intel.com
> > > > 
> > > > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > > > 
> > > > Imre Deak (5):
> > > >    drm/dp: Change AUX DPCD probe address from DPCD_REV to LANE0_1_STATUS
> > > >    drm/edid: Define the quirks in an enum list
> > > >    drm/edid: Add support for quirks visible to DRM core and drivers
> > > >    drm/dp: Add an EDID quirk for the DPCD register access probe
> > > >    drm/i915/dp: Disable the AUX DPCD probe quirk if it's not required
> > > > 
> > > >   drivers/gpu/drm/display/drm_dp_helper.c      |  44 ++--
> > > >   drivers/gpu/drm/drm_edid.c                   | 227 ++++++++++---------
> > > >   drivers/gpu/drm/i915/display/intel_dp.c      |  11 +-
> > > >   drivers/gpu/drm/i915/display/intel_dp_aux.c  |   2 +
> > > >   drivers/gpu/drm/i915/display/intel_hotplug.c |  10 +
> > > >   include/drm/display/drm_dp_helper.h          |   6 +
> > > >   include/drm/drm_connector.h                  |   4 +-
> > > >   include/drm/drm_edid.h                       |   8 +
> > > >   8 files changed, 189 insertions(+), 123 deletions(-)
> > > > 
> > > > -- 
> > > > 2.44.2
> > > > 
> 
> -- 
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
> 
