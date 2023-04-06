Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7316D9E16
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 18:58:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88E1610EC60;
	Thu,  6 Apr 2023 16:58:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D1DE10E2A2;
 Thu,  6 Apr 2023 16:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680800330; x=1712336330;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=IsnZSE7nNmB4e5077N6Dshv1yzYtzz3ZOcJBCHWH8DE=;
 b=Y777An86CN1z9agYX58K1yejmtNkFKNVEY/PTU/RBhfYkS/QeT3dQxDE
 0kehozSVt1P6GQnr73oOY64KlseKEXGrsVoKGveJzPynzMIIpaATy5Hnf
 T5EgjpvRxPQ/VI02Xcji3a4DxmafrmtJbVFEiKx9hIoxlu8tsYwMrDKos
 Uvnx4QUml/13DCbX4lBX7ZY+wicnVC8ixmKmrMuRrM2lJ+N7x24Wa7ZQW
 0OIGmg/+4j0itPiU20BOxEENq9d9pZDZieNdMWE4q3MiSur8v7ITg4fmR
 OJAqSziZ8BHxE+F/TYPRrDyEdU6i7DeDk/EMg+q+PQW1k5K/T2/pVWwke Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="322435202"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="322435202"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 09:58:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="933276449"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="933276449"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 06 Apr 2023 09:58:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 6 Apr 2023 09:58:47 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 6 Apr 2023 09:58:47 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 6 Apr 2023 09:58:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OEbIAesWXu6kU48Odb1nuQgZtY01CB6Ty0patzCJ+cWFEO0LgTO9RLWhmuyya8EgoiCoMMEwazpoe3a3/eYwfwS3tLxpEYnve5N8j8zwRSwseOvLCbOpsVQSCTwsWc5kJi3QLCrlM4oJ4rPXVhISnSK0v6EUZ2Q25cWLd16B8EbXiZ1bqq7IVwGCT5bM47hySTWHXBjT/uzhmiMWzIGnz42yn0AgPedJ+1uvOFAsC+kofYqRpC9HZTtsHD6ykZ54xAf7nFNSIHjLDOAJnCipNoPPZyxJ7zQIH3ZpnJkIX0VHqbp1+hq7I3+JMPydSBxEcZ8ewMUQxAF3x2HS+O0O2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YYuh5PrA5rTmN/cR6wWkNIkcHY9zOjM2L7Wsv0WqDaY=;
 b=AhARI24koDU+MBsqMEFtdSRa2CukxKbOtPzvRAtXWujrdkf/QhqWhXU8d9oLtdoKKs7LSzoJOVXclHFaQJRDnsqk+KT9oXjk0G3xVlc4nM4HAjYZwMaO+Bs9Bz9dPaHw2xO6dI02uBY8/SE8HuFiPK0zzqfQ6IpkcaE1uDRyTrJlsLZ0g4cKeyBuowoDj2krHrracA7HZRQ2BGhGpuX6fneCsGeKqbrEby9pa273qC46a73RULRub+Ze9vHIh1ihurYXoR/27ooDPVhOCK1seE1Bxn/EvsZe8iPuOm6mm/WjPj1Ff+rypp8k4KVjIpA0WXsdtqJT6HnjrQEdcLw91A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7891.namprd11.prod.outlook.com (2603:10b6:208:3fa::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.31; Thu, 6 Apr
 2023 16:58:40 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%9]) with mapi id 15.20.6254.033; Thu, 6 Apr 2023
 16:58:40 +0000
Date: Thu, 6 Apr 2023 16:58:33 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC PATCH 08/10] dma-buf/dma-fence: Introduce long-running
 completion fences
Message-ID: <ZC76OWKHmjwfx7mo@DUT025-TGLU.fm.intel.com>
References: <e5eb5ab0-8e51-389c-34ae-7c6004f4b1ba@amd.com>
 <f7b3b70b-c798-b09e-210c-f84eaafd3251@linux.intel.com>
 <5b2e6a78-b743-028c-f54d-af38c130164a@amd.com>
 <16a3a3fd-47c7-d74d-4835-9438ef8d2635@shipmail.org>
 <ZCx0P7GwLh2yOVR4@DUT025-TGLU.fm.intel.com>
 <ZCx5wGTA3RCZGjA4@phenom.ffwll.local>
 <ZCx/C4cOwPcPQZ0R@DUT025-TGLU.fm.intel.com>
 <ZC1y9ON07yTYNTz6@phenom.ffwll.local>
 <ZC4LNOuOza9RX9TJ@DUT025-TGLU.fm.intel.com>
 <ZC5nm73p6SByTXDn@phenom.ffwll.local>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZC5nm73p6SByTXDn@phenom.ffwll.local>
