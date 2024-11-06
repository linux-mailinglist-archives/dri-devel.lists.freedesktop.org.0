Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C709BF677
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 20:29:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70A0610E76D;
	Wed,  6 Nov 2024 19:29:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=w_armin@gmx.de header.b="h2LGBACt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D37310E1DB
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 19:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1730921274; x=1731526074; i=w_armin@gmx.de;
 bh=KPIsoyhsws8Agp7wgFRMdaTpDymEbvSb3Owgwg6CKMI=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=h2LGBACtvj9fuTu8QJu3YKOjKAS2hewAVTTkd9mZmaplCDT2J9hvpF/GtT49QeKg
 Bt4vp6fMC2gSsYxfdqC05RHmq+I9OJ53K6olZLIzYc8oF3BOSjocR+HWABgQPdyMI
 uV+5SFihSVbovJy+fuaKWC1V5sgRRwRbGw/bnuWabCT6vdvpD+yVPp6iO5bVFlfAg
 +ZGwJZy/1bUp8Uax4ZS5K5Au27cfgCjGWUGMTQRjWXfew9D2ZIiRZuO47D52Y8nv1
 5kYvQkAvqhbzYzSeqHFJkHGzaNsPyX12fxVzRgKvBEcxbQ8A9cEedXNLJ2JDTh51e
 zyyJZ4ZtvPpzMPCH/g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MG9kC-1t3KhK2USC-003gaQ; Wed, 06
 Nov 2024 20:27:54 +0100
Message-ID: <da774e71-39f3-43ec-a366-c8c893132447@gmx.de>
Date: Wed, 6 Nov 2024 20:27:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/10] sysfs: introduce callback
 attribute_group::bin_size
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
 Carlos Bilbao <carlos.bilbao.osdev@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "David E. Box" <david.e.box@linux.intel.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>, Frederic Barrat <fbarrat@linux.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Logan Gunthorpe <logang@deltatee.com>, "K. Y. Srinivasan"
 <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>
Cc: Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-cxl@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, linux-mtd@lists.infradead.org,
 platform-driver-x86@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-alpha@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-hyperv@vger.kernel.org
References: <20241103-sysfs-const-bin_attr-v2-0-71110628844c@weissschuh.net>
 <20241103-sysfs-const-bin_attr-v2-2-71110628844c@weissschuh.net>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20241103-sysfs-const-bin_attr-v2-2-71110628844c@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:44YqvEvciDnAZyVj6z6AwMwirIfHL0Pzp3XFOKxQKNiQ7tHWySC
 RxktlrVaqsSUg5C4VvLrzKpoqlhjiHyHgejaek9khmsio9KiFm5QCv2KXv29eAcNsGR1hIr
 /Q5ILnqj229v3epEt6qEr+soHYvezbTam1hICVuVYB5Diy3yXhaNodiu0nfX7EP/suGwHuw
 I6p5H1JUB0YrJzn4YZJQA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BJYO93jXrqs=;fzmEJQpCL0PeqA4I2iYLeQ+/FRA
 MPq/2bbvr2WJqMuneUG6luVuj1km+05i2j/1x0NELfvZ4gM4s6XaNM8HLcODqZ2YvwqbRoHUl
 2LVK+ozUvLuqixPcgAE0TpsTj6BsJuZZF8Prk152h36LGoBr9+Kd/R2q2Uj14uYLPmyWZJ52T
 GNvCa+TOfxV6zDxmDel4X7SRWzgnowuH/BIW3mUXHAYAVu4fYedW6ndnVbIfGQolflbLgQgyW
 8mV+C1e27T4QNjbRbp0K+rJqERUl44Twyy7xGukU3hzMv86Q7mhlxLrkLCQS08ejnbvx9vsKG
 6r01C9bdsfdQTjc8ugjkhVZo1cVoiz+0Idhzkx2HFzevnqowukNVKHY0CWZ4djGA/wxza8ihC
 eNcKow0sVo9h8op9VF3+dQKYJlpKJzp7n2geJP8QZL0kSe6bjfmj/6AvUYeZ5S5Mj+GvK8pW+
 Hx13JZYdjPEwoso2V+ubjtHLhHFhZCY3jh0/lw4JBQ9TuoNEMuaERqMypNT2JoPC/SM1qDBVx
 oZvDgRCLkXEbhhDGTdGaeM4aGZm9w0xjx7OOl3y478J0h8vJWzK2lZcJ9OCtdTCOBJ3TKK51o
 j2XTpAkas1ObXtSswmUtpY/4NVAGbjFlT/VOYp0mdC+F4L90W0AmQwAT/dp7ljfoSSkZT4/zA
 tnfMmwR7alN2DKWZGMREmp8dtIWDzl/LkYsX5xsPiTm6gHpOZxc0s4oUuYnkXDbW9UIZGBd7l
 8FMWWaPCemeDgSDhQn2reHRR1YW+K4+d53fVkZQszw1C38L00qMcKo7qliwnTIDdOaJvrPrQg
 Ne8RWTGaSm1RVKwc8Z2xLPwg==
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

