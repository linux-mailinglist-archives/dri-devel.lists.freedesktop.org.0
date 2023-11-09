Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD317E6918
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 12:04:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B12410E8AB;
	Thu,  9 Nov 2023 11:04:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F8FD10E8B2
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 11:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699527843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N/9f9ui2ByIfxOM0vhtd0gbvc0LypquLMddJ4UMlRjA=;
 b=gZBgYN9Mom3czxoDjp8Y3ok5xEjJY6VmaSBAEhd2kMXwcZnsJZzw0wNirUN9BSDOabY+Sa
 RjIkG1QjEBjn9xx3e5MypifNIUkNvibRYJUBVYdzm8yFinJjaEKfIeWlaQaE8O/sF39SfA
 mPq4GCLR3Jeko5Y/gZB/SYPFuHPnXWg=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-9-RicUYTkrMxmyZuJeevnm_w-1; Thu, 09 Nov 2023 06:04:00 -0500
X-MC-Unique: RicUYTkrMxmyZuJeevnm_w-1
Received: by mail-vk1-f198.google.com with SMTP id
 71dfb90a1353d-4ac2040cedaso149177e0c.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 03:04:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699527840; x=1700132640;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BTHdoswUAcs5z99P9gQJOP7b9HTzdGGGib7KL3ylz+E=;
 b=xGKWXRa/rxZQThvx+M1IPPAex/t96yRrXaPz3gX1LPgp1GI+3ANGzMUUvY+l1oX8Oc
 sWqu3BrkO74oOBirb/eQ9Eb4Qujixnz0k/Fd6Rnp1Ae6Yh27AL6xnV/tovn4DxMrWzGL
 +QrJO4r53o9B/xRO8smYcBSHbe9mWkgAK7RWACXtvb9TTdhRh9kZSzkc4Dz3oicrbixT
 TGRiN2Ksr6Lj5zNWt3J1TnYCwussZu2mbWzqfYya53gsrdaabx1MukZCRLlqAONmyrpI
 MBi/D7FoP8CzR6Xe8Oyl5UEVlCygq+KhSxNFaysofZV3sc3z31pFb4HbAtZ39FfvObAK
 KFNQ==
X-Gm-Message-State: AOJu0YylHzF46Aoi2LIQG8pKnDeO84f6XrgzOrXOS1uAq16rMjj15tLu
 0z/mCRZ6NWGxwm764joK4GKQaiPGdxqHGCmhulurBQtU6lKuZXVCJMgLR6w21uYg8vMlZdg+3Ya
 q+gz32BUQUtH2cmqF62V6jyqKQyYw
X-Received: by 2002:a67:fe4f:0:b0:45d:b4ae:ddb9 with SMTP id
 m15-20020a67fe4f000000b0045db4aeddb9mr4081985vsr.2.1699527839676; 
 Thu, 09 Nov 2023 03:03:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/PKB7u4hZG7vUEjD4FVPQ4r2OiRrvyLgxkTsj6m7W595bd9b7FYDieBBb/+sfLZB5ri4zKA==
X-Received: by 2002:a67:fe4f:0:b0:45d:b4ae:ddb9 with SMTP id
 m15-20020a67fe4f000000b0045db4aeddb9mr4081949vsr.2.1699527839319; 
 Thu, 09 Nov 2023 03:03:59 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-228-197.dyn.eolo.it.
 [146.241.228.197]) by smtp.gmail.com with ESMTPSA id
 e6-20020ad44426000000b0065afcf19e23sm1949798qvt.62.2023.11.09.03.03.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 03:03:58 -0800 (PST)
Message-ID: <53b5c756ff3387e81796d1859c79276a09328234.camel@redhat.com>
Subject: Re: [RFC PATCH v3 12/12] selftests: add ncdevmem, netcat for devmem
 TCP
From: Paolo Abeni <pabeni@redhat.com>
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Date: Thu, 09 Nov 2023 12:03:54 +0100
In-Reply-To: <20231106024413.2801438-13-almasrymina@google.com>
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-13-almasrymina@google.com>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Eric Dumazet <edumazet@google.com>,
 Shakeel Butt <shakeelb@google.com>, Stanislav Fomichev <sdf@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Shuah Khan <shuah@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 2023-11-05 at 18:44 -0800, Mina Almasry wrote:
