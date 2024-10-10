Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C42998061
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 10:43:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE2C210E899;
	Thu, 10 Oct 2024 08:43:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RC5VTOVY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE2B710E2BF;
 Thu, 10 Oct 2024 08:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728549836; x=1760085836;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Kk3ov/dAbjYJ5U+vwlXBUWjMReJfXUW2ZJ22Qv2AgyY=;
 b=RC5VTOVYYA8GEYpiGIsyvZvT3kM2pyOQwqFaavAPjVOmChadxCGYeGzS
 TPSRswyCQESi6oiyNrV36O4eSxQ7WnkitL64pMOunR1fxg4S5sIOGjYvy
 BPZ/38IIqUdkzIWIs+PgOADu3e8ZSDS7YodZ7MYOHzcepSCjo/1BwWi7k
 wPKfJHhg77PghHmIbDFTkbBUJB6XebgVq+3oc6eohChY9vq8tlM+ZSsTT
 +IqXcc0eHJoZlGFqOxf8fPXRUgGUElPAmtaRSbD30Ud/argLhiSMAVix2
 Adv9sM6E67wWl0p9vo4WpRdNldQA7C09ZBwc9erpClliaoe8ggytjoh4/ Q==;
X-CSE-ConnectionGUID: /va4qslkR8KcOg3DI6zutw==
X-CSE-MsgGUID: MSnIAfzqTNSOiXpz6nzh+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27767210"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="27767210"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 01:43:55 -0700
X-CSE-ConnectionGUID: t6iz2lJ5QHGV7R4g2PX0yQ==
X-CSE-MsgGUID: iMxjelTmSv6KXeqajPcNYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="76439493"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Oct 2024 01:43:54 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 01:43:54 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 01:43:53 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 10 Oct 2024 01:43:53 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 10 Oct 2024 01:43:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=smRBOh8lS5Qpcr9pRt/SfdkA1XpbUm/eTieVWwWgOfbmX0VHBZ5Hrchy9dx00JBkBWBD8LGcSCtc7BBZpoCsjVQwrDQ8X0uuSqilZCaPFHXnO9SucRjuv22sdPJ72jqmBYQEgepbvSknDMYfOjCaAh8wvJLO7JjxrqSDumdU2zppqoEjPDcg+XhEWKlutIZeFUuRix4t1Zdsgx43n3/iR7hzjsej9hRT5MW9g5AwDHsWkekUxpNmZSVrmSCcO/tMVV0eVQFHixNMLqRyIl1/hKF0xgjBexBPosi3rL2uoh3Z+65e7KXbtm/cu+LvYAAkHr4yPhKPah0lwrMLis6qWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FMJKfjshC286ZfEZ0pF6cFid4EHnNQqX/NAtUSoql1M=;
 b=hqZqfgndV4zknzfTlztB++Eylfmh4M4rL47imId4YSEV/Eo70bXWF2HI1obm6lo9Po8IHS8AWbRcXPuRhYePjfr6+JEyiqfMFvuMg7IXuq12p5GF7V1qW1hhfvYVgj0iRNmxeh5z2A/Z7YXM5NG4SKwGVFtevPD4lp59GRCfpirvIwXUr1CUMLclikeX5WDrCYR8DciyVcYHh9sN1tSGiV50sEsJ3mr5H86QXGPla1ejyrIADqazhoc1SHbaPO8IWIQ5/et3RnT5j68YVRliyzn6rtx0c/yKUcdOlZXQEMmnHcsaM9PbYScAwCW7Ti5SQ8pdIQim4dKRAajLuLjmQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ2PR11MB8449.namprd11.prod.outlook.com (2603:10b6:a03:56f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 10 Oct
 2024 08:43:50 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.8048.013; Thu, 10 Oct 2024
 08:43:50 +0000
Date: Thu, 10 Oct 2024 10:43:46 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
CC: <linux-pci@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, Bjorn
 Helgaas <bhelgaas@google.com>, Christian =?utf-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
 <kw@linux.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matt Roper
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 2/3] PCI: Allow extending VF BAR within original
 resource boundary