Am 03.11.24 um 18:03 schrieb Thomas Wei=C3=9Fschuh:

> Several drivers need to dynamically calculate the size of an binary
> attribute. Currently this is done by assigning attr->size from the
> is_bin_visible() callback.

Hi,

i really like your idea of introducing this new callback, it will be very
useful for the wmi-bmof driver :).

Thanks,
Armin Wolf

>
> This has drawbacks:
> * It is not documented.
> * A single attribute can be instantiated multiple times, overwriting the
>    shared size field.
> * It prevents the structure to be moved to read-only memory.
>
> Introduce a new dedicated callback to calculate the size of the
> attribute.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
>   fs/sysfs/group.c      | 2 ++
>   include/linux/sysfs.h | 8 ++++++++
>   2 files changed, 10 insertions(+)
>
> diff --git a/fs/sysfs/group.c b/fs/sysfs/group.c
> index 45b2e92941da1f49dcc71af3781317c61480c956..8b01a7eda5fb3239e1383724=
17d01967c7a3f122 100644
> --- a/fs/sysfs/group.c
> +++ b/fs/sysfs/group.c
> @@ -98,6 +98,8 @@ static int create_files(struct kernfs_node *parent, st=
ruct kobject *kobj,
>   				if (!mode)
>   					continue;
>   			}
> +			if (grp->bin_size)
> +				size =3D grp->bin_size(kobj, *bin_attr, i);
>
>   			WARN(mode & ~(SYSFS_PREALLOC | 0664),
>   			     "Attribute %s: Invalid permissions 0%o\n",
> diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
> index c4e64dc112063f7cb89bf66059d0338716089e87..4746cccb95898b24df6f53de=
9421ea7649b5568f 100644
> --- a/include/linux/sysfs.h
> +++ b/include/linux/sysfs.h
> @@ -87,6 +87,11 @@ do {							\
>    *		SYSFS_GROUP_VISIBLE() when assigning this callback to
>    *		specify separate _group_visible() and _attr_visible()
>    *		handlers.
> + * @bin_size:
> + *		Optional: Function to return the size of a binary attribute
> + *		of the group. Will be called repeatedly for each binary
> + *		attribute in the group. Overwrites the size field embedded
> + *		inside the attribute itself.
>    * @attrs:	Pointer to NULL terminated list of attributes.
>    * @bin_attrs:	Pointer to NULL terminated list of binary attributes.
>    *		Either attrs or bin_attrs or both must be provided.
> @@ -97,6 +102,9 @@ struct attribute_group {
>   					      struct attribute *, int);
>   	umode_t			(*is_bin_visible)(struct kobject *,
>   						  struct bin_attribute *, int);
> +	size_t			(*bin_size)(struct kobject *,
> +					    const struct bin_attribute *,
> +					    int);
>   	struct attribute	**attrs;
>   	struct bin_attribute	**bin_attrs;
>   };
>