X-ClientProxiedBy: BYAPR03CA0035.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::48) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7891:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bff33e6-1a4d-4269-b945-08db36c02bd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EIwK5Kid9u0w5qRodPm0NCwfBiWN5IDn/r3SaMR1NFzjgp9N8FU4EiHt35U/8Grfga/RdJ9uZt5rKqkx1Elm8A2auYc1tUfiHZQgLb0tyxWpkiPYSgPyWDX4IDPLsUFyY+MG+XIS+ZmvqQThepdWIppTaURWvumq+bfUuCp9u+5PoiR0Kjl4IdDuEw8xpuBK0vpLeFlzjXbAaBALUg9ysyQHK1psIUKkPNgivLAaIPz9TAxa+cQs514utaUFzPNRzCxuMGRbUFrj9o66Zxq/oBozC6U4gur0kq7wqq6M2sl4SGlCeZAZNmiUNo4aIrZv/n/Hz6fR3q54gfUoBxQdHxnrfkgCjVixqJLs9ATvVZcbau95qyjduqufo0H3lW3lstAAlrU/G4NRqIT1wIxIPTNZMq557I4G9e3wTM12gk2epj3s6zTL6FH1RlL6V4rYVLIgb0RiIk/ks0pbWwiAPI7NmySr2BNBDlHcyVnnpX5XJ83T78+k40vPV7cIu0FOysE+VeEy5agN3Wr6PtD0Iog1qKXMsMN5h1mnn9tu6ALJPoTYChVVRXky0zFQmGsaAqVlosENBcg9RpMkDPUwCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(376002)(39860400002)(346002)(136003)(451199021)(83380400001)(38100700002)(66476007)(66556008)(66946007)(316002)(41300700001)(6666004)(6486002)(5660300002)(966005)(54906003)(8936002)(478600001)(7416002)(30864003)(86362001)(44832011)(82960400001)(4326008)(6512007)(6506007)(8676002)(6916009)(26005)(53546011)(66574015)(186003)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?a8cSrm95V1hdeeFtIQ58DMfENG47YUo+midZ/wNtADE7c0szmoLeeVbJHL?=
 =?iso-8859-1?Q?M7DLgvR1Fx7pL9pAszmAUS++83l0px9oo70clHRSjao2DeAH0kzEJZRgCd?=
 =?iso-8859-1?Q?15s/kTPtdBe29KLBSvkpIbnlfrTdL/4auGiLFeyekL+s3d3Zm7XVbTOaAW?=
 =?iso-8859-1?Q?7RW7NpIRqtNVhuhDfe7PzxLBJ7N2Kj+HA1O8Zu9lRraHCr13ghLhDF+7ei?=
 =?iso-8859-1?Q?hudWnFbITi6jKEFYOJBH21wzDQNGX8nccmXmdxAh1Ye0kThlBOGzNNCV5I?=
 =?iso-8859-1?Q?cuNvrpkwAhhK6T8Fq+6IVhQhRFQQUYlJ5oJQ4p1fSDIQ53mrXxGHXvzJJE?=
 =?iso-8859-1?Q?XQLsZ8DQVyTzTfeRhqWHXJjl2KUvjQMb5NEv4dG3y2XApCDYyvt850lgyI?=
 =?iso-8859-1?Q?mD0aXNosHglTl89tr8rse8Lbqh1hw+8l85cO0kJpWwoe46+FFEW60CpkQ8?=
 =?iso-8859-1?Q?5JAbRq7sngScXrtljD++Wolf15TT/WPBzurmTstb/3pFagiYDDHEsBG7U5?=
 =?iso-8859-1?Q?AeonRwuCiXssAogCb3PKyAX+SrbejvE8nrfR01DXhxE2PrvnCyY8AtPuc7?=
 =?iso-8859-1?Q?ObpZEzwyUk7dnYSRQCToE5wm/3U3hTH6lPG+H875bchuZIwmaXGgvNoCJD?=
 =?iso-8859-1?Q?iqs5HNVuGYVCxVqCic8uai8i1QbXuXjgKRHIp+uwD3ymPnmuSqeSEnpgig?=
 =?iso-8859-1?Q?0+dq9KlrwUT2ngJQ2+bPv36rqHi5h5ELraYjCJL+A9ze0fuwZU68YXjcTe?=
 =?iso-8859-1?Q?F+TKmAN1QbA3oxd0zhKwAM3L7C4e05ytJw0W8q3tbmVZ7hedktn6mVrEBE?=
 =?iso-8859-1?Q?P7OIN4r5vwtKoahg12bacwgf3JIM7L+k+TeV5fz9iuVRWcl4B5gMu9DU/d?=
 =?iso-8859-1?Q?rY42C/nrvngPy6b0NSdTezI0Lcy7FVOmX5i/BY2/3rL/1pl9dHpsAg1UxU?=
 =?iso-8859-1?Q?+0VFFuLEUb0M4qFXJSUHoqMdfhLYGgEbYlkpb2m8dEXnaxtZ+c3j+8u62W?=
 =?iso-8859-1?Q?O+GASy0j5qwv1/mqrLnrTZpsLH7QHAs6VrF/EKPZIm+Ze0XonBUxj/G8wF?=
 =?iso-8859-1?Q?h/1YKxoqDyG/tVXRdlFWuls6l6SCwLJ/S4GYqyA9cCBjgBVsk/q4SxCa+w?=
 =?iso-8859-1?Q?ctP3WqDAte2xKRqwnhbNuJHJ0JLOlmSmeO4kebvcuaQdL3VE2lnek2CZeg?=
 =?iso-8859-1?Q?4KjfATx3uYd5u3B4d8JfA8GglLtQ0Ve4UrRpovVUlUiKaDP1cwlQ/3r+Iv?=
 =?iso-8859-1?Q?wwlmJ8gBpULepvInPiUccIk6/K1p7PZlHOWc4uh1cx1xPikRKTjSIlhxUo?=
 =?iso-8859-1?Q?cCSdBptoHTBRhaab9Q9dpOFUjAUlV6w96b2ndE27AsFriq0lsCI5ROMXMp?=
 =?iso-8859-1?Q?cDTTH0vu/KW9HMqgDYY/Eln7qJTmgXgzY2AmiTYNoWcDgLPJk+GJk1CKEU?=
 =?iso-8859-1?Q?PAMfiu+5T1zXiFh+oXTFVnjRWU/AVrk6i7cGdSvAGe6naZcCOs+sA489qK?=
 =?iso-8859-1?Q?MrV2nmK1BZ4yEVPeC1TNeZEsa+OBwTyTtCzDCblAVWeABu9bycJcHQNgPT?=
 =?iso-8859-1?Q?Z91FuF3avWlH+M8janqh3AeyFOY37zrlKePE3vwxFEkjfo/2oVP185m9DW?=
 =?iso-8859-1?Q?Uxatblht71Hc6oCALBb9Wll4lCp8xTeeE3XhmSdTt+fLbZzMoX249Rgg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bff33e6-1a4d-4269-b945-08db36c02bd3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 16:58:40.2189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MJg4zSzUuARberbcID7a8on+xqCo6WQ6H1UpiNKxAqh4RYIHG2JPIgJfoqyOT+hyjauCbFZUZKllBZwuSGoHvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7891
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
Cc: robdclark@chromium.org,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 airlied@linux.ie, lina@asahilina.net,
 Thomas =?iso-8859-1?Q?Hellstr=F6m_=28Intel=29?= <thomas_os@shipmail.org>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 boris.brezillon@collabora.com,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 06, 2023 at 08:32:59AM +0200, Daniel Vetter wrote:
