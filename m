Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DD0A480F7
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 15:24:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A46B210EB07;
	Thu, 27 Feb 2025 14:24:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mOP5hwDV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2077.outbound.protection.outlook.com [40.107.94.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52C7510EB07;
 Thu, 27 Feb 2025 14:23:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lGdZcBRRiKBrpzYbSfso+iNloaxRPhVeYoYF/+YCbe/BBpq2gmlvuSn2kRYr/Re1A0exUBTbxsByoffq2ssHPWxLDT/JB/hRFwK/DS2M86p91SapaAY0/j+cCaKj0Pg2F8aRw7M1WcNbXyd0V4Hf6G6xLa/HRSjf1NVdguCL3RAiwO/peD2kqixGT9fVZ5sUmhI5iQgGnZxqWVd+ChuKo10dWpq5WKJUQDIqM0aMk9wZv+2opc2hT3aoOW2wml2uCNqDYv44sC5tzTygMRmsjXdFt26MTPtNXKIRBB2RobY3aZaD4QXJRYu8IGrX6SbxlXkFSMoeykQ+8Gc+PODrkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=afu03q5238/lQBxyOw8nKirxLROv5NDOcregH3Dajxg=;
 b=pEMls04K/nPVfuUWDu9JykKxKn3G8EiFwDC/ybzXMNxbtgbSbzFh+3ZZgfSV6Xi8vQMgiK6Z0sQFezkJJO87z1cIXXXxxIxx7OUZeiWQW6vavcxZ9ldbPyFpQj30SIJoWKI5834EmZzBiU0MjXKUavgbyPiS4SR5xRYHL3i91TCOJ0ftS00zwB5Xgf+md3DvZWL0zId4PGtxT846HujqwflIgEE2NI7G62ja0liQk+OuDSlq7Fl7ELUw3xzH22Bf4cC/bVMd7iHcDVSGkg/CORzK8Zw4eZh5D1KVEce8oJi/CkzoAOPx4KRNdgZSrW4gTlDmlg6GeiV4mWGQ9K3QRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afu03q5238/lQBxyOw8nKirxLROv5NDOcregH3Dajxg=;
 b=mOP5hwDV5M3LwFcjFmTpFC/jDVQdyAUMx8Uch3l5DGC9ZQBtQq1tfhsRA79N+BnqhZAoWDw2mmxaAYq7byrryGQ83yz8FgWdabC0c4h0mZ0tRcXx2GGXelzdiGa4THQCn5+VPY1kv5qDo0MOM+gaFLEAp61kBUFeAIMvD7ablvoSpPDav7LptMQGHaoUDWIdPPXAhMHsM6Ef+oWMNSP6aFwg9nCufM8VdtP+AG17T6hj6Gwwb7B95DVXtT9drvy3vfMU27918kLRV3sxErUz+mPh/1u53GsdIBKw6nCXdqQyCCFf23zegeqtJa56fWSPzw+knnO5q0ZbF5nko4TCFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by DS0PR12MB8245.namprd12.prod.outlook.com (2603:10b6:8:f2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Thu, 27 Feb
 2025 14:23:51 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8466.016; Thu, 27 Feb 2025
 14:23:50 +0000
Date: Thu, 27 Feb 2025 10:23:49 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Dave Airlie <airlied@gmail.com>, Gary Guo <gary@garyguo.net>,
 Joel Fernandes <joel@joelfernandes.org>, Boqun Feng <boqun.feng@gmail.com>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 paulmck@kernel.org
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
Message-ID: <20250227142349.GD39591@nvidia.com>
References: <Z73rP4secPlUMIoS@cassiopeiae> <20250225210228.GA1801922@joelnvbox>
 <20250225225756.GA4959@nvidia.com> <Z75WKSRlUVEqpysJ@cassiopeiae>
 <20250226004916.GB4959@nvidia.com> <Z75riltJo0WvOsS5@cassiopeiae>
 <20250226172120.GD28425@nvidia.com> <Z7-IHgcVVS8XBurW@cassiopeiae>
 <20250226234730.GC39591@nvidia.com>
 <2025022644-fleshed-petite-a944@gregkh>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025022644-fleshed-petite-a944@gregkh>
X-ClientProxiedBy: MN2PR22CA0025.namprd22.prod.outlook.com
 (2603:10b6:208:238::30) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|DS0PR12MB8245:EE_
X-MS-Office365-Filtering-Correlation-Id: 86490536-4328-42cd-6488-08dd573a5b28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LDWRjYBcKqmAAy0qwuzfUjXt6nBBf6P47nqYmexNQAirnGHHdChh5YZjnmh8?=
 =?us-ascii?Q?sDKAfcZzs6U85v+Z+Pjwfqzm49v9kS2MVIaUlqq8qtkPPY0jdmlygEgc2eS/?=
 =?us-ascii?Q?oTlJ65doPZUADF0V89ok4xx8mhG9ftn6xVLOCAeXwEecpzdJGomYtD1vGq6j?=
 =?us-ascii?Q?mE0oi1Jehsairzh4SI0OtorMPIOEsUYUip4HuUrNfOfyfW4EfsyoERglPGwO?=
 =?us-ascii?Q?yfbIKUO+Hvrlu6CBeciz40kkHa+1ILokl4DthXyx++S/6ZkTIQVxeZ8aGxcu?=
 =?us-ascii?Q?DSejIM8iKFQlYHvVWGph0wSi0gQc5Yrns6Dv1TgwvlBIoUcHbumkkTm9DMwE?=
 =?us-ascii?Q?Ph6qqdf0kzywspdt/m5So/tyTbuSn2HDsgdHqQQ/cqXnwcSddmcxm4KFQ6cz?=
 =?us-ascii?Q?y+PPJjx7eA/5SKC5PuWAV3meg+Jzvxk7enjMa0Yeg0CDj9E/CyW/MvuQmdl6?=
 =?us-ascii?Q?MdQ9crng7e4L3ICSDxJjLphI7NwBpcTdbEIP5jhIZH5Md9nJLJGNpM3s8tLN?=
 =?us-ascii?Q?6yi8lvo48ka2Zn2yf04VvQBUJFFkPPdfG+TdVgMCxPqBL8zBGAxDHe468jbJ?=
 =?us-ascii?Q?+8qQVIkNiMt+onspqvbNmeia2fyGXh+gl819Sl1g1lAqr9MbKvHUiurh4IGQ?=
 =?us-ascii?Q?eL8+yDYF5qrg7CYC8w3Qt3yzOqfPTmjzi2z/HX1B6jkboMimuiIjNYjug4iA?=
 =?us-ascii?Q?HxA7aoJRxAWGEsMrzzOHEEaT7A0M0pGOG6CS5qKGvk/u3rSoqyY8ViFd6mmF?=
 =?us-ascii?Q?ky6C+215fC421CGhL5TjbOsu8Bn3L15nLMEHiCPfKezC+U12Hov/x6bKLgb5?=
 =?us-ascii?Q?KLku2m/9qOOMmH6Uxs+v0iiGksLStad/1Rp0XKgdSM+DM1THWW/b3YU1Mtco?=
 =?us-ascii?Q?vZKdA/WEKrAwFkYeuf7vc4QmPovH/DZ5bjqMYzXOVHhs+iEFfhRtmGSv30ET?=
 =?us-ascii?Q?9OzoDmWN4/5xsMxpE3CyUEAnrD47nrZJ1b5/k0TQnQ5UaasbVTiOFr+ZdjxE?=
 =?us-ascii?Q?Qx66pZd90UXP1lweZXWTyCAYOgvQ8ZoX6Vn3AY0ufW/+UrJ8AUcNFXoofPa3?=
 =?us-ascii?Q?YGBGoa4u0h3ZMQoJuc32q3NMIJkQGmXmiiHLgh0+tJ/e4yGO8BDoMmBgzWYh?=
 =?us-ascii?Q?lLRBBXPHULDmrVuoPFjhTTZwLjE4xSbK7rupJRDxYkE8xOTCvLe86i6qwzJ/?=
 =?us-ascii?Q?xd36Z7Vu4cRBRz2GdHgzAaSOj01OVojHKiTLiz9MkorBV3/X0/+iLynUcEcl?=
 =?us-ascii?Q?IXF+q0t6A9lIIV0vGRJGmSfqKQN3lkwmuuE9u0PmzvK91gnYCjIWh4SUL+OV?=
 =?us-ascii?Q?d8bWu5sIwW32t6Q7phhdfAvuhRQsIpG025puQJDs2ok6tFWtIfHEScXx4V31?=
 =?us-ascii?Q?KH3blXrghG2P6S0n2Nu/d0b0p+30?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kskd7AIO2xWpEyWdTYyt+8L+Au8BdFw6GzxC90T66LgXzGy6oTj8mcdeKvsQ?=
 =?us-ascii?Q?oEiptpgGaxLU+lzI1sNlTK3QNk0AvadtO/KR9KSNG3WeLnlgCulNU/IOktYF?=
 =?us-ascii?Q?XtPlNDHNclBTArrrarGIZ57JrQgqPTHJzttUeficA5bAquZyidtYRL/5boZu?=
 =?us-ascii?Q?P2XePhiYZ9aCMo5moU/BcUZBbhByzz8khhJATNBNcsNvVgqx6cdpmMFu/b78?=
 =?us-ascii?Q?7IEYKz7B5PYZPsWRMRBhSwhEWvFK+cClaRxZaj3HDZjpeurms2/mq8MwAm2P?=
 =?us-ascii?Q?e+PQeAfVUntfoYQ5SCK+g1P87O0HTFtd0hWeA3ryvuWPuU7ugu/sQTnqrntZ?=
 =?us-ascii?Q?asS8+ogefnLS1+6e6dYtnnzQd6vCwctRzm3QDpBEXBhpveGRAcAKRVXWeUnx?=
 =?us-ascii?Q?j0loXzdOr2XAysePYWtmiyvWytZNQ1pKRy4WMjq3MMChShbcWfOznWotX5MY?=
 =?us-ascii?Q?OSXI8hpHaK+Uo3456900/Qja7ddil0ZOMzfjeJjSdNZfJckPfg2RrnLkPpyM?=
 =?us-ascii?Q?bhZRfO23t+ON1+b/9jo3XHqTPEKPmHwMv9QPbRt+7xg1PFi130Zyu82ZdBs6?=
 =?us-ascii?Q?aU1jftvIeLrm+rumPd93JgUUzN0Q9dYWUJXMQIdxrhkiMM/LyUhu433sSarP?=
 =?us-ascii?Q?TZShNYgzyrYqIZhB8zbOVxTGOb2YL97jCKZtAwFPI5x6hvhjUoXkPWvybOTG?=
 =?us-ascii?Q?IB+ARIxpAePNX+BLaE21K6k8LgWSTUmBd3/de1OflO5p4cAbcd32LZF4xITc?=
 =?us-ascii?Q?U0thWejuzgkQ8Vxznq85FcBpwGNzblFTeRYIWb8hq4iuD+vM+EtX5X3bUwfN?=
 =?us-ascii?Q?SCktiXK5jxNqU6SGb7I+x8UDDXxsceQvD3b/G/oAp5Y+59OgIyDlUag8zFCe?=
 =?us-ascii?Q?uwWvF4UICWzxv0UW6vL/gTifIlK6ZjqRemNiTZQYE+ecFmG1suYa5KaWF3ud?=
 =?us-ascii?Q?7AhARiCDnSLSdQxP/b2LVlyXScL1ogSpHfHShU8Z/AX3It6S6er2ftKPI5H2?=
 =?us-ascii?Q?TUemyC5ptdcTkFxAzG4swQqoAT5Uu1HTAlW5IRJn+5hUlYiWrFv1hm+h+ms1?=
 =?us-ascii?Q?FqC4euEGryEOwV4ZDoWWb4UZiaeUrUhQJuLvebF4ytTdUnFBUhHN/9mZ5taw?=
 =?us-ascii?Q?/pPOLIaWvCQrAMB03maNG0sGeVSVvmhodXkf9YuZG2Joaq0Sne7LNLmxWaKb?=
 =?us-ascii?Q?dSWrmUph0R9oJWhpTo6OA8/5ao1DsJqDnpAi8AsEhZCv0TvRO7zSGRwJd4sM?=
 =?us-ascii?Q?83jOaV680m8nwnKZ+GaMj01WWTLH2a7RfZjCbWgb6AZ2XKi4tPAq6HzVFlwv?=
 =?us-ascii?Q?uBe9Jsa0ikbVtONqX7tFIeMUM3C2dJe6lpDVNfD7+KyZF0MFZGpxL8vCae4X?=
 =?us-ascii?Q?p3q7GWKoh2Auayq430xa0vIOuvFQgGtCiLnggYctuIaTpzIpsZ0t8FTFU9lB?=
 =?us-ascii?Q?arbEv4mJ6t7oDcLWfPG1CvbZD4CWgWNEGKE9tA9JPqeDviTytMrK8ZeEE/l+?=
 =?us-ascii?Q?DARX7VO+ruBMpLYXxroFWskEJdJgfGYEYZgQsZRCcT4xW/zVfZjhmwH0SyvJ?=
 =?us-ascii?Q?sk6oKl7T+/RgWH3iM/A=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86490536-4328-42cd-6488-08dd573a5b28
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 14:23:50.7379 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GXqEnSsoing5JYzIPi1TS6qL/OYpPbvYg/8m3snL/mVGrNqnP8Zp4kDz7IH7CAS4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8245
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

On Wed, Feb 26, 2025 at 05:02:23PM -0800, Greg KH wrote:
> On Wed, Feb 26, 2025 at 07:47:30PM -0400, Jason Gunthorpe wrote:
> > The way misc device works you can't unload the module until all the
> > FDs are closed and the misc code directly handles races with opening
> > new FDs while modules are unloading. It is quite a different scheme
> > than discussed in this thread.
> 
> And I would argue that is it the _right_ scheme to be following overall
> here.  Removing modules with in-flight devices/drivers is to me is odd,
> and only good for developers doing work, not for real systems, right?

There are two issues and I've found these discussions get confused
about two interrelated things:

1) Module lifetime and when modules are refcounted
2) How does device_driver remove() work, especially with hot unplug
   and /sys/../unbind while the module is *still loaded*.

