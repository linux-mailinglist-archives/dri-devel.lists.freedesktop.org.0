Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QC1tJa3tpWlLHwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 21:06:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E86341DF1B6
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 21:06:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66C7B10E1CA;
	Mon,  2 Mar 2026 20:06:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CcEayUDz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00F8610E174;
 Mon,  2 Mar 2026 20:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772481959; x=1804017959;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=JacQnvq4/nSdMw4kPqJqvbXODW0cHXBqcoja5aRi1qc=;
 b=CcEayUDzqJ2J1F+5396jMiF06mQsQ7blo83YYcZ9e6oqLndlWtkBkzy1
 DUxqJYnYWlMm0jPaBbNbXZ8XXDnFt/w8NlrZRwWdcd8YM6ziaiU5ItdLO
 rHNffQAxq3AKAZfnH+YfgzbcAIvheVtjxllMTAjyEkVy+r2U0dL4rEBuV
 zjlbLSrwp1vEAVVox6j4k2JEhpDlbmreM1el/bPLzk72GrhIHQ+lmjuvT
 N8S6bNv3wyCYONAbTyq8W8+wtbLmmO6etLMmDDpzgej1K0k57qhn/bqJs
 A3TKvqT0fUc1ER0Sk+5i0rhx6jZ/mv5Y2swrfcuIuSNJGIaxecfLW9JEY Q==;