Message-ID: <q4rlysahrqcnl2uahbblzz5z7e3crfluiio6xg6esuodqqjvnf@qfac4dkfokcd>
References: <20240919223557.1897608-1-michal.winiarski@intel.com>
 <20240919223557.1897608-3-michal.winiarski@intel.com>
 <90235e12-1c0e-d952-8d09-fef2bc8ed942@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <90235e12-1c0e-d952-8d09-fef2bc8ed942@linux.intel.com>
X-ClientProxiedBy: WA0P291CA0007.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::11) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ2PR11MB8449:EE_
X-MS-Office365-Filtering-Correlation-Id: caf77765-68ed-4daa-5051-08dce907a983
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TW0rNndUZGU0cGVnVHMwNE16bGh5bWlzenIrL09PTEIwYUVya1h6SVIyM0R0?=
 =?utf-8?B?VDlFNDZOODFPZ3lick1LMzAxSFN1ZU9MMlIwNXVjRml3bmdtVXdHWGZ4b0Na?=
 =?utf-8?B?VTgwa2VmV3F3ZDJockJVellDMkJJck1BNVpXSEhsUGcrbEVadmFBdHhxdThI?=
 =?utf-8?B?QmpnTWg2WW5QTHZXSHpTc3RVS1VqWThYTUU2QUpJODlCUUFycUx6V2prTlNP?=
 =?utf-8?B?eGlYNTNiSW1taFQxMUJKcVdhckVKN3IxTWJ3UTlsRUQydzd6S2xsV2x5S2E5?=
 =?utf-8?B?eHpiU1NZWFV3MnIyWGpETkUyUkVTMGZ5SEU1RFhwS0hDOUVxT2ZRbHJTUGZy?=
 =?utf-8?B?b0pmVEdFL2JhclpPa3dYUE1mVU1hTjVkQm8xVHFKTlQ4L3UzQU82R0NSM1VQ?=
 =?utf-8?B?UEJ6dVFJa3ExU0d0UFozSmc3d0J1ZDFMYnQ0cStmQ0lBL1NkRHZFUFlhMjJW?=
 =?utf-8?B?QmVaazkwaHU3QnhZSWpraFgwTVFMZmJ4bDNVMmhuYnN5MWhrQnVmQVNKNTIz?=
 =?utf-8?B?eGJSdjJUZGplR2VzNE9OTlBCc1Mvd01JWGdZbXVMZEVIOWF4S3hGQkV4OHBo?=
 =?utf-8?B?R2tpYmZFUkNjQi8yVUgzSWxmdzQ0TysvQUxERVBZeHJDMFdtZkY1R0pBb2NM?=
 =?utf-8?B?emU5YVVTeW1mdVpVaTFTS3ZrYUdIYndmUmszYWtMYXpUcEVXSVdJenZNNmhr?=
 =?utf-8?B?Z0IweTJqMU51d2M0UHJNM2hhMW5yOXNnZ3ZkMURRa0YzL0RaZjRCZjFzRG1I?=
 =?utf-8?B?dERiazNjSm9nOHYxaWhyVldWRWpLdWtNZk10VnlMLzg5a2dRNm1HNnEzY3ZR?=
 =?utf-8?B?YkkveG15ckhqKy9KcW4yUU1Wd0ZKOGhScGpxVlg3Q3dmQzFpQzlMbzFZb0ZY?=
 =?utf-8?B?aXJkZXBtemo2WEw3K2UxMGJVRXZEckdiQm5nOTR0SGNmNDFQUjA1YUxrcG1Q?=
 =?utf-8?B?by9weUhlVTFDUWIydmE2aXFNSyt0ZGo4RGFsOTlMK25VeEwrWHJjUE5makRx?=
 =?utf-8?B?TERjcDMvc2N2bkpOWU5SdHRoYU0zWWNNM0FZdnczTWlSOXZQVDZLQ0tCMDVX?=
 =?utf-8?B?NU53VlEremVQYmxGUEZNZVpNczlvUzZYeEMyMFVLUUREeFB6TGtjQlBnNWps?=
 =?utf-8?B?bi90amNYYzQ4R3NFb09DREVrZFNMMlpzMWNCaGR4MnpwSWJRZnQ1MktzbjhD?=
 =?utf-8?B?MitIVmw2RDdmYk1OQTE3YW54eDNDNFF4eVNZUit4djVtM1d2a0crQkpTT0V2?=
 =?utf-8?B?Y1h0djJQYnVvd052VmlrOWtrNjNlMzRkZCt6NWY1RE4yaVJuK2NJOUhNVElI?=
 =?utf-8?B?L0g5LzN0RHZIcjF0YUdUVWpxQ1VERDFyV1R2VFllZEZTSDQwbUsrWWZPYWxD?=
 =?utf-8?B?QWdFdjh2R0xFak4xY1pIbVBZZ0d4MnZlNVRCOFVMUFN3dmZ4TFR6ZERqWjl5?=
 =?utf-8?B?c3U3YTVvMExFcHFCeThFalQ2N1BNZ1c2VVp1NERSUVVMTFpMa1lZTUE3Y2hu?=
 =?utf-8?B?OHI0L2FkVFFnR2s3dE1sTE8wclJ3cWZVZktuT2RUV04yT3FGYzRZVldyaXpw?=
 =?utf-8?B?b2JiVEh5WVVqSEhCNmJNZFhkVjB1a2Z1V2F5MUJDb1Y0WXViMHVIck5uTDRC?=
 =?utf-8?B?VldQNjd0a0pnWHVFOTdwR2lzcTc4TGphVjdMSU1wdnpXYlYwUUNNSnJjYkhH?=
 =?utf-8?B?dXc2OUIvcXNCUFFHL0JFRDdoanlGT3JwRjJKanFRMExQMTM5Sm83TFZ3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFhrWjRyZ29ITzV2UkdMUjVIU2VYMGRuWnhKejBwT0ZFVFF5WkJaeWFaNW11?=
 =?utf-8?B?eWtid0tiNkxJZ3hneHlmOGhJQ21xQmFMS0dMeFZ2cm1nWjRtSFk0bWFqSjdz?=
 =?utf-8?B?bmV0WUxaV29CcWJaci9tTEU0VXN3RlRycngzMkdzUFlTTzNUNjhkUnhDZmV1?=
 =?utf-8?B?eEM3NXp5UTdwU0JjTmxKK1hIZ0ZWcGlmK2xrZDlHZVJsNUluKzRoVmdjdGFq?=
 =?utf-8?B?MlAvczI2bDFWL2lnWkxlR3RGc1RJbmRtUHlaOUFESFIzdkh6M0V6V1k5QURq?=
 =?utf-8?B?V3V0RmJKaGxvMGdXMkVoWjc2QXJRRm1aank2MUNLRlB6dUdyOWJXaUcxRUFR?=
 =?utf-8?B?ZnVqbmlpdkVlOSsyN0dKcWpEbUlQZmJPM2I5SFh0UFN0MEJZVjFLWEFDc09P?=
 =?utf-8?B?ck5WNVFmMVFCbjF2YnZ5ODNwTmhIcEM2dDdoSHJvaitHbkhzK2RCYWQ5MUR5?=
 =?utf-8?B?bVJGcDZFaWRjbTJ4TksrWE9mWlpVUHBCS3hLVHFUZnVjWXJKLzNzWjJtTUEv?=
 =?utf-8?B?U0JaOXd4UTlZYlNuSGNFOGNwcDVsY3AwY3RGdDVDRjdYN3c5MTVaNytPSG80?=
 =?utf-8?B?Z29LTDFwZ2QxdTZQb2V0YUk4Nm5DRjlJaDBYNS8zRjlZNkpRbm00WGdMSXdx?=
 =?utf-8?B?UUxyNkZHeGhqbzlVbkZxQUVPeGNLOGpPYkxKS1pmbTBlTjFzcUlXTHM1Q0Jq?=
 =?utf-8?B?Z0xPekJVQ1UzdzZETURhd0VBUFFHU21pUzc4bGNuRVJoTFRNaEEyNXluSFp3?=
 =?utf-8?B?NUt5Zyt1bnRPMHZGZGhlSmhNdjRhREp4TmxyaTVpNTJDbVpMQURNNlVkbGI5?=
 =?utf-8?B?enRULzV5eURWaUpWZmk5M2h0TGZxL1pxcGlBcjhIdnQ1Y3U1enIrckk0QUpa?=
 =?utf-8?B?Z1BrSHRIZzlLNkNRQ2p1MkZvUkhIaHMwL0QzSWlvQlB2SC9yOUhzdUg1eUZJ?=
 =?utf-8?B?ZDVETVlLcEFiZytzeXErUVhON2tYQ2w1NGxMcDVES3hIamNQekNreXRhaFBM?=
 =?utf-8?B?b2dmR0E2bmxLZXpSbUNzYlVSVCtjQU1ORlRUeUs4OCswVkkvMzZ3RTExNlFE?=
 =?utf-8?B?OU1pU0drQzBPSlZ1VXpnUzdvb3JCelR2UzRnNGw0eW9RVzloNGU1VzhJUllB?=
 =?utf-8?B?YUZsM21nS3ZqUlR1NVQxcENvZmNBVitlY2R2TUFOeGltY2ZTbVpVUVVhSEdU?=
 =?utf-8?B?YWYvVUNXYytzem0xbjNEeVBUc0xxeFlYYTFyWFNWK29qczBPV2tNRkMxcHVl?=
 =?utf-8?B?V1VaTHhlb1hqNldXRkV2SXdGUWNBSDVKZ3BzMkxxMWI4Yk1FcnZEVU4vK1l3?=
 =?utf-8?B?UitDek9rRmZNVXRSS0tma1hRcEdDV09seSthaDNuVVZ2RE53LzR5WXBOdWZR?=
 =?utf-8?B?REJXT1Z1WGRISmg3ZmFHbUE5a2NrcjZkTy9SZVMzcVd5Y05XOXR5bWRPS0xU?=
 =?utf-8?B?MGo1NGdkcEU2bnBnM0VyL2hTN1NMYm1ZZkRTNkJhQ3JIMEtZbk9jWWxXTHkv?=
 =?utf-8?B?V0EvOEJ3a2Z6OVJQbnF2QkFVWjc1MEJUeVMxODRMdlVoNkR2VEdZdmdsNGxl?=
 =?utf-8?B?OVdyejhkQWNrR2h4NnRGVXcxekVLd0xySWlIUGUxVi92Um4yVHhpR1A1bW5X?=
 =?utf-8?B?MUdhaHhDRFJrc1RZbmJOcmswckdaTm1DZzJKRGZJdlFlaWUrYUlhNkVjQ29R?=
 =?utf-8?B?UU55VXorMGtyeCsvbStqRGJQZG50cEFiMjNsVFdrdlU2UzR6ZHNjV0x3SmE5?=
 =?utf-8?B?d0xEaHF2cmt6dVB2NkJMbTllVEhIYWRsVDVXcUFsdC84dElKemJYdWtEWjcx?=
 =?utf-8?B?WEJHbzI3TWJSY3pZK3A1T1YrQlEzVjBHKzRuRzhoTzhvSjdGQkdrRTE4SGdQ?=
 =?utf-8?B?dnBSSzhaRXlpK3VDM2RCRU1COGptZkFXS2Z5d0IrMmtxNmE0N3lwTUx0aUlU?=
 =?utf-8?B?TzluMDhLczdVekhaS0JVT3dkbGNQK1VvZWpqcUVyL0dVZCtSd0NJRFVINlJV?=
 =?utf-8?B?RXQxRGpqN0d2dmxTYzhUTEQrU1BjQ2dhdnl6MVZjUnh0Z2s3STAxT3dKOXk4?=
 =?utf-8?B?SmR1ekRBZnZEZjNPcnA5Vlp3RWREbDZncDhTVnVTZ1hlaDJ5LzFhYVhZcmhB?=
 =?utf-8?B?aVI5TTJqVVhxa1gyM1UrQ1pBcEtTY2pFbXRnVTk2aC9GQVh1YXp2RVVaSWpO?=
 =?utf-8?B?Y2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: caf77765-68ed-4daa-5051-08dce907a983
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 08:43:50.1851 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AlkdRgSSyjY7JU8+2JkzOikoQXxFkinUYyNoouUCnzcnXK1258DepxjOh4w2LWSwkm0SXA+plHbl/mOY/FdmBLJAyIZ7ZPd7xMPcShkSbLI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8449
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