> @@ -91,6 +95,7 @@ TEST_PROGS +=3D test_bridge_neigh_suppress.sh
>  TEST_PROGS +=3D test_vxlan_nolocalbypass.sh
>  TEST_PROGS +=3D test_bridge_backup_port.sh
>  TEST_PROGS +=3D fdb_flush.sh
> +TEST_GEN_FILES +=3D ncdevmem

I guess we want something added to TEST_PROGS, too ;)

>  TEST_FILES :=3D settings
> =20
> diff --git a/tools/testing/selftests/net/ncdevmem.c b/tools/testing/selft=
ests/net/ncdevmem.c
> new file mode 100644
> index 000000000000..78bc3ad767ca
> --- /dev/null
> +++ b/tools/testing/selftests/net/ncdevmem.c
> @@ -0,0 +1,546 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#define _GNU_SOURCE
> +#define __EXPORTED_HEADERS__
> +
> +#include <linux/uio.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <unistd.h>
> +#include <stdbool.h>
> +#include <string.h>
> +#include <errno.h>
> +#define __iovec_defined
> +#include <fcntl.h>
> +#include <malloc.h>
> +
> +#include <arpa/inet.h>
> +#include <sys/socket.h>
> +#include <sys/mman.h>
> +#include <sys/ioctl.h>
> +#include <sys/syscall.h>
> +
> +#include <linux/memfd.h>
> +#include <linux/if.h>
> +#include <linux/dma-buf.h>
> +#include <linux/udmabuf.h>
> +#include <libmnl/libmnl.h>
> +#include <linux/types.h>
> +#include <linux/netlink.h>
> +#include <linux/genetlink.h>
> +#include <linux/netdev.h>
> +#include <time.h>
> +
> +#include "netdev-user.h"
> +#include <ynl.h>
> +
> +#define PAGE_SHIFT 12
> +#define TEST_PREFIX "ncdevmem"
> +#define NUM_PAGES 16000
> +
> +#ifndef MSG_SOCK_DEVMEM
> +#define MSG_SOCK_DEVMEM 0x2000000
> +#endif
> +
> +/*
> + * tcpdevmem netcat. Works similarly to netcat but does device memory TC=
P
> + * instead of regular TCP. Uses udmabuf to mock a dmabuf provider.
> + *
> + * Usage:
> + *
> + * * Without validation:
> + *
> + *=09On server:
> + *=09ncdevmem -s <server IP> -c <client IP> -f eth1 -n 0000:06:00.0 -l \
> + *=09=09-p 5201
> + *
> + *=09On client:
> + *=09ncdevmem -s <server IP> -c <client IP> -f eth1 -n 0000:06:00.0 -p 5=
201
> + *
> + * * With Validation:
> + *=09On server:
> + *=09ncdevmem -s <server IP> -c <client IP> -l -f eth1 -n 0000:06:00.0 \
> + *=09=09-p 5202 -v 1
> + *
> + *=09On client:
> + *=09ncdevmem -s <server IP> -c <client IP> -f eth1 -n 0000:06:00.0 -p 5=
202 \
> + *=09=09-v 100000
> + *
> + * Note this is compatible with regular netcat. i.e. the sender or recei=
ver can
> + * be replaced with regular netcat to test the RX or TX path in isolatio=
n.
> + */
> +
> +static char *server_ip =3D "192.168.1.4";
> +static char *client_ip =3D "192.168.1.2";
> +static char *port =3D "5201";
> +static size_t do_validation;
> +static int queue_num =3D 15;
> +static char *ifname =3D "eth1";
> +static char *nic_pci_addr =3D "0000:06:00.0";
> +static unsigned int iterations;
> +
> +void print_bytes(void *ptr, size_t size)
> +{
> +=09unsigned char *p =3D ptr;
> +=09int i;
> +
> +=09for (i =3D 0; i < size; i++) {
> +=09=09printf("%02hhX ", p[i]);
> +=09}
> +=09printf("\n");
> +}
> +
> +void print_nonzero_bytes(void *ptr, size_t size)
> +{
> +=09unsigned char *p =3D ptr;
> +=09unsigned int i;
> +
> +=09for (i =3D 0; i < size; i++)
> +=09=09putchar(p[i]);
> +=09printf("\n");
> +}
> +
> +void validate_buffer(void *line, size_t size)
> +{
> +=09static unsigned char seed =3D 1;
> +=09unsigned char *ptr =3D line;
> +=09int errors =3D 0;
> +=09size_t i;
> +
> +=09for (i =3D 0; i < size; i++) {
> +=09=09if (ptr[i] !=3D seed) {
> +=09=09=09fprintf(stderr,
> +=09=09=09=09"Failed validation: expected=3D%u, actual=3D%u, index=3D%lu\=
n",
> +=09=09=09=09seed, ptr[i], i);
> +=09=09=09errors++;
> +=09=09=09if (errors > 20)
> +=09=09=09=09exit(1);
> +=09=09}
> +=09=09seed++;
> +=09=09if (seed =3D=3D do_validation)
> +=09=09=09seed =3D 0;
> +=09}
> +
> +=09fprintf(stdout, "Validated buffer\n");
> +}
> +
> +static void reset_flow_steering(void)
> +{
> +=09char command[256];
> +
> +=09memset(command, 0, sizeof(command));
> +=09snprintf(command, sizeof(command), "sudo ethtool -K %s ntuple off",
> +=09=09 "eth1");
> +=09system(command);
> +
> +=09memset(command, 0, sizeof(command));
> +=09snprintf(command, sizeof(command), "sudo ethtool -K %s ntuple on",
> +=09=09 "eth1");
> +=09system(command);
> +}
> +
> +static void configure_flow_steering(void)
> +{
> +=09char command[256];
> +
> +=09memset(command, 0, sizeof(command));
> +=09snprintf(command, sizeof(command),
> +=09=09 "sudo ethtool -N %s flow-type tcp4 src-ip %s dst-ip %s src-port %=
s dst-port %s queue %d",
> +=09=09 ifname, client_ip, server_ip, port, port, queue_num);
> +=09system(command);
> +}
> +
> +/* Triggers a driver reset...
> + *
> + * The proper way to do this is probably 'ethtool --reset', but I don't =
have
> + * that supported on my current test bed. I resort to changing this
> + * configuration in the driver which also causes a driver reset...
> + */
> +static void trigger_device_reset(void)
> +{
> +=09char command[256];
> +
> +=09memset(command, 0, sizeof(command));
> +=09snprintf(command, sizeof(command),
> +=09=09 "sudo ethtool --set-priv-flags %s enable-header-split off",
> +=09=09 ifname);
> +=09system(command);
> +
> +=09memset(command, 0, sizeof(command));
> +=09snprintf(command, sizeof(command),
> +=09=09 "sudo ethtool --set-priv-flags %s enable-header-split on",
> +=09=09 ifname);
> +=09system(command);
> +}
> +
> +static int bind_rx_queue(unsigned int ifindex, unsigned int dmabuf_fd,
> +=09=09=09 __u32 *queue_idx, unsigned int n_queue_index,
> +=09=09=09 struct ynl_sock **ys)
> +{
> +=09struct netdev_bind_rx_req *req =3D NULL;
> +=09struct ynl_error yerr;
> +=09int ret =3D 0;
> +
> +=09*ys =3D ynl_sock_create(&ynl_netdev_family, &yerr);
> +=09if (!*ys) {
> +=09=09fprintf(stderr, "YNL: %s\n", yerr.msg);
> +=09=09return -1;
> +=09}
> +
> +=09if (ynl_subscribe(*ys, "mgmt"))
> +=09=09goto err_close;
> +
> +=09req =3D netdev_bind_rx_req_alloc();
> +=09netdev_bind_rx_req_set_ifindex(req, ifindex);
> +=09netdev_bind_rx_req_set_dmabuf_fd(req, dmabuf_fd);
> +=09__netdev_bind_rx_req_set_queues(req, queue_idx, n_queue_index);
> +
> +=09ret =3D netdev_bind_rx(*ys, req);
> +=09if (!ret) {
> +=09=09perror("netdev_bind_rx");
> +=09=09goto err_close;
> +=09}
> +
> +=09netdev_bind_rx_req_free(req);
> +
> +=09return 0;
> +
> +err_close:
> +=09fprintf(stderr, "YNL failed: %s\n", (*ys)->err.msg);
> +=09netdev_bind_rx_req_free(req);
> +=09ynl_sock_destroy(*ys);
> +=09return -1;
> +}
> +
> +static void create_udmabuf(int *devfd, int *memfd, int *buf, size_t dmab=
uf_size)
> +{
> +=09struct udmabuf_create create;
> +=09int ret;
> +
> +=09*devfd =3D open("/dev/udmabuf", O_RDWR);
> +=09if (*devfd < 0) {
> +=09=09fprintf(stderr,
> +=09=09=09"%s: [skip,no-udmabuf: Unable to access DMA "
> +=09=09=09"buffer device file]\n",
> +=09=09=09TEST_PREFIX);
> +=09=09exit(70);
> +=09}
> +
> +=09*memfd =3D memfd_create("udmabuf-test", MFD_ALLOW_SEALING);
> +=09if (*memfd < 0) {
> +=09=09printf("%s: [skip,no-memfd]\n", TEST_PREFIX);
> +=09=09exit(72);
> +=09}
> +
> +=09ret =3D fcntl(*memfd, F_ADD_SEALS, F_SEAL_SHRINK);
> +=09if (ret < 0) {
> +=09=09printf("%s: [skip,fcntl-add-seals]\n", TEST_PREFIX);
> +=09=09exit(73);
> +=09}
> +
> +=09ret =3D ftruncate(*memfd, dmabuf_size);
> +=09if (ret =3D=3D -1) {
> +=09=09printf("%s: [FAIL,memfd-truncate]\n", TEST_PREFIX);
> +=09=09exit(74);
> +=09}
> +
> +=09memset(&create, 0, sizeof(create));
> +
> +=09create.memfd =3D *memfd;
> +=09create.offset =3D 0;
> +=09create.size =3D dmabuf_size;
> +=09*buf =3D ioctl(*devfd, UDMABUF_CREATE, &create);
> +=09if (*buf < 0) {
> +=09=09printf("%s: [FAIL, create udmabuf]\n", TEST_PREFIX);
> +=09=09exit(75);
> +=09}
> +}
> +
> +int do_server(void)
> +{
> +=09char ctrl_data[sizeof(int) * 20000];
> +=09size_t non_page_aligned_frags =3D 0;
> +=09struct sockaddr_in client_addr;
> +=09struct sockaddr_in server_sin;
> +=09size_t page_aligned_frags =3D 0;
> +=09int devfd, memfd, buf, ret;
> +=09size_t total_received =3D 0;
> +=09bool is_devmem =3D false;
> +=09char *buf_mem =3D NULL;
> +=09struct ynl_sock *ys;
> +=09size_t dmabuf_size;
> +=09char iobuf[819200];
> +=09char buffer[256];
> +=09int socket_fd;
> +=09int client_fd;
> +=09size_t i =3D 0;
> +=09int opt =3D 1;
> +
> +=09dmabuf_size =3D getpagesize() * NUM_PAGES;
> +
> +=09create_udmabuf(&devfd, &memfd, &buf, dmabuf_size);
> +
> +=09__u32 *queue_idx =3D malloc(sizeof(__u32) * 2);
> +
> +=09queue_idx[0] =3D 14;
> +=09queue_idx[1] =3D 15;
> +=09if (bind_rx_queue(3 /* index for eth1 */, buf, queue_idx, 2, &ys)) {
                          ^^^^^^^^^^^^^^^^^^^
I guess we want to explicitly fetch the "ifname" index.

Side note: I'm wondering if we could extend some kind of virtual device
to allow single host self-tests? e.g. veth, if that would not cause
excessive bloat in the device driver?

Cheers,

Paolo