> On Wed, Apr 05, 2023 at 11:58:44PM +0000, Matthew Brost wrote:
> > On Wed, Apr 05, 2023 at 03:09:08PM +0200, Daniel Vetter wrote:
> > > On Tue, Apr 04, 2023 at 07:48:27PM +0000, Matthew Brost wrote:
> > > > On Tue, Apr 04, 2023 at 09:25:52PM +0200, Daniel Vetter wrote:
> > > > > On Tue, Apr 04, 2023 at 07:02:23PM +0000, Matthew Brost wrote:
> > > > > > On Tue, Apr 04, 2023 at 08:14:01PM +0200, Thomas Hellström (Intel) wrote:
> > > > > > > 
> > > > > > > On 4/4/23 15:10, Christian König wrote:
> > > > > > > > Am 04.04.23 um 14:54 schrieb Thomas Hellström:
> > > > > > > > > Hi, Christian,
> > > > > > > > > 
> > > > > > > > > On 4/4/23 11:09, Christian König wrote:
> > > > > > > > > > Am 04.04.23 um 02:22 schrieb Matthew Brost:
> > > > > > > > > > > From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > > > > > > > > 
> > > > > > > > > > > For long-running workloads, drivers either need to open-code
> > > > > > > > > > > completion
> > > > > > > > > > > waits, invent their own synchronization primitives or internally use
> > > > > > > > > > > dma-fences that do not obey the cross-driver dma-fence protocol, but
> > > > > > > > > > > without any lockdep annotation all these approaches are error prone.
> > > > > > > > > > > 
> > > > > > > > > > > So since for example the drm scheduler uses dma-fences it is
> > > > > > > > > > > desirable for
> > > > > > > > > > > a driver to be able to use it for throttling and error
> > > > > > > > > > > handling also with
> > > > > > > > > > > internal dma-fences tha do not obey the cros-driver
> > > > > > > > > > > dma-fence protocol.
> > > > > > > > > > > 
> > > > > > > > > > > Introduce long-running completion fences in form of
> > > > > > > > > > > dma-fences, and add
> > > > > > > > > > > lockdep annotation for them. In particular:
> > > > > > > > > > > 
> > > > > > > > > > > * Do not allow waiting under any memory management locks.
> > > > > > > > > > > * Do not allow to attach them to a dma-resv object.
> > > > > > > > > > > * Introduce a new interface for adding callbacks making the
> > > > > > > > > > > helper adding
> > > > > > > > > > >    a callback sign off on that it is aware that the dma-fence may not
> > > > > > > > > > >    complete anytime soon. Typically this will be the
> > > > > > > > > > > scheduler chaining
> > > > > > > > > > >    a new long-running fence on another one.
> > > > > > > > > > 
> > > > > > > > > > Well that's pretty much what I tried before:
> > > > > > > > > > https://lwn.net/Articles/893704/
> > > > > > > > > > 
> > > > > > 
> > > > > > I don't think this quite the same, this explictly enforces that we don't
> > > > > > break the dma-fence rules (in path of memory allocations, exported in
> > > > > > any way), essentially this just SW sync point reusing dma-fence the
> > > > > > infrastructure for signaling / callbacks. I believe your series tried to
> > > > > > export these fences to user space (admittedly I haven't fully read your
> > > > > > series).
> > > > > > 
> > > > > > In this use case we essentially just want to flow control the ring via
> > > > > > the dma-scheduler + maintain a list of pending jobs so the TDR can be
> > > > > > used for cleanup if LR entity encounters an error. To me this seems
> > > > > > perfectly reasonable but I know dma-femce rules are akin to a holy war.
> > > > > > 
> > > > > > If we return NULL in run_job, now we have to be able to sink all jobs
> > > > > > in the backend regardless on ring space, maintain a list of jobs pending
> > > > > > for cleanup after errors, and write a different cleanup path as now the
> > > > > > TDR doesn't work. Seems very, very silly to duplicate all of this code
> > > > > > when the DRM scheduler provides all of this for us. Also if we go this
> > > > > > route, now all drivers are going to invent ways to handle LR jobs /w the
> > > > > > DRM scheduler.
> > > > > > 
> > > > > > This solution is pretty clear, mark the scheduler as LR, and don't
> > > > > > export any fences from the scheduler. If you try to export these fences
> > > > > > a blow up happens.
> > > > > 
> > > > > The problem is if you mix things up. Like for resets you need all the
> > > > > schedulers on an engine/set-of-engines to quiescent or things get
> > > > > potentially hilarious. If you now have a scheduler in forever limbo, the
> > > > > dma_fence guarantees are right out the window.
> > > > > 
> > > > 
> > > > Right, a GT reset on Xe is:
> > > > 
> > > > Stop all schedulers
> > > > Do a reset
> > > > Ban any schedulers which we think caused the GT reset
> > > > Resubmit all schedulers which we think were good
> > > > Restart all schedulers
> > > > 
> > > > None of this flow depends on LR dma-fences, all of this uses the DRM
> > > > sched infrastructure and work very well compared to the i915. Rewriting
> > > > all this with a driver specific implementation is what we are trying to
> > > > avoid.
> > > > 
> > > > Similarly if LR entity hangs on its own (not a GT reset, rather the
> > > > firmware does the reset for us) we use all the DRM scheduler
> > > > infrastructure to handle this. Again this works rather well...
> > > 
> > > Yeah this is why I don't think duplicating everything that long-running
> > > jobs need makes any sense. iow I agree with you.
> > > 
> > 
> > Glad we agree.
> > 
> > > > > But the issue you're having is fairly specific if it's just about
> > > > > ringspace. I think the dumbest fix is to just block in submit if you run
> > > > > out of per-ctx ringspace, and call it a day. This notion that somehow the
> > > > 
> > > > How does that not break the dma-fence rules? A job can publish its
> > > > finished fence after ARM, if the finished fence fence waits on ring
> > > > space that may not free up in a reasonable amount of time we now have
> > > > broken the dma-dence rules. My understanding is any dma-fence must only
> > > > on other dma-fence, Christian seems to agree and NAK'd just blocking if
> > > > no space available [1]. IMO this series ensures we don't break dma-fence
> > > > rules by restricting how the finished fence can be used.
> > > 
> > > Oh I meant in the submit ioctl, _before_ you even call
> > > drm_sched_job_arm(). It's ok to block in there indefinitely.
> > >
> > 
> > Ok, but how do we determine if their is ring space, wait on xe_hw_fence
> > which is a dma-fence. We just move a wait from the scheduler to the exec
> > IOCTL and I realy fail to see the point of that.
> 
> Fill in anything you need into the ring at ioctl time, but don't update
> the tail pointers? If there's no space, then EWOULDBLCK.
> 

