Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNorBVqrqWlSBwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 17:12:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2451D215334
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 17:12:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22EB010EC3C;
	Thu,  5 Mar 2026 16:12:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kyYToqH8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52D2010EC3C;
 Thu,  5 Mar 2026 16:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772727127; x=1804263127;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=2aDza1PQwkbZOxdFZhCLxmb5LynbORTurOSzPNPkH3Y=;
 b=kyYToqH82psAgE7PiwC0ISrexMPoF6Cm58Gc4o7G9IEss0n9N/kvCSk7
 cJ2c4Yt64Gg0ihfAjh9JpnNCnlMgQRXiAFi1SO6mjmsg9jkxWApklUnS0
 VwmgSCoYFa7Oz442Be1svZm/pihoRxj+9pri5eqE/n+wDOsUn21QRQkr6
 zbylo/nkEk3vUXW5Wx6OVxB84n3I7X15nm6Pa6ttf4aCLMipYc+mAWvaJ
 SiaLi0kypB+YLbINAlAfbQU/faugWOl8tIDY2/+Z9p92kV1zVQTcZJQym
 L9Edly5JLKWnC08mEObMQIVc98TyXRt4KI1XTmj9xfUtJuZawsCcy4M+h A==;
X-CSE-ConnectionGUID: pJLwWj/hRauyaAXWBXpPXw==
X-CSE-MsgGUID: p6/yT2A7RFeTk4B8BJYuZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73725404"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="73725404"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 08:12:06 -0800
X-CSE-ConnectionGUID: YzApFBdnSwisqxEStnh2Xw==
X-CSE-MsgGUID: uj1TK282TmaCg5DalYZJzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="216530348"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 08:12:05 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 08:12:05 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 08:12:05 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.16) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 08:12:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ewxRwQcReePirirnuNV0iApprwAN3fqAeCfvwWwVUBn4ou73+PiIKtokj4yKevpcfSTRAHb7/pG1gsl9tXsQL1slHlRbufEE3lXllfoTDGeMC9yJuo6Tj8rMM0HIAutIotUc7MMmxgFPKelzm86Pw37XK/eW6wCqRbUJ/eZO4orH71HH4ndyqWZytMaOvn4E391O8j3qqIQj0YSyYoketPwLFUpYQnfl9GjMx3CWnDy85DfP86WI3Sfh+E3jnNAZa6JxHjK716cCUVjsgUjwNv1Ew7Iy9MiNCOgi2pPmSOIanzVwK4iLj4REi+WE79j7pv65Eq88ZHa7jyITD/QHHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7HE9SZtNnk0O4HWlrZceoMNDazMFHeZjFQBi1VHs/S4=;
 b=iT2ANzgd5s0K89F0QjuzYsWHwCDivfbGMkJNeBmqLt9QhM87BuVyF4Lbg4uEE5b0ubMrRXJFaPpB5fujZ3CzUCmFZcRaIl2uXsKOhcuYUouTvNxoew3S9vplG1UCz6KKPLx/XAoLUND5BhMbyv8rTN19BdNXCgBe/m96b3qZR9QO4ETgexi6e8/MihMACBCkUtHWjvAXv1/JOe+9VRvX/BMuhZee2J7aTEvwjC46Sjw1YAAGjOY/ViNof+Uf1UpGxfbwtZn9kyWLQnPgtFfcWxVgwtlZOoDIBsDPeWIYFG/2q0Zz0NEkxeb7ok7vvNt9nqBTM3PFcvW0bTwnSN91mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by MW6PR11MB8368.namprd11.prod.outlook.com (2603:10b6:303:246::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 16:12:00 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::9ca5:4d1d:db45:f523]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::9ca5:4d1d:db45:f523%5]) with mapi id 15.20.9654.015; Thu, 5 Mar 2026
 16:12:00 +0000
