Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B57B7621BEB
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 19:32:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62D5E10E4F1;
	Tue,  8 Nov 2022 18:32:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2041.outbound.protection.outlook.com [40.107.94.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D6E410E4F2
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 18:32:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZB7i+i199zz0bAPc18ZM08spxUGC7FTHals1+wIhj1IGuBymbJQ272Q6BWuZgr26I+OW92fuXUhg49mVsDWLeLZ6yygAT9rGGjQA2MMoa9RfiLslpU1VMlT0k7wFFb/BzSB4u8x6LnOiJ/TBjMbikyOJsNZG2i0unXt8ja9ZNd+9yumhf/rOYAEMIEGGtl2H1Rd4JiSpQIWpilRnUHkoxxOKU1VqZvGq6+OvjMwJEw90PMGsmHEEseNB0mRSWvMS8qSxPS5MHdSOOUmuF6RdBxaRHtvczrduo7YqZxS8s0vloedYfDaT4GoRC2n/oYGcciggJZe23L1GLXb/rTC5qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pCS0SmBw/4fJuwoJM4d9LBSqUFAUkYJa9Y+C1s5zrEs=;
 b=M2vbpiEfk8BQDGKj9gAwLG4t3TgePVsw7hKMb21hdI2w931elC7uKOh34jAnCd6U8OKSr9xhLGYv/8Pk/mxTpiV9pkov8IU/9BiKYVvgN/gbFCA+chS1v6d1asSKZbU0ADM6yD85Bh9FOyfJRBiyd2Elyn73U1vbgGpzGPrakeEb5QkwVzzGlnAMpgVyHUu+8HkYWsrHqbYB+86qKDXblARXQAYzzYqDHoIyUIuUnMdrxyD1ewi3RshXfO59orxSVRe3ku8rcK4frkXDGtB0UMRxNetWmEdUDG6IUOKn+5Qti/q6lYwk4TEljroCoUSDF68AaZ/FrSqyOlwJyG1fBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pCS0SmBw/4fJuwoJM4d9LBSqUFAUkYJa9Y+C1s5zrEs=;
 b=nfLzxEMMlTl/+W5V6Od0oA5b5i9tNdsDI2wXZFQI62NMIY4R+UHss5h0pSYfmUbSKizr2Hu+dMfc/S5pzXv5LDd3JOBjXGvEc2FjSqqGDsb6s0L/bVGy+IIiBcSd0kDY41sxHVzLfr/l/oRAcgRPeJ4Iv5qanAygfa1iceBr8OKfG+9HIIApdrabd1hp7Gj5uxFi+i8k3UO3DZ94Gtgc8xqu3u3HrAb+kmplf7Qklu//22CSO5QEnVA4Z3p+qkXfuCMXi2TJSvVjqWMAL551GWfuL2qrklU+gge73KD/wQHGnSCoIUl9xR947fS9mL9H04wl6sTyHX7ZOcpdC6Wtww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2763.namprd12.prod.outlook.com (2603:10b6:5:48::16) by
 MN0PR12MB6001.namprd12.prod.outlook.com (2603:10b6:208:37d::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20; Tue, 8 Nov 2022 18:32:02 +0000
Received: from DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::fe89:eaf7:714f:d8a4]) by DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::fe89:eaf7:714f:d8a4%7]) with mapi id 15.20.5791.027; Tue, 8 Nov 2022
 18:32:02 +0000
