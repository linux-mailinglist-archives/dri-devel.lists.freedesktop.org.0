Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C92827A8E
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 23:22:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 475CA10E320;
	Mon,  8 Jan 2024 22:22:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80EEF10E2C7;
 Mon,  8 Jan 2024 22:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704752551; x=1736288551;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wei8QoKrtHoukyrrgkCbwRVFEF7VZZgWHYacUYwTR6U=;
 b=k+1Y5MEugNO0x1lhx1sTPFxCaTQjr8TplhsMvldgdoKINMrefNxIEZtl
 vd2uWB13uMItt9vTXu5LbZUVVcMDFdKSBvq1EG453FbA/A1nP+KrFVLb1
 PKI4yBIKnkWNVOq56hOt5Nu9U1XqSo4BTpGDmonIxMmx3Ja8g7LwWNSgW
 YgG07NYK+K0UadnCPAWUafT4u0gaMkjlHGyZyGZSoQGeNXvMu41miRo2k
 0kmFRW84KkqG6YRVE6xAfEoo8kArLcRoz3OhYv859th7LZ8NhUYS7y7l4
 MES6Y3LOSmh+1ulcj9VqBItXkUDvH+EJQOQS2VAGv4YVWs6amolftgxk2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="5386565"
X-IronPort-AV: E=Sophos;i="6.04,181,1695711600"; 
   d="scan'208";a="5386565"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2024 14:22:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="781563913"
X-IronPort-AV: E=Sophos;i="6.04,181,1695711600"; d="scan'208";a="781563913"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jan 2024 14:22:29 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Jan 2024 14:22:29 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 8 Jan 2024 14:22:29 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 8 Jan 2024 14:22:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X/qNaa841sGJfPe85KUfyaL97aKMeVcw/0IfIGTXoP5Y16Inq5D+pR28a1wOFOwkDCtglSKCLU8kYFoCBz9Dd7m7Dw1+69ZMjJ513sL3WZr6WJVdnfNQPbaizlykZ1JUwGC2iNcyuXymrpfsDdXaIQVduLuajtM/ISLjqhrFRARZbUuD+RsuMBGB3Olmm5DNd/XSlQKH/g42z6XQp5f7j1pP4DCLK5UdzWpLRsYji9gQFBJCKhy3ggXNSfp8Ulgv9lGUjpGzZDP0cAPraBxBMQEdHAaAdn+G9isg2f81tGP+m7cnDKJIvSLhp9DdCFYaXCy3jL4GTC5h+KTZSJKGzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VSatKQKHoxv0h1biwtMXhfHMn9pP2dZQQrxPEQfPVQo=;
 b=V6cwbeouUUIPnCxERX5HC7N+su5igmHVCSFFmrEwrhjt1vo9bGfI6a8EiXQBQkmClMF+RVZ7Iz2fyLNMLMQUCsgtLwO2cnGsfaHtCT3h2mCZa8kBdmMt/YEs7mqr9UmbwzyZ+g+y2NJNDQxK1VJMa8x0LKo4/YYNPUI6tsi3OcTBdfEiq/GctsbERmTnhOT/AHdfpd8SDRqyU4yEM9FMVUaUngJMPfbuNxbtKNKbEigVE9D10MIyJLNR483z+SkHWRSIxux8EalFpfTTx/LCNQ2h8RXW6HSz7UOcz/VNammTpIOG5a0Ti4TkeNUAMuow7YBuYpRGdN2fkE6qzrVqSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB7993.namprd11.prod.outlook.com (2603:10b6:806:2e5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Mon, 8 Jan
 2024 22:22:27 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7159.020; Mon, 8 Jan 2024
 22:22:27 +0000
Date: Mon, 8 Jan 2024 16:22:21 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] nightly.conf: Add the xe repo to drm-tip
Message-ID: <6dkiwe24dlanapcudkrbionkbc2lycqqghify6rkh2oux663w4@o4ekhar7flzm>
References: <20231222113640.14038-1-thomas.hellstrom@linux.intel.com>
 <ZYsb09nsERQFDCQl@intel.com>
 <9541c844440e8b0fc5686e19850a04c7a55745ba.camel@linux.intel.com>
 <ktdr7l23leikip3hsmbxr2iirmz5zat7wck2ib6lbijl3uybtu@4iqn3adhfzyv>
 <ZZxzn1zdye92n5C-@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZZxzn1zdye92n5C-@intel.com>
