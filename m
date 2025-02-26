Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CDDA467E4
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 18:21:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7676610E971;
	Wed, 26 Feb 2025 17:21:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="on2HN3HS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2064.outbound.protection.outlook.com [40.107.244.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD1C610E981;
 Wed, 26 Feb 2025 17:21:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mOoU+yxB2yf5Hrx6a2XTSlPw0lvveyken6IxSrqqfxjJErYkQKI02nJMfJRJHDQJHp6hH8f9q3Za0Cl/krhQh5QXu1ijMsoQp4KqerMSzZXPtT5NmM9jFzqq75zCDBiLkWm5kZWEroq+mPZH/XSsKlK3SsazzNGzfOfZI/GYW7Q7Hq+YnMpFwejk/eqeRo9jOdNvWvcKR84ZxtQN6oWYgSIQ1mHsxxp8zfTLwoq7Y6132u219vsXxGa8SvT2I3J1oz81xIPaCyWq6EBCXHf638nAb/2lg2G9Ok/HCGarbry08itmHspFCNmdIdJSNrYxpk/mSQQoxR3oGvRhvnUE5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mzcoC59nmqlcRDxAyCE4QvyfXWj6gV4WXRWYZXKw7AM=;
 b=gUd9W0e6hx7bcEZI6dyiDOxjehaTNx1lY0BmUqrpRlN/Qe7zR9VJa7b4ZgYfAbuyGU/r9/8pXenGuTgPoezQp8brE0mSfynYupXdzg/K0rvoT5bnPmYBVW6nNiFTBi7AIdQW9kHRv1UhiUQsjO47w6LJEYWQBo9HPikZhINxROVjV3FhvZZmeqxctYsSlj+pu22qvJ5MgPR/u9uDs0P9ZNf2heuZdDUYPqsROS1TcKO9jYdxVA05C/eQo4p/Ji9ZhAtW0tRzlEogW6TaXU2jyN7zsSdR+MaFOVnsZVzutjz5tSIar1gYnAwqCxKxZD7zsI3wVB2JZrehTJP1FaqZSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mzcoC59nmqlcRDxAyCE4QvyfXWj6gV4WXRWYZXKw7AM=;
 b=on2HN3HSiLoekbBEfGtqGTUn32tQYkbY5Z7HAnWms+dSZFbhFmnD/9My9Wr1YcRafzM3aO+craaIDPVBI7XLMdEclvlxoeTkaKJEEpV6OGjk2y2CLKzaaCs/3A8h2YGWxVSZGNpFph5WYP3Xn620EkFFeIGXw9n2IxNt5Gpg/MVTcNqyarK0pD9mxGiWvLjEkOTMYsQxHbRp1mBu2IgYAVn7djq9KwWePJCNqOoCSQvOuCR/nyS+icSVrBmV3C7+AsCiHZnu6GpdWzBy+0nBoISF2ntuutewBp3VQ08r8cm1VL+70fxIu9za9JIjMX1e4Wj1slajnEAdLrgeaEFpdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by CY8PR12MB7220.namprd12.prod.outlook.com (2603:10b6:930:58::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Wed, 26 Feb
 2025 17:21:22 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 17:21:22 +0000
Date: Wed, 26 Feb 2025 13:21:20 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Dave Airlie <airlied@gmail.com>, Gary Guo <gary@garyguo.net>,
 Joel Fernandes <joel@joelfernandes.org>, Boqun Feng <boqun.feng@gmail.com>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 paulmck@kernel.org
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
Message-ID: <20250226172120.GD28425@nvidia.com>
References: <Z7xh5bEyh_MII4WV@pollux> <20250224184502.GA1599486@joelnvbox>
 <Z70EcwNIX0KtWy36@cassiopeiae>
 <2f062199-8d69-48a2-baa6-abb755479a16@nvidia.com>
 <Z73rP4secPlUMIoS@cassiopeiae> <20250225210228.GA1801922@joelnvbox>
 <20250225225756.GA4959@nvidia.com> <Z75WKSRlUVEqpysJ@cassiopeiae>
 <20250226004916.GB4959@nvidia.com> <Z75riltJo0WvOsS5@cassiopeiae>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z75riltJo0WvOsS5@cassiopeiae>
X-ClientProxiedBy: MN0PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:208:52c::30) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|CY8PR12MB7220:EE_
X-MS-Office365-Filtering-Correlation-Id: db6e8a1b-5277-4195-7083-08dd5689fdb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LlO+IH1qMVnQ7lEy0ctWX9gqvVJxGNUheZk3vNiUsiPYtM/Yet5rJ6BNzubL?=
 =?us-ascii?Q?g8L6Nt3IWz7sYkQfKgu+R34Ru63vtyGxOkCz3HgpFv06daPR2SL8Dd7LmCt0?=
 =?us-ascii?Q?Q5lmL/hHq7IP2L9rO9ctCiukSoryzB2yAXgEPPwmqtZuWdmdYNsalnrqirEo?=
 =?us-ascii?Q?xoVyYUpZ+D/VqgeuGxLq6Yn1o8MFEr/fOxk9DMeDFqJZl28c1UaT+/UDbLfC?=
 =?us-ascii?Q?S94UH8bUS1lg3RAue9G3pXU1QsDyFsUtPQ93luv1IbpRNGOKsuYvOLcioBRP?=
 =?us-ascii?Q?zTrlue65AfEmf5z6bQa5vfdzjtTUJ8e10ecIbpWSi/8rZtGuuZeTKTggi8Ci?=
 =?us-ascii?Q?GdGZoW/bKhJrjjPV+xPjs4JI65Tyx5u0k9JD3FS3orZdi607kTBbYsQkEgfA?=
 =?us-ascii?Q?k5nuRr+Hk78uQEOZ3pjv5BxjlOh+jkA70sM44ddA6XwZZZQam17SooXgp6j7?=
 =?us-ascii?Q?fYY2zIn5f05CO0yG+pKNl265A8guq6ZxrLpQbrK9hfX6O2w9tyo29+6pAZdj?=
 =?us-ascii?Q?W/d9CAtFfNbLCH0ih6LjXPsDvEBamUem1jIYSn8J3091nPT6uINg5qrdcXKQ?=
 =?us-ascii?Q?1BBreFo83xiRiw9NM4mWczc8i2qCwujpPUphugEicPgaepkKqclkgI5WPsCS?=
 =?us-ascii?Q?9g2ayPlu0O4FBVEhLISGZglxg0FTL0Kqg5OFxrbC/bv4jO/g0gkB9YI9NqU5?=
 =?us-ascii?Q?cigKaH9ZhKEu4bEf84q6aVLAXZ4pggAk9yRlFx1fYakqXAr4Wp3mRotHsgQP?=
 =?us-ascii?Q?8iz1YAGDK+Jqt60IukmSGwG1qjJddkGyXNAY37kxFC4qk5cOFiI0J599R8KM?=
 =?us-ascii?Q?PwrYZveSHoZdhDhR2ZOrC/iFfT/7iCUlQCIPD5LIjaq/BmAzaVZB7raNS4T2?=
 =?us-ascii?Q?83ZSuudeDzUTjw8Hf9kJD1haqJ1s6usTS1HbJyowyqsVt2/JrMgK3lTWSe8/?=
 =?us-ascii?Q?bm+0pPSEXPYNUjaafRwBYsqxE7Ux5didX4t/4zWWQTGfrbrHnpwFo0DrKonl?=
 =?us-ascii?Q?NhdeFCZwY9Xj+27q0Quzsu6eKvQ6esUMYKmTSztQ3lRrcLxepxvEJSkyaUio?=
 =?us-ascii?Q?iaF7S0yla4RHMxVUTD4PTy86/d3fL2ixv75KDW82WmdZic/Uu4PSt/HB+CjA?=
 =?us-ascii?Q?JbHG9lnDrZ1jWNbprmkw/JCbBuJXmNyg6KVXJbmNcO2kID+yaPsnNL5DLl1Y?=
 =?us-ascii?Q?FOEau6fx6AednwkfQQAjAYH2qFCuesA1+S8ay8bq3ofkW217uJlvTt9ws7XU?=
 =?us-ascii?Q?1OdvegK135SBjfhUDDxU+JsAxGdgirKyhjlHpeg3SKp4UULW0ka1Soltmo2f?=
 =?us-ascii?Q?ir/OdKG1vztnsY1Pk3Aeu/2f6Ie9z2h5Wu3JZhZtzX4+WfpipWDe0AM7B1dT?=
 =?us-ascii?Q?aFxijciMoXxD2YtmUZx/QD9/dILL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BzoObqz6umqdJUl/aZqT+hnYspZ0MD1v3bGzxVQCO6tLfWv0j0pPlw2qP3UH?=
 =?us-ascii?Q?wjYAalTFt3ozZhjuC/Xr2qQkmU/bqZND5xBwmKV9kTcOouYc+yN+2mAGTU2p?=
 =?us-ascii?Q?EtsV2qgVFFk+vu1Xvw3VUsLWK12eezXfIYmowrTaMOeOJ1EulvhfwAzAdQKX?=
 =?us-ascii?Q?pJhCDT916XaHMIiL+izINOCdmbtyYLs60VquxzEwqTCqSbwKFbw4hJh5C855?=
 =?us-ascii?Q?nwvBsQP94ewbl7iaqgRV9Ut4yJcayX2klu8MSboqPT8Fyo7ybOLgqm4gq/OZ?=
 =?us-ascii?Q?XmQXgkhYPlBoLzg1OqiZxwiOfIBi7aDyfbEScPJFmVyTtpqQ9kpqjda14N0W?=
 =?us-ascii?Q?sRLVwaGITnCl5TTVQKx2ZQfmTQCxoZt7iFGTk2ccuuOXVbt+DV7OuAdZS8x4?=
 =?us-ascii?Q?LQWXqT3LVKp0JyjqQdw0k7MVWNK/NoS8OEHfQ195d4UT4e83hzJk2AIT7Z3r?=
 =?us-ascii?Q?9iccZce8fB6viTir+4p8j2+82cc0FZ7aEoL24ukXRnppccQ+eg11Pda/Hddw?=
 =?us-ascii?Q?yAYu8Twflki7N/VRfFrmeY+6vTvI7XPjgNuHrxYD0WF4Cq57wQKrjYV/iyDN?=
 =?us-ascii?Q?+D/rO1maLPPpwESqBukk43Fr0NTavDKYPvNNCAnL/x3My0o8Z/pVeGtdcjtD?=
 =?us-ascii?Q?Dg6SWCLrQNQ0apExcKYwPcvBlSy4tuljTKuYKK7fCQAUtDFrnlsf0nQmSG4L?=
 =?us-ascii?Q?w8hzSSQ16SJEAP1IUaIccwurfX/j3dGjw63ro0ZHbPJw40idcG6ITxOzpkbh?=
 =?us-ascii?Q?5Xg7tinCs+sPXTcQYjWX3wX1vVCZavTIx4/LYtXcUx6H29wL6gS9XUjqCFmG?=
 =?us-ascii?Q?qxOQaU88XdBB4n9zE3ElGqIAoSVl2hgc8kuCmks0Xy7WTwwgYjoY0E4n+Vaa?=
 =?us-ascii?Q?sk4jSASB8w/D5HS4FnV6yP8cSKVzBh1HNHLIO44EH9Zk7Fr1pumxBFFzC6VT?=
 =?us-ascii?Q?eDOl5BvmqMtFXA4bWYVQIS5dJ3IYqEMwqV9Dnfcz1oCKRSdKJQi78kBW1d1e?=
 =?us-ascii?Q?gk8ZtFTIbpH5WwIselWpmykp3+R0Rv0h6Dq6TjqwTmK27JFOwJg3JriVF4o/?=
 =?us-ascii?Q?Jk45qMIL0TeXucJAKEyYFvEJy1bfZSxZpiMcKCz/e6o3hW14a+6lf/j0FOuN?=
 =?us-ascii?Q?TOjVPVFz0ZvbdiEoXabXrOiQlinpP+yvm0xoAuax+Hs+BUhaF3du5+eIclCJ?=
 =?us-ascii?Q?RAV/2eDWd7Ip+t6rvJ4JJiWZK/V0ePzJyQBCfM4doUYDaos6/I/Jy0/8UzTW?=
 =?us-ascii?Q?zsPT1X98wzzXRy6Or/B1pCA6+7CYujXo0C/idZNbBNJ7n1mElIVxmPGUkdoG?=
 =?us-ascii?Q?WsNrugTbWkgSRxk/AiklgTLJKYRjqYZzuG1Z/rvMJ4khHwSztmo0kYzZ5B5M?=
 =?us-ascii?Q?UIooma6OAqOVjgsWzKtCzIRebW1NQc+2xkkX1dMCz6uhzZevpr81Km1c6PF3?=
 =?us-ascii?Q?Qrs5Na58UVmmUpPjUuw+BwgWMTAiK6SsJJLEyi263sp3SthVNy8zvcRfr374?=
 =?us-ascii?Q?yA5HeYNffVp7nygJ1Lzt6VZkInhIPqibeP0gLD06G0J7KLHuwPL619Qi/KUA?=
 =?us-ascii?Q?PUWIDIEM0unCW5zMiUCn/GfZYNDFchM6astHLYkt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db6e8a1b-5277-4195-7083-08dd5689fdb7
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 17:21:22.5306 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: McBW6j0VvfFA/r7GU7xBVGtFr3QINDsikpQm+WL8ZqXgcZkxDHLgokoGtUohh3Pn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7220
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