Noting, very explicitly, that you can unbind a device_driver without
unloading the module.

#1 should be strictly based around the needs of function pointers in
the system. Ie stuff like ".owner = THIS_MODULE".

#2 is challenging when the driver has a file descriptor.

AFAIK there are only two broad choices:
 a) wait for all FDs to close in remove() (boo!)
 b) leave the FDs open but disable them and complete remove(). eg
    return -ENODEV to all system calls

I think the kernel community has a strong preference for (b), but rdma
had started with (a) long ago. So we fixed it to (b), netdev does (b),
so do alot of places because (a) is, frankly, awful.

Now.. how does that relate to module unbinding? The drivers are
unbound now because we properly support hotunplug via (b). So when is
it OK to allow a module with no bound drivers to remove while a zombie
FD is still open?

That largely revolves around who owns the struct file_operations. For
misc_dev the driver module would own it, so it is impossible to unload
the driver module even if the device driver was hot unplugged/unbound.

For a subsystem, like rdma, the subsystem can own the
file_operations. Now to allow the driver module to be unloaded we
"simply" require the subsystem to fence all driver callbacks during
device driver remove and subsystem unregister. ie if the subsystem
knows it no longer can call the driver then it no longer needs a
refcount on the driver module.

This fence was necessary anyhow for RDMA because drivers had the
pre-existing assumption that unregister was fencing all driver
callbacks by waiting for the FDs to close. Drivers did not handle UAF
races with something like pci_iounmp() and their concurrent driver
callback threads.

Once the fence was built it was straightforward to also allow driver
module unload since the core code has NULL'd its copy of all the
driver function pointers during unregister.

Further, I'd argue this is the best model for subsystems to
follow. Allowing driver code to continue to run after subsystem
unregister forces the driver to deal with UAF removal races. This is
too hard for drivers to implement correctly, and prevents unloading
the driver module after the drivers have been unbound.

Why do people care? Aside from obvious hot-unplug cases, like physical
PCI hot plug on high-avaibility servers hated (a), there was a strong
desire from folks running software HA schemes to be able to upgrade
the driver module with minimal hits. They want to leave the
application running and it is able to fast-recover when the FD becomes
-ENODEV by opening a new one and keeping most of their internal state
alive.

> What is the requirement that means that you have to do this for function
> pointers? 

I'm just pointing out that function pointers are not guaranteed to be
valid forever in the linux model. Every function pointer is somehow
being protected by a lifecycle that links back to the module
lifecycle.

Most of the time a driver author can ignore function pointer lifecycle
analysis, but not always..

Jason