On Fri, Sep 20, 2024 at 02:30:00PM +0300, Ilpo Järvinen wrote:
> On Fri, 20 Sep 2024, Michał Winiarski wrote:
> 
> > VF MMIO resource reservation, either created by system firmware and
> > inherited by Linux PCI subsystem or created by the subsystem itself,
> > contains enough space to fit the BAR of all SR-IOV Virtual Functions
> > that can potentially be created (total VFs supported by the device).
> > This can be leveraged when the device is exposing lower than optimal BAR
> > size as a default, allowing access to the entire resource when lower
> > number of VFs are created.
> > It is achieved by dynamically resizing the BAR to largest possible value
> > that allows to fit all newly created VFs within the original resource
> > boundary.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/pci/iov.c   | 92 ++++++++++++++++++++++++++++++++++++++++++++-
> >  drivers/pci/pci.h   |  1 +
> >  include/linux/pci.h |  3 ++
> >  3 files changed, 95 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
> > index e8ccd2ae0f024..d88efbfa70e42 100644
> > --- a/drivers/pci/iov.c
> > +++ b/drivers/pci/iov.c
> > @@ -181,6 +181,86 @@ bool pci_iov_memory_decoding_enabled(struct pci_dev *dev)
> >  	return cmd & PCI_SRIOV_CTRL_MSE;
> >  }
> >  
> > +static void pci_iov_resource_do_extend(struct pci_dev *dev, int resno, u16 num_vfs)
> > +{
> > +	resource_size_t size;
> > +	int ret, old, i;
> > +	u32 sizes;
> > +
> > +	pci_config_pm_runtime_get(dev);
> > +
> > +	if (pci_iov_memory_decoding_enabled(dev)) {
> > +		ret = -EBUSY;
> > +		goto err;
> > +	}
> > +
> > +	sizes = pci_rebar_get_possible_sizes(dev, resno);
> > +	if (!sizes) {
> > +		ret = -ENOTSUPP;
> > +		goto err;
> > +	}
> > +
> > +	old = pci_rebar_get_current_size(dev, resno);
> > +	if (old < 0) {
> > +		ret = old;
> > +		goto err;
> > +	}
> > +
> > +	while (sizes > 0) {
> > +		i = __fls(sizes);
> > +		size = pci_rebar_size_to_bytes(i);
> > +		if (size * num_vfs <= pci_resource_len(dev, resno)) {
> > +			if (i != old) {
> > +				ret = pci_rebar_set_size(dev, resno, size);
> > +				if (ret)
> > +					goto err;
> > +
> > +				pci_iov_resource_set_size(dev, resno, size);
> > +				pci_iov_update_resource(dev, resno);
> > +			}
> > +			break;
> > +		}
> > +		sizes &= ~BIT(i);
> > +	}
> > +
> > +	pci_config_pm_runtime_put(dev);
> > +
> > +	return;
> > +
> > +err:
> > +	dev_WARN(&dev->dev, "Failed to extend %s: %d\n",
> > +		 pci_resource_name(dev, resno), ret);
> 
> Why do you use dev_WARN()? (analoguous to WARN_ON() / friends).
> 
> I suppose you'd want to use pci_warn() instead.

This should never happen - but fair point, with something like
panic_on_warn it would have more negative consequences. Let's downgrade
it to pci_warn().

> 
> > +	pci_config_pm_runtime_put(dev);
> > +}
> > +
> > +static void pci_iov_resource_do_restore(struct pci_dev *dev, int resno)
> > +{
> > +	if (dev->sriov->rebar_extend[resno - PCI_IOV_RESOURCES])
> > +		pci_iov_resource_do_extend(dev, resno, dev->sriov->total_VFs);
> > +}
> > +
> > +int pci_iov_resource_extend(struct pci_dev *dev, int resno, bool enable)
> > +{
> > +	if (!pci_resource_is_iov(dev, resno)) {
> > +		dev_WARN(&dev->dev, "%s is not an IOV resource\n",
> > +			 pci_resource_name(dev, resno));
> 
> pci_warn() ?

And this one is programmer error. But same as above, let's use
pci_warn().

Thanks
-Michał
