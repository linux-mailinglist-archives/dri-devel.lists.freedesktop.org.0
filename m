Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA4630A311
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 09:11:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D9E66E42A;
	Mon,  1 Feb 2021 08:11:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-fw-6002.amazon.com (smtp-fw-6002.amazon.com [52.95.49.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5025C6E311
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jan 2021 15:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1612107098; x=1643643098;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=361eNcfAb9g9ZSaxI7ZiqDfl2/qOTTT0U45r7JgDzi0=;
 b=WhNqvkXeOErQQ2mT4vvszT1eev7v6UiPfWO/fQ7y9ouZRUHMu4DZYBRV
 DZhqGYVJS+3W+V73pjq8EnSRgiMwwVUBCh7jz3kvq5/n3mAQPD5/3s+UD
 lBmYkGl1ibnNBpbwDJtay/93T3dfLv9xLmha9IplGoBZFZRnNzXrhKtHu 8=;
X-IronPort-AV: E=Sophos;i="5.79,390,1602547200"; d="scan'208";a="81288272"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1d-474bcd9f.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 31 Jan 2021 15:31:31 +0000
Received: from EX13D19EUB003.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
 by email-inbound-relay-1d-474bcd9f.us-east-1.amazon.com (Postfix) with ESMTPS
 id 8C979A1CC8; Sun, 31 Jan 2021 15:31:27 +0000 (UTC)
Received: from 8c85908914bf.ant.amazon.com (10.43.160.207) by
 EX13D19EUB003.ant.amazon.com (10.43.166.69) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Sun, 31 Jan 2021 15:31:21 +0000
Subject: Re: [PATCH rdma-core v7 4/6] pyverbs: Add dma-buf based MR support
To: Jianxin Xiong <jianxin.xiong@intel.com>, <linux-rdma@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
References: <1611604622-86968-1-git-send-email-jianxin.xiong@intel.com>
 <1611604622-86968-5-git-send-email-jianxin.xiong@intel.com>
From: Gal Pressman <galpress@amazon.com>
Message-ID: <137f406b-d3e0-fdeb-18e7-194a2aed927c@amazon.com>
Date: Sun, 31 Jan 2021 17:31:16 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1611604622-86968-5-git-send-email-jianxin.xiong@intel.com>
Content-Language: en-US
X-Originating-IP: [10.43.160.207]
X-ClientProxiedBy: EX13D50UWA001.ant.amazon.com (10.43.163.46) To
 EX13D19EUB003.ant.amazon.com (10.43.166.69)
X-Mailman-Approved-At: Mon, 01 Feb 2021 08:11:06 +0000
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
Cc: Yishai Hadas <yishaih@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 Edward Srouji <edwards@nvidia.com>,
 Christian Koenig <christian.koenig@amd.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug Ledford <dledford@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/01/2021 21:57, Jianxin Xiong wrote:
> Define a new sub-class of 'MR' that uses dma-buf object for the memory
> region. Define a new class 'DmaBuf' as a wrapper for dma-buf allocation
> mechanism implemented in C.
> 
> Update the cmake function for cython modules to allow building modules
> with mixed cython and c source files.
> 
> Signed-off-by: Jianxin Xiong <jianxin.xiong@intel.com>
> ---
>  buildlib/pyverbs_functions.cmake |  78 +++++++----
>  pyverbs/CMakeLists.txt           |  11 +-
>  pyverbs/dmabuf.pxd               |  15 +++
>  pyverbs/dmabuf.pyx               |  73 ++++++++++
>  pyverbs/dmabuf_alloc.c           | 278 +++++++++++++++++++++++++++++++++++++++
>  pyverbs/dmabuf_alloc.h           |  19 +++
>  pyverbs/libibverbs.pxd           |   2 +
>  pyverbs/mr.pxd                   |   6 +
>  pyverbs/mr.pyx                   | 105 ++++++++++++++-
>  9 files changed, 557 insertions(+), 30 deletions(-)
>  create mode 100644 pyverbs/dmabuf.pxd
>  create mode 100644 pyverbs/dmabuf.pyx
>  create mode 100644 pyverbs/dmabuf_alloc.c
>  create mode 100644 pyverbs/dmabuf_alloc.h
> 
> diff --git a/buildlib/pyverbs_functions.cmake b/buildlib/pyverbs_functions.cmake
> index 953cec2..0792410 100644
> --- a/buildlib/pyverbs_functions.cmake
> +++ b/buildlib/pyverbs_functions.cmake
> @@ -1,35 +1,61 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR Linux-OpenIB)
>  # Copyright (c) 2018, Mellanox Technologies. All rights reserved.  See COPYING file
> +# Copyright (c) 2020, Intel Corporation. All rights reserved.  See COPYING file
> +
> +function(build_module_from_cfiles PY_MODULE MODULE_NAME ALL_CFILES LINKER_FLAGS)
> +  string(REGEX REPLACE "\\.so$" "" SONAME "${MODULE_NAME}${CMAKE_PYTHON_SO_SUFFIX}")
> +  add_library(${SONAME} SHARED ${ALL_CFILES})
> +  set_target_properties(${SONAME} PROPERTIES
> +    COMPILE_FLAGS "${CMAKE_C_FLAGS} -fPIC -fno-strict-aliasing -Wno-unused-function -Wno-redundant-decls -Wno-shadow -Wno-cast-function-type -Wno-implicit-fallthrough -Wno-unknown-warning -Wno-unknown-warning-option -Wno-deprecated-declarations ${NO_VAR_TRACKING_FLAGS}"
> +    LIBRARY_OUTPUT_DIRECTORY "${BUILD_PYTHON}/${PY_MODULE}"
> +    PREFIX "")
> +  target_link_libraries(${SONAME} LINK_PRIVATE ${PYTHON_LIBRARIES} ibverbs rdmacm ${LINKER_FLAGS})
> +  install(TARGETS ${SONAME}
> +    DESTINATION ${CMAKE_INSTALL_PYTHON_ARCH_LIB}/${PY_MODULE})
> +endfunction()
>  
>  function(rdma_cython_module PY_MODULE LINKER_FLAGS)
> -  foreach(PYX_FILE ${ARGN})
> -    get_filename_component(FILENAME ${PYX_FILE} NAME_WE)
> -    get_filename_component(DIR ${PYX_FILE} DIRECTORY)
> -	if (DIR)
> -		set(PYX "${CMAKE_CURRENT_SOURCE_DIR}/${DIR}/${FILENAME}.pyx")
> -	else()
> -	    set(PYX "${CMAKE_CURRENT_SOURCE_DIR}/${FILENAME}.pyx")
> -	endif()
> -    set(CFILE "${CMAKE_CURRENT_BINARY_DIR}/${FILENAME}.c")
> -    include_directories(${PYTHON_INCLUDE_DIRS})
> -    add_custom_command(
> -      OUTPUT "${CFILE}"
> -      MAIN_DEPENDENCY "${PYX}"
> -      COMMAND ${CYTHON_EXECUTABLE} "${PYX}" -o "${CFILE}"
> -      "-I${PYTHON_INCLUDE_DIRS}"
> -      COMMENT "Cythonizing ${PYX}"
> +  set(ALL_CFILES "")
> +  set(MODULE_NAME "")
> +  foreach(SRC_FILE ${ARGN})
> +    get_filename_component(FILENAME ${SRC_FILE} NAME_WE)
> +    get_filename_component(DIR ${SRC_FILE} DIRECTORY)
> +    get_filename_component(EXT ${SRC_FILE} EXT)
> +    if (DIR)
> +      set(SRC_PATH "${CMAKE_CURRENT_SOURCE_DIR}/${DIR}")
> +    else()
> +      set(SRC_PATH "${CMAKE_CURRENT_SOURCE_DIR}")
> +    endif()
> +    if (${EXT} STREQUAL ".pyx")
> +      # each .pyx file starts a new module, finish the previous module first
> +      if (ALL_CFILES AND MODULE_NAME)
> +        build_module_from_cfiles(${PY_MODULE} ${MODULE_NAME} "${ALL_CFILES}" "${LINKER_FLAGS}")
> +      endif()
> +      set(PYX "${SRC_PATH}/${FILENAME}.pyx")
> +      set(CFILE "${CMAKE_CURRENT_BINARY_DIR}/${FILENAME}.c")
> +      include_directories(${PYTHON_INCLUDE_DIRS})
> +      add_custom_command(
> +        OUTPUT "${CFILE}"
> +        MAIN_DEPENDENCY "${PYX}"
> +        COMMAND ${CYTHON_EXECUTABLE} "${PYX}" -o "${CFILE}"
> +        "-I${PYTHON_INCLUDE_DIRS}"
> +        COMMENT "Cythonizing ${PYX}"
>        )
> -
> -    string(REGEX REPLACE "\\.so$" "" SONAME "${FILENAME}${CMAKE_PYTHON_SO_SUFFIX}")
> -    add_library(${SONAME} SHARED ${CFILE})
> -    set_target_properties(${SONAME} PROPERTIES
> -      COMPILE_FLAGS "${CMAKE_C_FLAGS} -fPIC -fno-strict-aliasing -Wno-unused-function -Wno-redundant-decls -Wno-shadow -Wno-cast-function-type -Wno-implicit-fallthrough -Wno-unknown-warning -Wno-unknown-warning-option -Wno-deprecated-declarations ${NO_VAR_TRACKING_FLAGS}"
> -      LIBRARY_OUTPUT_DIRECTORY "${BUILD_PYTHON}/${PY_MODULE}"
> -      PREFIX "")
> -    target_link_libraries(${SONAME} LINK_PRIVATE ${PYTHON_LIBRARIES} ibverbs rdmacm ${LINKER_FLAGS})
> -    install(TARGETS ${SONAME}
> -      DESTINATION ${CMAKE_INSTALL_PYTHON_ARCH_LIB}/${PY_MODULE})
> +      set(MODULE_NAME ${FILENAME})
> +      set(ALL_CFILES "${CFILE}")
> +    elseif(${EXT} STREQUAL ".c")
> +      # .c files belong to the same module as the most recent .pyx file,
> +      # ignored if appearing before all .pyx files
> +      set(CFILE "${SRC_PATH}/${FILENAME}.c")
> +      set(ALL_CFILES "${ALL_CFILES};${CFILE}")
> +    else()
> +      continue()
> +    endif()
>    endforeach()
> +  # finish the last module
> +  if (ALL_CFILES AND MODULE_NAME)
> +    build_module_from_cfiles(${PY_MODULE} ${MODULE_NAME} "${ALL_CFILES}" "${LINKER_FLAGS}")
> +  endif()
>  endfunction()
>  
>  function(rdma_python_module PY_MODULE)
> diff --git a/pyverbs/CMakeLists.txt b/pyverbs/CMakeLists.txt
> index 9542c4b..6fd7625 100644
> --- a/pyverbs/CMakeLists.txt
> +++ b/pyverbs/CMakeLists.txt
> @@ -1,5 +1,10 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR Linux-OpenIB)
>  # Copyright (c) 2019, Mellanox Technologies. All rights reserved. See COPYING file
> +# Copyright (c) 2020, Intel Corporation. All rights reserved. See COPYING file
> +
> +publish_internal_headers(""
> +  dmabuf_alloc.h
> +)
>  
>  rdma_cython_module(pyverbs ""
>    addr.pyx
> @@ -8,15 +13,17 @@ rdma_cython_module(pyverbs ""
>    cmid.pyx
>    cq.pyx
>    device.pyx
> +  dmabuf.pyx
> +  dmabuf_alloc.c
>    enums.pyx
>    mem_alloc.pyx
>    mr.pyx
>    pd.pyx
>    qp.pyx
> +  srq.pyx
>    wr.pyx
>    xrcd.pyx
> -  srq.pyx
> -  )
> +)
>  
>  rdma_python_module(pyverbs
>    __init__.py
> diff --git a/pyverbs/dmabuf.pxd b/pyverbs/dmabuf.pxd
> new file mode 100644
> index 0000000..a063acb
> --- /dev/null
> +++ b/pyverbs/dmabuf.pxd
> @@ -0,0 +1,15 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR Linux-OpenIB)
> +# Copyright (c) 2020, Intel Corporation. All rights reserved. See COPYING file
> +
> +#cython: language_level=3
> +
> +cdef class DmaBuf:
> +    cdef int drm_fd
> +    cdef int handle
> +    cdef int fd
> +    cdef unsigned long size
> +    cdef unsigned long map_offset
> +    cdef void *dmabuf
> +    cdef object dmabuf_mrs
> +    cdef add_ref(self, obj)
> +    cpdef close(self)
> diff --git a/pyverbs/dmabuf.pyx b/pyverbs/dmabuf.pyx
> new file mode 100644
> index 0000000..b9406bd
> --- /dev/null
> +++ b/pyverbs/dmabuf.pyx
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR Linux-OpenIB)
> +# Copyright (c) 2020, Intel Corporation. All rights reserved. See COPYING file
> +
> +#cython: language_level=3
> +
> +import weakref
> +
> +from pyverbs.base cimport close_weakrefs
> +from pyverbs.base import PyverbsRDMAErrno
> +from pyverbs.mr cimport DmaBufMR
> +
> +cdef extern from "dmabuf_alloc.h":
> +    cdef struct dmabuf:
> +        pass
> +    dmabuf *dmabuf_alloc(unsigned long size, int unit, int gtt)
> +    void dmabuf_free(dmabuf *dmabuf)
> +    int dmabuf_get_drm_fd(dmabuf *dmabuf)
> +    int dmabuf_get_fd(dmabuf *dmabuf)
> +    unsigned long dmabuf_get_offset(dmabuf *dmabuf)
> +
> +
> +cdef class DmaBuf:
> +    def __init__(self, size, unit=0, gtt=0):
> +        """
> +        Allocate DmaBuf object from a GPU device. This is done through the
> +        DRI device interface. Usually this requires the effective user id
> +        being a member of the 'render' group.
> +        :param size: The size (in number of bytes) of the buffer.
> +        :param unit: The unit number of the GPU to allocate the buffer from.
> +        :param gtt: Allocate from GTT instead of VRAM.
> +        :return: The newly created DmaBuf object on success.
> +        """
> +        self.dmabuf_mrs = weakref.WeakSet()
> +        self.dmabuf = dmabuf_alloc(size, unit, gtt)
> +        if self.dmabuf == NULL:
> +            raise PyverbsRDMAErrno(f'Failed to allocate dmabuf of size {size} on unit {unit}')
> +        self.drm_fd = dmabuf_get_drm_fd(<dmabuf *>self.dmabuf)
> +        self.fd = dmabuf_get_fd(<dmabuf *>self.dmabuf)
> +        self.map_offset = dmabuf_get_offset(<dmabuf *>self.dmabuf)
> +
> +    def __dealloc__(self):
> +        self.close()
> +
> +    cpdef close(self):
> +        if self.dmabuf == NULL:
> +            return None
> +        close_weakrefs([self.dmabuf_mrs])
> +        dmabuf_free(<dmabuf *>self.dmabuf)
> +        self.dmabuf = NULL
> +
> +    cdef add_ref(self, obj):
> +        if isinstance(obj, DmaBufMR):
> +            self.dmabuf_mrs.add(obj)
> +
> +    @property
> +    def drm_fd(self):
> +        return self.drm_fd
> +
> +    @property
> +    def handle(self):
> +        return self.handle
> +
> +    @property
> +    def fd(self):
> +        return self.fd
> +
> +    @property
> +    def size(self):
> +        return self.size
> +
> +    @property
> +    def map_offset(self):
> +        return self.map_offset
> diff --git a/pyverbs/dmabuf_alloc.c b/pyverbs/dmabuf_alloc.c
> new file mode 100644
> index 0000000..05eae75
> --- /dev/null
> +++ b/pyverbs/dmabuf_alloc.c
> @@ -0,0 +1,278 @@
> +// SPDX-License-Identifier: GPL-2.0 OR Linux-OpenIB
> +/*
> + * Copyright 2020 Intel Corporation. All rights reserved. See COPYING file
> + */
> +
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <stdint.h>
> +#include <unistd.h>
> +#include <string.h>
> +#include <errno.h>
> +#include <drm/drm.h>
> +#include <drm/i915_drm.h>
> +#include <drm/amdgpu_drm.h>
> +#include <drm/radeon_drm.h>

