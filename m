Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 592DAC0F829
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 18:02:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF44A89E1D;
	Mon, 27 Oct 2025 17:02:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SiTqNxem";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98E2910E51F;
 Mon, 27 Oct 2025 17:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761584423; x=1793120423;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=hVdd31uw2OHw+4GqfZeq46iaQeIqzEVgAMJiQpps0ko=;
 b=SiTqNxemOJki34ZeHymbLJW/y4gqP6/4aTYSrujxP5LyUR4LCCGp5NQQ
 Fq0Pb7iVtqYQ1dIM4wkwr17psgzCTaUfV7GctuVqD5pv/HyuHwWFiesGm
 FjR+R0f6/d8egXsr0Kcp1J00z3I9xpcXNPUDAQxawYnre09O5g7JEUstk
 1Fi65CZqOXlG43HFgOfkFXLExO9pw1QQOvN/YQ/IkEWQb/IdB8+VzZyFN
 dThAtYVSVbO6hrPbJBd1WJ/ZUTEjmP3v8dUlNFvWUQBcjIaKJ6IQ1KkEU
 CdeEGpm94dlBrhGpMoFbyqDYoqyWsRaw84me1dlSrOGZ3Y7uhwoliY79p A==;
X-CSE-ConnectionGUID: xa7TBldPS4OQ4LwAdEVlcg==
X-CSE-MsgGUID: cfnggmi3S8+17r9+cQ0JDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74792263"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="74792263"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 10:00:22 -0700
X-CSE-ConnectionGUID: 2zaatQvQTF6BT9U1X01jPg==
X-CSE-MsgGUID: Nzu0qSMlQbyHRlLDPalI1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="222305220"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 10:00:22 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 10:00:21 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 10:00:21 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.57) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 10:00:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cu6n+DhD/+Xn7XC+NEUTN1ClnqEQ8QpqTD7aLSOvvoxCSmZLyMPqlrxrQnz2X/32f95kXt0DB+IsnfUjMY3S+Fzgl6e1o5rPm3S5z+rJKWpJBAKlUnDSCNZbMRW4S0L53qxgQZW8jrSASv5U9NvbtPEiAGw37MTf7DJtXEacZDpiiN1/hBc2pZgUL0xD7Z42/BQiDQ2J8tetGog60LryYJ1G4eEpl/cdV8JWbpJFvoSOSPvTc9NwWoY/m9dD5bWgOX79HEuhYRKe1LZ15Dj8oZdS97kBijVLM7DGXE/zc9oMXz6CIFjXev1xB++FDRAVaXA+ORFs5CIcPOB3k+iP2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pNamyT3QhCuPMlX9WGHeDtEqMFOPlWFML8hic8Tr1zs=;
 b=ejWZ7lf4YBVY9vlWuqlAglg6TRieLCNdNCiXWgomGx7wkf3xv0oLINcehDeKEsuymEZv+VOz8tiwFqu4xLZRXvNtcm+xzCTIRTPJhTDFut1wvzW7Kij6fiJ/QEkk7mk1SqVisgxMYkS+DaMnYukfE8uLusBUsfBCaPdtol7VrPVwaAOhOD0DVXPE/vlwc0lGQRxEIpaq9+1X+xx9CaWae/3yAEangCitBvPkpf6RohO8kRPzu4Giyr+0uE21kUi8BfIseRdWeuK5xbNG1awDefVeqIaKfUGiamTMshzYOA4Clgy1NJU1zC/8p7xOglDdFy58uqntXLUYMNodsWrimA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB7416.namprd11.prod.outlook.com (2603:10b6:806:316::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 17:00:19 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 17:00:19 +0000
Date: Mon, 27 Oct 2025 10:00:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Philipp Stanner <pstanner@redhat.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <jiangshanlai@gmail.com>, <tj@kernel.org>,
 <simona.vetter@ffwll.ch>, <christian.koenig@amd.com>, <dakr@kernel.org>
Subject: Re: [RFC PATCH 2/3] drm/sched: Taint workqueues with reclaim
Message-ID: <aP+lIKQ6FHLltgcl@lstrano-desk.jf.intel.com>
References: <20251021213952.746900-1-matthew.brost@intel.com>
 <20251021213952.746900-3-matthew.brost@intel.com>
 <2336a1282aa6a44f23a9100d2553b8032f44f3bd.camel@redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2336a1282aa6a44f23a9100d2553b8032f44f3bd.camel@redhat.com>
X-ClientProxiedBy: MW4PR03CA0055.namprd03.prod.outlook.com
 (2603:10b6:303:8e::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB7416:EE_
X-MS-Office365-Filtering-Correlation-Id: 392438ef-6d5b-4556-b00c-08de157a4f5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?2ialOyndbw9itshfk0ROP+oLhgq+Uty7+9t8XCgnObyfCWKThoAvdJqBo/?=
 =?iso-8859-1?Q?s1EsMXLvVk0tVueVUIPrenMTpsEDYS4xpQPuiiXz4dmBcml4VnTakLN5LF?=
 =?iso-8859-1?Q?FB9EP/Au+ztnkVBPSjyf0rSUPsem4Yjz1XPDM+fEjzhQUE+19RrPJEqQOL?=
 =?iso-8859-1?Q?7do57dYnk/qb6eRhDOiWDVOa2B9p5zMcKQm4hteK/bel2vG03R/KOsklJl?=
 =?iso-8859-1?Q?/3RkjHqKg7xSyNMnvb7hNL2o+W6/IQEZKcvOKZ6jO0XrhP+vJTpInBsKI4?=
 =?iso-8859-1?Q?45/TSHvrfG9iGv7nwNa0anYT+XzOurwsi9zjfUNjNUZ8dwc7vAP0/DlEvp?=
 =?iso-8859-1?Q?232PTpCIzR5wgRIUiPJbRhCNtfpp1voWywJszP8q8P+tVrAY3Jcl6oVE+7?=
 =?iso-8859-1?Q?zgA2CH8ZxAP64nbaDMnpnCL6UGJi4i5Muc/hXbmdoGBbXRXmrwew/meTrs?=
 =?iso-8859-1?Q?PdMswgaIoafuGbpcTqpVYSpF20liuxJu7NNKZauBQopT5hiYTUS7G+c/Tu?=
 =?iso-8859-1?Q?9WfL9FyS8d5OHmVW+b59O+cY2oa7z6p8adM3Y+wIFT6Im0nAf/eAWLFJEN?=
 =?iso-8859-1?Q?nIDqtveiLRlRihB52Y7N84AYiEcbk87RdAT57MXYpo3/vmOOyCx1EHr+zB?=
 =?iso-8859-1?Q?+7nLFjrCEUX1IOETXFPpNOWz+/ELMILwh2caQwhOAEW+IUMEv6U7xJTrEw?=
 =?iso-8859-1?Q?Dlhx9+G/OwUQcY/jOj4yDrJi/g8tredp54E1++6Ig8In4PQpdmwP46vtHL?=
 =?iso-8859-1?Q?AYFqjpHoUwYIWGS6gmqPfBKzz75+C9YL74D/PUEK+pER9xTF0o13DW7RXB?=
 =?iso-8859-1?Q?M6zpl81rdSjjx+EWRo9onI5QcvSPB/IEkzLdCOLuTYTae4kpNumO7TdJJH?=
 =?iso-8859-1?Q?03H6E8HVURgjQC+I2hUP2VWJ4Pr9wDxMRqAvENbxX0DvTQWe1fVqax5TqT?=
 =?iso-8859-1?Q?E1yUML+GRj3J+/qVWLksycVPFR1wThpw0KJUpVIMrsRtmoUPykkGS2N4l6?=
 =?iso-8859-1?Q?c036G2DU5IgQkny3qK8E6WGryqPfMX4C8bSesSeWwnovpVRYlmT9JrR0in?=
 =?iso-8859-1?Q?V21ARs9oVVOpmedmSjxNGUywKw5RAweaqApYw3HMMn9xgApTwsZ4UF547/?=
 =?iso-8859-1?Q?psZHqLD6lqU2SNsBNY8yA15SsCdG7UGb1Y7Rbr2IjQGPcsPrSy8qP45a21?=
 =?iso-8859-1?Q?7oOguFV9daA2oAoRzvI/Gae5tQcVajKwsTN3yKQtQnJyqWnVha0iDcmkLl?=
 =?iso-8859-1?Q?uKI1EouR5QKZvivKQoSilWFumBw/rocy+Hhn4SyI394os9QamIWpt+YFnH?=
 =?iso-8859-1?Q?0CNpHCQnfwa8DkTpuUBzaxHzuA38i6DgNxrvQGwTQRmeyShnxVdz8hO1jv?=
 =?iso-8859-1?Q?CCj8Vi48bWgS8q724wI6gApatgREi4oyfb3tgsnArJ+TgGbAZ8vewPqVZI?=
 =?iso-8859-1?Q?CEyJ35jPXUPZaB0hxoqasJOQfeZtgzEshZH7opOJpektN2S7IIzEt57nbD?=
 =?iso-8859-1?Q?gRvK3ddFRJXMx+aicxEw2L?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?jI0sR1QYtNsb19K0ZOKK8YRHgPhM7nvsbqXSVIQfTPY5r5qny7KI64cFD7?=
 =?iso-8859-1?Q?xqt/ygzYdwOzdlklzZ5AjTXibF0uYQjPpOYPfEhUbS+Gw7VlwtlQHYygH9?=
 =?iso-8859-1?Q?4EZK3U55UpvpWOaXYe/F9Nq7VOuklfG81jVKA+7YSEdOjLVrI7ZD8FLyWm?=
 =?iso-8859-1?Q?3gwKev1yGGFHkxgx499gbZaQnDCWUdprgmIpCBmzhBzqrPk8AJrvSHR3p+?=
 =?iso-8859-1?Q?gx1Ilg9Z3DW9LwiW8YUKHN5thet61f2z1tKSsDn5n0lpJ6xRckRgOpcj88?=
 =?iso-8859-1?Q?kYyBo6F0hz4CnrJN7WS4Yyr/z9pJxva5OJmlkaZ8C3TJ8l/5ZPOklMYnM9?=
 =?iso-8859-1?Q?Y3ia4petkokipU86VCe+ql9HxCYXs4oTqo+enUNpyu0OSb8qrUpTSrgAAM?=
 =?iso-8859-1?Q?0PCe17NiGUQ1dqSepIs7ohCioQCpkww0Zg6yX14A2w1DAdHXtW58q0MLxz?=
 =?iso-8859-1?Q?Ge+BaT78l0JYIHRdULplUlmLL6VUDfKtCjvCrGWhd3x/Kre9VMJx3HsdGj?=
 =?iso-8859-1?Q?r//lV4xpQNppTpv5H8w0FR1HOe5y/zCamNGf+LhXwbv/skA+OhLfeJturs?=
 =?iso-8859-1?Q?Tiy/DEWQxcIpuhZcyd7kzgJOeH3tekrc2Co6cYg3jeqw+yyDYwafHfSzaz?=
 =?iso-8859-1?Q?qPViNVpnSgCZt5eYTovHvIvZDAbA/nKTf7oGQT40NuGJMvrMwPFkwB/MCz?=
 =?iso-8859-1?Q?Lf2H3ocNbkIoS/rCmriUsBZJ7sbSTrkonL7fmyMsoPaq7JEHzV0s1sEpzp?=
 =?iso-8859-1?Q?7EvZEudHyBzsm9vHhZYAz5TlsSIF2q7nnvuy6yPLwHYN7oUhYZmEDd7IY2?=
 =?iso-8859-1?Q?ZGDZlIrr1WBSX/xx1vgj9nayz+Ps0/XEb8AqmX0nlFaZfzlGlPrg0azXsN?=
 =?iso-8859-1?Q?YJnKJ8eRMGnw5W/0+q60jBSaVmxOPZTUdrrFt++W6K7a9j8Cgk9U8bcpD4?=
 =?iso-8859-1?Q?eB4FyxqsJAXLvYHw+O4IKK+77QnM548G9kuY9cGvl6SVGWwp4IfNsIlTGp?=
 =?iso-8859-1?Q?+z4uNviTYaVoZ+90Ub93LNQrfpyPkOzgtxvCnqK+YuhhScUSHFWPKrkdbQ?=
 =?iso-8859-1?Q?HDhzkMfZppRJK3Vi1sL20O0cNYQRx3vb+B6kag5JJyNMECgLK/JmTXDvd1?=
 =?iso-8859-1?Q?iD2e51wd6P4Jhl90mQIWSIA1ngQjAZ7qhJFVy5fmBLDofFXshrqONZqgB9?=
 =?iso-8859-1?Q?+C2Q1dyNZw/iZvIUjaqp9FEcE+iYckxiyFkmY9RENuFLNZB2bd04y4aEOK?=
 =?iso-8859-1?Q?yPC91IGaerXEFK7K1W3esg4WxUlDGpRGsGVe/Sp4leR28DzbPUmpQLxQCs?=
 =?iso-8859-1?Q?gIH5ldhqOI+8bJiR/EUmcxzer94SglG0JbQRTqASrnLSRwmzJxmo8ej5d6?=
 =?iso-8859-1?Q?1NrCzHRaerlMwuxONYfa6+q+IzIkEhEF/9/QJ2/KrLn9GeyDzQKmuLcUEK?=
 =?iso-8859-1?Q?oDz0+kQI/1ZgO+HcLbahC6aTRRgXCoe/YNFLVATjZQ9S2JuZV5QNq9RSPD?=
 =?iso-8859-1?Q?nkfyijEHJ1VAP4Oaat8poearvrbMe1UYbbaDSd9cmMtVQi4Fv4VEWdYqG/?=
 =?iso-8859-1?Q?lTgsgWuKb8HZZJxmBX4SwRHwvmZpzlJbjtvc5oMk1Fj6t4Z2H++xiCtDnk?=
 =?iso-8859-1?Q?NkSAFN0AANpmTx+n1AwYOHndKTnJPrfRcUSf6nwqQehwNhAXD7FrqoFQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 392438ef-6d5b-4556-b00c-08de157a4f5a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 17:00:19.6527 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xx9riDzcJjVM7bgGI9nwcbkbc/0rvZx/K7KYPGsjjCYuXFx1DdtOO06M+S7WB4yIZNz4QZA/x6X0vyCJ11vh9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7416
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

On Mon, Oct 27, 2025 at 12:03:33PM +0100, Philipp Stanner wrote:
> On Tue, 2025-10-21 at 14:39 -0700, Matthew Brost wrote:
> > Multiple drivers seemingly do not understand the role of DMA fences in
> > the reclaim path. As a result, 
> > 
> 
> result of what? The "role of DMA fences"?
> 
> > DRM scheduler workqueues, which are part
> > of the fence signaling path, must not allocate memory.
> > 
> 
> Should be phrased differently. The actual rule here is "The GPU
> scheduler's workqueues can be used for memory reclaim. Because of that,
> work items on these queues must not allocate memory."
> 

Sure, will reword.

> --
> 
> In general, I often read in commits or discussions about this or that
> "rule", especially "DMA fence rules", but they're often not detailed
> very much.
>

Yes, I kinda assume the audience reviewing any dma-buf or drm-sched
really understand the "DMA fence rules" compare to driver devs which
often do not really get this concept. Taining the work queues here will
help driver devs avoid mistakes and hopefully along the way get them to
point where they understand "DMA fence rules" - it took me a few years
to really get this rules.

Matt
 
> 
> P.
> 
> >  This patch
> > teaches lockdep to recognize these rules in order to catch driver-side
> > bugs.
> > 
> > Cc: Christian König <christian.koenig@amd.com>
> > Cc: Danilo Krummrich <dakr@kernel.org>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Philipp Stanner <phasta@kernel.org>
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/scheduler/sched_main.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index c39f0245e3a9..676484dd3ea3 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -1368,6 +1368,9 @@ int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_
> >  	atomic64_set(&sched->job_id_count, 0);
> >  	sched->pause_submit = false;
> >  
> > +	taint_reclaim_workqueue(sched->submit_wq, GFP_KERNEL);
> > +	taint_reclaim_workqueue(sched->timeout_wq, GFP_KERNEL);
> > +
> >  	sched->ready = true;
> >  	return 0;
> >  Out_unroll:
> 