Date: Thu, 5 Mar 2026 18:11:51 +0200
From: Imre Deak <imre.deak@intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>
CC: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, <dri-devel@lists.freedesktop.org>, 
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH RFC 0/4] DP: Read LTTPR caps followed by DPRX caps
Message-ID: <aamrRxXwBxzt6s4F@ideak-desk.lan>
References: <20260305-dp_aux-v1-0-54ee0b5f5158@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260305-dp_aux-v1-0-54ee0b5f5158@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
X-ClientProxiedBy: GVX0EPF0005F6AA.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::287) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|MW6PR11MB8368:EE_
X-MS-Office365-Filtering-Correlation-Id: 257b6f41-932c-4324-80f4-08de7ad1ee56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: DQczXjVVjuFScVD6IoKivZ0WUvhHKcl1XBjh2E4Y6ztM+I+9PvGi+Y6hTJ8obD1YfJgt/ji/6pPheGn3BpFOTAloJKKNUB6gpVlOCjcwg6W/hLVpC8ztvQ5iOuBl+4jkJB0aQfqnfOSEett3SvFzUlYgJbDZsgvabTKDy9oSq/VpP0SHxfqoyUs+nItbQI7tBJCNupPNrZV8j3jx50QWiqO5IlictI3eanAK347TNKXaSQwErnXypHpjJxT7EL62hgEGh/sUUJrPAkdzPzzNP3jBkmL+v5lB2GmKvHTxGwELhntnD2w5o9d8PJtVpU0uy9SpKe18J/vpNXE3i1JS86OP2FAZyZa1ldDs++X8OuhsFTU1bqbq2RJf4BgMMo2cfcF7Fl4o68oIvV2cubOlxhanNVgzpjm3HxVnFnvinvPk2cwOax7o6BYm1FpaMO83dP1Ftflv3LQF78eApkDlFcrNQVVsnmNmnaeZD7YgoOVb/5W862ZQ30pN/WOwQWSQEE/06MvrJWoqYFbCOLq6YYqVUrMAiFLDJbKugSYSIReGkZahuIDt4K10535iCnsIjW8rQc4NzcOY2dJyEO/qLIz/J00WZnvjZpfBLU/QbhMU8vEqTl/eWBLNQWVzwor2FxE1I8EYEx38nYhRzMc8FFPepWUh2343479yXEcIEPUKg6MU2Jl8Pt5z1tK1y5Ci
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4G6jA040mAFag899XwSLEqlHcZ4HWVHPQZAedFb7a2DG7q/IgFVlisAOY4Mg?=
 =?us-ascii?Q?GiPBpJ+T8jw1egMqlJ4h+R63FVw1CN1Jod7KMGm/eQ5kCDZ9mevKjHGOC9P7?=
 =?us-ascii?Q?KJ/9OPmegSL8aKLX8wdmVj4w/MwNb5XpkuxmGdb5OHYYJvmHdFKJMks4ojL/?=
 =?us-ascii?Q?+dL4vBeE2NfGlYazs5hi5FMNafRLuFgCZbKbNvS71DaTWpDkXz3cjEJNKUX4?=
 =?us-ascii?Q?8qsmWeyBn/sxfwphiwhvtt6s4kmSK9z6CSzsvwNQjt2wiWyZqkAQiIGVCHQk?=
 =?us-ascii?Q?4OuTDm2eBSsjTE2kOGUCn7x6DTNiveR8rXbWGMG2lZeiOPDN7WoVjDSv1HbL?=
 =?us-ascii?Q?YH1P62tBSGxjQKbmd6O9VArx3TXUEVVitHVqOMjaoUk7B3l/uMbg2sKNbpJd?=
 =?us-ascii?Q?akUJOujR678HJ8916hzqK9MHk1cEUH6yzJPngr+r2upsKe9TpIllQTMXlId6?=
 =?us-ascii?Q?blRT3SlFfxDmmJRIHxdxu/ibK/p14Gox/xKPwjDLwHn3Zgs4Us/dh0rfUvM7?=
 =?us-ascii?Q?5nce49V0FUpH8iELaQCU4XHnHz/BJEeRKPjetCuhnIYRXE+hGsntzWn+VngC?=
 =?us-ascii?Q?aB4X/h+GOwHYM3dKN+83XRPLvpNkDmduExIfcz2hro9qeyaq3XHMTkruAK9q?=
 =?us-ascii?Q?loJqsj/X4YrFPBNs5DjqGmUejBRRIvF8e8icjtkHdgedpLmRBv10FrgqJNg1?=
 =?us-ascii?Q?K3MoZxbA0FWTRu9OIvG+mHNe9uVYilPhTK/fCspOp4PdhZH7lMARxLj4DVTp?=
 =?us-ascii?Q?kzWkxBPkQf2VsQrThKA+v/SIZ+MLS7A4CtAGEdzHjceKBnmwZWMiwcI5kF79?=
 =?us-ascii?Q?M/12sX9Zz2wDFykaAgIM0FMAZZWE8jlKOU6sGg7Uk9tJPyqKeYOt+Iu7BfZd?=
 =?us-ascii?Q?e74GoD+Rpo7KR5jvnC8K0qg153C+sSgxd8XRI4lKRx6QByKBJ/w+9wdW+ebu?=
 =?us-ascii?Q?YXrqVPP74Ygipm9rmpAceFwTbaR58FfiA8t61YmS4Uk06GR9LAQ/3QDcWhlH?=
 =?us-ascii?Q?ndKacwT+vO1z6NT5tYEPncBcmyba0pskXhGpMd8rc+RYKFXu1Ep3qOk4f/R/?=
 =?us-ascii?Q?nVsvnrZ3+/SPyl1YrltlNLA8K4bsBiRcSU3BdHxrTHA6IalmKInHYE7c8DVc?=
 =?us-ascii?Q?HrKxArHBfgEhREd9SOVa1l9F2822lqfd7w7zwDASMtqkMX2S2gubNa53iL+c?=
 =?us-ascii?Q?j2MwcSbckLY7cjRp1J9RVL+QUZuUhdcsKPQyBGRMv4CT9pYa7jJ5RRPOI9M7?=
 =?us-ascii?Q?rUsrvVrknpvYyyqnDYWW4sViW4NZaEwWYZN3EEl1leWFIHWmDiFRwcjYWRn2?=
 =?us-ascii?Q?jb9K0g3KQ1YJHf0zIULkPVgSqju4B4NxJwDhY2VgVctqCl53tyJ2U3VK5JE+?=
 =?us-ascii?Q?P698wDNEr4NPLVwG/jpPhQ9Iu6Je+8z3wnxVQFfjXQZaIFzUXRHjoQHsY0er?=
 =?us-ascii?Q?4a9w994UGi0QtE0oE920JPRnVDZz0mH+rmqFsRF45OMnhIsKkOD9AUmUDmC0?=
 =?us-ascii?Q?OUtG4suEf7orCqKmnuiyAFVzFFecGdddqofhnJn00HG018pPDYmKLsL/7GLT?=
 =?us-ascii?Q?X7Zv8ZrmQgoHtssEm/RMW8HdzF6/kmpqpWFiaMEId8zbYyv8hMNU/ey6eJHR?=
 =?us-ascii?Q?dnlM1Y7GjWb5usk/OC3POsGVTvv77UN6CU/YYzIaJKgCIhSDP6xAFOSXE7lb?=
 =?us-ascii?Q?sfrjpV847+24f5ExWL7QMdWsqL7HWr7eAzN1HGy4m3WkysKRN2kQjvQOwgTa?=
 =?us-ascii?Q?px2eGUyMOA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 257b6f41-932c-4324-80f4-08de7ad1ee56
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 16:12:00.0243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MCJq08ueKflmbep7CO3FELRzwCFvB/uMF//ZugGhqjeKe2ptJpKs87pin9fe+tYaNHtMW4rBuuJyhACVCQaT7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8368
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
X-Rspamd-Queue-Id: 2451D215334
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.49 / 15.00];
	R_DKIM_REJECT(1.00)[intel.com:s=Intel];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:replyto,intel.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imre.deak@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:-];
	HAS_REPLYTO(0.00)[imre.deak@intel.com];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.091];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 01:48:10PM +0530, Arun R Murthy wrote:
