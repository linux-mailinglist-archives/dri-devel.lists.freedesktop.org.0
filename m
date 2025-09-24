Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D53B9AD24
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 18:14:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 644A710E76C;
	Wed, 24 Sep 2025 16:13:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098F110E140;
 Wed, 24 Sep 2025 16:13:58 +0000 (UTC)
Received: by psionic.psi5.com (Postfix, from userid 1002)
 id 12B8C3F1BA; Wed, 24 Sep 2025 18:13:56 +0200 (CEST)
Date: Wed, 24 Sep 2025 18:13:56 +0200
From: Simon Richter <Simon.Richter@hogyros.de>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Christoph Hellwig <hch@infradead.org>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-pci@vger.kernel.org
Subject: Re: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for device
 functions of Intel GPUs
Message-ID: <20250924161356.GA3273841@psionic12.psi5.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922121253.GT1391379@nvidia.com>
 <IA0PR11MB7185067FA8CE8A95419D06F5F81DA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <aNKiXTGs75fldDYS@infradead.org>
 <1d9065f3-8784-4497-b92c-001ae0e78b63@amd.com>
 <IA0PR11MB71855457D1061D0A2344A5CFF81CA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <aNMnHJwWfFPgGYbW@lstrano-desk.jf.intel.com>
 <5f9f8cb6-2279-4692-b83d-570cf81886ab@amd.com>
 <20250923133839.GL1391379@nvidia.com>
 <8da25244-be1e-4d88-86bc-5a6f377bdbc1@amd.com>
 <20250923131247.GK1391379@nvidia.com>
 <522d3d83-78b5-4682-bb02-d2ae2468d30a@amd.com>
 <20250923121528.GH1391379@nvidia.com>
 <80d2d0d1-db44-4f0a-8481-c81058d47196@amd.com>
 <aNJB1r51eC2v2rXh@lstrano-desk.jf.intel.com>
 <aNI9a6o0RtQmDYPp@lstrano-desk.jf.intel.com>
 <IA0PR11MB718580B723FA2BEDCFAB71E9F81DA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20250922140024.GZ1391379@nvidia.com>
 <42f45fa2-6ea3-44c7-870a-dc1973894a87@amd.com>
 <20250922132720.GY1391379@nvidia.com>
 <fbb6bbe7-8141-4532-812e-2b93cc2fcb1b@amd.com>
 <20250922122900.GV1391379@nvidia.com>
 <4e3919c3-3d1b-4f34-a1e4-5e9e7a5e6e14@amd.com>
 <20250922122018.GU1391379@nvidia.com>
 <045c6892-9b15-4f31-aa6a-1f45528500f1@amd.com>
 <IA0PR11MB718504F59BFA080EC0963E94F812A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20250919122931.GR1391379@nvidia.com>
 <IA0PR11MB7185C96268ADB5530B343ABBF811A@IA0PR11MB7185.namprd11.prod.outlook.com>
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

Hi,

since I'm late to the party I'll reply to the entire thread in one go.

On Fri, Sep 19, 2025 at 06:22:45AM +0000, Kasireddy, Vivek wrote:

> I think using a PCI BAR Address works just fine in this case because the Xe
> driver bound to PF on the Host can easily determine that it belongs to one
> of the VFs and translate it into VRAM Address.

There are PCIe bridges that support address translation, and might apply
different translations for different PASIDs, so this determination would
need to walk the device tree on both guest and host in a way that does
not confer trust to the guest or allows it to gain access to resources
through race conditions.

The difficulty here is that you are building a communication mechanism
that bypasses a trust boundary in the virtualization framework, so it
becomes part of the virtualization framework. I believe we can avoid
that to some extent by exchanging handles instead of raw pointers.

I can see the point in using the dmabuf API, because it integrates well
with existing 3D APIs in userspace, although I don't quite understand
what the VK_KHR_external_memory_dma_buf extension actually does, besides
defining a flag bit -- it seems the heavy lifting is done by the
VK_KHR_external_memory_fd extension anyway. But yes, we probably want
the interface to be compatible to existing sharing APIs on the host side
at least, to allow the guest's "on-screen" images to be easily imported.

There is some potential for a shortcut here as well, giving these
buffers directly to the host's desktop compositor instead of having an
application react to updates by copying the data from the area shared
with the VF to the area shared between the application and the
compositor -- that would also be a reason to remain close to the
existing interface.

It's not entirely necessary for this interface to be a dma_buf, as long
as we have a conversion between a file descriptor and a BO.  On the
other hand, it may be desirable to allow re-exporting it as a dma_buf if
we want to access it from another device as well.

I'm not sure that is a likely use case though, even the horrible
contraption I'm building here that has a Thunderbolt device send data
directly to VRAM does not require that, because the guest would process
the data and then send a different buffer to the host. Still would be
nice for completeness.

