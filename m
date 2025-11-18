Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 148B6C6B090
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 18:45:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E22310E515;
	Tue, 18 Nov 2025 17:45:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RBOi8s6O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A74E10E519;
 Tue, 18 Nov 2025 17:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763487919; x=1795023919;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4Zf9F+UZPzvFx7juvQ5ioEyRbgyx4UA2ameZ/Km9AAs=;
 b=RBOi8s6Obl/jc/aqRZu62BeuQEJ4/AHfZr72h/qU0KV3PgaleLKeyiwU
 9ZIH+j4L3nWzWOFww/nhRqpSsijK9CCtRNcFRNZ5RXaBPfcQuY5Vj/NZ4
 XZQ/s4vDN29DuCDI4v+UoHfgj8LukuztXLlZXF9DidwcOiPI8J/wSSh5A
 wQACkTu4U2GhGPrPVo/GrpmWTbrJpr/sXpp/WpAIWqjXhxUEPL75lzbiu
 Slw+V5446reEQhB882nz4sJwra9usPWYZc1l9CWkD2VTNOkVIeFlzopqL
 hFJWtvEBK2TWCNKM3AFNRJhKxTejRj7UF+21lTOMyKCu2AxINE0T3+Hbv w==;
X-CSE-ConnectionGUID: +nGgk+KEQkGEQAuTEZvwYw==
X-CSE-MsgGUID: 0p2MNU4dQB2DC56kR7IOEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="68121416"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="68121416"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 09:45:19 -0800
X-CSE-ConnectionGUID: Y1YI7o8oSBakfdo7XC/zrw==
X-CSE-MsgGUID: fXwU3irYTUOEa7IL6k8BKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190101034"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 09:45:19 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 09:45:18 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 09:45:18 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.9) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 09:45:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uTescmhoAooXd972pRcW5LA7+GIFd/fSXra2NppG/Gz7pIGW3iXrR5pgxOmke9TyhYUyOgAJITwFwROZzRzV9ZWA2VhcIsD7HBSeyHEZJ23eAI7IKp3JYkYCIa9W/BCgiUxU15a5J/0rjWoDCdMegmrRbokdk6RbT/NKzaeUoOqV88AAeF0zDUo+R8xOu9mwB+3OIFgqcOqtLu6x4EWZ/htU+k0dEmrK2bnpsCgUTXK6Qob5udwrllXQDu8F4DlnWBbopICLMUSh2o8eJ8BpXJD4Nfikb0z4VAsCSyOocN1XTmGszVnnSQ03FvUNI9j1j0mw2u6WeBON6M9IPbEFDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CvvjeZLhpEY6b5edZrxtIqtMboDjpW6gB40RbFhFBwc=;
 b=xN5Q1A1owrjBOzu4GCQwiqiPTvOpIHnQERp+PvZeiLTR1lJRFGAVmjCmPiBZ1UfBBLeyRkLNB4/Yr5eh8wMJGxbp6QUNw13KfsEhdxnFqIGhTuYVBjIgzZ0vOBRRpSg6Y4lOoJcGALMdPv8Rzp9Uo2rV9n0JyW6kAjPhZU6UYaAzLZXC/769g/FZZNjZyTq/Ka87/f3zYxDEQAOTknOkWGGt0jo3Vxh7TMkupkZZfenuCFrsZWN8Vq8bAqwzcm1Rw8mux5UNLu4eFd1XYOokYT3Ednon4qwYriHOI+l5HlcOy3nXjhFq3kOtVcvGIPSBGKbyR6n/FQdIpx75zMwHag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7956.namprd11.prod.outlook.com (2603:10b6:208:40b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 17:45:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 17:45:15 +0000
Date: Tue, 18 Nov 2025 09:45:12 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <christian.koenig@amd.com>, <pstanner@redhat.com>, <dakr@kernel.org>
Subject: Re: [PATCH v3 2/7] drm/sched: Add several job helpers to avoid
 drivers touching scheduler state
Message-ID: <aRywqNOh6HUhFnRd@lstrano-desk.jf.intel.com>
References: <20251016204826.284077-1-matthew.brost@intel.com>
 <20251016204826.284077-3-matthew.brost@intel.com>
 <aRt-OPJh01t8AhVG@nvishwa1-desk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aRt-OPJh01t8AhVG@nvishwa1-desk>
X-ClientProxiedBy: MW4PR04CA0173.namprd04.prod.outlook.com
 (2603:10b6:303:85::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7956:EE_
X-MS-Office365-Filtering-Correlation-Id: 70e1bf26-02b9-42e8-6f18-08de26ca3b05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3EDhf+Ujo6MC6nCW6/P3PzzKje9PkmdTL1PurkqTp5UF7zlKurOVCTGMVNvR?=
 =?us-ascii?Q?8YPzZ1ZUcuYA23I3L2vgQ7MeMBAMeA+kk4+znXcAAc0a5fpbtVpOD4iMTymc?=
 =?us-ascii?Q?IAHab418ZidureWBNkiXH9faNJXbSA6H7v28deNAgPPIcg5yUf+iVJmUJBoz?=
 =?us-ascii?Q?CAQnTX4p4r7/eMfB9hwayNVnHpyoamDkLOml+1pH8bNouW91MRjBk7tHITpH?=
 =?us-ascii?Q?QfBydWEP8VgzKW5PX0uMWt6MXfIzHQFQq62Kop+Ywa6CxBzEYYOjutYCAFXt?=
 =?us-ascii?Q?8p8gDqYMspiUK4Qc9znB8jYmA7lXzoAp+ztgL6UzEhqVhGz8TUAThBRwSfO4?=
 =?us-ascii?Q?G5WpC6GT79wKK4mnCld7DP/4STl6D6KKMnTtT4RCHmDENGV2pEAfdCaXjnbW?=
 =?us-ascii?Q?kq99CWQETjoYAfU0ivucQjwUB0C8lPMNUUjNrJJBBK1iDPHcJOoTg/cawTqf?=
 =?us-ascii?Q?sU9mJKuJbsGOtN4dDg/jaFm4wjZh/wJMPQKAxXbjKD8DNzVAzoam5MUoUVgO?=
 =?us-ascii?Q?QJuIwHc99soDbzButvozyqyssXfRTbfefdtwOi9r+LBQLC2FGcGQxTrFTbd3?=
 =?us-ascii?Q?vTHx6JzlWJuIYonJ6J/O9YfMkJdWgGVqsAWJmMUVu+UXuLoA8wnGGU4wtliI?=
 =?us-ascii?Q?R6R2MRtbS6HFO/Ie4UAapNw70ku4eDlh7gNQ8cmVCX3ptq76uV8K7LdvxkzC?=
 =?us-ascii?Q?1RmroeJuX5lm2iyCIquMj6+V1JMVi3vjEYEA1UHsMBKV0vBPzg1g3/BoIRgz?=
 =?us-ascii?Q?MKBpivMAi5KVr7pR0SbApjxMyu6ZIIVRqzPPQtBf69p/paG4bhTeyj+5d273?=
 =?us-ascii?Q?/Qlqpid53IEVRNutsaFKGgiE/3wGPjzRLKsRFs8oc8VHRjv3Hn6pvpvuGJL3?=
 =?us-ascii?Q?pMJ9q3HshfhsxL8/1gxWwctDVCROg97eeeIbe3dH/QrIp+4Thu02LW+Pg4wh?=
 =?us-ascii?Q?xFtRwjQQBxTiDXfoRU0r96W4NOteJojNzz2JhiE8oFRNerYk/9DKXHaiflcF?=
 =?us-ascii?Q?fd8rFyvJ6X+0XItms1lSUnTjUeoLorIeF7DtS1oRBs3W8BnqCwQ/i8htlPI8?=
 =?us-ascii?Q?ZsgS056PhTBoplGbMMKLM4wGC0ynS+ZwZMwulpOX/wVUSJ+y2c7LmXUkPXA5?=
 =?us-ascii?Q?NjSR1l6hq6vaIGBzi25nduV1dBA+mPWVphlvrEudURZW7UwDqKumYO6EHs3Y?=
 =?us-ascii?Q?gxSSDkJ6KHv3VOZ1v/Tv4dpg7j3DwbFCtnCfINvqSe/Tz41D82APT79pfzCf?=
 =?us-ascii?Q?74wpSQz7lzC43OnkBUGY3l/3HRr1eikl2j0FuR74URUQLwPchscdi6Q5TL2g?=
 =?us-ascii?Q?IrLYyLs13EN6C5htxLJ0Syv3pLwyPRI8o1iIzToLdSC30SZ8bzGOKjU07HxX?=
 =?us-ascii?Q?RG/7f9p+8lvuneeRvzA7HwN9e0ox1aYY9YxY6FuGAWjQGKoSpgVE4+Emwazu?=
 =?us-ascii?Q?1SN3u9VVBbf3m5AbKBC79UjEQ6GWsWGg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TCWE13qU6e9sAWaOyMvjSZz0JNq29t1pGUFI4CmovnFYGVXbATRO+umHRsYz?=
 =?us-ascii?Q?JMGZ8o/XbL9+ksEm9Yionx69U5h8PU1CX9Yvwerxa7qrdQVGM30FNg5rowzp?=
 =?us-ascii?Q?U6JrgZ9093qeQmkfgzngC5WckZUO3nrxDQ/M1DDhJVIJTDOQDWlRQg5y1CiD?=
 =?us-ascii?Q?dwy2wEiVQIVk2NpcKeD7w3D//j2+MxWrufsRntgE7dt5bMaZFCb+2u9NoxJK?=
 =?us-ascii?Q?KFcuX/VaFgS1EENNOcj2N8noNrhB1SKmhVECLpHXP9tnxS6uQawQI3bn1Tcw?=
 =?us-ascii?Q?lI/KIgiN+8Iq/4CsHacfH0HMYhgtvsqNGz0qe9i1LZL7ml6Hp7xPmXw8XNFu?=
 =?us-ascii?Q?g0M7EX6tR3Oz6/5wFzZrDfsLVPriRnX32d8GhDVPrF75EJjxeoWhtbN+JS6G?=
 =?us-ascii?Q?QXBNGt+5o0Xqy6r3Xst28T0CJHDrsjiQUs4lsbK2ZcQ/zj2KFufHFI83x6/l?=
 =?us-ascii?Q?2PARyZXNByRLeOIJMV2bl7WWPKqKmafp6BfapKY5w/AUl+96Yeh4zVsWvR48?=
 =?us-ascii?Q?8j4j0NzRymiCCyZnRyS0gOFeuAJPso738lHtj4rAF+GW27DDhwqHFb34bEFZ?=
 =?us-ascii?Q?Mj9l1qdFbl+DCwD2yqk1SOz/rFqBXznY/d48KCvSpFPLID3/4leW/MaV2b1u?=
 =?us-ascii?Q?uKPNGaB2mA8yAgsXapovEjnE6EOpklpHf4iYO/rcfCga3Tle9QxRPmexKy/N?=
 =?us-ascii?Q?UW7wLXKL0c0H4VlquQd/i68zDUZwn3J4l6DiEV29cKxtgzGytz21V6Wrjytb?=
 =?us-ascii?Q?ZrlhG2YkhP+asRY8EuHwzdwAL+7iJXIdNLrPwAECMKiFViPaO+GUXlO/MhbR?=
 =?us-ascii?Q?2aMNcO4wiKJaIk1GKZtHJr0avpOeNpoMsGfSk7SN2Nie0wBaiavdtGAx+/jo?=
 =?us-ascii?Q?1CrNqVclG2oTcyPy5Aoe8zmuaxyQqEqT3QN4ZmGcOgQ9Ij+MbZXOLMXvf/om?=
 =?us-ascii?Q?wjs6YWxxfVdaFNbgaOdz4EsleMcI9e75J0OIncZKbpemIKt/2CxMKm09QhK4?=
 =?us-ascii?Q?TOv6ZPZ52BAx0Y6X8Qpqbu3l35xmJf8GevuPrFNa5g6wAw4y4MaG8C/lcAZ5?=
 =?us-ascii?Q?iuqjoB06TerR31g2sffunqpfdrwHEWprPmJAR80AolaZjszhnf17UUk3s9VW?=
 =?us-ascii?Q?mku7ZDuFRATmaygFDDZBpcUwo3Cv6GIGvgL5o82ya1IIMFKWKmS+MDgpolVt?=
 =?us-ascii?Q?FwACg7MYodax/3MA7iDJrWlZXEAf6xqRJ4n+98zJA8cDPk2UHmSbkjFmO6Oi?=
 =?us-ascii?Q?hrHOCZ/tIeCDlzeLSygdMXz/EGJSsmeAWxFzsOdr/FYo6V/hD88Lf8ZEW2Ce?=
 =?us-ascii?Q?gObj3XWffl3k9goK3+YAfiPV1XIM8iqggoh9YVfdIHh6XV8FPoG2d0kOVnNv?=
 =?us-ascii?Q?jDVlCJevM4xzOtS3+0lw7T+sVyFCddtuJ7lagF6oDBYpDIjNKnAx9Va2fcat?=
 =?us-ascii?Q?jurA82rmwG9g4vNFqRxudCnj9ba4EZ5Qm8EJdjIChNpHPBvZaA9aM2FgNWOR?=
 =?us-ascii?Q?zPILu6ur1XLxhhdZcYShy2Gm/DE154/U/HQyru+w/RczD/TVHFsZustq/6fK?=
 =?us-ascii?Q?ioz0KxB8cEWgusUmebnq7eyxqaNqmUuBF79YKgLvyUZHYbYl2z+x4IcwFFmV?=
 =?us-ascii?Q?vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70e1bf26-02b9-42e8-6f18-08de26ca3b05
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 17:45:15.0210 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eaPe/EKwlmyM/kKDfvRH0ohDlKQMXjlF2NmbxxaPQFWfbO9b4vRkurcUTrRA0lzFtwx/+J2Ivm9/LgCLE9gI2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7956
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

On Mon, Nov 17, 2025 at 11:57:44AM -0800, Niranjana Vishwanathapura wrote:
> On Thu, Oct 16, 2025 at 01:48:21PM -0700, Matthew Brost wrote:
> > Add helpers to see if scheduler is stopped and a jobs signaled state.
> > Expected to be used driver side on recovery and debug flows.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> > drivers/gpu/drm/scheduler/sched_main.c |  4 ++--
> > include/drm/gpu_scheduler.h            | 32 ++++++++++++++++++++++++--
> > 2 files changed, 32 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index 46119aacb809..69bd6e482268 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -344,7 +344,7 @@ drm_sched_rq_select_entity_fifo(struct drm_gpu_scheduler *sched,
> >  */
> > static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
> > {
> > -	if (!READ_ONCE(sched->pause_submit))
> > +	if (!drm_sched_is_stopped(sched))
> > 		queue_work(sched->submit_wq, &sched->work_run_job);
> > }
> > 
> > @@ -354,7 +354,7 @@ static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
> >  */
> > static void drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
> > {
> > -	if (!READ_ONCE(sched->pause_submit))
> > +	if (!drm_sched_is_stopped(sched))
> > 		queue_work(sched->submit_wq, &sched->work_free_job);
> > }
> > 
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index 7f31eba3bd61..d1a2d7f61c1d 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -700,6 +700,17 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
> > 
> > /* Inlines */
> > 
> > +/**
> > + * drm_sched_is_stopped() - DRM is stopped
> > + * @sched: DRM scheduler
> > + *
> > + * Return: True if sched is stopped, False otherwise
> > + */
> > +static inline bool drm_sched_is_stopped(struct drm_gpu_scheduler *sched)
> > +{
> > +	return READ_ONCE(sched->pause_submit);
> > +}
> > +
> > /**
> >  * struct drm_sched_pending_job_iter - DRM scheduler pending job iterator state
> >  * @sched: DRM scheduler associated with pending job iterator
> > @@ -716,7 +727,7 @@ __drm_sched_pending_job_iter_begin(struct drm_gpu_scheduler *sched)
> > 		.sched = sched,
> > 	};
> > 
> > -	WARN_ON(!READ_ONCE(sched->pause_submit));
> > +	WARN_ON(!drm_sched_is_stopped(sched));
> > 	return iter;
> > }
> 
> NIT...instead of modifying the functions added in previous patch, may be this
> patch should go in first and the previous patch can be added after that with
> drm_sched_is_stopped() usage?
> 

Yes, I think that would be better ordering. Will fix.

> > 
> > @@ -724,7 +735,7 @@ __drm_sched_pending_job_iter_begin(struct drm_gpu_scheduler *sched)
> > static inline void
> > __drm_sched_pending_job_iter_end(const struct drm_sched_pending_job_iter iter)
> > {
> > -	WARN_ON(!READ_ONCE(iter.sched->pause_submit));
> > +	WARN_ON(!drm_sched_is_stopped(iter.sched));
> > }
> > 
> > DEFINE_CLASS(drm_sched_pending_job_iter, struct drm_sched_pending_job_iter,
> > @@ -750,4 +761,21 @@ class_drm_sched_pending_job_iter_lock_ptr(class_drm_sched_pending_job_iter_t *_T
> > 		list_for_each_entry((__job), &(__sched)->pending_list, list)	\
> > 			for_each_if(!(__entity) || (__job)->entity == (__entity))
> > 
> > +/**
> > + * drm_sched_job_is_signaled() - DRM scheduler job is signaled
> > + * @job: DRM scheduler job
> > + *
> > + * Determine if DRM scheduler job is signaled. DRM scheduler should be stopped
> > + * to obtain a stable snapshot of state.
> > + *
> > + * Return: True if job is signaled, False otherwise
> > + */
> > +static inline bool drm_sched_job_is_signaled(struct drm_sched_job *job)
> > +{
> > +	struct drm_sched_fence *s_fence = job->s_fence;
> > +
> > +	WARN_ON(!drm_sched_is_stopped(job->sched));
> > +	return dma_fence_is_signaled(&s_fence->finished);
> > +}
> 
> NIT..In patch#4 where xe driver uses this function in couple places,
> I am seeing originally it checks if the s_fence->parent is signaled
> instead of &s_fence->finished as done here.
> I do see below message in the 's_fence->parent' kernel-doc,
> "We signal the &drm_sched_fence.finished fence once parent is signalled."
> So, probably it is fine, but just want to ensure.
> 

It more or less is the same check. Techincally the hardware fence
(parent) can signal before software fence (finished) but it is pretty
small race window which practice should never be hit but I could make
this function more robust can check on the parent fence too, that is
probably better I guess. Let me change this.

Matt

> Niranjana
> 
> > +
> > #endif
> > -- 
> > 2.34.1
> > 