Ok, I can maybe buy this approach and this is fairly easy to do. I'm
going to do this for LR jobs only though (non-LR job will still flow
control on the ring via the scheduler + write ring in run_job). A bit of
duplicate code but I can live with this.

> > > > > kernel is supposed to provide a bottomless queue of anything userspace
> > > > > submits simply doesn't hold up in reality (as much as userspace standards
> > > > > committees would like it to), and as long as it doesn't have a real-world
> > > > > perf impact it doesn't really matter why we end up blocking in the submit
> > > > > ioctl. It might also be a simple memory allocation that hits a snag in
> > > > > page reclaim.
> > > > > 
> > > > > > > > > > And the reasons why it was rejected haven't changed.
> > > > > > > > > > 
> > > > > > > > > > Regards,
> > > > > > > > > > Christian.
> > > > > > > > > > 
> > > > > > > > > Yes, TBH this was mostly to get discussion going how we'd best
> > > > > > > > > tackle this problem while being able to reuse the scheduler for
> > > > > > > > > long-running workloads.
> > > > > > > > > 
> > > > > > > > > I couldn't see any clear decision on your series, though, but one
> > > > > > > > > main difference I see is that this is intended for driver-internal
> > > > > > > > > use only. (I'm counting using the drm_scheduler as a helper for
> > > > > > > > > driver-private use). This is by no means a way to try tackle the
> > > > > > > > > indefinite fence problem.
> > > > > > > > 
> > > > > > > > Well this was just my latest try to tackle this, but essentially the
> > > > > > > > problems are the same as with your approach: When we express such
> > > > > > > > operations as dma_fence there is always the change that we leak that
> > > > > > > > somewhere.
> > > > > > > > 
> > > > > > > > My approach of adding a flag noting that this operation is dangerous and
> > > > > > > > can't be synced with something memory management depends on tried to
> > > > > > > > contain this as much as possible, but Daniel still pretty clearly
> > > > > > > > rejected it (for good reasons I think).
> > > > > > > > 
> > > > > > > > > 
> > > > > > > > > We could ofc invent a completely different data-type that abstracts
> > > > > > > > > the synchronization the scheduler needs in the long-running case, or
> > > > > > > > > each driver could hack something up, like sleeping in the
> > > > > > > > > prepare_job() or run_job() callback for throttling, but those waits
> > > > > > > > > should still be annotated in one way or annotated one way or another
> > > > > > > > > (and probably in a similar way across drivers) to make sure we don't
> > > > > > > > > do anything bad.
> > > > > > > > > 
> > > > > > > > >  So any suggestions as to what would be the better solution here
> > > > > > > > > would be appreciated.
> > > > > > > > 
> > > > > > > > Mhm, do we really the the GPU scheduler for that?
> > > > > > > > 
> > > > > > 
> > > > > > I think we need to solve this within the DRM scheduler one way or
> > > > > > another.
> > > > > 
> > > > > Yeah so if we conclude that the queue really must be bottomless then I
> > > > > agree drm-sched should help out sort out the mess. Because I'm guessing
> > > > > that every driver will have this issue. But that's a big if.
> > > > > 
> > > > > I guess if we teach the drm scheduler that some jobs are fairly endless
> > > > > then maybe it wouldn't be too far-fetched to also teach it to wait for a
> > > > > previous one to finish (but not with the dma_fence that preempts, which we
> > > > > put into the dma_resv for memory management, but some other struct
> > > > > completion). The scheduler already has a concept of not stuffing too much
> > > > > stuff into the same queue after all, so this should fit?
> > > > 
> > > > See above, exact same situation as spinning on flow controling the ring,
> > > > this IMO absolutely breaks the dma-fence rules. IMO the correct solution
> > > > is to have a DRM that doesn't export dma-fences, this is exactly what
> > > > this series does as if we try to, boom lockdep / warn on blow up.
> > > 
> > > I dont think it's impossible to do this correctly, but definitely very,
> > > very hard. Which is why neither Christian nor me like the idea :-)
> > > 
> > > Essentially you'd have to make sure that any indefinite way will still
> > > react to drm_sched_job, so that you're not holding up a gt reset or
> > > anything like that, but only ever hold up forward progress for this
> > > specific scheduler/drm_sched_entity. Which you can do as long (and again,
> > > another hugely tricky detail) you still obey the preempt-ctx dma_fence and
> > > manage to preempt the underlying long-running ctx even when the drm/sched
> > > is stuck waiting for an indefinite fence (like waiting for ringspace or
> > > something like that).
> > > 
> > > So I don't think it's impossible, but very far away from "a good idea" :-)
> > > 
> > > Hence to proposal to bail out of this entire mess by throwing EWOULDBLCK
> > > back to userspace directly from the ioctl function, where you still can do
> > > that without breaking any dma_fence rules. Or if it's not a case that
> > > matters in practice, simply block in the ioctl handler instead of
> > > returning EWOULDBLCK.
> > 
> > Returning EWOULDBLCK on a full ring is reasonsible I guess but again
> > without returning a fence in run job the TDR can't be used for clean up
> > on LR entities which will result in duplicate code open coded by each
> > driver. Same goes for checking ring full in exec.
> > 
> > How about this:
> > - We mark xe_hw_fence as LR to ensure it can't be exported, return this
> >   in run_job which gives flow control on the ring + the handy TDR
> >   functionality
> > - When a scheduler is marked as LR, we do not generate finished fences
> >   for jobs
> > - We heavily, heavily scrutinize any usage of the LR fence flag going
> >   foward
> > - We document all of this very loudly
> > 
> > Is this reasonable?
> 
> I'm not seeing why it's needed? If you're worried about TDR duplication
> then I think we need something else. Because for long-running ctx we never
> have a timeout of the ctx itself (by definition). The only thing we time
> out on is the preempt, so I guess what could be done:
> - have the minimal scaffolding to support the preempt-ctx fence in
>   drm_sched_entity
> - when the preempt ctx fence enables signalling a) callback to the driver
>   to start the preempt (which should signal the fence) b) start a timer,
>   which should catch if the preempt takes too long