> As per the spec  DP2.1 section 3.6.8.6.1, section 2.12.1,
> section 2.12.3 (Link Policy) the LTTPR caps is to be read first
> followed by the DPRX capability.

Not exactly. The Standard requires reading the DPRX capabilities after
the LTTPR caps are read. The driver does read the DPRX caps after
reading the LTTPR caps. The DP Standard does not mandate that the first
read after a sink is connected (i.e. after the HPD signal of the sink is
asserted) must be an LTTPR capability read and cannot be any other DPCD
register read. In fact this would be impossible to guarantee, a DPRX
capability read - or any DPCD register read for that matter - could
happen at any point and so it could happen right after the HPD signal
got asserted.

> Git log shows that initially drm dp helper exposed function to read
> lttpr caps. Driver reads the lttpr caps and then the dprx caps.
> For a particular issue 
> https://gitlab.freedesktop.org/drm/intel/-/issues/3415
> as a workaround reading dprx caps was done first to know if the panel is
> < DP1.4 and then read 1 block at a time for lttpr caps.
> 
> This can be handled in a better way and two such ways is what I see.
> 1. Read LTTPR caps followed by DPRX caps as per the spec. Then on
> reading dprx caps if revision < 1.4 then re-read the lttpr caps one
> block at a time.
> 
> 2. Read LTTPR caps and if 8b/10b check for correctness of the link rate
> supported(lttpr caps 0xf0001), if some corrupted value is read then read
> one block at a time.

The driver does read the DPRX capabilities after reading the LTTPR
capabilities. This is what the standard mandates.

The workaround for issues/3415 depends on the DPCD_REV value, so this is
read separately before reading the LTTPR caps. I don't see a better way
to implement the workaround and such read is not prohibited by the DP
Standard either. So I don't see the point of the changes in this
patchset.

> I am open for either of the two or you have any other options as well I
> am open.
> 
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
> Arun R Murthy (4):
>       drm/display/dp: Read LTTPR caps without DPRX caps
>       drm/i915/dp: Read LTTPR caps followed by DPRX caps
>       drm/i915/dp: On HPD read LTTPR caps followed by DPRX caps
>       drm/i915/dp: DPRX/LTTPR caps for DP should be read once
> 
>  drivers/gpu/drm/display/drm_dp_helper.c            | 63 ++++++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_dp.c            |  3 +-
>  .../gpu/drm/i915/display/intel_dp_link_training.c  | 40 +++++++-------
>  .../gpu/drm/i915/display/intel_dp_link_training.h  |  1 -
>  drivers/gpu/drm/i915/display/intel_dp_tunnel.c     |  3 +-
>  include/drm/display/drm_dp_helper.h                |  2 +
>  6 files changed, 86 insertions(+), 26 deletions(-)
> ---
> base-commit: cfc20c776480fda8c1b0517b187bb71ec0781cd4
> change-id: 20260305-dp_aux-1e27599e06c8
> 
> Best regards,
> -- 
> Arun R Murthy <arun.r.murthy@intel.com>
> 
