Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 080DC3A2F8C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 17:41:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C3F16E49B;
	Thu, 10 Jun 2021 15:41:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB8336E49B
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 15:41:23 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15AFUx0K174175;
 Thu, 10 Jun 2021 15:41:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=EPhhRpQ84euKncBIKC14jjTETcSBNCgwbdCuR3muNqQ=;
 b=tWWrL9IxucLQUcxYtAT+jy+dcQI+VNzSm/ahEWj0gIM1SF8wPoCuOqGKi1jHpIbzYR1a
 2MyHGD7+zlcRiNLgbG6dhn2DAAAquGkIi5s3xmPe2q+MWpVp5sRAiT/IlVVtW0o4eSsx
 Mnt3eRXV/gPaQoEMAiv6DCT86AKGzfed7XZAMLCrdcH1Whez/lpUYurMYmNgw3368GtA
 K6i99fiUlreHMpsmXXaZ8/p85l4IJu65fClDa9r+qhtxwvAlnU2/Squ1Npf6X3Pw5t9c
 JYBcKx1w+c3PRG/WHdOggDrmMa4T0ZaL+RjYab+KYnTw/GWV+GuuZ9lfmbELe0teeZu9 Jg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 3900pscdvr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Jun 2021 15:41:22 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15AFVBsK082063;
 Thu, 10 Jun 2021 15:41:22 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3020.oracle.com with ESMTP id 390k1t2wg3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Jun 2021 15:41:22 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15AFc1Pc094019;
 Thu, 10 Jun 2021 15:41:21 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 390k1t2wfy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Jun 2021 15:41:21 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 15AFfKhL028835;
 Thu, 10 Jun 2021 15:41:21 GMT
Received: from kadam (/41.212.42.34) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 10 Jun 2021 08:41:20 -0700
Date: Thu, 10 Jun 2021 18:41:13 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: dri-devel@lists.freedesktop.org
Subject: question about error handling in ttm_bo_handle_move_mem()
Message-ID: <20210610154113.GJ1955@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: tJKsXGMdbUv2fE_3ui9n14wF-Qm0Jtb4
X-Proofpoint-ORIG-GUID: tJKsXGMdbUv2fE_3ui9n14wF-Qm0Jtb4
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10011
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 clxscore=1031
 bulkscore=0 spamscore=0 mlxscore=0 adultscore=0 malwarescore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106100099
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The new version of Firefox seems to trigger a refcounting bug in my
nouveau driver.  I tested a v4.15 kernel and that has the bug as well.
It seems like the refcounting is off if ttm_bo_evict() fails.  Dmesg
at the end.

I tried to see if I could spot anything off and I had a question about
ttm_bo_handle_move_mem().

drivers/gpu/drm/ttm/ttm_bo.c
   230  static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
   231                                    struct ttm_resource *mem, bool ev=
ict,
   232                                    struct ttm_operation_ctx *ctx,
   233                                    struct ttm_place *hop)
   234  {
   235          struct ttm_bo_device *bdev =3D bo->bdev;
   236          struct ttm_resource_manager *old_man =3D ttm_manager_type(b=
dev, bo->mem.mem_type);
   237          struct ttm_resource_manager *new_man =3D ttm_manager_type(b=
dev, mem->mem_type);

old_man and new_man are assigned here.

   238          int ret;
   239 =20
   240          ttm_bo_unmap_virtual(bo);
   241 =20
   242          /*
   243           * Create and bind a ttm if required.
   244           */
   245 =20
   246          if (new_man->use_tt) {
   247                  /* Zero init the new TTM structure if the old locat=
ion should
   248                   * have used one as well.
   249                   */
   250                  ret =3D ttm_tt_create(bo, old_man->use_tt);
   251                  if (ret)
   252                          goto out_err;

This "goto out_err;" is a no-op.  Presumably that is intentional.  I
think if this create succeeds then the error handling is expected to
clean it up?

   253 =20
   254                  if (mem->mem_type !=3D TTM_PL_SYSTEM) {
   255                          ret =3D ttm_tt_populate(bo->bdev, bo->ttm, =
ctx);
   256                          if (ret)
   257                                  goto out_err;
   258                  }
   259          }
   260 =20
   261          ret =3D bdev->driver->move(bo, evict, ctx, mem, hop);

On my system ->move() is returning -EINVAL

   262          if (ret) {
   263                  if (ret =3D=3D -EMULTIHOP)
   264                          return ret;
   265                  goto out_err;
   266          }
   267 =20
   268          ctx->bytes_moved +=3D bo->base.size;
   269          return 0;
   270 =20
   271  out_err:
   272          new_man =3D ttm_manager_type(bdev, bo->mem.mem_type);

This seems like a mistake.  This sets new_man to the same value as
old_man.  I don't understand why it needs to be re-assigned at all
though so maybe I'm missing something.


   273          if (!new_man->use_tt)

This test seems reversed.

Unfortunately, making these changes doesn't fix my crashes and I'm still
investigating.

   274                  ttm_bo_tt_destroy(bo);
   275 =20
   276          return ret;
   277  }