On Wed, Feb 26, 2025 at 02:16:58AM +0100, Danilo Krummrich wrote:
> > DRM achieves this, in part, by using drm_dev_unplug().
> 
> No, DRM can have concurrent driver code running, which is why drm_dev_enter()
> returns whether the device is unplugged already, such that subsequent
> operations, (e.g. I/O) can be omitted.

Ah, I did notice that the driver was the one providing the
file_operations struct so of course the core code can't protect the
driver ops. Yuk :\

> Again, the reason a pci::Bar needs to be revocable in Rust is that we can't have
> the driver potentially keep the pci::Bar alive (or even access it) after the
> device is unbound.

My impression is that nobody has yet come up with a Rust way to
implement the normal kernel design pattern of revoke threads then free
objects in safe rust.

Yes, this is a peculiar lifetime model, but it is pretty important in
the kernel. I'm not convinced you can just fully ignore it in Rust as
a design pattern. We use it pretty much everywhere a function pointer
is involved.

For instance, I'm looking at workqueue.rs and wondering why is it safe
against Execute After Free races. I see none of the C functions I
would expect to be used to prevent those races in the code.

Even the simple example:

//! fn print_later(val: Arc<MyStruct>) {
//!     let _ = workqueue::system().enqueue(val);
//! }

Seems to be missing the EAF prevention ie WorkItem::run() is in .text
of THIS_MODULE and I see nothing is preventing THIS_MODULE from being
unloaded.

The expectation of work queues is to follow the above revoke threads
then free pattern. A module should do that sequence in the driver
remove() or module __exit function.

Jason
