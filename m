Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BB6BF997E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 03:17:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF97E10E677;
	Wed, 22 Oct 2025 01:17:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oh5iPk9s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCE0B10E674;
 Wed, 22 Oct 2025 01:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761095813; x=1792631813;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oDFwW6v6v7c5xqCHDSmob8hDV3kE8DczCR0iTH8TNq8=;
 b=Oh5iPk9sTZTd6leMOBgQvoi1UkWyrHI3ma6eMGEsIXJ5pmWG/TJ6hnHy
 HwyJvppxguOstvR2nnxaGHmCx2hKs5vu2e1ZR3Op7um/MCScCGlzZ+roW
 j9T7ZrRa8GEcmJzWHisWoRxKBHRIeM/3bV5DIDWP07pKCseD27UqpGFTu
 UUsY3jN4o8xR9wqPAaZY7T5mgTNb93JfK/PSrARYtEmNeUa7UtNtnLOjG
 iqGoHFXWJkdDG9oqxTEeGTPDpllXI8BRslI4AOe+/wreC1khMRCj/uQUr
 zOGb5ZDI/Q+u4/vfIJeUPEBlVGauPbwSdfwfrBzg1pVcRKTMGwKqlqDjG Q==;
X-CSE-ConnectionGUID: ZYtQJdG1QNSKbd828qkobQ==
X-CSE-MsgGUID: nKH0PQ+gT4W8FGNrCOBS+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73840156"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="73840156"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 18:16:44 -0700
X-CSE-ConnectionGUID: ixQJIJh5RwK4/teB3heUSg==
X-CSE-MsgGUID: qr76sCN8S36UVvze74XVSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="184140317"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 18:16:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 18:16:43 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 18:16:43 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.23) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 18:16:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xj2+ulbsm2noSl+qHO9nS9H8m18eMJMCKQoGRueV4wv51h+UQEj76VRoyk1Dgpsv4HTDW4X1VfBHsXd2pWchRiybcI6PW7rkYY3lQD2S6ushhcMTy9gBQWbxfvYJ2oJ3GJEqhtbZ82KGGWJmEgO/zv/a1RPVO5gZaucbH/9WrOd0pFqHyeOpxlQ41YtugYbeFyb7RLdN4iCr5Y8s7jkDqo+Uk/mUzQxz2KTuLsTQyryBlgvc5+cp21qnu4TJSil54cc8Xbx5Bz7OyhLX3i1epm5/vj0kBcVPklVtHAoqae2CY+V6r/GlPsbIrDfE+jPbULNFEJ4fguaYQXJeZhoqQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4af0oPq2zWRiqaL7G9DpNchN3nSSdXOYAZujcS87DHU=;
 b=CnSci9p9PSG6FY+La2/km+VKXdfMRq1Gfwz5cgAjSr7eaMRQ/DGrWCh9n1QhGN0LOSggGbgmE1MQqtWN9HslaTIUuSS60YYqiGNgl4Cr01teEK67I8YhdKMa9ieCE54tr7nC/5XtTbyLlty2Bq22ee3b+ZOHpVN2sJlJxi+eelWBsxBBt3ZwNB4Y9J0GWr+vN3dr9DksCg6+fyv8VnLbJdVH0F+cLaNv73DYA1JyZB1wX3hKaeDNGxKDGdlqCuXzXS8TAgoU7YfBBPhZ10SbXTUPK5xItt8fReA1tbSBDAlxkgFA3fBzUkLWzO2avl2AguXE5isjZ07UVNHjfL061A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB5311.namprd11.prod.outlook.com (2603:10b6:5:392::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Wed, 22 Oct
 2025 01:16:36 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.015; Wed, 22 Oct 2025
 01:16:36 +0000
Date: Tue, 21 Oct 2025 18:16:33 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tejun Heo <tj@kernel.org>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <jiangshanlai@gmail.com>,
 <simona.vetter@ffwll.ch>, <christian.koenig@amd.com>, <pstanner@redhat.com>,
 <dakr@kernel.org>
Subject: Re: [RFC PATCH 1/3] workqueue: Add an interface to taint workqueue
 lockdep with reclaim
Message-ID: <aPgwcc6+1yHhB1/j@lstrano-desk.jf.intel.com>
References: <20251021213952.746900-1-matthew.brost@intel.com>
 <20251021213952.746900-2-matthew.brost@intel.com>
 <aPgBjmIm6n9H-R_u@slm.duckdns.org>
 <aPgDXsQY5qAfU0Tv@lstrano-desk.jf.intel.com>
 <aPgD/3d7lJKoSzI8@lstrano-desk.jf.intel.com>
 <aPgWgAs_5XoEWri9@slm.duckdns.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aPgWgAs_5XoEWri9@slm.duckdns.org>
X-ClientProxiedBy: MW4PR03CA0208.namprd03.prod.outlook.com
 (2603:10b6:303:b8::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB5311:EE_
X-MS-Office365-Filtering-Correlation-Id: 770045a2-fc7e-477d-ae63-08de1108a4ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+BNAC7vAaNBkG+6GeAucEQ63kmO4IHPkY4jWv93JOL3OqV8hV9tfetQyPsaZ?=
 =?us-ascii?Q?Ie8rDESbwdrzAXQmJo1tamhoi7+5MMn/XAOH2hgq3hxh0VMgprGUpZ3ePOW+?=
 =?us-ascii?Q?AtV22p/TzPBPG+Sq8Sp7XfOPTFYdVsQ/U77rvCsjicK77tv1mfR63yrc7oXZ?=
 =?us-ascii?Q?l4ms8QyTBIskUk8CW6fX+KYlNPWFfCB+VxByJT/JWe57+FSyDsyjIu+wQ4zv?=
 =?us-ascii?Q?WlPgitB6RX/npBXdBCDtVwyHBT1hEIRtQPQEgwpKSH0mma6lDtScpOdPj/Io?=
 =?us-ascii?Q?gOUWLSdvPjS4rrhwRV/SxA4z6Qj/jue7VjPOh+La00qrXR3OaVR8yhGSkdqF?=
 =?us-ascii?Q?Vv46BAJvZKshtYPEbyNKmOt8JutfFJwr1/u4EjOEjg1xVNYcpj3N66IbtXtu?=
 =?us-ascii?Q?o33MfvKeA6iWED5ulwzrO8hu9f/67Pvicpnm4OIzpWUsPmP7duT9VbYEZ4zJ?=
 =?us-ascii?Q?MuKNGtUq3Hx+ScNSuF3OlQZSTtNb+uMIgDWsH0q8Y7CPjaaJ5AA1gi5b3Wvo?=
 =?us-ascii?Q?X8g52HwjYgiUC5LNDIYUAQLc098cLE1O4BsPLZk1qzP1IfSFVMs48PMH1OtM?=
 =?us-ascii?Q?TopUeT3cP7Cx0RktrzrQQ9PWapmKjqPn+MNtWBiNbiilzm9Nvp9jV7oHCeYD?=
 =?us-ascii?Q?JuTEmUa8BEPjQYcjrgJM57ccQjjDCxSShsLBPOvou7PnhtzxrKuVzsV85x8F?=
 =?us-ascii?Q?kU+pRQfaNQy1tB56iiv3MbsOoO6H+XIUZBASQl+nX3/HqXooaB0HltMzBfjg?=
 =?us-ascii?Q?FtI4zyw4zFm4B2kp6ZoKjLOjt017AJm1iidVn5r3frbCtqRIzb69Oi7HkF1d?=
 =?us-ascii?Q?C22jHqM1cth+rJodQaD3DZB9taqjrZ7nE8567JZhjvIwyLnCkR+q2g4tmdrj?=
 =?us-ascii?Q?d/8vK8sLHvGxiZy/PjiKpSLZw17+y5/zyLJVEB85V3ofMqcHXyl7P/vSA5pH?=
 =?us-ascii?Q?3/4wddQRA1o4H3OExTX4krctbqO6UOR2GBNGVS409Rkmtnt07TPeYZtZuttj?=
 =?us-ascii?Q?Ak7wN1SJtIZNtchYfQ/fhi39xR8klRC9TLYVGNBMwInkHYWiF+gfbZEIi1uL?=
 =?us-ascii?Q?iWCdI7WNh0YXgdVqTgVQPffYDru4eYAiaTTRpFlu9hFrGCipgvWzegKaBiDs?=
 =?us-ascii?Q?dXpLeUMVf3bM0abgB5yN/beQw6ChohViz/USuyV8VGJbB/3r5h4/shL9fv4y?=
 =?us-ascii?Q?MBQZ7ix7lIGthvJMfEprXmWf6dMzRym12SvV7w5BXhcul0/Eq63q6ZcR1V1b?=
 =?us-ascii?Q?3Skd3ZJPqI1ITZdBxj1gQ+AdKjVhOp6aVMKsYFig9W1cTqX42vOxHL+c1C+l?=
 =?us-ascii?Q?jsOQN5XHDsWTcpIedUyiR6MsdpocdxHDxqWI+jFPW/N+XyE7yx/MyMRd0VmC?=
 =?us-ascii?Q?iVB1pUVFSl5XxQNJCXdPnfPgCmU/ksEGga5POidqEM18iYevxrNoO7kMQHFC?=
 =?us-ascii?Q?IEInrnn9+ZW1NfnAA57lX+AZekarnRxp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?93IlxbuvX3Hf4TlAPDtCtI8wjEWr4Sl85G9U1r2hEICutYlyEUsygprkBxBm?=
 =?us-ascii?Q?0EDufNeWxN4FLoconXHcBuSMJ4kfK3eZ5zqQoBSj/Oz6baUmitpIXAmKtpH2?=
 =?us-ascii?Q?M5qxkidwEPI7QVnX9I3+WoHHEbuytxvmPxu1BaRRVrqa3fkW3mOyiV8jbpGJ?=
 =?us-ascii?Q?H9f5+fdTrvnB71+a66K4t1NXk5tm/C3bMgHnuGN34rGSiVvNNi7eXjvMUviL?=
 =?us-ascii?Q?GDEtlpAFGAUpHQd/4o21AzSe7cBNfO5gWRvY1+RUyHCZgk5+Xswx9IHB6YU+?=
 =?us-ascii?Q?UWqbBNb0DY1qmd3vDM1JXLwvOuM/9RJmHIzEcmtd4843DgkA7m1OEHmC8QaF?=
 =?us-ascii?Q?d5QclZV3X/qJYzjTQWpx09Ld1e/SNgmz38zUNpuPEXXwFlAOgHkm4gUBJvx7?=
 =?us-ascii?Q?4aU5oNOPBUe0pBTrNHNJRA9gSWcFt8SvMmdzllZaiclhWVZNfqlwvCOn/oYV?=
 =?us-ascii?Q?GwCUBq5aClh5Si0S3If0RACzgKYZPFXvF7/BkZ+8eSTMRyvc2bNX0Ydny3XI?=
 =?us-ascii?Q?Amz+OJ5Rj0MoFm6qDEXn0NHcemyPvcvTS4dbKduvcyVLqdyMbRqmkuH2fqvm?=
 =?us-ascii?Q?lO8gi1yjEvKQRRkrS04DMDuKOpPB23r1Dv1g9sBQQvNBhI1GxWGu2MyDQXKS?=
 =?us-ascii?Q?vrCMKP3IPFZcH6Bw5lRY/DfXPAhrf+aTqqP5djbh96y2L5v6/qo3yNNbNUHR?=
 =?us-ascii?Q?y/ADRIqZD9pXBU9pPg7BJl/L02HB8fnmGQx3Y78r7Jpak1Bq0mV7q9lMCC4d?=
 =?us-ascii?Q?WC7SvYrihBnhMMZ12goQ3+P7woHsHevnro8t+hkNw9oGChRvHZBs79XQE9GQ?=
 =?us-ascii?Q?a+KH3iIcxaB+RRuE5WgbzdHXzcE9QuFdyAo9YNZwx8S43WvSgkghmR7w0jG2?=
 =?us-ascii?Q?BptJJIKCpsF8XHUVHgdWvLA1wWGkxxLClpd9PjCjajAQnWp0KwnLgjV2kTKg?=
 =?us-ascii?Q?GwQtGnPajPqXH8E75sLxZeAmUGL9WdIcoc/J8yzxEPLfl4o1nvO0PEZ0UESH?=
 =?us-ascii?Q?I6jRp68MdfWaKEjichLnkIQ7vfsAPxFMQzDff7R9fXM2Yh3UWy75VqE7neWd?=
 =?us-ascii?Q?3gYCRmi6AlkXmST4imc+UMVTlSfCk/aKzGOTYB0kpCDN5V2vHUXT1NN9JvFA?=
 =?us-ascii?Q?NbKXBG5UKF+SMMxSMJx2kASif3eh+WS+7+c7a7jtNAq4TG4Vjla1su26JcoG?=
 =?us-ascii?Q?M9vBPWa0ixcLqVtSQDbtoWW5OlCmrcj10GCX8BTX8WCQT4oD3vQ1PYylw52s?=
 =?us-ascii?Q?DcekbEODkzR8OdbwB8TIVuoPiUXF4LaWgDUuIrKY/Zl0ycWNgVRiqlsmFgA6?=
 =?us-ascii?Q?n7KinLBZE1JUzV73YiyqfzaAUpH4Ts/QAgOlJ1fV/Kn4BRJnM6M85feWBd/t?=
 =?us-ascii?Q?VHrJOBMqOi9NYRyfQPgk0You8RsCQ39rscbk9vB3uIlLC+mXOl9JTMDWNqA1?=
 =?us-ascii?Q?S9aQY7nLxpHDcv5Gjo254tUTN/+osAC2L1aDfixAaRONNAbR9dB4Rr6AYNgu?=
 =?us-ascii?Q?r/6leYIRQ5+9LcMIjLJbcTw5YvUMv2tu8mAlFjucwHSBWfrpD/EJZmWEadKZ?=
 =?us-ascii?Q?R3z7Qyi0L1AZbzAcMiSFEJHD/AUpc7pPg9kKW66lODPeqew4hjxe8q6OKFUT?=
 =?us-ascii?Q?Cg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 770045a2-fc7e-477d-ae63-08de1108a4ff
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 01:16:36.0499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gIj8W1x5JX1ahZGFC//FDeVuDupkdcQTh9OCBh+5m/lgfdktg1qQ3TBGTAS7Kco7nAEiyiRS+Ze3om/cs2kHYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5311
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

On Tue, Oct 21, 2025 at 01:25:52PM -1000, Tejun Heo wrote:
> Hello,
> 
> On Tue, Oct 21, 2025 at 03:06:55PM -0700, Matthew Brost wrote:
> > > > Given that it's about reclaim, "memory cannot be allocated" may be a bit
> > > > misleading. Can you make the description more accurate? Also, it'd be great
> > 
> > Can fix the comment. The rule is memory cannot be allocated in the
> > context of reclaim (e.g., GFP_KERNEL).
> 
> Oh, I meant that e.g. GPF_ATOMIC or GFP_NOFS reclaims should be fine. It's
> just that we can't recurse into reclaim from WQ_RECLAIM workqueue, right?
> 

Yes, exactly. Will adjust.

Matt

> Thanks.
> 
> -- 
> tejun