X-CSE-ConnectionGUID: PCNBfkuZTbK7uP8fbbSTBQ==
X-CSE-MsgGUID: 8RPtgwAnQAudfZ7JGwsFxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="98975153"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="98975153"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 12:05:58 -0800
X-CSE-ConnectionGUID: AUt6ucOhT8u5yYa7QWp99A==
X-CSE-MsgGUID: fwnRSockTmahJZ1z1r/0yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="222262666"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 12:05:59 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 12:05:57 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 2 Mar 2026 12:05:57 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.29)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 12:05:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=smlT62EYoN+UEOQWe8H5GkEh5sFCbLXKsNp04fdwQZh6JCGvVSlkDFpEdxz+kt/g8rMo9QPgfcTxF0WDYQ6pSH+tOE+fJlw12v5dBHFns25CIVEera5wVyZPS6hWB+qliAiH4CaQ/S8rMohTob+Oqx4RsI4qdc335kGzIL7U9AKetOlLciG+L7zWsFr5fBUqwGOBO/J0vhH8nd/i/KkFsECMTrUhlyH9Lu9TszQ+vV8hpxd39B0rEw1fjW3TK2T609aJzOeMOTTmaZQkERy5fn++r1zfmFS62dBynE5cg8UZjVJIrmC/Tn3LoWZ1gLElsA/vfWdLL6AAn8lgKcZsag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SHjgP45ZmZQybvCecPT5IMBihA3o7ypNuz5fI942N5U=;
 b=YRtwS/NjzcRh07Utqf71U4jpC5omm4ntyBt6EmFRGm5AFkXSVC9jFPtuSZAX15it0qC6wueKLr/ktibfUD+iJk1i56Qsk/WxlRrueXdg/16Y4lUnRL+BL8n3iwNUp9YyjBJPSy5Lvq1Us22/uweMeZbX+0fMypSbT+i8C5NwRvEoKoJ8pwJmE/xBkHgifSXmzDkqd6Y1KKXy/HIptTt4CgVHZijHXS1GAo2h8BNYrFuBek7/T3xF7m+vurUt6accsrw5SZ9jGkoF9lWKxuVzqGy5QMf/+85Zm86leV8FHvVEWI+UD4NTpnvqQhxsWcSKy4C98ZrThSNT4cm2guZIkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB7325.namprd11.prod.outlook.com (2603:10b6:8:107::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 20:05:49 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 20:05:49 +0000
Date: Mon, 2 Mar 2026 12:05:46 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
CC: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Tvrtko
 Ursulin" <tvrtko.ursulin@igalia.com>, Philipp Stanner <phasta@kernel.org>
Subject: Re: [PATCH 1/2] dma-buf: Assign separate lockdep class to chain lock
Message-ID: <aaXtmuOr4bZtQ9lr@lstrano-desk.jf.intel.com>
References: <20260224175544.2167712-1-matthew.brost@intel.com>
 <20260302162812.15a0614b@fedora>
 <470ae9bb-e955-4773-b5b5-cc97b5bda20a@amd.com>
 <20260302173959.1c07d7d5@fedora>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260302173959.1c07d7d5@fedora>
X-ClientProxiedBy: MW4PR03CA0216.namprd03.prod.outlook.com
 (2603:10b6:303:b9::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB7325:EE_
X-MS-Office365-Filtering-Correlation-Id: f1f2a98b-b71f-4481-f98a-08de7897193d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: oNIgKV/CPm3aRVADxwtKsV3VG/GLoRzrmrTr00n9goLq6KXA0axvoAza7SRn8P0GvOv3IXKA2lkO1m2rJxjnPndGNQZILz7qY2LCQmRP/GVSjwMJfmeePAuX7CN7kU6dbBvX9Hi+NeXJw5Ks8MH7P8/sUiduRISd1eCMEKiYDqj8CA6gbSZyazbR/nPEE8RVnNlMJ7yyzenKGo3B+jdf6cW4/MExpNzj/Puf7Ievgj4rAkrUWJX+mS3cYHQJcZ/Lj+mAnxp01H5DVCuI9USN8+J0aXwqzejegmPq6B5rgJsYZDGF3Og7l3NZPxUEoN2wBK8MqB8HZgvISGyBsYjC5r7z/Hb+NOqiPJ/VkGGALbko+7ZLAd6FeT8JCOuqIFDDJ7jc6s/KzrY7q1+QMqJhMScljbZQlTrhTOGCkQY0+30BlTahvYQIuCsBzCxvSKubiFkKhUIJOcsOZP9FWQUjX5THPSnX2G/gNTvODGRacWfj1PsRwhWFZ1z7vLcOhszTdVbwTSxlk9hjxYDs4t/b2Bk5bhlifDL+o6UWM/FSl+wQ753QCwwtWLbXTEktnO2okBG6OTOoEqON7f3KfvU2v8QsAcfgdGtNNt6ODaOxVhyMrAEqMdZ+UCieKcZLhvSIBnEn/9z1QdJ7JO0N/65GqDIrv+QD+4E51HPwydWRjaAtSkn8cSEjmc+fnv5wHpWRNX6bxGHm/r3oLSY7mfMFmRPAZUiki6heYqiFUxfJo+M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?8E/QYIKwBzsarwmmN51O42LMclaBikroL3z8V9/b+M2rfYW1rMoHfjY828?=
 =?iso-8859-1?Q?hCIcZGtYQ9Hn81q5dtG6Iw6a2O1wC5u9O2bny9o9MJ8MtCredXeTUxe0J6?=
 =?iso-8859-1?Q?YVyw6yjnXNYo7TFqTlOxnYgFaqdxsKSeT+W04Z7N3fXA5gZXk0B8wCu+qN?=
 =?iso-8859-1?Q?wiZItdegNyPkKr9yL6Ub59OjOptogvlVgEdN97I2TKflfqLbVh8C/NI3SL?=
 =?iso-8859-1?Q?H9r6uhFKyoZ5R8B2UxuIqc4I3LwMpbWK+r0i5ewyYjlNEAtvrPKWcofDQk?=
 =?iso-8859-1?Q?Fkz7vpmri6IGULFoJegj8LK57qPVfHVt9GhNB6vKlI/kdGCjJ4MjuBPQs9?=
 =?iso-8859-1?Q?uB2+bu3nr/4GHrkyrZDkQbwHcYRMvN3xd5ew5sT6ehBXrQAjx6tXkyYQAJ?=
 =?iso-8859-1?Q?zBZvN/hN3EnjroFAVX2O/zZ1e/xQYhxobW8aG/wjktzr4GdC1InZ7xxUkw?=
 =?iso-8859-1?Q?xb3sR8/cSiYPyH6DHEMxD+3SESENxR6bnBvDJ50oRFPHYMj6gGzl8z4H1u?=
 =?iso-8859-1?Q?+Wm4xy1KGGxsbMme63xabdMAp3L+mogniMPNqYVv2FYV+WErZw2aXjIafP?=
 =?iso-8859-1?Q?cheETHt+oc+QhRbENXvEgzlAbobw+riiU0Wwd5650zVns4E03DF2r7HwUv?=
 =?iso-8859-1?Q?qRRgUCZ1H3ZjbsI328ibX95qTI2BPnFeKCH8yq22fTZmpzJctdC1fuUA1d?=
 =?iso-8859-1?Q?sb+DKKSk88pwSVdG3cNsspNiOnb+Vu8+mYQnPbl598CD0TVkJS4WcPkIAg?=
 =?iso-8859-1?Q?v3tjxPuWWe/a8WxElf8g1twSJ7O2qpt/A61ui/kMSl5nhZgvtEefDAh/Ln?=
 =?iso-8859-1?Q?03S65EMcwiUoiAF+3UPp7CKu/j9WogXi490Hn49EUyHyYvjCs3RmR0NYr0?=
 =?iso-8859-1?Q?CDqUvWw4foukLl7aR2jTcsXyMED0AH8k1hw47cVfAj7tZodF+zm1jgZXrE?=
 =?iso-8859-1?Q?3KN/XhnTglvXjKIwQNhNT6B/D5h2ndaRcIXTwDOm0WBcrUvMckUnFgXFzZ?=
 =?iso-8859-1?Q?SYruDAgdexfsxHcwM2lOqdNpUD7r0p7SAXZaFwaXQ0366ukzRnNBujsyyk?=
 =?iso-8859-1?Q?jbzNd+yIkb/zr9vj1lInP06/zWsEuYO9gpCqu3LCvXGl9qLPq21ULqd+Ao?=
 =?iso-8859-1?Q?B5WRWe/TOngAULbewlZUhXFqOwjb1KNAVYXVQgy7X/nUlGOmJeI4GH0XdF?=
 =?iso-8859-1?Q?QdSZgwk0DJMO/ceoozASUPxBGIfDdQGOJr3vVSEFtST2fi+Vl4zhGxyMpu?=
 =?iso-8859-1?Q?Btg5oePBodw9YQ7CCOPTJGoEcue0MUIOoyRv3n/2yyJZI7cBt9YZwToNfo?=
 =?iso-8859-1?Q?hbIQd+Ge073n8mUHXJt8a5ddEW5LXzz8xlEOfxyrIlhEbDZuEE1S9aW4Qj?=
 =?iso-8859-1?Q?LoutiByrqpxZfHikEswWNgnhYxiR8cBYoroMnkIPDLWqrt8tD01LHcoUke?=
 =?iso-8859-1?Q?zTOTw1+7gIYnTw5S9eEq7uDz2KARp5J+edpgOk6N6hxLsxyjTyZD7+XxRV?=
 =?iso-8859-1?Q?AsDLHV+NEFVnt7f47/RxJhGkf0VI4vOnboTUY7sfa25jUs4YfbaUw6Daht?=
 =?iso-8859-1?Q?ziN/VHfoO5ej1u7FsB8v1N+xw5scGYhDXZQmbi0xV0itOj2x8hDcFTBiOX?=
 =?iso-8859-1?Q?f1BEv/a8H+6zNjEIJsNYrBvYhnDNWF033j5a47eVrRFWiMg9JusDeaBYN6?=
 =?iso-8859-1?Q?E9F+M+M80a5W9qnxA6BA0CmDwvyh04S8//ZKEofGcBUyuJ52AM4y6F4A3h?=
 =?iso-8859-1?Q?Z+7ZHHAkClawneKUZaIdZAxeK60ijBR8zTbQfadil0XF0munKSe2SxLXwr?=
 =?iso-8859-1?Q?yd1clPNq+a3S7rJGg8Yz08kHSn7mcws=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1f2a98b-b71f-4481-f98a-08de7897193d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 20:05:49.4095 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1fOMOMk8bx4YkE/B67ktWsW0iWJoLRNlm9pV59pqFAVVHBWn6xbqzp3dqMsZSOtZXebTVMFLva233I0yY0nNxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7325
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
X-Rspamd-Queue-Id: E86341DF1B6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,igalia.com:email,lstrano-desk.jf.intel.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:dkim,intel.com:email,collabora.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 05:39:59PM +0100, Boris Brezillon wrote:
> On Mon, 2 Mar 2026 16:42:28 +0100
> Christian König <christian.koenig@amd.com> wrote:
> 
> > On 3/2/26 16:28, Boris Brezillon wrote:
> > > On Tue, 24 Feb 2026 09:55:43 -0800
> > > Matthew Brost <matthew.brost@intel.com> wrote:
> > >   
> > >> dma_fence_chain_enable_signaling() runs while holding the chain
> > >> inline_lock and may add callbacks to underlying fences, which takes
> > >> their inline_lock.
> > >>
> > >> Since both locks share the same lockdep class, this valid nesting
> > >> triggers a recursive locking warning. Assign a distinct lockdep
> > >> class to the chain inline_lock so lockdep can correctly model the
> > >> hierarchy.
> > >>
> > >> Fixes: a408c0ca0c41 ("dma-buf: use inline lock for the
> > >> dma-fence-chain") Cc: Christian König <christian.koenig@amd.com>
> > >> Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > >> Cc: Philipp Stanner <phasta@kernel.org>
> > >> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> > >> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > >> ---
> > >>  drivers/dma-buf/dma-fence-chain.c | 17 +++++++++++++++++
> > >>  1 file changed, 17 insertions(+)
> > >>
> > >> diff --git a/drivers/dma-buf/dma-fence-chain.c
> > >> b/drivers/dma-buf/dma-fence-chain.c index
> > >> a707792b6025..4c2a9f2ce126 100644 ---
> > >> a/drivers/dma-buf/dma-fence-chain.c +++
> > >> b/drivers/dma-buf/dma-fence-chain.c @@ -242,6 +242,9 @@ void
> > >> dma_fence_chain_init(struct dma_fence_chain *chain, struct
> > >> dma_fence *fence, uint64_t seqno)
> > >>  {
> > >> +#if IS_ENABLED(CONFIG_LOCKDEP)
> > >> +	static struct lock_class_key dma_fence_chain_lock_key;
> > >> +#endif
> > >>  	struct dma_fence_chain *prev_chain =
> > >> to_dma_fence_chain(prev); uint64_t context;
> > >>  
> > >> @@ -263,6 +266,20 @@ void dma_fence_chain_init(struct
> > >> dma_fence_chain *chain, dma_fence_init64(&chain->base,
> > >> &dma_fence_chain_ops, NULL, context, seqno);
> > >>  
> > >> +#if IS_ENABLED(CONFIG_LOCKDEP)
> > >> +	/*
> > >> +	 * dma_fence_chain_enable_signaling() is invoked while
> > >> holding
> > >> +	 * chain->base.inline_lock and may call
> > >> dma_fence_add_callback()
> > >> +	 * on the underlying fences, which takes their
> > >> inline_lock.
> > >> +	 *
> > >> +	 * Since both locks share the same lockdep class, this
> > >> legitimate
> > >> +	 * nesting confuses lockdep and triggers a recursive
> > >> locking
> > >> +	 * warning. Assign a separate lockdep class to the chain
> > >> lock
> > >> +	 * to model this hierarchy correctly.
> > >> +	 */
> > >> +	lockdep_set_class(&chain->base.inline_lock,
> > >> &dma_fence_chain_lock_key); +#endif  
> > > 
> > > If we're going to recommend the use of this inline_lock for all new
> > > dma_fence_ops implementers, as the commit message seems to imply
> > >   
> > >> Shared spinlocks have the problem that implementations need to
> > >> guarantee that the lock lives at least as long all fences
> > >> referencing them.
> > >>
> > >> Using a per-fence spinlock allows completely decoupling spinlock
> > >> producer and consumer life times, simplifying the handling in most
> > >> use cases.  
> > > 
> > > maybe we should have the lock_class_key at the dma_buf_ops level and
> > > have this lockdep_set_class() automated in __dma_fence_init().  
> > 
> > The dma_fence_chain() and dma_fence_array() containers are the only
> > ones who are allowed to nest the lock with other dma_fences. E.g. we
> > have WARN_ON()s in place which fire when you try to stitch together
> > something which won't work.
> > 
> > So everybody else should get a lockdep warning when they try to do
> > nasty things like this because you really can't guarantee lock order
> > between different dma_fence implementations.
> 
> Okay, that makes sense.

Yes, I agree with Christian's reasoning - chains / arrays is the only
case where nesting should be allowed. Also if we assigned a key for
every inline lock we'd quickly exhaust the number of lockdep keys.

Matt
