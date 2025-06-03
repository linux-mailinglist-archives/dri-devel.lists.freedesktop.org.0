Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1189EACBE2C
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 03:32:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E9E110E1A1;
	Tue,  3 Jun 2025 01:32:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta22.hihonor.com (mta22.honor.com [81.70.192.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC64B10E1A1
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 01:32:38 +0000 (UTC)
Received: from w001.hihonor.com (unknown [10.68.25.235])
 by mta22.hihonor.com (SkyGuard) with ESMTPS id 4bBCp73SNVzYl04k;
 Tue,  3 Jun 2025 09:30:39 +0800 (CST)
Received: from a010.hihonor.com (10.68.16.52) by w001.hihonor.com
 (10.68.25.235) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 3 Jun
 2025 09:32:35 +0800
Received: from a010.hihonor.com (10.68.16.52) by a010.hihonor.com
 (10.68.16.52) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 3 Jun
 2025 09:32:35 +0800
Received: from a010.hihonor.com ([fe80::7127:3946:32c7:6e]) by
 a010.hihonor.com ([fe80::7127:3946:32c7:6e%14]) with mapi id 15.02.1544.011;
 Tue, 3 Jun 2025 09:32:34 +0800
From: wangtao <tao.wangtao@honor.com>
To: kernel test robot <lkp@intel.com>, "sumit.semwal@linaro.org"
 <sumit.semwal@linaro.org>, "christian.koenig@amd.com"
 <christian.koenig@amd.com>, "kraxel@redhat.com" <kraxel@redhat.com>,
 "vivek.kasireddy@intel.com" <vivek.kasireddy@intel.com>,
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "brauner@kernel.org"
 <brauner@kernel.org>, "hughd@google.com" <hughd@google.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "amir73il@gmail.com"
 <amir73il@gmail.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>, "jstultz@google.com"
 <jstultz@google.com>, "tjmercier@google.com" <tjmercier@google.com>,
 "jack@suse.cz" <jack@suse.cz>, "baolin.wang@linux.alibaba.com"
 <baolin.wang@linux.alibaba.com>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-fsdevel@vger.kernel.org"
 <linux-fsdevel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "wangbintian(BintianWang)" <bintian.wang@honor.com>, yipengxiang
 <yipengxiang@honor.com>, liulu 00013167 <liulu.liu@honor.com>, "hanfeng
 00012985" <feng.han@honor.com>
Subject: RE: [PATCH v3 3/4] udmabuf: Implement udmabuf rw_file callback
Thread-Topic: [PATCH v3 3/4] udmabuf: Implement udmabuf rw_file callback
Thread-Index: AQHb0U9QXzR8zCVG/0iWOLZdee2y5bPqtG6AgAX2EFA=
Date: Tue, 3 Jun 2025 01:32:34 +0000
Message-ID: <dbd3b06611b64900a641a159c12ed37b@honor.com>
References: <20250530103941.11092-4-tao.wangtao@honor.com>
 <202505302235.mDzENMSm-lkp@intel.com>
In-Reply-To: <202505302235.mDzENMSm-lkp@intel.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.163.18.240]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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



> -----Original Message-----
> From: kernel test robot <lkp@intel.com>
> Sent: Friday, May 30, 2025 10:25 PM
> To: wangtao <tao.wangtao@honor.com>; sumit.semwal@linaro.org;
> christian.koenig@amd.com; kraxel@redhat.com; vivek.kasireddy@intel.com;
> viro@zeniv.linux.org.uk; brauner@kernel.org; hughd@google.com;
> akpm@linux-foundation.org; amir73il@gmail.com
> Cc: oe-kbuild-all@lists.linux.dev; benjamin.gaignard@collabora.com;
> Brian.Starkey@arm.com; jstultz@google.com; tjmercier@google.com;
> jack@suse.cz; baolin.wang@linux.alibaba.com; linux-media@vger.kernel.org;
> dri-devel@lists.freedesktop.org; linaro-mm-sig@lists.linaro.org; linux-
> kernel@vger.kernel.org; linux-fsdevel@vger.kernel.org; linux-
> mm@kvack.org; wangbintian(BintianWang) <bintian.wang@honor.com>;
> yipengxiang <yipengxiang@honor.com>; liulu 00013167
> <liulu.liu@honor.com>; hanfeng 00012985 <feng.han@honor.com>; wangtao
> <tao.wangtao@honor.com>
> Subject: Re: [PATCH v3 3/4] udmabuf: Implement udmabuf rw_file callback
>=20
> Hi wangtao,
>=20
> kernel test robot noticed the following build errors:
>=20
> [auto build test ERROR on brauner-vfs/vfs.all] [also build test ERROR on =
next-
> 20250530] [cannot apply to linus/master v6.15] [If your patch is applied =
to the
> wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>=20
> url:    https://github.com/intel-lab-lkp/linux/commits/wangtao/fs-allow-
> cross-FS-copy_file_range-for-memory-backed-files/20250530-184146
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.a=
ll
> patch link:    https://lore.kernel.org/r/20250530103941.11092-4-
> tao.wangtao%40honor.com
> patch subject: [PATCH v3 3/4] udmabuf: Implement udmabuf rw_file callback
> config: sparc64-randconfig-002-20250530 (https://download.01.org/0day-
> ci/archive/20250530/202505302235.mDzENMSm-lkp@intel.com/config)
> compiler: sparc64-linux-gcc (GCC) 15.1.0 reproduce (this is a W=3D1 build=
):
> (https://download.01.org/0day-
> ci/archive/20250530/202505302235.mDzENMSm-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes:
> | https://lore.kernel.org/oe-kbuild-all/202505302235.mDzENMSm-lkp@intel.
> | com/
>=20
> All error/warnings (new ones prefixed by >>):
>=20
Quick note: I don't have local sparc64 compilation setup, so I'll
explicitly add the header dependencies to ensure safety.

Regards,
Wangtao.
>    drivers/dma-buf/udmabuf.c: In function 'udmabuf_rw_file':
> >> drivers/dma-buf/udmabuf.c:298:25: error: storage size of 'iter' isn't
> >> known
>      298 |         struct iov_iter iter;
>          |                         ^~~~
> >> drivers/dma-buf/udmabuf.c:299:45: error: 'ITER_SOURCE' undeclared
> >> (first use in this function)
>      299 |         unsigned int direction =3D is_write ? ITER_SOURCE : IT=
ER_DEST;
>          |                                             ^~~~~~~~~~~
>    drivers/dma-buf/udmabuf.c:299:45: note: each undeclared identifier is
> reported only once for each function it appears in
> >> drivers/dma-buf/udmabuf.c:299:59: error: 'ITER_DEST' undeclared
> >> (first use in this function)
>      299 |         unsigned int direction =3D is_write ? ITER_SOURCE : IT=
ER_DEST;
>          |                                                           ^~~~=
~~~~~
> >> drivers/dma-buf/udmabuf.c:327:17: error: implicit declaration of
> >> function 'iov_iter_bvec'; did you mean 'bvec_iter_bvec'?
> >> [-Wimplicit-function-declaration]
>      327 |                 iov_iter_bvec(&iter, direction, bvec, bv_idx, =
bv_total);
>          |                 ^~~~~~~~~~~~~
>          |                 bvec_iter_bvec
> >> drivers/dma-buf/udmabuf.c:298:25: warning: unused variable 'iter'
> >> [-Wunused-variable]
>      298 |         struct iov_iter iter;
>          |                         ^~~~
>=20
>=20
> vim +298 drivers/dma-buf/udmabuf.c
>=20
>    286
>    287	static ssize_t udmabuf_rw_file(struct dma_buf *dmabuf, loff_t
> my_pos,
>    288				struct file *other, loff_t pos,
>    289				size_t count, bool is_write)
>    290	{
>    291		struct udmabuf *ubuf =3D dmabuf->priv;
>    292		loff_t my_end =3D my_pos + count, bv_beg, bv_end =3D 0;
>    293		pgoff_t pg_idx =3D my_pos / PAGE_SIZE;
>    294		pgoff_t pg_end =3D DIV_ROUND_UP(my_end, PAGE_SIZE);
>    295		size_t i, bv_off, bv_len, bv_num, bv_idx =3D 0, bv_total =3D 0;
>    296		struct bio_vec *bvec;
>    297		struct kiocb kiocb;
>  > 298		struct iov_iter iter;
>  > 299		unsigned int direction =3D is_write ? ITER_SOURCE : ITER_DEST;
>    300		ssize_t ret =3D 0, rw_total =3D 0;
>    301		struct folio *folio;
>    302
>    303		bv_num =3D min_t(size_t, pg_end - pg_idx + 1, 1024);
>    304		bvec =3D kvcalloc(bv_num, sizeof(*bvec), GFP_KERNEL);
>    305		if (!bvec)
>    306			return -ENOMEM;
>    307
>    308		init_sync_kiocb(&kiocb, other);
>    309		kiocb.ki_pos =3D pos;
>    310
>    311		for (i =3D 0; i < ubuf->nr_pinned && my_pos < my_end; i++) {
>    312			folio =3D ubuf->pinned_folios[i];
>    313			bv_beg =3D bv_end;
>    314			bv_end +=3D folio_size(folio);
>    315			if (bv_end <=3D my_pos)
>    316				continue;
>    317
>    318			bv_len =3D min(bv_end, my_end) - my_pos;
>    319			bv_off =3D my_pos - bv_beg;
>    320			my_pos +=3D bv_len;
>    321			bv_total +=3D bv_len;
>    322			bvec_set_page(&bvec[bv_idx], &folio->page, bv_len,
> bv_off);
>    323			if (++bv_idx < bv_num && my_pos < my_end)
>    324				continue;
>    325
>    326			/* start R/W if bvec is full or count reaches zero. */
>  > 327			iov_iter_bvec(&iter, direction, bvec, bv_idx,
> bv_total);
>    328			if (is_write)
>    329				ret =3D other->f_op->write_iter(&kiocb, &iter);
>    330			else
>    331				ret =3D other->f_op->read_iter(&kiocb, &iter);
>    332			if (ret <=3D 0)
>    333				break;
>    334			rw_total +=3D ret;
>    335			if (ret < bv_total || fatal_signal_pending(current))
>    336				break;
>    337
>    338			bv_idx =3D bv_total =3D 0;
>    339		}
>    340		kvfree(bvec);
>    341
>    342		return rw_total > 0 ? rw_total : ret;
>    343	}
>    344
>=20
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