regards,
dan carpenter

[  159.893081] nouveau 0000:01:00.0: Direct firmware load for nouveau/nva8_=
fuc084 failed with error -2
[  159.893089] nouveau 0000:01:00.0: Direct firmware load for nouveau/nva8_=
fuc084d failed with error -2
[  159.893091] nouveau 0000:01:00.0: msvld: unable to load firmware data
[  159.893092] nouveau 0000:01:00.0: msvld: init failed, -19
[ 1945.479861] [TTM] Buffer eviction failed
[ 1945.479883] ------------[ cut here ]------------
[ 1945.479886] refcount_t: underflow; use-after-free.
[ 1945.479900] WARNING: CPU: 7 PID: 2528 at lib/refcount.c:28 refcount_warn=
_saturate+0xa6/0xf0
[ 1945.479914] Modules linked in: bnep(E) ctr(E) ccm(E) cpufreq_conservativ=
e(E) cpufreq_userspace(E) cpufreq_powersave(E) cpufreq_ondemand(E) tun(E) u=
input(E) binfmt_misc(E) ath3k(E) btusb(E) btrtl(E) btbcm(E) btintel(E) blue=
tooth(E) jitterentropy_rng(E) drbg(E) ansi_cprng(E) ecdh_generic(E) ecc(E) =
intel_rapl_msr(E) intel_rapl_common(E) snd_hda_codec_realtek(E) x86_pkg_tem=
p_thermal(E) snd_hda_codec_generic(E) ath9k(E) intel_powerclamp(E) ledtrig_=
audio(E) snd_hda_codec_hdmi(E) coretemp(E) ath9k_common(E) kvm_intel(E) ath=
9k_hw(E) snd_hda_intel(E) snd_intel_dspcfg(E) kvm(E) snd_intel_sdw_acpi(E) =
ath(E) irqbypass(E) snd_hda_codec(E) mac80211(E) snd_hda_core(E) ghash_clmu=
lni_intel(E) snd_hwdep(E) aesni_intel(E) snd_pcm_oss(E) libaes(E) snd_mixer=
_oss(E) crypto_simd(E) dell_smm_hwmon(E) cfg80211(E) cryptd(E) snd_pcm(E) r=
apl(E) iTCO_wdt(E) snd_timer(E) intel_cstate(E) intel_pmc_bxt(E) snd(E) rfk=
ill(E) iTCO_vendor_support(E) intel_uncore(E) pcspkr(E) libarc4(E) soundcor=
e(E) mei_me(E) watchdog(E)
[ 1945.480005]  sg(E) at24(E) mei(E) evdev(E) nfsd(E) loop(E) auth_rpcgss(E=
) msr(E) nfs_acl(E) lockd(E) parport_pc(E) ppdev(E) grace(E) lp(E) parport(=
E) sunrpc(E) fuse(E) configfs(E) ip_tables(E) x_tables(E) autofs4(E) ext4(E=
) crc16(E) mbcache(E) jbd2(E) btrfs(E) blake2b_generic(E) xor(E) raid6_pq(E=
) libcrc32c(E) crc32c_generic(E) ums_realtek(E) uas(E) usb_storage(E) hid_g=
eneric(E) usbhid(E) hid(E) sd_mod(E) sr_mod(E) t10_pi(E) crc_t10dif(E) cdro=
m(E) crct10dif_generic(E) nouveau(E) mxm_wmi(E) wmi(E) i2c_algo_bit(E) drm_=
ttm_helper(E) ttm(E) xhci_pci(E) drm_kms_helper(E) ahci(E) r8169(E) crct10d=
if_pclmul(E) crct10dif_common(E) ehci_pci(E) realtek(E) lpc_ich(E) libahci(=
E) mdio_devres(E) cec(E) xhci_hcd(E) crc32_pclmul(E) libphy(E) ehci_hcd(E) =
crc32c_intel(E) libata(E) i2c_i801(E) i2c_smbus(E) drm(E) scsi_mod(E) usbco=
re(E) fan(E) video(E) button(E)
[ 1945.480157] CPU: 7 PID: 2528 Comm: Xorg Tainted: G            E     5.12=
=2E0+ #1
[ 1945.480164] Hardware name: Dell Inc. XPS 8700/0KWVT8, BIOS A06 11/18/2013
[ 1945.480168] RIP: 0010:refcount_warn_saturate+0xa6/0xf0
[ 1945.480177] Code: 05 b9 e2 3d 01 01 e8 79 e5 42 00 0f 0b c3 80 3d a7 e2 =
3d 01 00 75 95 48 c7 c7 68 61 f2 b1 c6 05 97 e2 3d 01 01 e8 5a e5 42 00 <0f=
> 0b c3 80 3d 86 e2 3d 01 00 0f 85 72 ff ff ff 48 c7 c7 c0 61 f2
[ 1945.480183] RSP: 0018:ffffbba402fd7d30 EFLAGS: 00010286
[ 1945.480188] RAX: 0000000000000000 RBX: 0000000000000002 RCX: ffff9194fed=
d8588
[ 1945.480192] RDX: 00000000ffffffd8 RSI: 0000000000000027 RDI: ffff9194fed=
d8580
[ 1945.480196] RBP: ffff918e03c0d800 R08: 0000000000000000 R09: ffffbba402f=
d7b50
[ 1945.480199] R10: ffffbba402fd7b48 R11: ffffffffb24cc7c8 R12: ffffffffc08=
b4d20
[ 1945.480202] R13: ffff918e00c2e000 R14: ffff918e7e348c00 R15: ffff918e7e3=
48c00
[ 1945.480206] FS:  00007fa1278f0a40(0000) GS:ffff9194fedc0000(0000) knlGS:=
0000000000000000
[ 1945.480211] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1945.480215] CR2: 00007f8c0802f000 CR3: 000000013f4bc003 CR4: 00000000001=
706e0
[ 1945.480219] Call Trace:
[ 1945.480225]  nouveau_gem_new+0xc1/0xf0 [nouveau]
[ 1945.480451]  nouveau_gem_ioctl_new+0x53/0xf0 [nouveau]
[ 1945.480618]  ? nouveau_gem_new+0xf0/0xf0 [nouveau]
[ 1945.480779]  drm_ioctl_kernel+0xaa/0xf0 [drm]
[ 1945.480837]  drm_ioctl+0x20f/0x3a0 [drm]
[ 1945.480883]  ? nouveau_gem_new+0xf0/0xf0 [nouveau]
[ 1945.481058]  nouveau_drm_ioctl+0x55/0xa0 [nouveau]
[ 1945.481233]  __x64_sys_ioctl+0x83/0xb0
[ 1945.481242]  do_syscall_64+0x33/0x80
[ 1945.481251]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[ 1945.481262] RIP: 0033:0x7fa127d5bcc7
[ 1945.481268] Code: 00 00 00 48 8b 05 c9 91 0c 00 64 c7 00 26 00 00 00 48 =
c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 <48=
> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 99 91 0c 00 f7 d8 64 89 01 48
[ 1945.481274] RSP: 002b:00007ffe54852078 EFLAGS: 00000246 ORIG_RAX: 000000=
0000000010
[ 1945.481281] RAX: ffffffffffffffda RBX: 00007ffe548520d0 RCX: 00007fa127d=
5bcc7
[ 1945.481285] RDX: 00007ffe548520d0 RSI: 00000000c0306480 RDI: 00000000000=
00010
[ 1945.481288] RBP: 00000000c0306480 R08: 0000000000000000 R09: 000055e8302=
0e010
[ 1945.481292] R10: 00007fa127e25b80 R11: 0000000000000246 R12: 00007ffe548=
520d0
[ 1945.481296] R13: 0000000000000010 R14: 000055e8302c9fd0 R15: 00000000000=
01000
[ 1945.481302] ---[ end trace 1717583068871a81 ]---
[ 2081.413684] [TTM] Buffer eviction failed