X-ClientProxiedBy: SJ0PR03CA0044.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB7993:EE_
X-MS-Office365-Filtering-Correlation-Id: 62f88145-ebde-424d-861c-08dc10984b81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0ns5MkeV5XwdE8dq9aKmoispVgfwaqA4pgXBsRGo0eA1dXlSVuo9i9Fh7CtFDw1gCeePon2jInsCbFdmSud4P2zw1Yvmt8ngB/pGsbEazGJgVyoF79FgHME3/UXB58HqV2N9Zsh31KTkFLesB/UWuqMUSPd0m569xAwFjt6+6sBSzAQjaiJZ1s5c5IyNtXx9D7/NzREnICQcpbXwgUplIOQ2Q3pT178VXjV2ttEbOkBX5sXX5U6z3Tz2K0unEFAJeRbUeFuRRDcQtE4l2PHoTpDZPsJQ3MTZgWEcD0GTZQGpqL/O5K1m/K0Mu/PB/m9SQ4i+LWqOMJGsZQBENIz+JQGSVJNoR6ZknoGYRCnSqs6HDuZUrvFYEnICAvdFBSZhbrf5TTHXSOdQSnNqt4gg+g7g1hT/dllvgIUQOIFEOfZ3Cx980+brTWkKOYTjuZfBYEAHFHAY6sBclthqrAPk/zxl9aq3XL5L4H+8FTfnPSW0iW8rf7h3b2znT5YQZgsBUPbatjwtqpajwtklHkocutDVUUHWWb7Uoeqrv3R5G0s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(396003)(366004)(346002)(136003)(39860400002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(8936002)(8676002)(316002)(6506007)(26005)(9686003)(6512007)(83380400001)(66574015)(66946007)(6486002)(33716001)(66476007)(66556008)(41300700001)(86362001)(6666004)(966005)(6636002)(478600001)(5660300002)(38100700002)(4001150100001)(2906002)(82960400001)(6862004)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?3/mOdiiG4IKuCo6JwW1M9lix69X0rk8VSy1ulqrXy9c0tn+teYI2J0ieSG?=
 =?iso-8859-1?Q?AqXIUZ8kDzLjkBS3DNGPas8G28auCH41hmZwzQbedxKx4wC9QH3poLiUwS?=
 =?iso-8859-1?Q?PjNVSEUyCh0W0csleFiWOaPp8O2rkYe5B/nSIhAYUrcSZhUnMvno3c5Ff2?=
 =?iso-8859-1?Q?2eVMAQ24+b2UkS93w/fVDUJZa4c/cbV9vGzyQsBuR8Ff7UKnLlGBL4UFaX?=
 =?iso-8859-1?Q?b8vZoHAkmM+25EplQJGl0gZwNxicJiSN1NWu/NU++8fQiB8YJPnLFpARcS?=
 =?iso-8859-1?Q?Vzdz+auu6upGFStaNgr2pTjkKbskqaOxEdeTH2hJrnYfASwW2J6OSVKkML?=
 =?iso-8859-1?Q?V+UUwHuxy+ulasi6+3z7QBGId0TLR7j+2tyDR4j+cuFyuZdtzCWD/eJVOE?=
 =?iso-8859-1?Q?//xIBD36P7HA8tPRuPCzfk1xjL1fT9XU/Pix1uI22h+TrUt6TlPEOjyRky?=
 =?iso-8859-1?Q?zHGQeNYX+Q7ORavpnsN9iV4TKpn/J/zhBbl3HXGYdIAsQu7eqpY5ChB6gR?=
 =?iso-8859-1?Q?TaP850FVn/fraUytghrjGZRcef5j3cy+nziW7C3w6089at4HP2HGjQLrRm?=
 =?iso-8859-1?Q?baUxCUTEzvMbf8noh7oILv9SjXO7Xc+X07sodV3LLaY4SW/xqlQY13xbwe?=
 =?iso-8859-1?Q?/wSDbv5ZBAFAZIHcXlHjcXVopTKuKZiEU8kVzR56GJg3B6pFgrYQvKBf8K?=
 =?iso-8859-1?Q?RPtpsLhqD4O2TdoDg0o1jNYucvhG3HLuk7gsUIuvT3H4FAkNW2NGN1YOtX?=
 =?iso-8859-1?Q?h0VqZKbByJ1p8DcsnvReNYAymnw5u3evkm5aK5kfO6HxXWiXO/Qp4pZhbv?=
 =?iso-8859-1?Q?EIOQuCwHrHnhlec2tfExumcnSTAhBFJKXAEj9qusgNc8BlQex9Qq73Pk7/?=
 =?iso-8859-1?Q?whIH/xWUmG/oqaMl+i18mK+G3C7YPicKgYfOEqI9SiTn8pByLfeHRULXpJ?=
 =?iso-8859-1?Q?8WtjRnuZiX2e7olYrWHr1ta8LQKgodOXlq9A2axnFFsvkcQOdji3s8DZYQ?=
 =?iso-8859-1?Q?KEOw3wPMggw5isUfi5wgn1+GNYMfDrC8nu6ot/Ry0aXzhe1qpJj8VRsR3o?=
 =?iso-8859-1?Q?nSXoLeAqWZ3dA7LfCxq3Si1BqCgAZRjfey8TqusJdpDeECgnJ+bAsaEv0D?=
 =?iso-8859-1?Q?AVMg7TtunXn/olt9QlQo3RwL9hGMu/vmTfMt6AVxJ4irG5Wg70W+9eJq/Q?=
 =?iso-8859-1?Q?kCHKAaq/frLf4CX50Ayl61bKgoqBkgIvLJjBQKyzHPN46VnjWMKFsxj1Yp?=
 =?iso-8859-1?Q?xiaUqcX0OQs4BAM7fVv7Y0+vMlOzaTQNBw6jF7KkELZ+8NaY2PEpqsgp3Z?=
 =?iso-8859-1?Q?uKrv2k6wziMrdZ8pWanFgi48ofC2SOgKU4tHSkb2SIzNre6T6LCK6pH34/?=
 =?iso-8859-1?Q?/jwAMvLS7Zh3Yd6KEQ0Yj1kpKxsqGM7odBtLHPL915pBjJg5aCeJzwSb3n?=
 =?iso-8859-1?Q?L7iCnbkSyLE5cqtCxDjcA42McVrkZ3Cj9d//lqImuMjKxPUeJGab/7oYEE?=
 =?iso-8859-1?Q?Gi45D2BI6iViJfsMpb5hTvpW3u6XwcXH9M+kGyAkO/1Z5jwdOJBgmY+vMB?=
 =?iso-8859-1?Q?gOhAz18tTk2JrviAu4QL6qUq+XSNXw5d1omM6JzO8BzbCLAOY8JT00ezTi?=
 =?iso-8859-1?Q?/HVwPNj6BxnKZW1v/rAsr5QSM0Zpm3XaDKJDH/hB/WGt3pi4A0X0+RHw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 62f88145-ebde-424d-861c-08dc10984b81
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2024 22:22:26.9123 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o8xpvr0pYlZDbadTxZFhX6CdgPfCqd8h7C0C1ZzCBSlenWxmL099/gGR0frbFZpqgsULMc4xEVc//k2WYyl0Oy4/j6gCk9XQPS8QpfqhpSM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7993
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
Cc: daniel.vetter@ffwll.ch, intel-gfx@lists.freedesktop.org,
 dim-tools@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 08, 2024 at 05:13:51PM -0500, Rodrigo Vivi wrote:
>On Wed, Jan 03, 2024 at 11:59:16PM -0600, Lucas De Marchi wrote:
>> On Wed, Jan 03, 2024 at 02:50:57PM +0100, Thomas Hellström wrote:
>> > On Tue, 2023-12-26 at 13:30 -0500, Rodrigo Vivi wrote:
>> > > On Fri, Dec 22, 2023 at 12:36:39PM +0100, Thomas Hellström wrote:
>> > > > Add the xe repo to drm-tip and the dim tools.
>> > > > For now use the sha1 of the first drm-xe-next pull request for drm-
>> > > > tip,
>> > > > since that branch tip is currently adapted for our CI testing.
>> > > >
>> > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> > > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> > > > Cc: Oded Gabbay <ogabbay@kernel.org>
>> > > > Cc: daniel.vetter@ffwll.ch
>> > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> > > > Cc: dim-tools@lists.freedesktop.org
>> > > > Cc: dri-devel@lists.freedesktop.org
>> > > > Cc: intel-gfx@lists.freedesktop.org
>> > > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> > > > ---
>> > > >  nightly.conf | 7 +++++++
>> > > >  1 file changed, 7 insertions(+)
>> > > >
>> > > > diff --git a/nightly.conf b/nightly.conf
>> > > > index 24126b61b797..accd3ff2cc39 100644
>> > > > --- a/nightly.conf
>> > > > +++ b/nightly.conf
>> > > > @@ -24,6 +24,10 @@ git://anongit.freedesktop.org/drm-tip
>> > > >  https://anongit.freedesktop.org/git/drm/drm-tip
>> > > >  https://anongit.freedesktop.org/git/drm/drm-tip.git
>> > > >  "
>> > > > +drm_tip_repos[drm-xe]="
>> > > > +ssh://git@gitlab.freedesktop.org/drm/xe/kernel.git
>> > > > +https://gitlab.freedesktop.org/drm/xe/kernel.git
>> > > > +"
>> > > >  drm_tip_repos[drm-intel]="
>> > > >  ssh://git.freedesktop.org/git/drm/drm-intel
>> > > >  ssh://git.freedesktop.org/git/drm-intel
>> > > > @@ -65,14 +69,17 @@ drm_tip_config=(
>> > > >  	"drm			drm-fixes"
>> > > >  	"drm-misc		drm-misc-fixes"
>> > > >  	"drm-intel		drm-intel-fixes"
>> > > > +	"drm-xe			drm-xe-fixes"
>> > > >  
>> > > >  	"drm			drm-next"
>> > > >  	"drm-misc		drm-misc-next-fixes"
>> > > >  	"drm-intel		drm-intel-next-fixes"
>> > > > +	"drm-xe			drm-xe-next-fixes"
>> > > >  
>> > > >  	"drm-misc		drm-misc-next"
>> > > >  	"drm-intel		drm-intel-next"
>> > > >  	"drm-intel		drm-intel-gt-next"
>> > > > +	"drm-xe			drm-xe-next b6e1b7081768"
>> > >
>> > > yeap, up to this commit nothing else should change, but
>> > > then we will need an extra rebase of the rest on top of drm/drm-next.
>> > >
>> > > But then we need to decide where these following patches will live:
>> > > 880277f31cc69 drm/xe/guc: define LNL FW
>> > > 2cfc5ae1b8267 drm/xe/guc: define PVC FW
>> > > 52383b58eb8cf mei/hdcp: Also enable for XE
>> > > bea27d7369855 mei: gsc: add support for auxiliary device created by
>> > > Xe driver
>> > > fcb3410197f05 fault-inject: Include linux/types.h by default.
>> > > 8ebd9cd71f8ac drm/xe: Add PVC's PCI device IDs
>> > >
>> > >
>> > > Will it be the topic/core-for-CI?
>> > > or topic/xe-extras?
>> > > or what?
>> >
>> > This sounds to me like topic/core-for-CI? Or is there any drawback with
>> > that?
>>
>> I think some of them are not really a "for CI". It's more like the
>> workflow we are adopting e.g. with guc/huc, not sending it to linux-firmware
>> until we are confident on what version we will start officially
>> supporting.
>
>yeap, I kind of agree here, but at the same time it is our way to run
>our CI with the firmware blobs that we need while not final, and also
>this was already used for i915's MTL firmware.

ok

>
>>
>> This one can't go to topic/core-for-CI neither:
>> 	fcb3410197f05 fault-inject: Include linux/types.h by default.
>>
>> what it would do would be that we would not see the build error anymore,
>> but everyone else would (and it's not a CI-only configuration).
>> Unless it's merged to another branch, we shouldn't merge it.
>
>yeap. it is sad that we were ignored there. let's just drop this then.
>our driver is workarounding this bug anyway already.

agreed, let's drop it.

>
>
>>
>> "52383b58eb8cf mei/hdcp: Also enable for XE" could be material for
>> topic/core-for-CI and  "8ebd9cd71f8ac drm/xe: Add PVC's PCI device IDs"
>> could either be on that branch or another xe-specific one.
>
>yeap. For the MEI we probably need to ping Greg on the original
>submission and ask his ack so we can put that in the final drm-xe-next
>for good and not even include in a topic branch.
>
>for the PVC IDs, the topic branch could be okay as well. But if we
>end up with an exclusive branch for xe, then it is better there.

fair enough... I'm ok starting with topic/core-for-CI and if it ever
becomes a problem, to create a xe-specific topic branch.

thanks
Lucas De Marchi

>
>>
>> >
>> > >
>> > > Anyway, for the inclusion like this, after our CI is ready:
>> >
>> > Could we merge this patch already at this point, considering it will,
>> > at least for now, only update drm-tip with our fixes?
>>
>> ack
>>
>> Lucas De Marchi
>>
>> >
>> > Thanks,
>> >
>> > /Thomas
>> >
>> >
>> > >
>> > > Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> > >
>> > > >  
>> > > >  	"drm-intel		topic/core-for-CI"
>> > > >  	"drm-misc		topic/i915-ttm"
>> > > > --
>> > > > 2.42.0
>> > > >
>> >