The GuC does this for us, no need.

> - if the timeout first (importantly we only enable that when the
>   preemption is trigger, not by default), kick of the normal drm/sched tdr
>   flow. maybe needs some adjustements in case there's different handling
>   needed for when a preemption times out compared to just a job timing out
>

The GuC imforms us this and yea we kick the TDR.

> I think this might make sense for sharing timeout handling needs for
> long-running context. What you proposed I don't really follow why it
> should exist, because that kind of timeout handling should not ever happen
> for long-running jobs.

We use just the TDR a as single cleanup point for all entities. In the
case of a LR entity this occurs if the GuC issues a reset on the
entity (liekly preempt timeout), the entity takes a non-recoverable page
fail, or the entity to the root cause of a GT reset. The pending job
list here is handy, that why I wanted to return xe_hw_fence in run_job
to hold the job in the scheduler pending list. The doesn't TDR won't
fire if the pending list is empty.

Based on what you are saying my new proposal:

1. Write ring in exec for LR jobs, return -EWOULDBLCK if no space in
ring
2. Return NULL in run_job (or alternatively a signaled fence)
3. Have specical cased cleanup flow for LR entites (not the TDR, rather
likely a different worker we kick owned by the xe_engine).
4. Document this some that this how drivers are expected to do LR
workloads plus DRM scheduler

1 & 3 are pretty clear duplicates of code but I can live with that if
I can get Ack on the plan + move on. The coding will not be all that
difficult either, I am just being difficult. In the is probably a 100ish
lines of code.

What do you think Daniel, seem like a reasonable plan?

Matt

> -Daniel
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