I assume these should come from the kernel headers package, right?
We're getting new compilation errors on SLES 15 for some reason, although the
package is installed.

FAILED: pyverbs/CMakeFiles/dmabuf.cpython-36m-x86_64-linux-gnu.dir/dmabuf_alloc.c.o 
/usr/bin/cc -Ddmabuf_cpython_36m_x86_64_linux_gnu_EXPORTS -Iinclude -I/usr/include/libnl3 -I/usr/include/python3.6m -Wall -Wextra -Wno-sign-compare -Wno-unused-parameter -Wmissing-prototypes -Wmissing-declarations -Wwrite-strings -Wformat=2 -Wformat-nonliteral -Wdate-time -Wnested-externs -Wshadow -Wstrict-prototypes -Wold-style-definition -Wredundant-decls -O2 -g  -fPIC    -Wall -Wextra -Wno-sign-compare -Wno-unused-parameter -Wmissing-prototypes -Wmissing-declarations -Wwrite-strings -Wformat=2 -Wformat-nonliteral -Wdate-time -Wnested-externs -Wshadow -Wstrict-prototypes -Wold-style-definition -Wredundant-decls -fPIC -fno-strict-aliasing -Wno-unused-function -Wno-redundant-decls -Wno-shadow -Wno-cast-function-type -Wno-implicit-fallthrough -Wno-unknown-warning -Wno-unknown-warning-option -Wno-deprecated-declarations  -fno-var-tracking-assignments -std=gnu11 -MD -MT pyverbs/CMakeFiles/dmabuf.cpython-36m-x86_64-linux-gnu.dir/dmabuf_alloc.c.o -MF pyverbs/CMakeFiles/dmabuf.cpython-36m-
 x86_64-linux-gnu.dir/dmabuf_alloc.c.o.d -o pyverbs/CMakeFiles/dmabuf.cpython-36m-x86_64-linux-gnu.dir/dmabuf_alloc.c.o   -c ../pyverbs/dmabuf_alloc.c
 ../pyverbs/dmabuf_alloc.c:12:10: fatal error: drm/drm.h: No such file or directory
  #include <drm/drm.h>
           ^~~~~~~~~~~
 compilation terminated.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
