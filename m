Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC64B56388
	for <lists+dri-devel@lfdr.de>; Sun, 14 Sep 2025 00:06:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C687110E1FA;
	Sat, 13 Sep 2025 22:06:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CuX4LN7j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2042.outbound.protection.outlook.com [40.107.92.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B75AC10E1FA;
 Sat, 13 Sep 2025 22:06:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cCADenPihjq5b1YdxEnQ8O/zNzYwLL37vuntc/3UqHVkveXxnf9OyOwYf/nv1sI3z6tRdqYLF8Nl97VyWhEFA/A75xFwosqH62h275c4wQNZTlOXvykW7cpSxdBxgJ6SLTZhCMmzFNdVrG9xcMAZOkO0y7TCq2r41ppWIhXRh4EcHsMCpLqrdigoB2qCmi/NbGTL4HPKbj7cHIA6LCiLRJdAgltNZ+8W1K3iTPgAQogGXQ4CEdPUn5e5j6NjRgrLJtvxTstjOSWq0Y+GqEsYkeNKn5PE5VaNdvGrGspD60sWU9Pe147fa+d3MMbh1fcfkKALWxhL5F19wZ4OCCSQPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=023UrN2DEvzbyzlIJVLreZhDffT62H1ibTjpeBacbME=;
 b=yy0FXWDmFiCeWJVH6YTH3/1DsCwsfGm7/y/Es/5EvCztP9mXXTYnLAd60MmYow9QGv7DP+eaKa3WS5YvX+wuSf701Q5//YJfP7oMN09gMgLAOz0zPuk/oHf8tst0rl3Gc0fTH0IVxOla6wwkGoy2nCeZfY1C17P8WU32uU7i4BV6apso7WwUs1GjPjVnJxxtY0ZKu25ewD9E/PliHhOwZawIYAooKVWgP7GBu+LW0DrGnc2R9YFCIo7wGH2GLeqx2NiIFCDzNntbYGX/9IRFAaoPTVvB0rHI8E2tAjTUhcLFn3B+dLgTXx0O0ZYO74ssw8gbnZCfPpcFYfQHIK4XTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=023UrN2DEvzbyzlIJVLreZhDffT62H1ibTjpeBacbME=;
 b=CuX4LN7j6jVlLRbmQR3V+meC1mlwPgJ0p3vfMn1I+fqV9LsO+QTF5JdZcgdKf+0yhudneW4rXX6wI4KNgYIcC+C7VEJl3td7bi3wTkX0OvN+HKyBl5JLuqN3AkG2hucZ9Kc36AofbQDqZ9kRXgYszf+o8E5tg3r2xxN2uw3YLyPdqB3kObZuD1GIzEQ7iO+fR/hKWslaFNIzG/WHBMZBIf8+Uh1geznKH3vHWh90YFaKixn3yB9pZEg9pX1XlEZQ+PUVXMAqcjXTTGHtougGem/JyNG6/HJmsGo47NE3zE8t987bYQZL3UcTVJp5EKqUMNt8shZBUjvjbWa47+RZvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by IA1PR12MB6089.namprd12.prod.outlook.com (2603:10b6:208:3ef::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Sat, 13 Sep
 2025 22:06:27 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9115.018; Sat, 13 Sep 2025
 22:06:27 +0000
Date: Sat, 13 Sep 2025 18:06:25 -0400
From: Joel Fernandes <joelagnelf@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 02/12] gpu: nova-core: move GSP boot code to a
 dedicated method
Message-ID: <20250913220625.GA1564550@joelbox2>
References: <20250911-nova_firmware-v5-2-5a8a33bddca1@nvidia.com>
 <e1755470-587b-4a43-8171-3d031b7fb4f4@kernel.org>
 <DCPYQNZG1OJK.2EE4JWJAROK57@nvidia.com>
 <ce74db34-77bc-4207-94c8-6e0580189448@kernel.org>
 <DCQ074EMFNIK.1OJLWJXWZLDXZ@nvidia.com>
 <20250913010226.GA1478480@joelbox2>
 <DCRPJKD0UHDQ.IOWSOB2IK06E@kernel.org>
 <20250913171357.GA1551194@joelbox2>
 <CANiq72n50MaMXeWdwvVOEQd3YEHbDRqeeRzbdY8hPnePtq-hnw@mail.gmail.com>
 <b1aea815-68b4-4d6c-9e12-3a949ee290c6@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1aea815-68b4-4d6c-9e12-3a949ee290c6@nvidia.com>
X-ClientProxiedBy: BN9PR03CA0881.namprd03.prod.outlook.com
 (2603:10b6:408:13c::16) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|IA1PR12MB6089:EE_
X-MS-Office365-Filtering-Correlation-Id: f0f7a83e-6905-4d96-e173-08ddf311c925
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?a035ZeAs9g3O00rtjZ6sBw3WHbibtyhPkYgPCWNS8RnIB8fo/ld65kOoMmsN?=
 =?us-ascii?Q?BP9M7mXDACmDBVvEfDK1pvzt3wQcM7AqEibqAyGkFXj/kbKLFlIDpQBZ6uHr?=
 =?us-ascii?Q?hSyQnY2GRWNaz7UFE/aj0fGzSC2zDUA5oImbY3AzLetQeXg77d3IiSae3VOq?=
 =?us-ascii?Q?2PtETlQufLho9dKOnsJV2vH0PItmeUEyuxPUyp6yBehvT7c9fhDjwpwNQ/CS?=
 =?us-ascii?Q?QeijsoyWnkshsiwHVhPPo7/ccKGrba4NIghLcXJz6tPqI+4dXCJfdWAEp+dp?=
 =?us-ascii?Q?Mq8cNphkHrQeRfpYPn2OFSy0QTqPqXA+Ovoa4x0fcvpZejwbitlJZiH1W2F7?=
 =?us-ascii?Q?QziWN+Ko5Hs0o2oDzZEPMq1TEmCc1bvZl3dTbWSVzXmSagAVKKnykelhSYx/?=
 =?us-ascii?Q?0nmaNSBeAbj6834SsjBh/rFQqedtpSBn4JQZ21J5Kibn1+ls4SOqjDkkclXH?=
 =?us-ascii?Q?rO3fH3nxvKZ5B4SR/r/9MJWlsAYF7LwqLhCBh3cGxe74lyfXLcHqRKa5sftM?=
 =?us-ascii?Q?tY8qhkjM4Ldr3EjsRxOEHWfAuX4cbszwKwh9lGVFyu6+oU6G41FB17IxgPdn?=
 =?us-ascii?Q?FuN4IbcBpba228nph69NBLmraOaqhgKbADJKJftUsIGe2ikQ90a2oh/SJ+bm?=
 =?us-ascii?Q?shg7mfabZ8T0vLBAlrUIMkcG8mnsNL/PWm3Wells5nQPMhekal4uOqvP0Oqb?=
 =?us-ascii?Q?bFlYClj2zwppXPk5KiSImbpcKWDaAqeYhtSAq9E0dlE6m5YNh53MLArMFiig?=
 =?us-ascii?Q?d6xEgx7bZI6rVXY8qpN4rJGidY8ieglR4VFLt6z5n7Oi0vwUmKrysP4U7vcE?=
 =?us-ascii?Q?BRyEhd4ZH06uwc/j7Qq1RfQh/C5yC6JCk+IO7Yop12TIHBN8q+eB2NdaSh35?=
 =?us-ascii?Q?OO60+qo/FPifNvHuVy7B4Mn79hLnI0Y3BsnhcEB+FCkvulGtDGywTmu3MsqI?=
 =?us-ascii?Q?EWdqq7HitowAhpn05om7slXPwpQBcj5gAnQkJfTx7lV+A1/fwpGPAMqjWgyU?=
 =?us-ascii?Q?NC5msjCZ1cY98m+PW/6M0nZqVK9jCEX+7GEeV6ppxYUt45OMAFaWWeQDDAHe?=
 =?us-ascii?Q?FncYgDWaFyD5nwu6rB8MRdjnXBF/GDeQjB7V1SyrnnmmBrWEFvynujE7UV5H?=
 =?us-ascii?Q?LcOb1jTuJxHIm9zIM8WTJT3ev+xsXE4ntd39noGLKF3eoADiM7vXmWFR6bF4?=
 =?us-ascii?Q?B6TCfqQovFABKSQQ2nje4pOgGQnR90V4grXyPNBUAPGVJKoPO3LKM4TYeidK?=
 =?us-ascii?Q?5PmWOiF+iPUhTkfYMXUap3dB4vFLBlWuREE1rdOh91RxLhD4FGm4mv+0sjR2?=
 =?us-ascii?Q?nQpsDoqbRyryvehgq+4YwNqsYBUF38eWKIxdrAkw+GHhohJ721aVL6wYFC+w?=
 =?us-ascii?Q?fNG+Tn+e8UeiN/LA27XBom/iK8xEmO0CtFzxSIHTrsghurYc4bjmAJe4XsrG?=
 =?us-ascii?Q?3O9SFbr8ids=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FXpVxQHisP083m9aTgCyC/WVdekwiDurbm6AAXg9r2MCwji1qZBATUQiFHeh?=
 =?us-ascii?Q?KAvywQ4yLE9Cde3gKyT8R7wwr2NCTZ1VTzRePcFVzwS2oCi1TyKEbvB4L5UD?=
 =?us-ascii?Q?mwUE586GG2HPM8Cu3eyvChUGfI3+SwIMOUacTRkCGodS0SNytk+QyqurgMhx?=
 =?us-ascii?Q?7uyzaLvoxcUbNs3YPCisfIhB0qyjCvcM7K5UwqVqB3/o6ynbUXG0ewzCSZqr?=
 =?us-ascii?Q?/tC/Xc1Ukpi9OIss7HUQ4DJ/puhzXyW5rriJp8aLzkaX4/Jd6iJDsIfI/imq?=
 =?us-ascii?Q?AyEE5t2Rm1BsH5yk2CLsh16pFHIHBGXtsITHD/SEwsmU/gx8S+L5KbZgXD7f?=
 =?us-ascii?Q?k4BsprslQJ39pMoYXq6/u0ezSjD/L91sWiyM+QX1mEt31bfGgtRff9jQLKkE?=
 =?us-ascii?Q?QfFpTGjkwGQ3Dyvvd1o6/3ZdpJg+hQM6foSZbEXPB+uRw+HWJzHK1q06TLDI?=
 =?us-ascii?Q?1AtFoDR5eD/SSf6ljyyH8871h9+5s9E4yXAfTb0arf75dS3CMekJ1bXWMRpj?=
 =?us-ascii?Q?yVPjwNoBFWjx7vPipuopEN0nOLR8sSaJqS8z+IOn57nrUIydiwHdJeiphmth?=
 =?us-ascii?Q?KIFdGj0/fTuc6daXqvraLRCfV23ILcQbnPw6hIeC2RwGJvU67m818M0xtcky?=
 =?us-ascii?Q?oylq0YwQRsWtio1U1OBwGf5QxfCMz3aEIOj7ZAUSmRjA+Tg6/SdoL2ow5eFs?=
 =?us-ascii?Q?wl8RgK1BsBtSjzebznRfHNAI3zXMyoBRHGrZ1ri5bazx3YVtfDU91iewKd3r?=
 =?us-ascii?Q?LMspbgTFGNqTuvbFNwehx7Lc22gBn0Tvix2xY/9Mq4KQCb88oAwpkqrwGR0D?=
 =?us-ascii?Q?QV/HhmQrguYv7xXzJCgBsuQeUlNfrtOTH11AO/UPKN7co1CYXvD4qfLj/3eF?=
 =?us-ascii?Q?FWT14BYYC+QripTRRdZ5OqMIlJvWgGnRkzZywRlG1WVxjw4wDHauY1kpo/Xb?=
 =?us-ascii?Q?CeYkFMRrfJRr2Szi16QZSJrYZifpAndA0OnjzrA/4DI5kjhJcEekZZAoo5j8?=
 =?us-ascii?Q?lDIN+qA5Rk/r67nFxXVnydnwHJgAAWgHE21z6e9QExTZKL5Lwxnll0dUHjsO?=
 =?us-ascii?Q?XoWniGphVDDCjW5mIH9V9nL5VLKtyEd5d40nnonql0MLLS8KnitP/06LXivG?=
 =?us-ascii?Q?ncywFDgL5cmH4+Zrm37PZ6O8ngRQ2fNhkvK9MXA46v7pI7JUXEmBuAhZwkIc?=
 =?us-ascii?Q?CsxqxXPoR3jA5IqqVc5VI77i4utI5TziY06UrSqyiHyej4xcGlbiNr8vGQsX?=
 =?us-ascii?Q?lqUQhGsJPMDMFj6VmOS1wX1LzujWjoAHkwrOVDkQC6b6WcXctEYUpD4pqhT7?=
 =?us-ascii?Q?amKDA87JsvNlkjQptHZ39mAV5XKrysmeg8eWvoOouDJzNNNpPJCpKSSWcM6D?=
 =?us-ascii?Q?VYFMNzhx+DL8mhj0ESk4sRazdl1op0NBfjLRRVpiNMszxdBtJsCXIU+2Wsix?=
 =?us-ascii?Q?AmvY4GTCEftKszMUiztjapzUYVMGnbdqdy8pOZVRsOqA3/3ByjERFsFGdbE8?=
 =?us-ascii?Q?rxc9ep/Qkb5WzNVxbfKBvlvP5wMINGBKbqmCh12jq1rq5JgqbZXzqxeR34y6?=
 =?us-ascii?Q?lR1sePlIgpwcSWc1nmKl7QpH/sdEWDaF7C2j0uoU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0f7a83e-6905-4d96-e173-08ddf311c925
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2025 22:06:27.2328 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MToIgdRptoGYKPSBrYFq6Tkb/N0GaqLn6uZhGFe6JnLN8pVM1yyzjvJfkppNKHubJo9nEl4eHhA+W7prpcf8FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6089
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

On Sat, Sep 13, 2025 at 02:29:54PM -0700, John Hubbard wrote:
[..]

> > 
> > I would suggest taking a look at our website and the links there (like
> > issue #2) -- what we are doing upstream Rust is documented.
> 
> ...and my question was asked before reading through issue #2. So your
> and Danilo's responses seem to be saying that there is already some
> understanding that this is an area that could be improved.
> 
> Good!
> 
> I believe "issue #2" refers to this, right?
> 
>    https://github.com/Rust-for-Linux/linux/issues/2
> 
> That's going to take some time to figure out if it interects
> what I was requesting, but I'll have a go at it.

Indeed, kudos to rust-for-linux community for working on missing Rust
features and on pinning itself.

> > 
> > (Danilo gave you a direct link, but I mention it this way because
> > there are a lot of things going on, and it is worth a look and perhaps
> > you may find something interesting you could help with).
> > 
> > > except to satisfy paranoia
> > 
> > Using unsafe code everywhere (or introducing unsoundness or UB for
> > convenience) would defeat much of the Rust for Linux exercise.
> > 
> 
> Yes. It's only "paranoia" if the code is bug-free. So Rust itself
> naturally will look "a little" paranoid, that's core to its mission. :)

This seems to be taken out-of-context, I said "paranoia" mainly because I am
not sure if excessive use of pinning may tend to cause other problems. The
"paranoia" is about over-usage of pinning. Personally, I don't prefer to pin
stuff in my code until I absolutely need to, or when I start having needs for
pinning, like using spinlocks. Maybe I am wrong, but the way I learnt Rust,
data movement is baked into it. I am not yet confident pinning will not
constraint Rust code gen -- but that could just be a part of my learning
journey that I have to convince myself it is Ok to do so in advance of
actually requiring it even if you simply hypothetically anticipate needing it
(as Danilo pointed out that in practice this is not an issue and I do tend to
agree with Miguel and Danilo because they are usually right :-D). I am
researching counter examples :-)

thanks,

 - Joel