The other thing that seems to be looming on the horizon is that dma_buf
is too limited for VRAM buffers, because once it's imported, it is
pinned as well, but we'd like to keep it moveable (there was another
thread on the xe mailing list about that). That might even be more
important if we have limited BAR space, because then we might not want
to make the memory accessible through the BAR unless imported by
something that needs access through the BAR, which we've established the
main use case doesn't (because it doesn't even need any kind of access).

I think passing objects between trust domains should take the form of an
opaque handle that is not predictable, and refers to an internal data
structure with the actual parameters (so we pass these internally as
well, and avoid all the awkwardness of host and guest having different
world views. It doesn't matter if that path is slow, it should only be
used rather seldom (at VM start and when the VM changes screen
resolution).

For VM startup, we probably want to provision guest "on-screen" memory
and semaphores really early -- maybe it makes sense to just give each VF
a sensible shared mapping like 16 MB (rounded up from 2*1080p*32bit) by
default, and/or present a ROM with EFI and OpenFirmware drivers -- can
VFs do that on current hardware?

On Tue, Sep 23, 2025 at 05:53:06AM +0000, Kasireddy, Vivek wrote:

> IIUC, it is a common practice among GPU drivers including Xe and Amdgpu
> to never expose VRAM Addresses and instead have BAR addresses as DMA
> addresses when exporting dmabufs to other devices.

Yes, because that is how the other devices access that memory.

> The problem here is that the CPU physical (aka BAR Address) is only
> usable by the CPU.

The address you receive from mapping a dma_buf for a particular device
is not a CPU physical address, even if it is identical on pretty much
all PC hardware because it is uncommon to configure the root bridge with
a translation there.

On my POWER9 machine, the situation is a bit different: a range in the
lower 4 GB is reserved for 32-bit BARs, the memory with those physical
addresses is remapped so it appears after the end of physical RAM from
the point of view of PCIe devices, and the 32 bit BARs appear at the
base of the PCIe bus (after the legacy ports).

So, as an example (reality is a bit more complex :> ) the memory map
might look like

0000000000000000..0000001fffffffff    RAM
0060000000000000..006001ffffffffff    PCIe domain 1
0060020000000000..006003ffffffffff    PCIe domain 2
...

and the phys_addr_t I get on the CPU refers to this mapping. However, a
device attached to PCIe domain 1 would see

0000000000000000..000000000000ffff    Legacy I/O in PCIe domain 1
0000000000010000..00000000000fffff    Legacy VGA mappings
0000000000100000..000000007fffffff    32-bit BARs in PCIe domain 1
0000000080000000..00000000ffffffff    RAM (accessible to 32 bit devices)
0000000100000000..0000001fffffffff    RAM (requires 64 bit addressing)
0000002000000000..000000207fffffff    RAM (CPU physical address 0..2GB)
0060000080000000..006001ffffffffff    64-bit BARs in PCIe domain 1
0060020000000000..006003ffffffffff    PCIe domain 2

This allows 32 bit devices to access other 32 bit devices on the same
bus, and (some) physical memory, but we need to sacrifice the 1:1
mapping for host memory. The actual mapping is a bit more complex,
because 64 bit BARs get mapped into the "32 bit" space to keep them
accessible for 32 bit cards in the same domain, and this would also be a
valid reason not to extend the BAR size even if we can.

The default 256 MB aperture ends up in the "32 bit" range, so unless the
BAR is resized and reallocated, the CPU and DMA addresses for the
aperture *will* differ.

So when a DMA buffer is created that ends up in the first 2 GB of RAM,
the dma_addr_t returned for this device will have 0x2000000000 added to
it, because that is the address that the device will have to use, and
DMA buffers for 32 bit devices will be taken from the 2GB..4GB range
because neither the first 2 GB nor anything beyond 4 GB are accessible
to this device.

If there is a 32 bit BAR at 0x10000000 in domain 1, then the CPU will
see it at 0x60000010000000, but mapping it from another device in the
same domain will return a dma_addr_t of 0x10000000 -- because that is
the address that is routeable in the PCIe fabric, this is the BAR
address configured into the device so it will actually respond, and the
TLP will not leave the bus because it is downstream of the root bridge,
so it does not affect the physical RAM.

Actual numbers will be different to handle even more corner cases and I
don't remember exactly how many zeroes are in each range, but you get
the idea -- and this is before we've even started creating virtual
machines with a different view of physical addresses.

On Tue, Sep 23, 2025 at 06:01:34AM +0000, Kasireddy, Vivek wrote:

> - The Xe Graphics driver running inside the Linux VM creates a buffer
> (Gnome Wayland compositor's framebuffer) in the VF's portion (or share)
> of the VRAM and this buffer is shared with Qemu. Qemu then requests
> vfio-pci driver to create a dmabuf associated with this buffer.

That's a bit late. What is EFI supposed to do?

   Simon
