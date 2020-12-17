Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C02FD2DDFAD
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:32:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A983089B18;
	Fri, 18 Dec 2020 08:32:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760049.outbound.protection.outlook.com [40.107.76.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F06616E1AA
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 08:40:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X9HKzmZAi3cTPNRgygnE83TDceNnncixEq3B2x2ZYJXdGD6D/yLCUYN+gvjYZaY9anhbhhtbALQlmuhPkYOsYOaak/LOqNVFKQ7HtlllaSQxiy8qfcChyyT0LViS2WgdokwCyCc5KqyntkAzS2ktfSArcD2jeFTue+jEyAwKKRRr9RZD/vr/CuvM660k4QA63oQv7EdlS0h9si8jrCXEjTMN0AMAnRcgbC2mDqdV9k9YWUq3grMicgtZN00CqIRAmxJc19KIlnWAqvG3A2YDj9BJ+ofkiufZxnBo+ZkVCy9jSIKZxxeYB+FcY9zIwRbUxJFvQf7EAngFm+Au3QlPJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2KeKc5fK4CDvqslsAwMzEh91QHKX1eB3jV+xbK4iB0=;
 b=JgB/0GkmuFzjhxLwUehLdA5FTdlaSi5CsYtbJ6iavkwt4edQi4OMKM4X/TKK3EYLOPqjd5bD94R26qEKC0EvAyDNd0Ixk5jamv0eEkD95aMEQYga7oBgVt6hMqVz62ydsuOBM7+fogJbcCedTHxld++sJqcoBD2U8MhWkLSRSZ2N2up4WaEUnobaH6h3/WCF/ze+k4hTs38MNAe2EzPd527fwOFR42Lun1a91eVxdy5aGLmWP9JVHbE39NWMohDHvwZmKQq+ZnbJBNcRcOaNN8VW1A7zde7209PZEHCfVvkj7aucBz2y8ZUF6QCfS4VW3daJlel3XRLa7hlR4YuYeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2KeKc5fK4CDvqslsAwMzEh91QHKX1eB3jV+xbK4iB0=;
 b=tO6Bei9n1bW93ADWnT/9E5Rkg5yAQ3lvHQFzbh4Xk5qGvEtEmz29kOjbpD+l+QcnYbZX1AVpUkfyBeAQJnzNwy8b6Obn/IbbKCNYqS8NPHmQ6k48+8h0aAA9TFEWsRPIloa11S6wGujDvw/LTUcssI5RlQhq5JIw/SpZ8vtepyM=
Received: from SN2PR01CA0009.prod.exchangelabs.com (2603:10b6:804:2::19) by
 CH2PR02MB6072.namprd02.prod.outlook.com (2603:10b6:610:4::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.19; Thu, 17 Dec 2020 08:40:25 +0000
Received: from SN1NAM02FT019.eop-nam02.prod.protection.outlook.com
 (2603:10b6:804:2:cafe::c9) by SN2PR01CA0009.outlook.office365.com
 (2603:10b6:804:2::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Thu, 17 Dec 2020 08:40:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT019.mail.protection.outlook.com (10.152.72.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3654.12 via Frontend Transport; Thu, 17 Dec 2020 08:40:23 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 17 Dec 2020 00:40:08 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 17 Dec 2020 00:40:08 -0800
Envelope-to: derek.kiernan@xilinx.com, manish.narani@xilinx.com,
 michal.simek@xilinx.com, dragan.cvetic@xilinx.com,
 rajan.vaja@xilinx.com, ravi.patel@xilinx.com,
 tejas.patel@xilinx.com, wendy.liang@xilinx.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 christian.koenig@amd.com, linux-arm-kernel@lists.infradead.org,
 robh+dt@kernel.org, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, devicetree@vger.kernel.org,
 arnd@arndb.de, daniel@ffwll.ch, alexdeucher@gmail.com
Received: from [10.23.122.68] (port=58561)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <wendy.liang@xilinx.com>)
 id 1kpopU-00020g-Fa; Thu, 17 Dec 2020 00:40:08 -0800
From: Jiaying Liang <wendy.liang@xilinx.com>
Subject: Re: [PATCH v3 0/9] Xilinx AI engine kernel driver
To: Alex Deucher <alexdeucher@gmail.com>, Jiaying Liang
 <wendy.liang@xilinx.com>
References: <1606722505-16194-1-git-send-email-wendy.liang@xilinx.com>
 <CADnq5_NZrqkouXCFKWc2wv483nc=x4cXXjFCqcEmkUYZpNeMUQ@mail.gmail.com>
 <CAKMK7uFjwmm9W3RFVdQ=EOqHvWeD5ZPA7zP86O_sxxBv3n4jjw@mail.gmail.com>
 <b0d41bb6-0347-24f5-7a2d-a3b41d5444c9@xilinx.com>
 <CADnq5_N7Q_6jfghWQGs17gzT2Ucj_19v9V4s7G0wPStVn+mftQ@mail.gmail.com>
Message-ID: <83491d22-64b6-68bd-b7e2-787e0826712c@xilinx.com>
Date: Thu, 17 Dec 2020 00:40:07 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <CADnq5_N7Q_6jfghWQGs17gzT2Ucj_19v9V4s7G0wPStVn+mftQ@mail.gmail.com>
Content-Language: en-US
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1cefe045-d04f-458a-4ed4-08d8a267650a
X-MS-TrafficTypeDiagnostic: CH2PR02MB6072:
X-Microsoft-Antispam-PRVS: <CH2PR02MB60726FE95D3503AF4DF80A80B0C40@CH2PR02MB6072.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yap0lfeNynBXrtYfZvdApGiLMvMJAU0XX8yRUwxKvsQpUPknDYJJrU2x+QA1FfngZIemKNGNKszwvj3hy5XKQM49gaS4AeyiSgaMsDzHKHSXV4wwOotxXrG9rLUofKeCouwl8H6wuo23Ot2RZXD4PsVXJPVVG49Mr5RX7mV45LHfA8C89VruEYYTJ0pXBLlT5a2CHmWEGq3RkodYoD7nTVkSAZNeRCUsDxswCiFczZzSESCGSqbMDFlxNxbgAIO1k+yNSc2xe3J2vSh33BbVliyg7M8t3ANbt/5sg/Lrez2FYDX9keYHJSHnID++TntGexgDY4YH1BJT+UUf+zwh5xrXyAfMaNsrazSYu6Tp+LAIQCfUMWS+hwWK+AWyj9yA3pue1kBuv1EYqwvTaCAiil6szLcGL1wHjPd14Xw1fd8A2X8q7+NiaBsDaxry7wTrR+Iv2DX3tB3EicvUjxxWYzaVFl2AzzoNSveaSCBi+NwtbgSf7FSUkku4zme9akn8a1N+lZGdFXVYxlQfv46MbA==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(376002)(136003)(396003)(46966005)(7636003)(53546011)(82740400003)(70206006)(31696002)(110136005)(966005)(31686004)(336012)(30864003)(26005)(9786002)(8676002)(54906003)(70586007)(478600001)(426003)(316002)(2616005)(36756003)(47076004)(4326008)(82310400003)(8936002)(2906002)(83380400001)(186003)(7416002)(5660300002)(356005)(50156003)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2020 08:40:23.2131 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cefe045-d04f-458a-4ed4-08d8a267650a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT019.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6072
X-Mailman-Approved-At: Fri, 18 Dec 2020 08:31:48 +0000
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
Cc: tejas.patel@xilinx.com, ravi.patel@xilinx.com, rajan.vaja@xilinx.com,
 Arnd Bergmann <arnd@arndb.de>, devicetree <devicetree@vger.kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>, Dragan Cvetic <dragan.cvetic@xilinx.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 manish.narani@xilinx.com, Derek Kiernan <derek.kiernan@xilinx.com>,
 Christian Koenig <christian.koenig@amd.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-media <linux-media@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/15/20 7:23 AM, Alex Deucher wrote:
> On Mon, Dec 14, 2020 at 7:24 PM Jiaying Liang<wendy.liang@xilinx.com>  wrote:
>> On 12/11/20 11:39 AM, Daniel Vetter wrote:
>>> Hi all
>>>
>>> On Fri, Dec 11, 2020 at 8:03 PM Alex Deucher<alexdeucher@gmail.com>   wrote:
>>>> On Mon, Nov 30, 2020 at 3:25 AM Wendy Liang<wendy.liang@xilinx.com>   wrote:
>>>>> AI engine is the acceleration engine provided by Xilinx. These engines
>>>>> provide high compute density for vector-based algorithms, and flexible
>>>>> custom compute and data movement. It has core tiles for compute and
>>>>> shim tiles to interface the FPGA fabric.
>>>>>
>>>>> You can check the AI engine architecture document for more hardware details:
>>>>> https://www.xilinx.com/support/documentation/architecture-manuals/am009-versal-ai-engine.pdf
>>>>>
>>>>> This patch series adds a Linux kernel driver to manage the Xilinx AI
>>>>> engine array device and AI engine partitions (groups of AI engine tiles
>>>>> dedicated to an application).
>>>> Hi Wendy,
>>>>
>>>> I think it would be good to provide an overview of how your stack
>>>> works in general.  That would give reviewers a better handle on how
>>>> all of this fits together.  I'd suggest including an overview in the
>>>> cover letter and also in the commit message and/or as a comment in the
>>>> code in one of the patches.  I'm not really an expert when it comes to
>>>> FPGAs, but this basically looks like a pretty low level interface to
>>>> set up the data fabric for a kernel that will run on the soft logic or
>>>> maybe the microcontroller on the board.  It doesn't have to be super
>>>> detailed, just a nice flow for how you might use this.  E.g.,
>>>>
>>>> Userspace uses ioctls X, Y, Z to configure the data fabric for the
>>>> FPGA kernel.  The kernels can run on... .  DMA access to system memory
>>>> for data sets can be allocated using ioctl A.  DMA access is limited
>>>> by... . The user can then load the FPGA kernel on to one of the
>>>> engines using ioctl B and finally they can kick off the whole thing
>>>> using ioctl C.  FPGA kernels are compiled using YYY toolchain and use
>>>> use the following runtime (link to runtime) to configure the data
>>>> fabric using ioctls X, Y, Z.
>>> At least for drm drivers we ideally have that as a .rst file in
>>> Documentation/. With that you can even do full svg graphs, or just dot
>>> graphs, of the overall stack if you really want to go overboard :-)
>>>
>>>> It would also be good to go over the security implications of the
>>>> design.  E.g., can the FPGA kernel(s) access the DMA engine directly,
>>>> or is it limited to just the DMA regions set up by the ioctls?  Also,
>>>> does the hardware and software design allow for multiple users?  If
>>>> so, how does that work?
>>> I've also seen indications that there's some on-chip or on-card
>>> memory. How that's planned to be used and whether we want to manage
>>> this (maybe even with something like ttm) would be good to understand.
>>>
>>> All excellent questions from Alex, just figured I add some more.
>>>
>>> Cheers, Daniel
>> Hi Alex, Daniel,
>>
>> Below is an overview of the driver.
>>
>> AI engine kernel driver manages Xilinx AI engine device. An AI engine device
>> contains cores tiles and SHIM tiles. Core tiles are the computation tiles
>> , the SHIM tiles are the tiles interfacing to external components.
>>
>>             +--------+--------+--------+--------+
>>              | Core        | Core        | Core        | Core | ...
>>              |                |                | |                |
>>             +-----------------------------------+
>>              | Core        | Core        | Core        | Core     | ...
>>              |                |                | |             |
>>             +--------+--------+--------+---------
>>              ...
>>             +--------+--------+-----------------+
>>             | SHIM        | SHIM       | SHIM       |SHIM        |
>>             | PL            | PL           | PL            |PL | NOC  |
>>             +---+----+---+----+---+-----+-------+
>>     AXI Streams   |        |                |              |    |AXI MM
>>                          |        |                | |    |
>> Events Singals |        |                |              |    |
>>                          |        |                | |    |
>>                          |        |                | |    |
>>             +---+--------+--------+-----+ +--+------+
>>             |       FPGA                                        | |
>> NOC        |
>>             | | |                  |
>>             +---------------------------+ +--+-------+
>>                                              |
>>                                              |
>>                                          +---+------+
>>                                          |   DDR           |
>>                                          +----------+
>>
>> Each Core tile contains computing module, local memory and DMA module. The
>> local memory DMA module takes data from or to the AXI streams and writes
>> it to or reads it from the local memory. The computing module can also
>> directly get/put data from/to the AXI stream. The AIE SHIM enables AIE tiles
>> to get/put data from/to AXI streams from FPGA, enables external master to
>> access AI engine address space through AXI MM. SHIM NoC module has DMA
>> engine,
>> which can access extern memory though AXI MM and push it to internal AXI
>> streams.
>>
>> At runtime, the AI engine tiles interconnection needs to be configured
>> so that
>> it can get fetch data from external components or adjacent tiles, and AI
>> engine
>> core program needs to be loaded. And then user application can push data
>> to the
>> AI engine array and start/stop AI engine core. AI engine device errors
>> can be
>> raised as events, the AI engine kernel driver listens to the events
>> interrupt
>> to monitor runtime async device errors.
>>
>> Instead of application directly interacting with the AI engine kernel
>> APIs, user
>> application/libraries interacts with AI engine userspace library:
>> https://github.com/Xilinx/embeddedsw/tree/master/XilinxProcessorIPLib/drivers/aienginev2
>> It provides cross OSes low level functional abstraction such as how to
>> connect one
>> stream port to another stream port, how to configure core tile local DMA.
>>
>> The AI engine library can be used by other runtime libraries such as
>> Xilinx runtime (XRT)
>> library:https://xilinx.github.io/XRT/master/html/index.html,
>> which provides acceleration abstraction for Xilinx accelerators, it has
>> extensions
>> to interface to other acceleration framework such as OpenCL.
>> XRT provides buffer handling abstractions for user application to share
>> data between
>> applicaiton and devices.
>>
>> Here is an example of application runtime stack:
>>
>>               +----------------------------+
>>               |      Application                              |
>>               | |
>>               +----------------------------+
>>               |       XRT                                        |
>>               | |
>>               +----------------------------+
>>               |      AIE Library                               |
>>               | |
>>              +----------------------------+
>>       +----------------------------------------+
>> Kern    +----------------------------+
>>               |         AIE Partition                        +--+
>>              +----------------------------+    |
>>                     |----------------------------+
>>               +----------------------------+
>>                |         AIE Device                           |
>>                | |
>>               +----------------------------+
>>
>>
>>
>> The AI engine kernel driver provides the following user interfaces:
>>    * AIE device driver is the root device driver to manage the partitions of
>>      of the AI engine device array. AI engine array can be partitioned into
>>      column wised isolated partitions. Each applicaiton can only access its
>>      own partitions.
>>    * AIE device driver monitors the interrupt from the AI enigne device. All
>>      AI engine tiles shared the same interrupt for error events.
>>    * AIE partition driver controls address mapping and access of the
>>      registers/local memories of the tiles within a partition.
>>      * It provides mmap operation to enable application to direclty
>> access the
>>        tiles local memories for small data update such as parameter
>> update for
>>        performance.
>>      * It provides mmap operatio to map all the registers as readonly for
>>        application to poll registers efficiently to check status.
>>      * It provides ioctl for userspace to pass I/O commands to write/mask
>> write
>>        the registers. How to configure is defined by userspace. Userspace
>> will
>>        pass the I/O commands sequence to the kernel driver, and kernel driver
>>        will validate the commands before it writes to the registers.
>>      * It provides ioctl to import dmabuf and ioctl to configure the the
>> DMA module
>>        in the SHIM tile which can access memory outside AI engine array.
>>
>> The buffer management is out of this driver. In the above example, user
>> application
>> uses Xilinx runtime(XRT), XRT is the one to manage the buffers.
>>
> So if I understand this correctly, this driver handles the resource
> management for the AI engines, PLs (programmable logic), and DMA
> streams.  I think it's important to understand that there are multiple
> address spaces here.  Normally when we talk about DMA in the kernel we
> are referring to devices accessing an external resource like system
> memory on the host CPU or another device's MMIO space (e.g., another
> PCIe device).  It would be good to clarify which address spaces the
> DMAs in your diagram refer to.  I think the DMAs in the AI engines are
> specifically for DMAs within the AI engine logic (e.g., between AIs in
> a partition).  How is DMA to system memory handled?  What about
> dedicated memory on the FPGA (e.g., HBM or DDR on the FPGA itself)?
> Is that what you are exposing as DMA bufs?  When you allocate a
> DMA-buf for a partition, is that partition only allowed to access
> memory that is part of that DMA buf?  I presume there is some
> scatter/gather table that sets up the DMA range that the partition can
> access?  Who loads the soft logic (Is that the PL or some other IP)?
> Is the soft logic partitioned as well?  If I had some soft logic I
> wanted to run on the FPGA, what would the kernel driver interaction
> sequence look like?  Maybe using the OpenCL soft logic would be a good
> example.  E.g.,

The AI engine driver only manage the resources within the AI

engine array. There are two types of DMAs of the AI engine device.

one is the AI engine tile local memory DMA which can only access the local

memory. There is another type of DMA which is in the SHIM tile. This

DMA can access external address space such as DDR. Although it can acess

the memory on fpga if user configure the platform that way, it is 
preferred to

use PL data mover to move data between FPGA memory and AI engine device.

The PL data mover will not be managed by the AI engine driver.

One SHIM DMA has up to 16 buffer descriptors to use.

Xilinx FPGA manager is the one used to program the FPGA soft logic.

E.g. when XRT is used, if AI engine is connected to FPGA logic, the XRT 
stack is

the one to manage the configuration sequence.

> 1. user has soft logic blob generated by their soft logic compiler (is
> this compiler open source?)
The soft logic blob is generated by Xilinx tools which is not open 
source yet.
> 2. user calls AI engine kernel driver to allocate the required
> resources (AI engines, AI engine DMAs, doorbells of some sort?  etc.)

User will call AI engine kernel driver to allocate required resources within

the AI engine array at runtime.

However the patches for it is not in this patch set.

> 3. user calls AI engine kernel driver to allocate system memory and/or
> FGPA memory that can be used by the soft logic blob

AI engine kernel driver doesn't allocate system memory. User can use other

kernel driver to allocate memory.

E.g. when XRT is used, user calls XRT kernel driver (zocl) to allocate 
system memory.

So far, the FPGA memory is usually assigned to a soft data mover when 
the platform is

created. Are you considering to have the FPGA memory in the DMA pool of the

system? If it is dedicated to a device, can reserved memory solve this 
problem?

The AI engine kernel driver doesn't consider this yet.

> 4. user calls AI engine kernel driver to load soft logic

I assume you are referring to the soft logic on the FPGA side which is not

part of the AI engine device. FPGA manager is the one to load the soft 
logic on FPGA.

> 5. user interfaces with soft logic (how? presumably via some memory
> resource allocated in 2 and 3?)

I assume you are referring to the soft logic on the FPGA side (not the 
AI engine device)

The user interface with soft logic is managed by the soft logic IP driver.

Each soft logic has some memory mapped control registers. User can 
access those

registers through the soft logic IP driver.

About memory allocation, I think it is better to manage the shared 
memory out of

a specific device driver. Are you looking for memory management which covers

both the system memory and fpga memory, and the device can specify which 
memory

it prefers?


Thanks,

Wendy

>
> Thanks,
>
> Alex
>
>
>> Best Regards,
>>
>> Wendy
>>
>>>> Thanks,
>>>>
>>>> Alex
>>>>
>>>>
>>>>> v3:
>>>>> * unlock AIE dev mutex after failed to gain the partition lock in
>>>>>     errors handing
>>>>> * replace pointer with __u64 and enum with __u32 in ioctl
>>>>>
>>>>> v2:
>>>>> * Fix dtschema check errors
>>>>> * Fix test bot warning on interrupt implementation. Removed set but
>>>>>     unused  varaible.
>>>>> * Fix compilation unused function warning of firmware change in case
>>>>>     ZynqMP firmware is not configured
>>>>> * There are other warning on ZynqMP firmware reported from testbot
>>>>>     which is not introduced by this patch set.
>>>>>     "[PATCH] firmware: xlnx-zynqmp: fix compilation warning" is submitted
>>>>>     for those fixes.
>>>>>
>>>>>
>>>>> Izhar Ameer Shaikh (1):
>>>>>     firmware: xilinx: Add IOCTL support for AIE ISR Clear
>>>>>
>>>>> Nishad Saraf (2):
>>>>>     misc: xilinx-ai-engine: Add support to request device management
>>>>>       services
>>>>>     misc: xilinx-ai-engine: Add support for servicing error interrupts
>>>>>
>>>>> Wendy Liang (6):
>>>>>     dt-binding: soc: xilinx: ai-engine: Add AI engine binding
>>>>>     misc: Add Xilinx AI engine device driver
>>>>>     misc: xilinx-ai-engine: Implement AI engine cleanup sequence
>>>>>     misc: xilinx-ai-engine: expose AI engine tile memories to userspace
>>>>>     misc: xilinx-ai-engine: add setting shim dma bd operation
>>>>>     misc: xilinx-ai-engine: add request and release tiles
>>>>>
>>>>>    .../bindings/soc/xilinx/xlnx,ai-engine.yaml        | 126 ++++
>>>>>    MAINTAINERS                                        |   8 +
>>>>>    drivers/firmware/xilinx/zynqmp.c                   |  14 +
>>>>>    drivers/misc/Kconfig                               |  12 +
>>>>>    drivers/misc/Makefile                              |   1 +
>>>>>    drivers/misc/xilinx-ai-engine/Makefile             |  16 +
>>>>>    drivers/misc/xilinx-ai-engine/ai-engine-aie.c      | 608 +++++++++++++++++++
>>>>>    drivers/misc/xilinx-ai-engine/ai-engine-clock.c    | 245 ++++++++
>>>>>    drivers/misc/xilinx-ai-engine/ai-engine-dev.c      | 496 ++++++++++++++++
>>>>>    drivers/misc/xilinx-ai-engine/ai-engine-dma.c      | 481 +++++++++++++++
>>>>>    drivers/misc/xilinx-ai-engine/ai-engine-internal.h | 519 ++++++++++++++++
>>>>>    .../misc/xilinx-ai-engine/ai-engine-interrupt.c    | 659 +++++++++++++++++++++
>>>>>    drivers/misc/xilinx-ai-engine/ai-engine-mem.c      | 275 +++++++++
>>>>>    drivers/misc/xilinx-ai-engine/ai-engine-part.c     | 635 ++++++++++++++++++++
>>>>>    drivers/misc/xilinx-ai-engine/ai-engine-res.c      | 219 +++++++
>>>>>    drivers/misc/xilinx-ai-engine/ai-engine-reset.c    | 159 +++++
>>>>>    include/linux/firmware/xlnx-zynqmp.h               |   8 +
>>>>>    include/uapi/linux/xlnx-ai-engine.h                | 238 ++++++++
>>>>>    18 files changed, 4719 insertions(+)
>>>>>    create mode 100644 Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml
>>>>>    create mode 100644 drivers/misc/xilinx-ai-engine/Makefile
>>>>>    create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-aie.c
>>>>>    create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-clock.c
>>>>>    create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-dev.c
>>>>>    create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-dma.c
>>>>>    create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-internal.h
>>>>>    create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-interrupt.c
>>>>>    create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-mem.c
>>>>>    create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-part.c
>>>>>    create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-res.c
>>>>>    create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-reset.c
>>>>>    create mode 100644 include/uapi/linux/xlnx-ai-engine.h
>>>>>
>>>>> --
>>>>> 2.7.4
>>>>>
>>>>> _______________________________________________
>>>>> dri-devel mailing list
>>>>> dri-devel@lists.freedesktop.org
>>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>> _______________________________________________
>>>> dri-devel mailing list
>>>> dri-devel@lists.freedesktop.org
>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