Date: Tue, 8 Nov 2022 12:31:59 -0600
From: Daniel Dadap <ddadap@nvidia.com>
To: dri-devel@lists.freedesktop.org
Subject: RFC - DRM-based UAPI for Dynamic Mux Switching
Message-ID: <Y2qgnxjy//WfAnUL@lenny>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: DM6PR06CA0102.namprd06.prod.outlook.com
 (2603:10b6:5:336::35) To DM6PR12MB2763.namprd12.prod.outlook.com
 (2603:10b6:5:48::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2763:EE_|MN0PR12MB6001:EE_
X-MS-Office365-Filtering-Correlation-Id: 6705caef-3998-4d8f-6420-08dac1b7876b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tJmTnXtEr4dlvFkYwLmnnrJ9Bg/fZesJ6sDBujF8nU3NBOjJl/b6M7joveryn50iw78Ncjvh56hTXo+KRDNZOX9YGNBoLHklJ9m+yAG4ITSAiP0cBbCpfm1Yl7ut/kTV9/pmiSLDHr43mY9227mpImLO0SLg/aTklREoBuTm4DKHl3C3pFOyoTzdWPAE6B79HD79MAgurVpOQgrUzcYmIpSQbk+lD3Ik/U7VeWPYwbruOGkkj5t+USmY53Idj/zMSVmB9Rz6nwR1EyiANSDvY2HTir8uvGlaHGBhUEVtIJx2WXww42ThW1hd0NqWq1Xkxfcbq6H+M7G6J3k2jUaqALo5iKp2pykVanz6asBiaA698mC126QgtS0oTWMM9Inkq6zrLeVH1UAThCKLXKNoPGmE8jAsmiumkPQTEDX4LrEmpiUQ4KPANRDrPrrx1hnqFZZ1Q5sKGgdzBekxg3ifypGQ8rX1hobIStS/EtLLEiLNDVV1MkZJKUmW4vinUQw5s7vHbAsF8xIIcNEQI791n05OcKK89GblMPkMWnNLav1Bo1wmxOlEvCy0nzcayLvjFu195APB7B0gJ1Z2c9muLZ/yt8D5K5n/Z6LlZFiq2R1a888CicrgNK70QSj4ijSg7vNzH5BZueRySMM6fHxmXClpiuWMz3mUZ8m/qiv/YZfnHF0NQm9WqXzpszt330hg3nnBHmjkRlSRtMIPixiNgEra6gPaSsrtvPw8yo6dgoH+PmzviDlKtFAWkO9r+aqNIv6vgaKgICg1BpUf8K23WZ+MOeWnjUNtOkSVc4MgfL4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2763.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(7916004)(376002)(39860400002)(346002)(396003)(136003)(366004)(451199015)(66899015)(8676002)(66476007)(66946007)(30864003)(66556008)(478600001)(186003)(2906002)(6916009)(41300700001)(5660300002)(8936002)(83380400001)(316002)(966005)(26005)(86362001)(38100700002)(33716001)(9686003)(6512007)(6486002)(6506007)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DC3GBqvHTyeomcfdQAgDYeofbZIkxP8sgm4uU8kBopUkGSOolzSOI8BXUg2C?=
 =?us-ascii?Q?2Ae8Y0IjrTUH8elRXxps5PvWpxIEZPCTbghfSf/RYt183SHVmwC/AFJj+0KM?=
 =?us-ascii?Q?PtH/QxyXwBAKKDCLK1LgiQqIyDLQTJ7fH/zKg+5UvQqkSy5QPa+92ho2yOAJ?=
 =?us-ascii?Q?U92Tsl9AffX9o4AsOiCoHK5Az4rQXtCYqSiMOdpeaylFATsoOqMQSicZVN+V?=
 =?us-ascii?Q?cL9EVN3Pc9RZXyyk5QFRj+TSbuoPHKmHcjS3lOC8s0vzIWFP4XZZHoU0vU3J?=
 =?us-ascii?Q?vop8aa/nf2/+Ckrzbq3VqtVCTq3NFfs3E8ML4qs+ZcaPVicdqodTPu4LM1N5?=
 =?us-ascii?Q?M/nfOkRrAOJEyykYkm+ungZ5bP/MXZmjOVRBwcsyeyjHpsF6pYzBe20g/4P6?=
 =?us-ascii?Q?qkvy3vZ43i0RC5K77VAFnG3+9sD2pUk/0m0bQQPP9ylZUkfE7BCbRF75ompC?=
 =?us-ascii?Q?GNqVigQCmQRiquk2UoJB3VfkYfYNfW9A4BRcazaDV4b1N0mfAiWLWRn9rk0M?=
 =?us-ascii?Q?YqLYBBD1WWGA5WsCwS9nwn1Z4N3tMPInKGCpwBg7DDHj9aA+jSmkg9k84OHq?=
 =?us-ascii?Q?01H/GW23RpFuoH3ImFE+d9j5j9g5EnrHQR8QjKmr8cYSzAra/N6ZX+aZukY5?=
 =?us-ascii?Q?RaGlOu/QiO+h761WUpEA0qVOtcZPLv6HtwOySdXIgqvbwoMc0JBXN78RArzQ?=
 =?us-ascii?Q?b9pJHRzmEQWicwqVG3YSwkGiH2j7BHVjx50N0YjR3uc6rmqxzih0j20dI2jQ?=
 =?us-ascii?Q?RzDI4KtSAotlwnpfKAtYsyzphvFP1Tb5wwEhReO/4auQObl+UGTm9qMCw5MH?=
 =?us-ascii?Q?GWjirXtKHDWNb7w3LoA46QX+NJATnvhCqL9u/WoDIFv4eOFKGI99RxzMfe8R?=
 =?us-ascii?Q?U4wUA72n3XAhG6oSQZvp9FByuI8IsCnRxfU4EOnSLStNbZTYhmAd1Bhm8uB1?=
 =?us-ascii?Q?EpauyCBwjN2w+CL7QGM1N/DFVWzI6tn9CgsZ+VLR40oZHhl2XULQsENqx510?=
 =?us-ascii?Q?HA13T92ZJRkrcd0yj1PvNy/CQ+JJVi53QnMB0Al974/q9/BkF6eSVSmWUqJc?=
 =?us-ascii?Q?J2lI8wxgBShteM9EiHdIdaQFIWHuNNTwp7GhWq4eiC2g5dOjm1P5ErsL8deo?=
 =?us-ascii?Q?Y0B9hBcnSE79NjEj0tIoNbetJN3d/jQysLSlWh5CQqORm8JHe0OSITmTeJyi?=
 =?us-ascii?Q?kvK32XrIwpttfaMzROpFqVDpiW/Wtj4wF6jXZjA86Y6AqAofKNJyZBF3P+PW?=
 =?us-ascii?Q?zGYDwC+EfHY/C4qnPwE5+NFLnmeWKTr8K/zoP52B/diMxkhsepb1QhEVRRzj?=
 =?us-ascii?Q?tyiCRagLUdAKSIMkzDoSGjO3EBGnDN5bqZ7qNLaoFoun79UspxYSiOkj6uvH?=
 =?us-ascii?Q?1uv2F1JWNFWHRC0Lybr6polVHB84VB0z9pe1Nl00FUY5jTRqfiwGvzSuef4w?=
 =?us-ascii?Q?ck3M9JCwfaublL8STi4VX7cyYeJv4eqwMrkSfmDW+4UjIDEfSYpHYYnbKGd9?=
 =?us-ascii?Q?9FK9vt4Hkh0/aAmsjaho0Q+yKdHpdwI9fxgKlb7bp9mVMJ69EzaYbHKlRJ8y?=
 =?us-ascii?Q?xExH3JpwGsdDuzccdvkMgCykjjJ5yairqeM74nXb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6705caef-3998-4d8f-6420-08dac1b7876b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2763.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 18:32:02.3046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4xo+fLjNNfd/Dk2TPS18oRdkMOBk39dwPJvlsvgGMx/KcS5XMaswSBQqtaFvt5wa2CmpDbRrfrWKfD0T29TMBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6001
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

Many dual-GPU notebook systems are equipped with a multiplexer ("mux")
to switch the signal source for the internal display panel between the
discrete and integrated GPUs. The vga-switcheroo infrastructure in the
Linux kernel can expose mux switch functionality to userspace via a
simple debugfs file; however, vga-switcheroo has several limitations
which make it unsuitable for some newer systems which support switching
the mux while the panel is actively driven (henceforth refered to as
"dynamic" mux switching), with the the intention to migrate display
responsibility from one GPU to the other. A new userspace API for mux
switching can overcome these limitations, while providing a cleaner
interface for DRM clients to interact with muxable displays.

Hardware which is capable of dynamic mux switching is now generally
available, labeled with the marketing name "NVIDIA Advanced Optimus":

https://www.nvidia.com/en-us/geforce/news/rtx-laptops-advanced-optimus/

Internally, we have been experimenting with implementing dynamic mux
switch capabilities on Linux for some time. An early X11/GLX prototype
was developed as internal proof of concept, but it relies on several
tricks to hide details about the mux switch from the X server and GLX
clients. A more recent prototype which extends vga-switcheroo and
updates the existing in-tree DRM-KMS drivers to use the new
vga-switcheroo extensions revealed the need for userspace to be more
actively involved in the mux switch process, leading to the design
proposal that follows:

Background: Limitations of vga-switcheroo

The current vga-switcheroo design has several limitations which are not
compatible with dynamic mux switching. The biggest of these is that the
system seems to be designed around the assumption that mux switches are
only possible when neither GPU is actively driving the display. The API
specifies a can_switch() callback function that "client" (i.e., GPU)
drivers register with vga-switcheroo so that they can report whether a
switch is possible. Currently, every implementation of this callback
will report that switching is possible IFF the reference count of active
modesetting clients is zero. There are currently three types of switch
events defined in the existing vga-switcheroo UAPI:

1. "Normal" mux switches (this switch type doesn't really have a name):
   Switch the mux immediately. This switch type calls the can_switch()
   callback and will fail if either client driver reports that it is
   busy and switching is not possible. If the client driver does not
   report that it handles power control, vga-switcheroo will power on
   the switched-to device and power off the switched-away-from device
   via the registered set_gpu_state() callbacks.
2. Delayed mux switches:
   Register the intent to switch the mux. The switch will be executed
   once there are no more active modesetting clients.
3. Mux-only switches:
   Switch the mux immediately, without checking the can_switch()
   callback, and without attempting to manipulate the power state of
   either GPU.

On the surface, the mux-only switch type seems like it might be suitable
for dynamic switches; however, this type of switch does not call *any*
of the client callbacks, so the client drivers are not made aware of the
mux switch event and cannot respond appropriately.

In particular, the reprobe() callback (which seems to be unimplemented
in every driver except for Nouveau) would be useful to alert the
switched-to GPU that it should reprobe the connected displays, e.g. to
retrain the link on eDP panels. Another callback that would be useful
for dynamic mux switching would be a new callback for enabling and
disabling Panel Self Refresh (PSR): this would be called on the
switched-away-from GPU to enable PSR before switching the mux, then
called on the switched-to GPU to disable PSR after switching the mux,
to enable a flicker-free transition from one GPU to the other.

vga-switcheroo is also built on the assumption that a system will have
at most one graphics mux, and that the mux is connected to exactly two
GPUs, one of them integrated and the other discrete. While this is the
most common configuration for GPU-muxed systems by far, there are some
existing designs with more than one mux, and it limits the possibile
configurations for future designs. Notably, existing systems with two
muxes (one for the internal panel, and another for an external display
connector) expose the muxes as a single logical mux which switches both
muxes at the same time.

These assumptions and limitations made sense for what was possible with
X.org at the time vga-switcheroo was designed: specifically, that there
can only ever be one GPU at a time with functioning 3D graphics, but in
this age of GLVND and PRIME Render Offloading, many multi-vendor use
cases are now possible which previously were not. While it is possible
to extend the existing vga-switcheroo subsystem to support dynamic
switching, and while vga-switcheroo could probably use a new UAPI anyway
(the current debugfs UAPI is unavailable if debugfs is disabled or
restricted, e.g. by the lockdown "confidentiality" mode), coupling mux
switching more tightly with DRM may make things simpler for both DRM-KMS
userspace clients and DRM-KMS modesetting drivers.

Proposal: Make mux switching part of the DRM-KMS atomic modeset UAPI

As the current vga-switcheroo UAPI is exposed via a debugfs file, this
means that switching the mux must be controlled separately from and in
addition to other work a mux-switching client might need to do in order
to prepare for and react to a mux switch. Presently, no particular
component is expected to be  responsible for driving the mux, and the
mux can be switched from anywhere in userspace via the debugfs file.
This is fine when mux switches are only possible while neither GPU is
actively driving a graphical display session, but poses a problem when
mux switches become possible while there are still actively running
modesetting clients. In addition to notifying the GPU drivers of the
event via the vga-switcheroo callback mechanism, the modesetting clients
would also need to be aware of, if not involved in, the mux switch
event.

Since the active modesetting clients already need to have the context of
what is being displayed on which display, it makes sense to assign the
role of dynamic mux switch control to the modesetting clients (e.g. an X
server or a Wayland compositor). And since the modesetting clients will
likely already want to stop displaying on the switched-away-from
connector and then start displaying on the switched-to connector, it
makes sense to attach the mux switch request to the modeset requests
that would already be necessary.

A proposal for driving dynamic mux switches via a DRM-centric
alternative to the existing vga-switcheroo model follows:

* Rather than registering the mux targets at GPU-level granularity (each
  vga-switcheroo client is associated with a pci_device), they could be
  registered at connector-level granularity by the DRM-KMS drivers.
* Each connector would be associated with an individual mux. Any mux
  which has two or more associated connectors will be capable of
  switching between them.
* The association of a connector with a particular mux would be exposed
  via an immutable drm_connector property. This will allow clients to
  ascertain which connectors share a mux, and can therefore be switched
  between. This property would be an opaque-to-userspace handle
  identifying a particular mux. All connectors which share a mux will
  have the same handle value reflected in the value of this property.
* An additional immutable drm_connector property will indicate an index
  for each display on the mux. The combination of a mux handle plus this
  connector index is globally unique within the system. The connector
  index values are unique to each connector within a given mux, but are
  not unique across muxes.
* A read/write drm_connector property will indicate the connector which
  is currently muxed when read, and will request a switch to another
  connector on the same mux when written.

This would allow for a DRM-KMS client to initiate a mux switch as
follows (some details about error handling and validation checks are
omitted for brevity):

1. The client prepares and validates an atomic modeset request which
   sets the "switched-to display" property on the switched-away-from
   connector to the value of the "mux value" property on the switched-to
   connector.
2. The client commits the switch-away-from request.
3. The switched-away-from KMS driver enables PSR on the pending
   switched-away-from connector. The client may stop presenting to the
   switched-away-from connector after this is complete.
4. DRM core calls into the mux driver which registered with the
   connector to switch the mux to the switched-to connector.
5. The switched-to DRM driver reprobes the connector and can now detect
   the previously disconnected display.
6. The client prepares and validates an atomic modeset request setting a
   mode on the switched-to connector.
7. The client commits the modeset request on the switched-to connector.
8. The switched-to KMS driver disables PSR on the switched-to connector.
9. Both atomic modesets are complete, and the client may begin
   presenting on the switched-to connector.

The atomic modeset requests come in a switch-away-from and switch-to
pair, since it is likely that the switched-away-from and switched-to
connectors would be on more than one drm_device. In the theoretical case
of the swiched-away-from and switched-to connectors being on the same
drm_device, it should theoretically be possible to perform a single
commit if the KMS driver is capable of validating the mode request on
the switched-to connector while it is still disconnected.

This design also provides natural synchronization points for operations
that the DRM-KMS drivers will need to take before and after the mux
switch, eliminating the need for dedicated callbacks for setting PSR
state and reprobing the displays. This will allow much of the process
to reuse existing code in the various DRM-KMS drivers which will need to
support dynamic mux switching, minimizing the amount of changes required
to existing in-tree and out-of-tree DRM-KMS drivers. The modesetting
client has complete control over and visibility into the state of each
muxable connector, and it is not possible for arbitrary userspace
programs to switch the mux. The design also allows for an arbitrary
number of muxes, each one able to switch between an arbitrary number of
connectors. It is even possible to have a mux switch between multiple
connectors on the same GPU.

Additional possible features:

In addition to the proposed drm_connector-based mux switching UAPI,
additional functionality can be handled by this framework (and could
also be added to vga-switcheroo, via appropriate extensions):

* EDID dispatch - vga-switcheroo supports switching only the DDC lines
  on older mux designs where this was possible, to allow the driver for
  the inactive GPU to read the panel's EDID while switched away. Modern
  notebook designs use eDP panels, and therefore cannot switch out DDC
  in isolation. This may not actually be necessary if the switched-to
  DRM-KMS driver is going to reprobe the connector before the client
  prepares an atomic request for the switched-to connector.
* HDA dispatch - GPU HDA drivers register with vga-switcheroo, but
  mainly for power management purposes. Since vga-switcheroo doesn't
  support switching an active desktop session from one GPU to another,
  users can simply switch to using the newly connected GPU's HDA
  controller after the switch. However, for dynamic switching it may be
  desirable to have a single consistent HDA device across both sides of
  the switch. This is probably easier said than done, but since this
  really isn't an issue for internal panels, which tend not to have
  GPU-driven audio, and there are relatively few designs with dynamic
  muxes for external displays, this doesn't need to be a particularly
  high priority issue.

Some problems that need solving:

* There would need to be some way to validate, with the first commit on
  the switched-away-from connector's device, that the client also has
  permission to set a mode on the switched-to connector's device. One
  way to do this might be to expose an immutable magic cookie property
  on each muxed connector, and set the magic cookie value of the target
  connector when requesting the mux switch. However, it might also be
  useful to have a more robust generic solution for cross-device
  authentication for other use
  cases that require it.
* It is unclear what the best method would be for discovering the which
  mux is associated with which connectors. For the simplistic and common
  case of one mux which can switch to connect one internal panel between
  either of two GPUs, this is trivial, but there is no obvious solution
  for the more general case. In the current prototype, the mux handler
  driver registers a callback which gets called once for each connector
  when DRM-KMS drivers register their connectors, and then assigns the
  mux ID for each connector that it is responsible for. This is similar
  to the get_client_id() handler callback in the existing vga-switcheroo
  design.
* Details for how to handle console restoration, e.g. if a client
  crashes while mux-switched away from the device driving the fbcon,
  should be worked out.
* The client will ideally be able to query the primary planes for the
  connector which is about to be switched to, before the switch occurs.
  Perhaps this could be done by having the target DRM-KMS driver allow
  planes to be queried on a disconnected connector if it is associated
  with a mux, or at the very least expose a list of supported formats
  that is accessible regardless of display connection status. In either
  case, some amount of foreknowledge would be required on the part of
  the to-be-switched-to connector's DRM driver, at least for displays
  which are attached to a mux.
* There should be a way to request switches for external muxes which do
  not currently have a display connected. DRM-KMS modesets don't really
  make sense for this case, since there's nothing to set a mode on.

One of the design goals in this proposal was to avoid introducing new
dedicated DRM APIs, which is why the functionality is expressed via
connector properties. However, it may be difficult to solve some of
these problems (particularly the cross-driver permission one) without
new APIs.
