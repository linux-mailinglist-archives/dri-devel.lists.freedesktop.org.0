Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E1F85B52C
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 09:29:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C8F410E1D0;
	Tue, 20 Feb 2024 08:29:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="QSjjaxui";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C1A310E106
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 23:45:38 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4TdzgM2NHHz9sm9;
 Tue, 20 Feb 2024 00:45:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1708386335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=JM034RwnZ2OkJfAcWcw+lAdAUT4xo3jQQu7svpkcxhw=;
 b=QSjjaxui77bKzN8HDe8Iok1+eKhgbSqHvl/xD6tL2FS5fKriGnsOULW6VW7Reo516Pn5Wu
 5lwG6Dno9pRE8aGLWtykLV4M5FPFE3dnJvtecUOTSL7bboTPwyVeLOy6gQoTZ923xamKaD
 EqQHgtkJGUh6roNQxmBvtqWpOfZ1BsE1h2sb1eXv0HpqPt53amAze1BFT3bYeSLFUTuY9O
 NNahdD/4afmAmQXIVd1ww/ZNCB28NwTLlfs80wBzQGgKkX2Qo57LNN1En1wP7SS8SbuYec
 /YQVtpFROBvIe3PV0kcXU/Dt0L/I4+Pn3qfuWgRWiY7YqRjdNYZAFUrUIE/JoA==
Date: Tue, 20 Feb 2024 00:45:31 +0100
From: Erhard Furtner <erhard_f@mailbox.org>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Subject: drm_format_helper_test fails Subtest:
 drm_test_fb_xrgb8888_to_xrgb2101010 on Big Endian machines (kernel 6.7.5,
 ppc64)
Message-ID: <20240220004531.5c6e5b38@yea>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/BOGJpdxgz_1o5Jmtf4+ozve"
X-MBO-RS-ID: c37abd1cf8d1fb51c98
X-MBO-RS-META: w33denhbo885hjsjxwegg6faz93bm9i7
X-Mailman-Approved-At: Tue, 20 Feb 2024 08:29:41 +0000
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

--MP_/BOGJpdxgz_1o5Jmtf4+ozve
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Greetings!

I ran some kernel drm/ttm unit tests to check for quirks in the drm/ttm subsystem. One thing I found out that the drm_format_helper_test fails Subtest: drm_test_fb_xrgb8888_to_xrgb2101010 on my Talos II (ppc64) which I run in BigEndian mode:

[...]
         KTAP version 1
         # Subtest: drm_test_fb_xrgb8888_to_xrgb2101010
     # drm_test_fb_xrgb8888_to_xrgb2101010: EXPECTATION FAILED at drivers/gpu/drm/tests/drm_format_helper_test.c:995
     Expected buf == result->expected, but
         buf ==
         <00><00><f0><3f>
         result->expected ==
         <3f><f0><00><00>
         not ok 1 single_pixel_source_buffer
     # drm_test_fb_xrgb8888_to_xrgb2101010: EXPECTATION FAILED at drivers/gpu/drm/tests/drm_format_helper_test.c:995
     Expected buf == result->expected, but
         buf ==
         <00><00><f0><3f>
         result->expected ==
         <3f><f0><00><00>
         not ok 2 single_pixel_clip_rectangle
     # drm_test_fb_xrgb8888_to_xrgb2101010: EXPECTATION FAILED at drivers/gpu/drm/tests/drm_format_helper_test.c:995
     Expected buf == result->expected, but
         buf ==
         <ff> ff  ff <3f> 00  00  00  00 <00><00><f0><3f> 00 <fc><0f> 00 
         <ff><03><00><00><ff><03><f0><3f><00><fc><ff><3f><ff><ff><0f><00>
         result->expected ==
         <3f> ff  ff <ff> 00  00  00  00 <3f><f0><00><00> 00 <0f><fc> 00 
         <00><00><03><ff><3f><f0><03><ff><3f><ff><fc><00><00><0f><ff><ff>
         not ok 3 well_known_colors
     # drm_test_fb_xrgb8888_to_xrgb2101010: EXPECTATION FAILED at drivers/gpu/drm/tests/drm_format_helper_test.c:995
     Expected buf == result->expected, but
         buf ==
         <72><46><84><03><14><d4><44><04><0c><3c><2f><2a> 00  00  00  00 
          00  00  00  00 <cd><0d><1f><1b><72><46><84><03><14><d4><44><04>
          00  00  00  00  00  00  00  00 <0c><30><20><2a><cd><0d><1f><1b>
         <72><46><84><03> 00  00  00  00  00  00  00  00 
         result->expected ==
         <03><84><46><72><04><44><d4><14><2a><2f><3c><0c> 00  00  00  00 
          00  00  00  00 <1b><1f><0d><cd><03><84><46><72><04><44><d4><14>
          00  00  00  00  00  00  00  00 <2a><20><30><0c><1b><1f><0d><cd>
         <03><84><46><72> 00  00  00  00  00  00  00  00 
         not ok 4 destination_pitch
     # drm_test_fb_xrgb8888_to_xrgb2101010: pass:0 fail:4 skip:0 total:4
     not ok 9 drm_test_fb_xrgb8888_to_xrgb2101010
[...]

Looking at these results I suspect this to be an endian issue, probably affecting other BE arches too.

Full dmesg + kernel .config attached.

Regards,
Erhard F.

--MP_/BOGJpdxgz_1o5Jmtf4+ozve
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=dmesg_675_p9.txt

[    6.569285] netconsole: network logging started
[    0.000000] entry-flush: disabled on command line.
[    6.604859] clk: Disabling unused clocks
[    6.652263] BTRFS: device label p9 devid 1 transid 245684 /dev/root scanned by swapper/0 (1)
[    6.688197] BTRFS info (device nvme0n1p3): first mount of filesystem 691e8915-055d-43f2-b80d-c130a54ba4b6
[    6.723675] BTRFS info (device nvme0n1p3): using xxhash64 (xxhash64-generic) checksum algorithm
[    6.759242] BTRFS info (device nvme0n1p3): using free space tree
[    6.795316] BTRFS warning (device nvme0n1p3): tree block not nodesize aligned, start 127231512576 nodesize 16384, can be resolved by a full metadata balance
[    6.921590] BTRFS info (device nvme0n1p3): enabling ssd optimizations
[    6.958653] BTRFS info (device nvme0n1p3): auto enabling async discard
[    7.009878] VFS: Mounted root (btrfs filesystem) readonly on device 0:16.
[    7.047594] devtmpfs: mounted
[    7.084256] Freeing unused kernel image (initmem) memory: 2548K
[    7.365588] Checked W+X mappings: passed, no W+X pages found
[    7.401459] rodata_test: all tests were successful
[    7.437173] Run /sbin/init as init process
[    7.612701] systemd[1]: systemd 254 running in system mode (+PAM -AUDIT -SELINUX -APPARMOR +IMA +SMACK +SECCOMP -GCRYPT +GNUTLS +OPENSSL +ACL +BLKID -CURL +ELFUTILS -FIDO2 +IDN2 -IDN -IPTC +KMOD +LIBCRYPTSETUP +LIBFDISK +PCRE2 -PWQUALITY -P11KIT -QRENCODE -TPM2 -BZIP2 -LZ4 -XZ -ZLIB +ZSTD -BPF_FRAMEWORK -XKBCOMMON +UTMP -SYSVINIT default-hierarchy=unified)
[    7.725414] systemd[1]: Detected architecture ppc64.
[    7.872379] systemd[1]: Hostname set to <T1000>.
[    7.975001] systemd-gpt-auto-generator[305]: File system behind root file system is reported by btrfs to be backed by pseudo-device /dev/root, which is not a valid userspace accessible device node. Cannot determine correct backing block device.
[    8.052296] (sd-execu[297]: /lib/systemd/system-generators/systemd-gpt-auto-generator failed with exit status 1.
[    8.241915] systemd[1]: Queued start job for default target graphical.target.
[    8.301649] systemd[1]: Created slice system-getty.slice.
[    8.382246] systemd[1]: Created slice system-modprobe.slice.
[    8.463667] systemd[1]: Created slice system-serial\x2dgetty.slice.
[    8.546459] systemd[1]: Created slice system-systemd\x2dfsck.slice.
[    8.629036] systemd[1]: Created slice system-vncserver.slice.
[    8.712317] systemd[1]: Created slice user.slice.
[    8.795976] systemd[1]: Started systemd-ask-password-console.path.
[    8.881846] systemd[1]: Started systemd-ask-password-wall.path.
[    8.969220] systemd[1]: Set up automount proc-sys-fs-binfmt_misc.automount.
[    9.058103] systemd[1]: Expecting device dev-disk-by\x2dlabel-boot.device...
[    9.148783] systemd[1]: Expecting device dev-disk-by\x2dlabel-swap.device...
[    9.240942] systemd[1]: Expecting device dev-hvc0.device...
[    9.331614] systemd[1]: Reached target cryptsetup.target.
[    9.421730] systemd[1]: Reached target integritysetup.target.
[    9.509978] systemd[1]: Reached target paths.target.
[    9.598394] systemd[1]: Reached target remote-fs.target.
[    9.686688] systemd[1]: Reached target slices.target.
[    9.775137] systemd[1]: Reached target veritysetup.target.
[    9.866223] systemd[1]: Listening on systemd-coredump.socket.
[    9.951998] systemd[1]: Listening on systemd-journald-dev-log.socket.
[   10.036715] systemd[1]: Listening on systemd-journald.socket.
[   10.123186] systemd[1]: Listening on systemd-networkd.socket.
[   10.210362] systemd[1]: Listening on systemd-udevd-control.socket.
[   10.295173] systemd[1]: Listening on systemd-udevd-kernel.socket.
[   10.410766] systemd[1]: Mounting dev-hugepages.mount...
[   10.496341] systemd[1]: Mounting dev-mqueue.mount...
[   10.582298] systemd[1]: Mounting sys-kernel-debug.mount...
[   10.665351] systemd[1]: sys-kernel-tracing.mount was skipped because of an unmet condition check (ConditionPathExists=/sys/kernel/tracing).
[   10.751412] systemd[1]: Starting kmod-static-nodes.service...
[   10.838014] systemd[1]: Starting modprobe@configfs.service...
[   10.925779] systemd[1]: Starting modprobe@dm_mod.service...
[   10.982976] device-mapper: uevent: version 1.0.3
[   10.984123] device-mapper: ioctl: 4.48.0-ioctl (2023-03-01) initialised: dm-devel@redhat.com
[   11.097933] systemd[1]: Starting modprobe@drm.service...
[   11.183583] systemd[1]: Starting modprobe@fuse.service...
[   11.268287] systemd[1]: Starting modprobe@loop.service...
[   11.331038] loop: module loaded
[   11.392740] systemd[1]: Starting systemd-fsck-root.service...
[   11.478530] systemd[1]: Starting systemd-journald.service...
[   11.549876] systemd-journald[335]: Collecting audit messages is disabled.
[   11.604726] systemd[1]: Starting systemd-modules-load.service...
[   11.661562] powernv-cpufreq: cpufreq pstate min 0x63 nominal 0x42 max 0x0
[   11.661566] powernv-cpufreq: Workload Optimized Frequency is enabled in the platform
[   11.666712] Asymmetric key parser 'pkcs8' registered
[   11.844428] systemd[1]: Starting systemd-udev-trigger.service...
[   11.929390] systemd[1]: Starting zram_var_tmp.service...
[   11.983299] zram: Added device: zram0
[   11.983478] zram: Added device: zram1
[   11.983649] zram: Added device: zram2
[   12.032912] zram1: detected capacity change from 0 to 100663296
[   12.175794] systemd[1]: Started systemd-journald.service.
[   13.674450] BTRFS info (device nvme0n1p3: state M): use zstd compression, level 1
[   13.875518] systemd-journald[335]: Received client request to flush runtime journal.
[   13.894165] EXT4-fs (zram1): mounting ext2 file system using the ext4 subsystem
[   13.897187] EXT4-fs (zram1): mounted filesystem 063820dd-15e5-43b1-8e13-b974c6aadadf r/w without journal. Quota mode: disabled.
[   14.062697] systemd-journald[335]: /var/log/journal/3f89104fd8e846edb53c46af433b901e/system.journal: Journal file uses a different sequence number ID, rotating.
[   14.062706] systemd-journald[335]: Rotating system journal.
[   14.535782] tg3 0004:01:00.1 enP4p1s0f1: renamed from eth1
[   14.624261] tg3 0004:01:00.0 enP4p1s0f0: renamed from eth0 (while UP)
[   14.677517] at24 0-0050: 65536 byte 24c512 EEPROM, writable, 1 bytes/write
[   14.683239] 6 fixed-partitions partitions found on MTD device flash@0
[   14.690192] usbcore: registered new interface driver usbfs
[   14.690285] usbcore: registered new interface driver hub
[   14.690418] usbcore: registered new device driver usb
[   14.754585] at24 2-0050: 16384 byte 24c128 EEPROM, writable, 1 bytes/write
[   14.768667] Creating 6 MTD partitions on "flash@0":
[   14.774427] [drm] radeon kernel modesetting enabled.
[   14.774617] radeon 0033:01:00.0: enabling device (0140 -> 0142)
[   14.776755] [drm] initializing kernel modesetting (RV515 0x1002:0x7183 0x1028:0x0302 0x00).
[   14.776774] [drm:radeon_device_init [radeon]] *ERROR* Unable to find PCI I/O BAR
[   14.776833] radeon 0033:01:00.0: Invalid PCI ROM header signature: expecting 0xaa55, got 0x0000
[   14.812492] [drm:radeon_atombios_init [radeon]] *ERROR* Unable to find PCI I/O BAR; using MMIO for ATOM IIO
[   14.821841] at24 3-0050: 256 byte spd EEPROM, read-only
[   14.822198] at24 3-0052: 256 byte spd EEPROM, read-only
[   14.822524] at24 4-0054: 256 byte spd EEPROM, read-only
[   14.822874] at24 4-0056: 256 byte spd EEPROM, read-only
[   14.823137] at24 5-0050: 65536 byte 24c512 EEPROM, writable, 1 bytes/write
[   14.833448] 0x000000000000-0x000004000000 : "PNOR"
[   14.862046] ATOM BIOS: 113
[   14.873454] at24 7-0050: 256 byte spd EEPROM, read-only
[   14.874160] at24 7-0052: 256 byte spd EEPROM, read-only
[   14.874850] at24 8-0054: 256 byte spd EEPROM, read-only
[   14.875587] at24 8-0056: 256 byte spd EEPROM, read-only
[   14.894286] 0x000001b21000-0x000003921000 : "BOOTKERNEL"
[   14.920914] xhci_hcd 0003:01:00.0: xHCI Host Controller
[   14.920941] xhci_hcd 0003:01:00.0: new USB bus registered, assigned bus number 1
[   14.921109] xhci_hcd 0003:01:00.0: hcc params 0x0270f06d hci version 0x96 quirks 0x0000000004000000
[   14.921834] xhci_hcd 0003:01:00.0: xHCI Host Controller
[   14.921842] xhci_hcd 0003:01:00.0: new USB bus registered, assigned bus number 2
[   14.921851] xhci_hcd 0003:01:00.0: Host supports USB 3.0 SuperSpeed
[   14.921990] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.07
[   14.921994] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[   14.921997] usb usb1: Product: xHCI Host Controller
[   14.922000] usb usb1: Manufacturer: Linux 6.7.5-gentoo-P9 xhci-hcd
[   14.922002] usb usb1: SerialNumber: 0003:01:00.0
[   14.922448] hub 1-0:1.0: USB hub found
[   14.922476] hub 1-0:1.0: 4 ports detected
[   14.923011] usb usb2: We don't know the algorithms for LPM for this host, disabling LPM.
[   14.923151] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 6.07
[   14.923158] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[   14.923162] usb usb2: Product: xHCI Host Controller
[   14.923165] usb usb2: Manufacturer: Linux 6.7.5-gentoo-P9 xhci-hcd
[   14.923168] usb usb2: SerialNumber: 0003:01:00.0
[   14.923562] hub 2-0:1.0: USB hub found
[   14.923593] hub 2-0:1.0: 4 ports detected
[   14.927114] [drm] Generation 2 PCI interface, using max accessible memory
[   14.960429] 0x000003a44000-0x000003a68000 : "CAPP"
[   14.995366] radeon 0033:01:00.0: VRAM: 256M 0x0000000000000000 - 0x000000000FFFFFFF (256M used)
[   14.995371] radeon 0033:01:00.0: GTT: 512M 0x0000000010000000 - 0x000000002FFFFFFF
[   14.995476] [drm] Detected VRAM RAM=256M, BAR=256M
[   15.030955] 0x000003a88000-0x000003a89000 : "VERSION"
[   15.067739] [drm] RAM width 128bits DDR
[   15.067743] radeon 0033:01:00.0: dma_iommu_get_required_mask: returning bypass mask 0xfffffffffffffff
[   15.105455] 0x000003a89000-0x000003ac9000 : "IMA_CATALOG"
[   15.143950] [drm] radeon: 256M of VRAM memory ready
[   15.179779] usb 1-1: new high-speed USB device number 2 using xhci_hcd
[   15.181966] 0x000003e10000-0x000004000000 : "BOOTKERNFW"
[   15.218812] [drm] radeon: 512M of GTT memory ready.
[   15.326257] usb 1-1: New USB device found, idVendor=05e3, idProduct=0610, bcdDevice=32.98
[   15.330893] [drm] GART: num cpu pages 131072, num gpu pages 131072
[   15.366434] usb 1-1: New USB device strings: Mfr=0, Product=1, SerialNumber=0
[   15.366439] usb 1-1: Product: USB2.0 Hub
[   15.378454] hub 1-1:1.0: USB hub found
[   15.406045] [drm] radeon: 1 quad pipes, 1 z pipes initialized.
[   15.440769] hub 1-1:1.0: 4 ports detected
[   15.486078] [drm] PCIE GART of 512M enabled (table at 0x0000000000040000).
[   15.653113] usb 1-4: new high-speed USB device number 3 using xhci_hcd
[   15.656075] radeon 0033:01:00.0: WB enabled
[   15.836266] usb 1-4: New USB device found, idVendor=05e3, idProduct=0610, bcdDevice=32.98
[   15.860269] radeon 0033:01:00.0: fence driver on ring 0 use gpu addr 0x0000000010000000
[   15.891534] usb 1-4: New USB device strings: Mfr=0, Product=1, SerialNumber=0
[   15.909760] usb 1-1.1: new low-speed USB device number 4 using xhci_hcd
[   15.925608] radeon 0033:01:00.0: radeon: MSI limited to 32-bit
[   15.954577] usb 1-4: Product: USB2.0 Hub
[   15.986787] [drm] radeon: irq initialized.
[   16.034635] hub 1-4:1.0: USB hub found
[   16.049295] usb 1-1.1: New USB device found, idVendor=04d9, idProduct=0006, bcdDevice= 1.40
[   16.049299] usb 1-1.1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[   16.049301] usb 1-1.1: Product: RPI Wired Keyboard 5
[   16.049303] usb 1-1.1: Manufacturer:  
[   16.052042] [drm] Loading R500 Microcode
[   16.084434] hub 1-4:1.0: 4 ports detected
[   16.117249] Loading firmware: radeon/R520_cp.bin
[   16.130272] hid: raw HID events driver (C) Jiri Kosina
[   16.163116] usb 1-1.3: new low-speed USB device number 5 using xhci_hcd
[   16.182861] usbcore: registered new interface driver usbhid
[   16.339894] usb 1-1.3: New USB device found, idVendor=275d, idProduct=0ba6, bcdDevice= 1.00
[   16.345588] usbhid: USB HID core driver
[   16.345899] [drm] radeon: ring at 0x0000000010001000
[   16.345939] [drm] ring test succeeded in 7 usecs
[   16.346229] [drm] ib test succeeded in 0 usecs
[   16.346235] stackdepot: allocating hash table of 1048576 entries via kvcalloc
[   16.351168] [drm] Radeon Display Connectors
[   16.351170] [drm] Connector 0:
[   16.351171] [drm]   DVI-I-1
[   16.351172] [drm]   HPD1
[   16.351173] [drm]   DDC: 0x7e40 0x7e40 0x7e44 0x7e44 0x7e48 0x7e48 0x7e4c 0x7e4c
[   16.351175] [drm]   Encoders:
[   16.351176] [drm]     CRT1: INTERNAL_KLDSCP_DAC1
[   16.351178] [drm]     DFP1: INTERNAL_KLDSCP_TMDS1
[   16.351178] [drm] Connector 1:
[   16.351179] [drm]   SVIDEO-1
[   16.351180] [drm]   Encoders:
[   16.351181] [drm]     TV1: INTERNAL_KLDSCP_DAC2
[   16.351182] [drm] Connector 2:
[   16.351183] [drm]   VGA-1
[   16.351183] [drm]   DDC: 0x7e50 0x7e50 0x7e54 0x7e54 0x7e58 0x7e58 0x7e5c 0x7e5c
[   16.351185] [drm]   Encoders:
[   16.351186] [drm]     CRT2: INTERNAL_KLDSCP_DAC2
[   16.351207] [drm] Initialized radeon 2.50.0 20080528 for 0033:01:00.0 on minor 0
[   16.376731] usb 1-1.3: New USB device strings: Mfr=0, Product=1, SerialNumber=0
[   16.425232] input:   RPI Wired Keyboard 5 as /devices/pci0003:00/0003:00:00.0/0003:01:00.0/usb1/1-1/1-1.1/1-1.1:1.0/0003:04D9:0006.0001/input/input0
[   16.441919] usb 1-1.3: Product: USB OPTICAL MOUSE 
[   16.460123] radeon 0033:01:00.0: [drm] Cannot find any crtc or sizes
[   16.530821] hid-generic 0003:04D9:0006.0001: input,hidraw0: USB HID v1.11 Keyboard [  RPI Wired Keyboard 5] on usb-0003:01:00.0-1.1/input0
[   16.550105] radeon 0033:01:00.0: [drm] Cannot find any crtc or sizes
[   16.557943] input: USB OPTICAL MOUSE  as /devices/pci0003:00/0003:00:00.0/0003:01:00.0/usb1/1-1/1-1.3/1-1.3:1.0/0003:275D:0BA6.0003/input/input1
[   16.558008] hid-generic 0003:275D:0BA6.0003: input,hidraw1: USB HID v1.11 Mouse [USB OPTICAL MOUSE ] on usb-0003:01:00.0-1.3/input0
[   16.574740] input:   RPI Wired Keyboard 5 as /devices/pci0003:00/0003:00:00.0/0003:01:00.0/usb1/1-1/1-1.1/1-1.1:1.1/0003:04D9:0006.0002/input/input2
[   16.703443] radeon 0033:01:00.0: [drm] Cannot find any crtc or sizes
[   16.767710] hid-generic 0003:04D9:0006.0002: input,hidraw2: USB HID v1.11 Device [  RPI Wired Keyboard 5] on usb-0003:01:00.0-1.1/input1
[   19.462346] cfg80211: Loading compiled-in X.509 certificates for regulatory database
[   19.475633] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[   19.475828] Loaded X.509 cert 'wens: 61c038651aabdcf94bd0ac7ff06c7248db18c600'
[   19.475859] Loading firmware: regulatory.db
[   19.477049] Loading firmware: regulatory.db.p7s
[   19.734596] Adding 16777212k swap on /dev/nvme0n1p4.  Priority:-2 extents:1 across:16777212k SS
[   20.160467] EXT4-fs (nvme0n1p2): mounting ext2 file system using the ext4 subsystem
[   20.165046] EXT4-fs (nvme0n1p2): mounted filesystem 4913eef4-b406-4b09-ad17-549fbf0a775e r/w without journal. Quota mode: disabled.
[   22.214626] radeon 0033:01:00.0: vgaarb: VGA decodes changed: olddecodes=io+mem,decodes=none:owns=none
[   22.642021] systemd-journald[335]: /var/log/journal/3f89104fd8e846edb53c46af433b901e/user-1000.journal: Journal file uses a different sequence number ID, rotating.
[   69.566101] KTAP version 1
[   69.566119] 1..1
[   69.566134]     KTAP version 1
[   69.566141]     # Subtest: drm_format_helper_test
[   69.566148]     # module: drm_format_helper_test
[   69.566151]     1..17
[   69.566161]         KTAP version 1
[   69.566166]         # Subtest: drm_test_fb_xrgb8888_to_gray8
[   69.567578]         ok 1 single_pixel_source_buffer
[   69.567811]         ok 2 single_pixel_clip_rectangle
[   69.567953]         ok 3 well_known_colors
[   69.568046]         ok 4 destination_pitch
[   69.568054]     # drm_test_fb_xrgb8888_to_gray8: pass:4 fail:0 skip:0 total:4
[   69.568061]     ok 1 drm_test_fb_xrgb8888_to_gray8
[   69.568069]         KTAP version 1
[   69.568077]         # Subtest: drm_test_fb_xrgb8888_to_rgb332
[   69.568157]         ok 1 single_pixel_source_buffer
[   69.568243]         ok 2 single_pixel_clip_rectangle
[   69.568329]         ok 3 well_known_colors
[   69.568497]         ok 4 destination_pitch
[   69.568510]     # drm_test_fb_xrgb8888_to_rgb332: pass:4 fail:0 skip:0 total:4
[   69.568520]     ok 2 drm_test_fb_xrgb8888_to_rgb332
[   69.568530]         KTAP version 1
[   69.568544]         # Subtest: drm_test_fb_xrgb8888_to_rgb565
[   69.568742]         ok 1 single_pixel_source_buffer
[   69.568940]         ok 2 single_pixel_clip_rectangle
[   69.569081]         ok 3 well_known_colors
[   69.569216]         ok 4 destination_pitch
[   69.569225]     # drm_test_fb_xrgb8888_to_rgb565: pass:4 fail:0 skip:0 total:4
[   69.569233]     ok 3 drm_test_fb_xrgb8888_to_rgb565
[   69.569241]         KTAP version 1
[   69.569251]         # Subtest: drm_test_fb_xrgb8888_to_xrgb1555
[   69.569349]         ok 1 single_pixel_source_buffer
[   69.569467]         ok 2 single_pixel_clip_rectangle
[   69.569566]         ok 3 well_known_colors
[   69.569662]         ok 4 destination_pitch
[   69.569671]     # drm_test_fb_xrgb8888_to_xrgb1555: pass:4 fail:0 skip:0 total:4
[   69.569678]     ok 4 drm_test_fb_xrgb8888_to_xrgb1555
[   69.569686]         KTAP version 1
[   69.569697]         # Subtest: drm_test_fb_xrgb8888_to_argb1555
[   69.569797]         ok 1 single_pixel_source_buffer
[   69.569901]         ok 2 single_pixel_clip_rectangle
[   69.570062]         ok 3 well_known_colors
[   69.570200]         ok 4 destination_pitch
[   69.570209]     # drm_test_fb_xrgb8888_to_argb1555: pass:4 fail:0 skip:0 total:4
[   69.570217]     ok 5 drm_test_fb_xrgb8888_to_argb1555
[   69.570224]         KTAP version 1
[   69.570234]         # Subtest: drm_test_fb_xrgb8888_to_rgba5551
[   69.570343]         ok 1 single_pixel_source_buffer
[   69.570445]         ok 2 single_pixel_clip_rectangle
[   69.570544]         ok 3 well_known_colors
[   69.570650]         ok 4 destination_pitch
[   69.570658]     # drm_test_fb_xrgb8888_to_rgba5551: pass:4 fail:0 skip:0 total:4
[   69.570666]     ok 6 drm_test_fb_xrgb8888_to_rgba5551
[   69.570673]         KTAP version 1
[   69.570684]         # Subtest: drm_test_fb_xrgb8888_to_rgb888
[   69.570780]         ok 1 single_pixel_source_buffer
[   69.570880]         ok 2 single_pixel_clip_rectangle
[   69.570991]         ok 3 well_known_colors
[   69.571087]         ok 4 destination_pitch
[   69.571096]     # drm_test_fb_xrgb8888_to_rgb888: pass:4 fail:0 skip:0 total:4
[   69.571104]     ok 7 drm_test_fb_xrgb8888_to_rgb888
[   69.571112]         KTAP version 1
[   69.571122]         # Subtest: drm_test_fb_xrgb8888_to_argb8888
[   69.571218]         ok 1 single_pixel_source_buffer
[   69.571319]         ok 2 single_pixel_clip_rectangle
[   69.571421]         ok 3 well_known_colors
[   69.571536]         ok 4 destination_pitch
[   69.571544]     # drm_test_fb_xrgb8888_to_argb8888: pass:4 fail:0 skip:0 total:4
[   69.571552]     ok 8 drm_test_fb_xrgb8888_to_argb8888
[   69.571559]         KTAP version 1
[   69.571570]         # Subtest: drm_test_fb_xrgb8888_to_xrgb2101010
[   69.571632]     # drm_test_fb_xrgb8888_to_xrgb2101010: EXPECTATION FAILED at drivers/gpu/drm/tests/drm_format_helper_test.c:995
[   69.571632]     Expected buf == result->expected, but
[   69.571632]         buf ==
[   69.571632]         <00><00><f0><3f>
[   69.571632]         result->expected ==
[   69.571632]         <3f><f0><00><00>
[   69.571750]         not ok 1 single_pixel_source_buffer
[   69.571831]     # drm_test_fb_xrgb8888_to_xrgb2101010: EXPECTATION FAILED at drivers/gpu/drm/tests/drm_format_helper_test.c:995
[   69.571831]     Expected buf == result->expected, but
[   69.571831]         buf ==
[   69.571831]         <00><00><f0><3f>
[   69.571831]         result->expected ==
[   69.571831]         <3f><f0><00><00>
[   69.571931]         not ok 2 single_pixel_clip_rectangle
[   69.572080]     # drm_test_fb_xrgb8888_to_xrgb2101010: EXPECTATION FAILED at drivers/gpu/drm/tests/drm_format_helper_test.c:995
[   69.572080]     Expected buf == result->expected, but
[   69.572080]         buf ==
[   69.572080]         <ff> ff  ff <3f> 00  00  00  00 <00><00><f0><3f> 00 <fc><0f> 00 
[   69.572080]         <ff><03><00><00><ff><03><f0><3f><00><fc><ff><3f><ff><ff><0f><00>
[   69.572080]         result->expected ==
[   69.572080]         <3f> ff  ff <ff> 00  00  00  00 <3f><f0><00><00> 00 <0f><fc> 00 
[   69.572080]         <00><00><03><ff><3f><f0><03><ff><3f><ff><fc><00><00><0f><ff><ff>
[   69.572222]         not ok 3 well_known_colors
[   69.572473]     # drm_test_fb_xrgb8888_to_xrgb2101010: EXPECTATION FAILED at drivers/gpu/drm/tests/drm_format_helper_test.c:995
[   69.572473]     Expected buf == result->expected, but
[   69.572473]         buf ==
[   69.572473]         <72><46><84><03><14><d4><44><04><0c><3c><2f><2a> 00  00  00  00 
[   69.572473]          00  00  00  00 <cd><0d><1f><1b><72><46><84><03><14><d4><44><04>
[   69.572473]          00  00  00  00  00  00  00  00 <0c><30><20><2a><cd><0d><1f><1b>
[   69.572473]         <72><46><84><03> 00  00  00  00  00  00  00  00 
[   69.572473]         result->expected ==
[   69.572473]         <03><84><46><72><04><44><d4><14><2a><2f><3c><0c> 00  00  00  00 
[   69.572473]          00  00  00  00 <1b><1f><0d><cd><03><84><46><72><04><44><d4><14>
[   69.572473]          00  00  00  00  00  00  00  00 <2a><20><30><0c><1b><1f><0d><cd>
[   69.572473]         <03><84><46><72> 00  00  00  00  00  00  00  00 
[   69.572675]         not ok 4 destination_pitch
[   69.572687]     # drm_test_fb_xrgb8888_to_xrgb2101010: pass:0 fail:4 skip:0 total:4
[   69.572692]     not ok 9 drm_test_fb_xrgb8888_to_xrgb2101010
[   69.572697]         KTAP version 1
[   69.572704]         # Subtest: drm_test_fb_xrgb8888_to_argb2101010
[   69.572829]         ok 1 single_pixel_source_buffer
[   69.572927]         ok 2 single_pixel_clip_rectangle
[   69.573039]         ok 3 well_known_colors
[   69.573121]         ok 4 destination_pitch
[   69.573127]     # drm_test_fb_xrgb8888_to_argb2101010: pass:4 fail:0 skip:0 total:4
[   69.573132]     ok 10 drm_test_fb_xrgb8888_to_argb2101010
[   69.573137]         KTAP version 1
[   69.573143]         # Subtest: drm_test_fb_xrgb8888_to_mono
[   69.573232]         ok 1 single_pixel_source_buffer
[   69.573327]         ok 2 single_pixel_clip_rectangle
[   69.573407]         ok 3 well_known_colors
[   69.573496]         ok 4 destination_pitch
[   69.573501]     # drm_test_fb_xrgb8888_to_mono: pass:4 fail:0 skip:0 total:4
[   69.573506]     ok 11 drm_test_fb_xrgb8888_to_mono
[   69.573511]         KTAP version 1
[   69.573517]         # Subtest: drm_test_fb_swab
[   69.573634]         ok 1 single_pixel_source_buffer
[   69.573745]         ok 2 single_pixel_clip_rectangle
[   69.573872]         ok 3 well_known_colors
[   69.573973]         ok 4 destination_pitch
[   69.573978]     # drm_test_fb_swab: pass:4 fail:0 skip:0 total:4
[   69.573983]     ok 12 drm_test_fb_swab
[   69.573988]         KTAP version 1
[   69.573994]         # Subtest: drm_test_fb_xrgb8888_to_xbgr8888
[   69.574082]         ok 1 single_pixel_source_buffer
[   69.574179]         ok 2 single_pixel_clip_rectangle
[   69.574258]         ok 3 well_known_colors
[   69.574350]         ok 4 destination_pitch
[   69.574355]     # drm_test_fb_xrgb8888_to_xbgr8888: pass:4 fail:0 skip:0 total:4
[   69.574360]     ok 13 drm_test_fb_xrgb8888_to_xbgr8888
[   69.574364]         KTAP version 1
[   69.574371]         # Subtest: drm_test_fb_xrgb8888_to_abgr8888
[   69.574447]         ok 1 single_pixel_source_buffer
[   69.574536]         ok 2 single_pixel_clip_rectangle
[   69.574617]         ok 3 well_known_colors
[   69.574696]         ok 4 destination_pitch
[   69.574701]     # drm_test_fb_xrgb8888_to_abgr8888: pass:4 fail:0 skip:0 total:4
[   69.574706]     ok 14 drm_test_fb_xrgb8888_to_abgr8888
[   69.574711]         KTAP version 1
[   69.574717]         # Subtest: drm_test_fb_clip_offset
[   69.574800]         ok 1 pass through
[   69.574872]         ok 2 horizontal offset
[   69.574956]         ok 3 vertical offset
[   69.575048]         ok 4 horizontal and vertical offset
[   69.575136]         ok 5 horizontal offset (custom pitch)
[   69.575251]         ok 6 vertical offset (custom pitch)
[   69.575343]         ok 7 horizontal and vertical offset (custom pitch)
[   69.575352]     # drm_test_fb_clip_offset: pass:7 fail:0 skip:0 total:7
[   69.575360]     ok 15 drm_test_fb_clip_offset
[   69.575367]         KTAP version 1
[   69.575377]         # Subtest: drm_test_fb_build_fourcc_list
[   69.575884]         ok 1 no native formats
[   69.576259]         ok 2 XRGB8888 as native format
[   69.576666]         ok 3 remove duplicates
[   69.577079]         ok 4 convert alpha formats
[   69.577455]         ok 5 random formats
[   69.577461]     # drm_test_fb_build_fourcc_list: pass:5 fail:0 skip:0 total:5
[   69.577466]     ok 16 drm_test_fb_build_fourcc_list
[   69.577472]         KTAP version 1
[   69.577478]         # Subtest: drm_test_fb_memcpy
[   69.577594]         ok 1 single_pixel_source_buffer: XR24 little-endian (0x34325258)
[   69.577705]         ok 2 single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[   69.577819]         ok 3 single_pixel_source_buffer: YU24 little-endian (0x34325559)
[   69.577905]         ok 4 single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[   69.578001]         ok 5 single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[   69.578101]         ok 6 single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[   69.578174]         ok 7 well_known_colors: XB24 little-endian (0x34324258)
[   69.578266]         ok 8 well_known_colors: XRA8 little-endian (0x38415258)
[   69.578369]         ok 9 well_known_colors: YU24 little-endian (0x34325559)
[   69.578463]         ok 10 destination_pitch: XB24 little-endian (0x34324258)
[   69.578573]         ok 11 destination_pitch: XRA8 little-endian (0x38415258)
[   69.578688]         ok 12 destination_pitch: YU24 little-endian (0x34325559)
[   69.578697]     # drm_test_fb_memcpy: pass:12 fail:0 skip:0 total:12
[   69.578705]     ok 17 drm_test_fb_memcpy
[   69.578712] # drm_format_helper_test: pass:16 fail:1 skip:0 total:17
[   69.578719] # Totals: pass:76 fail:4 skip:0 total:80
[   69.578725] not ok 1 drm_format_helper_test
[  231.328685] EXT4-fs (nvme0n1p2): unmounting filesystem 4913eef4-b406-4b09-ad17-549fbf0a775e.
[  231.396140] EXT4-fs (zram1): unmounting filesystem 063820dd-15e5-43b1-8e13-b974c6aadadf.
[  232.244873] systemd-shutdown[1]: Syncing filesystems and block devices.
[  232.275011] systemd-shutdown[1]: Sending SIGTERM to remaining processes...
[  232.315855] systemd-journald[335]: Received SIGTERM from PID 1 (systemd-shutdow).
[  232.353780] systemd-shutdown[1]: Sending SIGKILL to remaining processes...
[  232.398047] systemd-shutdown[1]: Unmounting file systems.
[  232.428563] (sd-remount)[1155]: Remounting '/' read-only with options 'compress=zstd:1,ssd,discard=async,space_cache=v2,subvolid=5,subvol=/'.
[  232.526107] systemd-shutdown[1]: All filesystems unmounted.
[  232.558195] systemd-shutdown[1]: Deactivating swaps.
[  232.590064] systemd-shutdown[1]: All swaps deactivated.
[  232.622083] systemd-shutdown[1]: Detaching loop devices.
[  232.655487] systemd-shutdown[1]: All loop devices detached.
[  232.687676] systemd-shutdown[1]: Stopping MD devices.
[  232.719982] systemd-shutdown[1]: All MD devices stopped.
[  232.751906] systemd-shutdown[1]: Detaching DM devices.
[  232.783566] systemd-shutdown[1]: All DM devices detached.
[  232.814320] systemd-shutdown[1]: All filesystems, swaps, loop devices, MD devices and DM devices detached.
[  232.845887] systemd-shutdown[1]: Syncing filesystems and block devices.
[  232.877216] systemd-shutdown[1]: Powering off.
[  233.171577] radeon 0033:01:00.0: Refused to change power state from D0 to D3hot
[  233.441209] tg3 0004:01:00.1: Refused to change power state from D0 to D3hot

--MP_/BOGJpdxgz_1o5Jmtf4+ozve
Content-Type: application/octet-stream; name=config_675_p9
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=config_675_p9

IwojIEF1dG9tYXRpY2FsbHkgZ2VuZXJhdGVkIGZpbGU7IERPIE5PVCBFRElULgojIExpbnV4L3Bv
d2VycGMgNi43LjUtZ2VudG9vIEtlcm5lbCBDb25maWd1cmF0aW9uCiMKQ09ORklHX0NDX1ZFUlNJ
T05fVEVYVD0iZ2NjIChHZW50b28gMTMuMi4xX3AyMDI0MDExMy1yMSBwMTIpIDEzLjIuMSAyMDI0
MDExMyIKQ09ORklHX0NDX0lTX0dDQz15CkNPTkZJR19HQ0NfVkVSU0lPTj0xMzAyMDEKQ09ORklH
X0NMQU5HX1ZFUlNJT049MApDT05GSUdfQVNfSVNfR05VPXkKQ09ORklHX0FTX1ZFUlNJT049MjQx
MDAKQ09ORklHX0xEX0lTX0JGRD15CkNPTkZJR19MRF9WRVJTSU9OPTI0MTAwCkNPTkZJR19MTERf
VkVSU0lPTj0wCkNPTkZJR19DQ19DQU5fTElOSz15CkNPTkZJR19DQ19DQU5fTElOS19TVEFUSUM9
eQpDT05GSUdfQ0NfSEFTX0FTTV9HT1RPX09VVFBVVD15CkNPTkZJR19DQ19IQVNfQVNNX0dPVE9f
VElFRF9PVVRQVVQ9eQpDT05GSUdfVE9PTFNfU1VQUE9SVF9SRUxSPXkKQ09ORklHX0NDX0hBU19B
U01fSU5MSU5FPXkKQ09ORklHX0NDX0hBU19OT19QUk9GSUxFX0ZOX0FUVFI9eQpDT05GSUdfUEFI
T0xFX1ZFUlNJT049MApDT05GSUdfSVJRX1dPUks9eQpDT05GSUdfQlVJTERUSU1FX1RBQkxFX1NP
UlQ9eQpDT05GSUdfVEhSRUFEX0lORk9fSU5fVEFTSz15CgojCiMgR2VuZXJhbCBzZXR1cAojCkNP
TkZJR19JTklUX0VOVl9BUkdfTElNSVQ9MzIKIyBDT05GSUdfQ09NUElMRV9URVNUIGlzIG5vdCBz
ZXQKIyBDT05GSUdfV0VSUk9SIGlzIG5vdCBzZXQKQ09ORklHX0xPQ0FMVkVSU0lPTj0iLVA5Igoj
IENPTkZJR19MT0NBTFZFUlNJT05fQVVUTyBpcyBub3Qgc2V0CkNPTkZJR19CVUlMRF9TQUxUPSIi
CkNPTkZJR19IQVZFX0tFUk5FTF9HWklQPXkKQ09ORklHX0hBVkVfS0VSTkVMX1haPXkKQ09ORklH
X0tFUk5FTF9HWklQPXkKIyBDT05GSUdfS0VSTkVMX1haIGlzIG5vdCBzZXQKQ09ORklHX0RFRkFV
TFRfSU5JVD0iIgpDT05GSUdfREVGQVVMVF9IT1NUTkFNRT0iKG5vbmUpIgpDT05GSUdfU1lTVklQ
Qz15CkNPTkZJR19TWVNWSVBDX1NZU0NUTD15CkNPTkZJR19TWVNWSVBDX0NPTVBBVD15CkNPTkZJ
R19QT1NJWF9NUVVFVUU9eQpDT05GSUdfUE9TSVhfTVFVRVVFX1NZU0NUTD15CkNPTkZJR19XQVRD
SF9RVUVVRT15CkNPTkZJR19DUk9TU19NRU1PUllfQVRUQUNIPXkKIyBDT05GSUdfVVNFTElCIGlz
IG5vdCBzZXQKIyBDT05GSUdfQVVESVQgaXMgbm90IHNldApDT05GSUdfSEFWRV9BUkNIX0FVRElU
U1lTQ0FMTD15CgojCiMgSVJRIHN1YnN5c3RlbQojCkNPTkZJR19HRU5FUklDX0lSUV9TSE9XPXkK
Q09ORklHX0dFTkVSSUNfSVJRX1NIT1dfTEVWRUw9eQpDT05GSUdfR0VORVJJQ19JUlFfTUlHUkFU
SU9OPXkKQ09ORklHX0hBUkRJUlFTX1NXX1JFU0VORD15CkNPTkZJR19JUlFfRE9NQUlOPXkKQ09O
RklHX0lSUV9TSU09eQpDT05GSUdfSVJRX0RPTUFJTl9ISUVSQVJDSFk9eQpDT05GSUdfR0VORVJJ
Q19NU0lfSVJRPXkKQ09ORklHX0lSUV9GT1JDRURfVEhSRUFESU5HPXkKQ09ORklHX1NQQVJTRV9J
UlE9eQojIENPTkZJR19HRU5FUklDX0lSUV9ERUJVR0ZTIGlzIG5vdCBzZXQKIyBlbmQgb2YgSVJR
IHN1YnN5c3RlbQoKQ09ORklHX0dFTkVSSUNfVElNRV9WU1lTQ0FMTD15CkNPTkZJR19HRU5FUklD
X0NMT0NLRVZFTlRTPXkKQ09ORklHX0FSQ0hfSEFTX1RJQ0tfQlJPQURDQVNUPXkKQ09ORklHX0dF
TkVSSUNfQ0xPQ0tFVkVOVFNfQlJPQURDQVNUPXkKQ09ORklHX0dFTkVSSUNfQ01PU19VUERBVEU9
eQpDT05GSUdfVElNRV9LVU5JVF9URVNUPW0KQ09ORklHX0NPTlRFWFRfVFJBQ0tJTkc9eQpDT05G
SUdfQ09OVEVYVF9UUkFDS0lOR19JRExFPXkKCiMKIyBUaW1lcnMgc3Vic3lzdGVtCiMKQ09ORklH
X1RJQ0tfT05FU0hPVD15CkNPTkZJR19OT19IWl9DT01NT049eQojIENPTkZJR19IWl9QRVJJT0RJ
QyBpcyBub3Qgc2V0CkNPTkZJR19OT19IWl9JRExFPXkKIyBDT05GSUdfTk9fSFpfRlVMTCBpcyBu
b3Qgc2V0CiMgQ09ORklHX05PX0haIGlzIG5vdCBzZXQKQ09ORklHX0hJR0hfUkVTX1RJTUVSUz15
CiMgZW5kIG9mIFRpbWVycyBzdWJzeXN0ZW0KCkNPTkZJR19CUEY9eQpDT05GSUdfSEFWRV9FQlBG
X0pJVD15CkNPTkZJR19BUkNIX1dBTlRfREVGQVVMVF9CUEZfSklUPXkKCiMKIyBCUEYgc3Vic3lz
dGVtCiMKQ09ORklHX0JQRl9TWVNDQUxMPXkKQ09ORklHX0JQRl9KSVQ9eQpDT05GSUdfQlBGX0pJ
VF9BTFdBWVNfT049eQpDT05GSUdfQlBGX0pJVF9ERUZBVUxUX09OPXkKQ09ORklHX0JQRl9VTlBS
SVZfREVGQVVMVF9PRkY9eQojIENPTkZJR19CUEZfUFJFTE9BRCBpcyBub3Qgc2V0CiMgZW5kIG9m
IEJQRiBzdWJzeXN0ZW0KCkNPTkZJR19QUkVFTVBUX1ZPTFVOVEFSWV9CVUlMRD15CiMgQ09ORklH
X1BSRUVNUFRfTk9ORSBpcyBub3Qgc2V0CkNPTkZJR19QUkVFTVBUX1ZPTFVOVEFSWT15CiMgQ09O
RklHX1BSRUVNUFQgaXMgbm90IHNldApDT05GSUdfU0NIRURfQ09SRT15CgojCiMgQ1BVL1Rhc2sg
dGltZSBhbmQgc3RhdHMgYWNjb3VudGluZwojCkNPTkZJR19WSVJUX0NQVV9BQ0NPVU5USU5HPXkK
IyBDT05GSUdfVElDS19DUFVfQUNDT1VOVElORyBpcyBub3Qgc2V0CkNPTkZJR19WSVJUX0NQVV9B
Q0NPVU5USU5HX05BVElWRT15CiMgQ09ORklHX1ZJUlRfQ1BVX0FDQ09VTlRJTkdfR0VOIGlzIG5v
dCBzZXQKQ09ORklHX0JTRF9QUk9DRVNTX0FDQ1Q9eQpDT05GSUdfQlNEX1BST0NFU1NfQUNDVF9W
Mz15CkNPTkZJR19UQVNLU1RBVFM9eQpDT05GSUdfVEFTS19ERUxBWV9BQ0NUPXkKQ09ORklHX1RB
U0tfWEFDQ1Q9eQpDT05GSUdfVEFTS19JT19BQ0NPVU5USU5HPXkKIyBDT05GSUdfUFNJIGlzIG5v
dCBzZXQKIyBlbmQgb2YgQ1BVL1Rhc2sgdGltZSBhbmQgc3RhdHMgYWNjb3VudGluZwoKQ09ORklH
X0NQVV9JU09MQVRJT049eQoKIwojIFJDVSBTdWJzeXN0ZW0KIwpDT05GSUdfVFJFRV9SQ1U9eQoj
IENPTkZJR19SQ1VfRVhQRVJUIGlzIG5vdCBzZXQKQ09ORklHX1RSRUVfU1JDVT15CkNPTkZJR19O
RUVEX1NSQ1VfTk1JX1NBRkU9eQpDT05GSUdfVEFTS1NfUkNVX0dFTkVSSUM9eQpDT05GSUdfVEFT
S1NfVFJBQ0VfUkNVPXkKQ09ORklHX1JDVV9TVEFMTF9DT01NT049eQpDT05GSUdfUkNVX05FRURf
U0VHQ0JMSVNUPXkKIyBlbmQgb2YgUkNVIFN1YnN5c3RlbQoKQ09ORklHX0lLQ09ORklHPXkKQ09O
RklHX0lLQ09ORklHX1BST0M9eQojIENPTkZJR19JS0hFQURFUlMgaXMgbm90IHNldApDT05GSUdf
TE9HX0JVRl9TSElGVD0xNgpDT05GSUdfTE9HX0NQVV9NQVhfQlVGX1NISUZUPTEzCiMgQ09ORklH
X1BSSU5US19JTkRFWCBpcyBub3Qgc2V0CgojCiMgU2NoZWR1bGVyIGZlYXR1cmVzCiMKIyBlbmQg
b2YgU2NoZWR1bGVyIGZlYXR1cmVzCgpDT05GSUdfQVJDSF9TVVBQT1JUU19OVU1BX0JBTEFOQ0lO
Rz15CkNPTkZJR19DQ19IQVNfSU5UMTI4PXkKQ09ORklHX0NDX0lNUExJQ0lUX0ZBTExUSFJPVUdI
PSItV2ltcGxpY2l0LWZhbGx0aHJvdWdoPTUiCkNPTkZJR19HQ0MxMV9OT19BUlJBWV9CT1VORFM9
eQpDT05GSUdfQ0NfTk9fQVJSQVlfQk9VTkRTPXkKQ09ORklHX05VTUFfQkFMQU5DSU5HPXkKQ09O
RklHX05VTUFfQkFMQU5DSU5HX0RFRkFVTFRfRU5BQkxFRD15CkNPTkZJR19DR1JPVVBTPXkKQ09O
RklHX1BBR0VfQ09VTlRFUj15CiMgQ09ORklHX0NHUk9VUF9GQVZPUl9EWU5NT0RTIGlzIG5vdCBz
ZXQKQ09ORklHX01FTUNHPXkKQ09ORklHX01FTUNHX0tNRU09eQpDT05GSUdfQkxLX0NHUk9VUD15
CkNPTkZJR19DR1JPVVBfV1JJVEVCQUNLPXkKQ09ORklHX0NHUk9VUF9TQ0hFRD15CkNPTkZJR19G
QUlSX0dST1VQX1NDSEVEPXkKIyBDT05GSUdfQ0ZTX0JBTkRXSURUSCBpcyBub3Qgc2V0CiMgQ09O
RklHX1JUX0dST1VQX1NDSEVEIGlzIG5vdCBzZXQKQ09ORklHX1NDSEVEX01NX0NJRD15CkNPTkZJ
R19DR1JPVVBfUElEUz15CkNPTkZJR19DR1JPVVBfUkRNQT15CkNPTkZJR19DR1JPVVBfRlJFRVpF
Uj15CiMgQ09ORklHX0NHUk9VUF9IVUdFVExCIGlzIG5vdCBzZXQKQ09ORklHX0NQVVNFVFM9eQpD
T05GSUdfUFJPQ19QSURfQ1BVU0VUPXkKQ09ORklHX0NHUk9VUF9ERVZJQ0U9eQpDT05GSUdfQ0dS
T1VQX0NQVUFDQ1Q9eQpDT05GSUdfQ0dST1VQX1BFUkY9eQpDT05GSUdfQ0dST1VQX0JQRj15CkNP
TkZJR19DR1JPVVBfTUlTQz15CiMgQ09ORklHX0NHUk9VUF9ERUJVRyBpcyBub3Qgc2V0CkNPTkZJ
R19TT0NLX0NHUk9VUF9EQVRBPXkKQ09ORklHX05BTUVTUEFDRVM9eQpDT05GSUdfVVRTX05TPXkK
Q09ORklHX1RJTUVfTlM9eQpDT05GSUdfSVBDX05TPXkKQ09ORklHX1VTRVJfTlM9eQpDT05GSUdf
UElEX05TPXkKQ09ORklHX05FVF9OUz15CiMgQ09ORklHX0NIRUNLUE9JTlRfUkVTVE9SRSBpcyBu
b3Qgc2V0CkNPTkZJR19TQ0hFRF9BVVRPR1JPVVA9eQojIENPTkZJR19SRUxBWSBpcyBub3Qgc2V0
CkNPTkZJR19CTEtfREVWX0lOSVRSRD15CkNPTkZJR19JTklUUkFNRlNfU09VUkNFPSIiCkNPTkZJ
R19SRF9HWklQPXkKIyBDT05GSUdfUkRfQlpJUDIgaXMgbm90IHNldAojIENPTkZJR19SRF9MWk1B
IGlzIG5vdCBzZXQKIyBDT05GSUdfUkRfWFogaXMgbm90IHNldAojIENPTkZJR19SRF9MWk8gaXMg
bm90IHNldAojIENPTkZJR19SRF9MWjQgaXMgbm90IHNldApDT05GSUdfUkRfWlNURD15CiMgQ09O
RklHX0JPT1RfQ09ORklHIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5JVFJBTUZTX1BSRVNFUlZFX01U
SU1FIGlzIG5vdCBzZXQKQ09ORklHX0NDX09QVElNSVpFX0ZPUl9QRVJGT1JNQU5DRT15CiMgQ09O
RklHX0NDX09QVElNSVpFX0ZPUl9TSVpFIGlzIG5vdCBzZXQKQ09ORklHX0xEX09SUEhBTl9XQVJO
PXkKQ09ORklHX0xEX09SUEhBTl9XQVJOX0xFVkVMPSJ3YXJuIgpDT05GSUdfU1lTQ1RMPXkKQ09O
RklHX1NZU0NUTF9FWENFUFRJT05fVFJBQ0U9eQpDT05GSUdfSEFWRV9QQ1NQS1JfUExBVEZPUk09
eQpDT05GSUdfRVhQRVJUPXkKQ09ORklHX01VTFRJVVNFUj15CiMgQ09ORklHX1NHRVRNQVNLX1NZ
U0NBTEwgaXMgbm90IHNldAojIENPTkZJR19TWVNGU19TWVNDQUxMIGlzIG5vdCBzZXQKQ09ORklH
X0ZIQU5ETEU9eQpDT05GSUdfUE9TSVhfVElNRVJTPXkKQ09ORklHX1BSSU5USz15CkNPTkZJR19C
VUc9eQpDT05GSUdfRUxGX0NPUkU9eQojIENPTkZJR19QQ1NQS1JfUExBVEZPUk0gaXMgbm90IHNl
dApDT05GSUdfQkFTRV9GVUxMPXkKQ09ORklHX0ZVVEVYPXkKQ09ORklHX0ZVVEVYX1BJPXkKQ09O
RklHX0VQT0xMPXkKQ09ORklHX1NJR05BTEZEPXkKQ09ORklHX1RJTUVSRkQ9eQpDT05GSUdfRVZF
TlRGRD15CkNPTkZJR19TSE1FTT15CkNPTkZJR19BSU89eQpDT05GSUdfSU9fVVJJTkc9eQpDT05G
SUdfQURWSVNFX1NZU0NBTExTPXkKQ09ORklHX01FTUJBUlJJRVI9eQpDT05GSUdfS0FMTFNZTVM9
eQojIENPTkZJR19LQUxMU1lNU19TRUxGVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX0tBTExTWU1T
X0FMTCBpcyBub3Qgc2V0CkNPTkZJR19LQUxMU1lNU19CQVNFX1JFTEFUSVZFPXkKQ09ORklHX0FS
Q0hfSEFTX01FTUJBUlJJRVJfQ0FMTEJBQ0tTPXkKQ09ORklHX0FSQ0hfSEFTX01FTUJBUlJJRVJf
U1lOQ19DT1JFPXkKQ09ORklHX0tDTVA9eQpDT05GSUdfUlNFUT15CkNPTkZJR19DQUNIRVNUQVRf
U1lTQ0FMTD15CiMgQ09ORklHX0RFQlVHX1JTRVEgaXMgbm90IHNldApDT05GSUdfSEFWRV9QRVJG
X0VWRU5UUz15CiMgQ09ORklHX1BDMTA0IGlzIG5vdCBzZXQKCiMKIyBLZXJuZWwgUGVyZm9ybWFu
Y2UgRXZlbnRzIEFuZCBDb3VudGVycwojCkNPTkZJR19QRVJGX0VWRU5UUz15CiMgZW5kIG9mIEtl
cm5lbCBQZXJmb3JtYW5jZSBFdmVudHMgQW5kIENvdW50ZXJzCgpDT05GSUdfU1lTVEVNX0RBVEFf
VkVSSUZJQ0FUSU9OPXkKIyBDT05GSUdfUFJPRklMSU5HIGlzIG5vdCBzZXQKCiMKIyBLZXhlYyBh
bmQgY3Jhc2ggZmVhdHVyZXMKIwpDT05GSUdfQ1JBU0hfQ09SRT15CkNPTkZJR19LRVhFQ19DT1JF
PXkKQ09ORklHX0tFWEVDX0VMRj15CkNPTkZJR19LRVhFQz15CkNPTkZJR19LRVhFQ19GSUxFPXkK
IyBDT05GSUdfQ1JBU0hfRFVNUCBpcyBub3Qgc2V0CiMgZW5kIG9mIEtleGVjIGFuZCBjcmFzaCBm
ZWF0dXJlcwojIGVuZCBvZiBHZW5lcmFsIHNldHVwCgpDT05GSUdfUFBDNjQ9eQoKIwojIFByb2Nl
c3NvciBzdXBwb3J0CiMKQ09ORklHX1BQQ19CT09LM1NfNjQ9eQojIENPTkZJR19QUENfQk9PSzNF
XzY0IGlzIG5vdCBzZXQKIyBDT05GSUdfUE9XRVJQQzY0X0NQVSBpcyBub3Qgc2V0CiMgQ09ORklH
X0NFTExfQ1BVIGlzIG5vdCBzZXQKIyBDT05GSUdfUFBDXzk3MF9DUFUgaXMgbm90IHNldAojIENP
TkZJR19QT1dFUjZfQ1BVIGlzIG5vdCBzZXQKIyBDT05GSUdfUE9XRVI3X0NQVSBpcyBub3Qgc2V0
CiMgQ09ORklHX1BPV0VSOF9DUFUgaXMgbm90IHNldApDT05GSUdfUE9XRVI5X0NQVT15CiMgQ09O
RklHX1BPV0VSMTBfQ1BVIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9PTENIQUlOX0RFRkFVTFRfQ1BV
IGlzIG5vdCBzZXQKQ09ORklHX1RBUkdFVF9DUFVfQk9PTD15CkNPTkZJR19UQVJHRVRfQ1BVPSJw
b3dlcjkiCkNPTkZJR19QUENfQk9PSzNTPXkKQ09ORklHX1BQQ19GUFVfUkVHUz15CkNPTkZJR19Q
UENfRlBVPXkKQ09ORklHX0FMVElWRUM9eQpDT05GSUdfVlNYPXkKQ09ORklHX1BQQ182NFNfSEFT
SF9NTVU9eQpDT05GSUdfUFBDX1JBRElYX01NVT15CkNPTkZJR19QUENfUkFESVhfTU1VX0RFRkFV
TFQ9eQpDT05GSUdfUFBDX0tVRVA9eQpDT05GSUdfUFBDX0tVQVA9eQojIENPTkZJR19QUENfS1VB
UF9ERUJVRyBpcyBub3Qgc2V0CkNPTkZJR19QUENfUEtFWT15CkNPTkZJR19QUENfSEFWRV9QTVVf
U1VQUE9SVD15CiMgQ09ORklHX1BNVV9TWVNGUyBpcyBub3Qgc2V0CkNPTkZJR19QUENfUEVSRl9D
VFJTPXkKQ09ORklHX0ZPUkNFX1NNUD15CkNPTkZJR19TTVA9eQpDT05GSUdfTlJfQ1BVUz0zMgpD
T05GSUdfUFBDX0RPT1JCRUxMPXkKIyBlbmQgb2YgUHJvY2Vzc29yIHN1cHBvcnQKCkNPTkZJR19W
RFNPMzI9eQpDT05GSUdfQ1BVX0JJR19FTkRJQU49eQojIENPTkZJR19DUFVfTElUVExFX0VORElB
TiBpcyBub3Qgc2V0CkNPTkZJR19QUEM2NF9FTEZfQUJJX1YyPXkKQ09ORklHX0NDX0hBU19FTEZW
Mj15CkNPTkZJR19DQ19IQVNfUFJFRklYRUQ9eQpDT05GSUdfQ0NfSEFTX1BDUkVMPXkKQ09ORklH
XzY0QklUPXkKQ09ORklHX01NVT15CkNPTkZJR19BUkNIX01NQVBfUk5EX0JJVFNfTUFYPTMzCkNP
TkZJR19BUkNIX01NQVBfUk5EX0JJVFNfTUlOPTE4CkNPTkZJR19BUkNIX01NQVBfUk5EX0NPTVBB
VF9CSVRTX01BWD0xNwpDT05GSUdfQVJDSF9NTUFQX1JORF9DT01QQVRfQklUU19NSU49MTEKQ09O
RklHX05SX0lSUVM9NTEyCkNPTkZJR19OTUlfSVBJPXkKQ09ORklHX1BQQ19XQVRDSERPRz15CkNP
TkZJR19TVEFDS1RSQUNFX1NVUFBPUlQ9eQpDT05GSUdfTE9DS0RFUF9TVVBQT1JUPXkKQ09ORklH
X0dFTkVSSUNfSFdFSUdIVD15CkNPTkZJR19QUEM9eQpDT05GSUdfUFBDX0JBUlJJRVJfTk9TUEVD
PXkKQ09ORklHX1BQQ19IQVNfTEJBUlhfTEhBUlg9eQpDT05GSUdfRUFSTFlfUFJJTlRLPXkKQ09O
RklHX1BBTklDX1RJTUVPVVQ9NDAKQ09ORklHX0NPTVBBVD15CkNPTkZJR19TQ0hFRF9PTUlUX0ZS
QU1FX1BPSU5URVI9eQpDT05GSUdfQVJDSF9NQVlfSEFWRV9QQ19GREM9eQpDT05GSUdfUFBDX1VE
QkdfMTY1NTA9eQpDT05GSUdfQVVESVRfQVJDSD15CkNPTkZJR19HRU5FUklDX0JVRz15CkNPTkZJ
R19HRU5FUklDX0JVR19SRUxBVElWRV9QT0lOVEVSUz15CkNPTkZJR19FUEFQUl9CT09UPXkKQ09O
RklHX0FSQ0hfSElCRVJOQVRJT05fUE9TU0lCTEU9eQpDT05GSUdfQVJDSF9TVVNQRU5EX1BPU1NJ
QkxFPXkKQ09ORklHX0FSQ0hfU1VTUEVORF9OT05aRVJPX0NQVT15CkNPTkZJR19BUkNIX0hBU19B
RERfUEFHRVM9eQpDT05GSUdfQVJDSF9TVVBQT1JUU19VUFJPQkVTPXkKQ09ORklHX1BQQ19EQVdS
PXkKQ09ORklHX1BHVEFCTEVfTEVWRUxTPTQKQ09ORklHX1BQQ19NU0lfQklUTUFQPXkKQ09ORklH
X1BQQ19YSUNTPXkKQ09ORklHX1BQQ19JQ1BfTkFUSVZFPXkKQ09ORklHX1BQQ19JQ1BfSFY9eQpD
T05GSUdfUFBDX0lDU19SVEFTPXkKQ09ORklHX1BQQ19YSVZFPXkKQ09ORklHX1BQQ19YSVZFX05B
VElWRT15CkNPTkZJR19QUENfWElWRV9TUEFQUj15CgojCiMgUGxhdGZvcm0gc3VwcG9ydAojCkNP
TkZJR19QUENfUE9XRVJOVj15CkNPTkZJR19PUEFMX1BSRD1tCiMgQ09ORklHX1NDT01fREVCVUdG
UyBpcyBub3Qgc2V0CkNPTkZJR19QUENfUFNFUklFUz15CkNPTkZJR19QUENfU1BMUEFSPXkKIyBD
T05GSUdfRFRMIGlzIG5vdCBzZXQKQ09ORklHX1BTRVJJRVNfRU5FUkdZPW0KIyBDT05GSUdfSU9f
RVZFTlRfSVJRIGlzIG5vdCBzZXQKQ09ORklHX0xQQVJDRkc9eQojIENPTkZJR19QUENfU01MUEFS
IGlzIG5vdCBzZXQKQ09ORklHX0hWX1BFUkZfQ1RSUz15CkNPTkZJR19JQk1WSU89eQojIENPTkZJ
R19JQk1FQlVTIGlzIG5vdCBzZXQKIyBDT05GSUdfUFBDX1NWTSBpcyBub3Qgc2V0CiMgQ09ORklH
X1BQQ19QTUFDIGlzIG5vdCBzZXQKIyBDT05GSUdfUFBDX01BUExFIGlzIG5vdCBzZXQKIyBDT05G
SUdfUFBDX1BBU0VNSSBpcyBub3Qgc2V0CiMgQ09ORklHX1BQQ19QUzMgaXMgbm90IHNldAojIENP
TkZJR19QUENfSUJNX0NFTExfQkxBREUgaXMgbm90IHNldApDT05GSUdfS1ZNX0dVRVNUPXkKQ09O
RklHX0VQQVBSX1BBUkFWSVJUPXkKQ09ORklHX1BQQ19IQVNIX01NVV9OQVRJVkU9eQpDT05GSUdf
UFBDX09GX0JPT1RfVFJBTVBPTElORT15CkNPTkZJR19QUENfRFRfQ1BVX0ZUUlM9eQojIENPTkZJ
R19VREJHX1JUQVNfQ09OU09MRSBpcyBub3Qgc2V0CkNPTkZJR19QUENfU01QX01VWEVEX0lQST15
CkNPTkZJR19NUElDPXkKQ09ORklHX01QSUNfTVNHUj15CkNPTkZJR19QUENfSTgyNTk9eQpDT05G
SUdfUFBDX1JUQVM9eQpDT05GSUdfUlRBU19FUlJPUl9MT0dHSU5HPXkKQ09ORklHX1BQQ19SVEFT
X0RBRU1PTj15CkNPTkZJR19SVEFTX1BST0M9eQojIENPTkZJR19SVEFTX0ZMQVNIIGlzIG5vdCBz
ZXQKQ09ORklHX0VFSD15CkNPTkZJR19QUENfUDdfTkFQPXkKQ09ORklHX1BQQ19CT09LM1NfSURM
RT15CkNPTkZJR19QUENfSU5ESVJFQ1RfUElPPXkKCiMKIyBDUFUgRnJlcXVlbmN5IHNjYWxpbmcK
IwpDT05GSUdfQ1BVX0ZSRVE9eQpDT05GSUdfQ1BVX0ZSRVFfR09WX0FUVFJfU0VUPXkKQ09ORklH
X0NQVV9GUkVRX0dPVl9DT01NT049eQojIENPTkZJR19DUFVfRlJFUV9TVEFUIGlzIG5vdCBzZXQK
IyBDT05GSUdfQ1BVX0ZSRVFfREVGQVVMVF9HT1ZfUEVSRk9STUFOQ0UgaXMgbm90IHNldAojIENP
TkZJR19DUFVfRlJFUV9ERUZBVUxUX0dPVl9QT1dFUlNBVkUgaXMgbm90IHNldAojIENPTkZJR19D
UFVfRlJFUV9ERUZBVUxUX0dPVl9VU0VSU1BBQ0UgaXMgbm90IHNldApDT05GSUdfQ1BVX0ZSRVFf
REVGQVVMVF9HT1ZfT05ERU1BTkQ9eQojIENPTkZJR19DUFVfRlJFUV9ERUZBVUxUX0dPVl9DT05T
RVJWQVRJVkUgaXMgbm90IHNldAojIENPTkZJR19DUFVfRlJFUV9ERUZBVUxUX0dPVl9TQ0hFRFVU
SUwgaXMgbm90IHNldApDT05GSUdfQ1BVX0ZSRVFfR09WX1BFUkZPUk1BTkNFPXkKIyBDT05GSUdf
Q1BVX0ZSRVFfR09WX1BPV0VSU0FWRSBpcyBub3Qgc2V0CiMgQ09ORklHX0NQVV9GUkVRX0dPVl9V
U0VSU1BBQ0UgaXMgbm90IHNldApDT05GSUdfQ1BVX0ZSRVFfR09WX09OREVNQU5EPXkKIyBDT05G
SUdfQ1BVX0ZSRVFfR09WX0NPTlNFUlZBVElWRSBpcyBub3Qgc2V0CiMgQ09ORklHX0NQVV9GUkVR
X0dPVl9TQ0hFRFVUSUwgaXMgbm90IHNldAoKIwojIENQVSBmcmVxdWVuY3kgc2NhbGluZyBkcml2
ZXJzCiMKIyBDT05GSUdfQ1BVRlJFUV9EVCBpcyBub3Qgc2V0CiMgQ09ORklHX0NQVUZSRVFfRFRf
UExBVERFViBpcyBub3Qgc2V0CkNPTkZJR19QT1dFUk5WX0NQVUZSRVE9bQojIGVuZCBvZiBDUFUg
RnJlcXVlbmN5IHNjYWxpbmcKCiMKIyBDUFVJZGxlIGRyaXZlcgojCgojCiMgQ1BVIElkbGUKIwpD
T05GSUdfQ1BVX0lETEU9eQojIENPTkZJR19DUFVfSURMRV9HT1ZfTEFEREVSIGlzIG5vdCBzZXQK
Q09ORklHX0NQVV9JRExFX0dPVl9NRU5VPXkKIyBDT05GSUdfQ1BVX0lETEVfR09WX1RFTyBpcyBu
b3Qgc2V0CiMgQ09ORklHX0NQVV9JRExFX0dPVl9IQUxUUE9MTCBpcyBub3Qgc2V0CgojCiMgUE9X
RVJQQyBDUFUgSWRsZSBEcml2ZXJzCiMKQ09ORklHX1BTRVJJRVNfQ1BVSURMRT15CkNPTkZJR19Q
T1dFUk5WX0NQVUlETEU9eQojIGVuZCBvZiBQT1dFUlBDIENQVSBJZGxlIERyaXZlcnMKIyBlbmQg
b2YgQ1BVIElkbGUKIyBlbmQgb2YgQ1BVSWRsZSBkcml2ZXIKCiMgQ09ORklHX0dFTl9SVEMgaXMg
bm90IHNldAojIGVuZCBvZiBQbGF0Zm9ybSBzdXBwb3J0CgojCiMgS2VybmVsIG9wdGlvbnMKIwoj
IENPTkZJR19IWl8xMDAgaXMgbm90IHNldAojIENPTkZJR19IWl8yNTAgaXMgbm90IHNldApDT05G
SUdfSFpfMzAwPXkKIyBDT05GSUdfSFpfMTAwMCBpcyBub3Qgc2V0CkNPTkZJR19IWj0zMDAKQ09O
RklHX1NDSEVEX0hSVElDSz15CkNPTkZJR19QUENfVFJBTlNBQ1RJT05BTF9NRU09eQojIENPTkZJ
R19MRF9IRUFEX1NUVUJfQ0FUQ0ggaXMgbm90IHNldApDT05GSUdfSE9UUExVR19DUFU9eQojIENP
TkZJR19QUENfUVVFVUVEX1NQSU5MT0NLUyBpcyBub3Qgc2V0CkNPTkZJR19BUkNIX0NQVV9QUk9C
RV9SRUxFQVNFPXkKIyBDT05GSUdfUFBDNjRfU1VQUE9SVFNfTUVNT1JZX0ZBSUxVUkUgaXMgbm90
IHNldApDT05GSUdfQVJDSF9TVVBQT1JUU19LRVhFQz15CkNPTkZJR19BUkNIX1NVUFBPUlRTX0tF
WEVDX0ZJTEU9eQpDT05GSUdfQVJDSF9TVVBQT1JUU19LRVhFQ19QVVJHQVRPUlk9eQpDT05GSUdf
QVJDSF9TRUxFQ1RTX0tFWEVDX0ZJTEU9eQpDT05GSUdfUFBDNjRfQklHX0VORElBTl9FTEZfQUJJ
X1YyPXkKQ09ORklHX1JFTE9DQVRBQkxFPXkKIyBDT05GSUdfUkVMT0NBVEFCTEVfVEVTVCBpcyBu
b3Qgc2V0CkNPTkZJR19BUkNIX1NVUFBPUlRTX0NSQVNIX0RVTVA9eQojIENPTkZJR19GQV9EVU1Q
IGlzIG5vdCBzZXQKQ09ORklHX1BSRVNFUlZFX0ZBX0RVTVA9eQpDT05GSUdfT1BBTF9DT1JFPXkK
Q09ORklHX0lSUV9BTExfQ1BVUz15CkNPTkZJR19OVU1BPXkKQ09ORklHX05PREVTX1NISUZUPTgK
Q09ORklHX0hBVkVfTUVNT1JZTEVTU19OT0RFUz15CkNPTkZJR19BUkNIX1NFTEVDVF9NRU1PUllf
TU9ERUw9eQpDT05GSUdfQVJDSF9TUEFSU0VNRU1fRU5BQkxFPXkKQ09ORklHX0FSQ0hfU1BBUlNF
TUVNX0RFRkFVTFQ9eQpDT05GSUdfSUxMRUdBTF9QT0lOVEVSX1ZBTFVFPTB4NWRlYWRiZWVmMDAw
MDAwMApDT05GSUdfUFBDXzRLX1BBR0VTPXkKIyBDT05GSUdfUFBDXzY0S19QQUdFUyBpcyBub3Qg
c2V0CkNPTkZJR19QQUdFX1NJWkVfNEtCPXkKQ09ORklHX1BQQ19QQUdFX1NISUZUPTEyCkNPTkZJ
R19USFJFQURfU0hJRlQ9MTQKQ09ORklHX0RBVEFfU0hJRlQ9MjQKQ09ORklHX0FSQ0hfRk9SQ0Vf
TUFYX09SREVSPTEyCiMgQ09ORklHX1BQQ19QUk9UX1NBT19MUEFSIGlzIG5vdCBzZXQKQ09ORklH
X1NDSEVEX1NNVD15CkNPTkZJR19QUENfREVOT1JNQUxJU0FUSU9OPXkKQ09ORklHX0NNRExJTkU9
IiIKQ09ORklHX0VYVFJBX1RBUkdFVFM9IiIKIyBDT05GSUdfU1VTUEVORCBpcyBub3Qgc2V0CiMg
Q09ORklHX0hJQkVSTkFUSU9OIGlzIG5vdCBzZXQKQ09ORklHX1BNPXkKIyBDT05GSUdfUE1fREVC
VUcgaXMgbm90IHNldApDT05GSUdfUE1fQ0xLPXkKQ09ORklHX1dRX1BPV0VSX0VGRklDSUVOVF9E
RUZBVUxUPXkKIyBDT05GSUdfRU5FUkdZX01PREVMIGlzIG5vdCBzZXQKQ09ORklHX1BQQ19NRU1f
S0VZUz15CiMgZW5kIG9mIEtlcm5lbCBvcHRpb25zCgpDT05GSUdfSVNBX0RNQV9BUEk9eQoKIwoj
IEJ1cyBvcHRpb25zCiMKQ09ORklHX0dFTkVSSUNfSVNBX0RNQT15CiMgQ09ORklHX0ZTTF9MQkMg
aXMgbm90IHNldAojIGVuZCBvZiBCdXMgb3B0aW9ucwoKQ09ORklHX05PTlNUQVRJQ19LRVJORUw9
eQpDT05GSUdfUEFHRV9PRkZTRVQ9MHhjMDAwMDAwMDAwMDAwMDAwCkNPTkZJR19LRVJORUxfU1RB
UlQ9MHhjMDAwMDAwMDAwMDAwMDAwCkNPTkZJR19QSFlTSUNBTF9TVEFSVD0weDAwMDAwMDAwCkNP
TkZJR19IQVZFX0tWTV9JUlFDSElQPXkKQ09ORklHX0hBVkVfS1ZNX0lSUUZEPXkKQ09ORklHX0hB
VkVfS1ZNX0VWRU5URkQ9eQpDT05GSUdfS1ZNX01NSU89eQpDT05GSUdfS1ZNX1ZGSU89eQpDT05G
SUdfS1ZNX0NPTVBBVD15CkNPTkZJR19IQVZFX0tWTV9JUlFfQllQQVNTPXkKQ09ORklHX0hBVkVf
S1ZNX1ZDUFVfQVNZTkNfSU9DVEw9eQpDT05GSUdfVklSVFVBTElaQVRJT049eQpDT05GSUdfS1ZN
PXkKQ09ORklHX0tWTV9CT09LM1NfSEFORExFUj15CkNPTkZJR19LVk1fQk9PSzNTXzY0X0hBTkRM
RVI9eQpDT05GSUdfS1ZNX0JPT0szU19QUl9QT1NTSUJMRT15CkNPTkZJR19LVk1fQk9PSzNTX0hW
X1BPU1NJQkxFPXkKQ09ORklHX0tWTV9CT09LM1NfNjQ9eQpDT05GSUdfS1ZNX0JPT0szU182NF9I
Vj1tCkNPTkZJR19LVk1fQk9PSzNTXzY0X1BSPW0KIyBDT05GSUdfS1ZNX0JPT0szU19IVl9QOV9U
SU1JTkcgaXMgbm90IHNldAojIENPTkZJR19LVk1fQk9PSzNTX0hWX1A4X1RJTUlORyBpcyBub3Qg
c2V0CiMgQ09ORklHX0tWTV9CT09LM1NfSFZfTkVTVEVEX1BNVV9XT1JLQVJPVU5EIGlzIG5vdCBz
ZXQKQ09ORklHX0tWTV9YSUNTPXkKQ09ORklHX0tWTV9YSVZFPXkKCiMKIyBHZW5lcmFsIGFyY2hp
dGVjdHVyZS1kZXBlbmRlbnQgb3B0aW9ucwojCkNPTkZJR19IT1RQTFVHX1NNVD15CkNPTkZJR19T
TVRfTlVNX1RIUkVBRFNfRFlOQU1JQz15CiMgQ09ORklHX0tQUk9CRVMgaXMgbm90IHNldApDT05G
SUdfSlVNUF9MQUJFTD15CiMgQ09ORklHX1NUQVRJQ19LRVlTX1NFTEZURVNUIGlzIG5vdCBzZXQK
Q09ORklHX0hBVkVfRUZGSUNJRU5UX1VOQUxJR05FRF9BQ0NFU1M9eQpDT05GSUdfQVJDSF9VU0Vf
QlVJTFRJTl9CU1dBUD15CkNPTkZJR19IQVZFX0lPUkVNQVBfUFJPVD15CkNPTkZJR19IQVZFX0tQ
Uk9CRVM9eQpDT05GSUdfSEFWRV9LUkVUUFJPQkVTPXkKQ09ORklHX0hBVkVfT1BUUFJPQkVTPXkK
Q09ORklHX0hBVkVfS1BST0JFU19PTl9GVFJBQ0U9eQpDT05GSUdfSEFWRV9GVU5DVElPTl9FUlJP
Ul9JTkpFQ1RJT049eQpDT05GSUdfSEFWRV9OTUk9eQpDT05GSUdfVFJBQ0VfSVJRRkxBR1NfU1VQ
UE9SVD15CkNPTkZJR19IQVZFX0FSQ0hfVFJBQ0VIT09LPXkKQ09ORklHX0dFTkVSSUNfU01QX0lE
TEVfVEhSRUFEPXkKQ09ORklHX0dFTkVSSUNfSURMRV9QT0xMX1NFVFVQPXkKQ09ORklHX0FSQ0hf
SEFTX0ZPUlRJRllfU09VUkNFPXkKQ09ORklHX0FSQ0hfSEFTX1NFVF9NRU1PUlk9eQpDT05GSUdf
SEFWRV9BU01fTU9EVkVSU0lPTlM9eQpDT05GSUdfSEFWRV9SRUdTX0FORF9TVEFDS19BQ0NFU1Nf
QVBJPXkKQ09ORklHX0hBVkVfUlNFUT15CkNPTkZJR19IQVZFX0ZVTkNUSU9OX0FSR19BQ0NFU1Nf
QVBJPXkKQ09ORklHX0hBVkVfSFdfQlJFQUtQT0lOVD15CkNPTkZJR19IQVZFX1BFUkZfRVZFTlRT
X05NST15CkNPTkZJR19IQVZFX0hBUkRMT0NLVVBfREVURUNUT1JfUEVSRj15CkNPTkZJR19IQVZF
X0hBUkRMT0NLVVBfREVURUNUT1JfQVJDSD15CkNPTkZJR19IQVZFX1BFUkZfUkVHUz15CkNPTkZJ
R19IQVZFX1BFUkZfVVNFUl9TVEFDS19EVU1QPXkKQ09ORklHX0hBVkVfQVJDSF9KVU1QX0xBQkVM
PXkKQ09ORklHX0hBVkVfQVJDSF9KVU1QX0xBQkVMX1JFTEFUSVZFPXkKQ09ORklHX01NVV9HQVRI
RVJfVEFCTEVfRlJFRT15CkNPTkZJR19NTVVfR0FUSEVSX1JDVV9UQUJMRV9GUkVFPXkKQ09ORklH
X01NVV9HQVRIRVJfUEFHRV9TSVpFPXkKQ09ORklHX01NVV9HQVRIRVJfTUVSR0VfVk1BUz15CkNP
TkZJR19BUkNIX1dBTlRfSVJRU19PRkZfQUNUSVZBVEVfTU09eQpDT05GSUdfTU1VX0xBWllfVExC
X1NIT09URE9XTj15CkNPTkZJR19BUkNIX0hBVkVfTk1JX1NBRkVfQ01QWENIRz15CkNPTkZJR19B
UkNIX1dFQUtfUkVMRUFTRV9BQ1FVSVJFPXkKQ09ORklHX0FSQ0hfV0FOVF9JUENfUEFSU0VfVkVS
U0lPTj15CkNPTkZJR19BUkNIX1dBTlRfQ09NUEFUX0lQQ19QQVJTRV9WRVJTSU9OPXkKQ09ORklH
X0FSQ0hfV0FOVF9PTERfQ09NUEFUX0lQQz15CkNPTkZJR19IQVZFX0FSQ0hfU0VDQ09NUD15CkNP
TkZJR19IQVZFX0FSQ0hfU0VDQ09NUF9GSUxURVI9eQpDT05GSUdfU0VDQ09NUD15CkNPTkZJR19T
RUNDT01QX0ZJTFRFUj15CiMgQ09ORklHX1NFQ0NPTVBfQ0FDSEVfREVCVUcgaXMgbm90IHNldApD
T05GSUdfSEFWRV9TVEFDS1BST1RFQ1RPUj15CkNPTkZJR19TVEFDS1BST1RFQ1RPUj15CiMgQ09O
RklHX1NUQUNLUFJPVEVDVE9SX1NUUk9ORyBpcyBub3Qgc2V0CkNPTkZJR19MVE9fTk9ORT15CkNP
TkZJR19IQVZFX0FSQ0hfV0lUSElOX1NUQUNLX0ZSQU1FUz15CkNPTkZJR19IQVZFX0NPTlRFWFRf
VFJBQ0tJTkdfVVNFUj15CkNPTkZJR19IQVZFX1ZJUlRfQ1BVX0FDQ09VTlRJTkc9eQpDT05GSUdf
QVJDSF9IQVNfU0NBTEVEX0NQVVRJTUU9eQpDT05GSUdfSEFWRV9WSVJUX0NQVV9BQ0NPVU5USU5H
X0dFTj15CkNPTkZJR19IQVZFX0lSUV9USU1FX0FDQ09VTlRJTkc9eQpDT05GSUdfSEFWRV9NT1ZF
X1BVRD15CkNPTkZJR19IQVZFX01PVkVfUE1EPXkKQ09ORklHX0hBVkVfQVJDSF9UUkFOU1BBUkVO
VF9IVUdFUEFHRT15CkNPTkZJR19IQVZFX0FSQ0hfVFJBTlNQQVJFTlRfSFVHRVBBR0VfUFVEPXkK
Q09ORklHX0hBVkVfQVJDSF9IVUdFX1ZNQVA9eQpDT05GSUdfSEFWRV9BUkNIX0hVR0VfVk1BTExP
Qz15CkNPTkZJR19BUkNIX1dBTlRfUE1EX01LV1JJVEU9eQpDT05GSUdfSEFWRV9BUkNIX1NPRlRf
RElSVFk9eQpDT05GSUdfSEFWRV9NT0RfQVJDSF9TUEVDSUZJQz15CkNPTkZJR19NT0RVTEVTX1VT
RV9FTEZfUkVMQT15CkNPTkZJR19IQVZFX1NPRlRJUlFfT05fT1dOX1NUQUNLPXkKQ09ORklHX1NP
RlRJUlFfT05fT1dOX1NUQUNLPXkKQ09ORklHX0FSQ0hfSEFTX0VMRl9SQU5ET01JWkU9eQpDT05G
SUdfSEFWRV9BUkNIX01NQVBfUk5EX0JJVFM9eQpDT05GSUdfQVJDSF9NTUFQX1JORF9CSVRTPTE4
CkNPTkZJR19IQVZFX0FSQ0hfTU1BUF9STkRfQ09NUEFUX0JJVFM9eQpDT05GSUdfQVJDSF9NTUFQ
X1JORF9DT01QQVRfQklUUz0xMQpDT05GSUdfUEFHRV9TSVpFX0xFU1NfVEhBTl82NEtCPXkKQ09O
RklHX1BBR0VfU0laRV9MRVNTX1RIQU5fMjU2S0I9eQpDT05GSUdfQVJDSF9XQU5UX0RFRkFVTFRf
VE9QRE9XTl9NTUFQX0xBWU9VVD15CkNPTkZJR19IQVZFX1JFTElBQkxFX1NUQUNLVFJBQ0U9eQpD
T05GSUdfSEFWRV9BUkNIX05WUkFNX09QUz15CkNPTkZJR19DTE9ORV9CQUNLV0FSRFM9eQpDT05G
SUdfT0xEX1NJR1NVU1BFTkQ9eQpDT05GSUdfQ09NUEFUX09MRF9TSUdBQ1RJT049eQpDT05GSUdf
Q09NUEFUXzMyQklUX1RJTUU9eQpDT05GSUdfSEFWRV9BUkNIX1JBTkRPTUlaRV9LU1RBQ0tfT0ZG
U0VUPXkKQ09ORklHX1JBTkRPTUlaRV9LU1RBQ0tfT0ZGU0VUPXkKQ09ORklHX1JBTkRPTUlaRV9L
U1RBQ0tfT0ZGU0VUX0RFRkFVTFQ9eQpDT05GSUdfQVJDSF9PUFRJT05BTF9LRVJORUxfUldYPXkK
Q09ORklHX0FSQ0hfT1BUSU9OQUxfS0VSTkVMX1JXWF9ERUZBVUxUPXkKQ09ORklHX0FSQ0hfSEFT
X1NUUklDVF9LRVJORUxfUldYPXkKQ09ORklHX1NUUklDVF9LRVJORUxfUldYPXkKQ09ORklHX0FS
Q0hfSEFTX1NUUklDVF9NT0RVTEVfUldYPXkKQ09ORklHX1NUUklDVF9NT0RVTEVfUldYPXkKQ09O
RklHX0FSQ0hfSEFTX1BIWVNfVE9fRE1BPXkKIyBDT05GSUdfTE9DS19FVkVOVF9DT1VOVFMgaXMg
bm90IHNldApDT05GSUdfQVJDSF9XQU5UX0xEX09SUEhBTl9XQVJOPXkKQ09ORklHX0FSQ0hfU1VQ
UE9SVFNfREVCVUdfUEFHRUFMTE9DPXkKCiMKIyBHQ09WLWJhc2VkIGtlcm5lbCBwcm9maWxpbmcK
IwojIENPTkZJR19HQ09WX0tFUk5FTCBpcyBub3Qgc2V0CkNPTkZJR19BUkNIX0hBU19HQ09WX1BS
T0ZJTEVfQUxMPXkKIyBlbmQgb2YgR0NPVi1iYXNlZCBrZXJuZWwgcHJvZmlsaW5nCgpDT05GSUdf
SEFWRV9HQ0NfUExVR0lOUz15CkNPTkZJR19HQ0NfUExVR0lOUz15CkNPTkZJR19HQ0NfUExVR0lO
X0xBVEVOVF9FTlRST1BZPXkKQ09ORklHX0ZVTkNUSU9OX0FMSUdOTUVOVD0wCiMgZW5kIG9mIEdl
bmVyYWwgYXJjaGl0ZWN0dXJlLWRlcGVuZGVudCBvcHRpb25zCgpDT05GSUdfUlRfTVVURVhFUz15
CkNPTkZJR19CQVNFX1NNQUxMPTAKQ09ORklHX01PRFVMRVM9eQojIENPTkZJR19NT0RVTEVfREVC
VUcgaXMgbm90IHNldAojIENPTkZJR19NT0RVTEVfRk9SQ0VfTE9BRCBpcyBub3Qgc2V0CkNPTkZJ
R19NT0RVTEVfVU5MT0FEPXkKQ09ORklHX01PRFVMRV9GT1JDRV9VTkxPQUQ9eQojIENPTkZJR19N
T0RVTEVfVU5MT0FEX1RBSU5UX1RSQUNLSU5HIGlzIG5vdCBzZXQKQ09ORklHX01PRFZFUlNJT05T
PXkKQ09ORklHX0FTTV9NT0RWRVJTSU9OUz15CiMgQ09ORklHX01PRFVMRV9TUkNWRVJTSU9OX0FM
TCBpcyBub3Qgc2V0CiMgQ09ORklHX01PRFVMRV9TSUcgaXMgbm90IHNldApDT05GSUdfTU9EVUxF
X0NPTVBSRVNTX05PTkU9eQojIENPTkZJR19NT0RVTEVfQ09NUFJFU1NfR1pJUCBpcyBub3Qgc2V0
CiMgQ09ORklHX01PRFVMRV9DT01QUkVTU19YWiBpcyBub3Qgc2V0CiMgQ09ORklHX01PRFVMRV9D
T01QUkVTU19aU1REIGlzIG5vdCBzZXQKIyBDT05GSUdfTU9EVUxFX0FMTE9XX01JU1NJTkdfTkFN
RVNQQUNFX0lNUE9SVFMgaXMgbm90IHNldApDT05GSUdfTU9EUFJPQkVfUEFUSD0iL3NiaW4vbW9k
cHJvYmUiCiMgQ09ORklHX1RSSU1fVU5VU0VEX0tTWU1TIGlzIG5vdCBzZXQKQ09ORklHX01PRFVM
RVNfVFJFRV9MT09LVVA9eQpDT05GSUdfQkxPQ0s9eQpDT05GSUdfQkxPQ0tfTEVHQUNZX0FVVE9M
T0FEPXkKQ09ORklHX0JMS19DR1JPVVBfUFVOVF9CSU89eQpDT05GSUdfQkxLX0RFVl9CU0dfQ09N
TU9OPXkKQ09ORklHX0JMS19ERVZfQlNHTElCPXkKIyBDT05GSUdfQkxLX0RFVl9JTlRFR1JJVFkg
aXMgbm90IHNldAojIENPTkZJR19CTEtfREVWX1pPTkVEIGlzIG5vdCBzZXQKIyBDT05GSUdfQkxL
X0RFVl9USFJPVFRMSU5HIGlzIG5vdCBzZXQKQ09ORklHX0JMS19XQlQ9eQpDT05GSUdfQkxLX1dC
VF9NUT15CiMgQ09ORklHX0JMS19DR1JPVVBfSU9MQVRFTkNZIGlzIG5vdCBzZXQKIyBDT05GSUdf
QkxLX0NHUk9VUF9JT0NPU1QgaXMgbm90IHNldAojIENPTkZJR19CTEtfQ0dST1VQX0lPUFJJTyBp
cyBub3Qgc2V0CkNPTkZJR19CTEtfREVCVUdfRlM9eQojIENPTkZJR19CTEtfU0VEX09QQUwgaXMg
bm90IHNldAojIENPTkZJR19CTEtfSU5MSU5FX0VOQ1JZUFRJT04gaXMgbm90IHNldAoKIwojIFBh
cnRpdGlvbiBUeXBlcwojCkNPTkZJR19QQVJUSVRJT05fQURWQU5DRUQ9eQojIENPTkZJR19BQ09S
Tl9QQVJUSVRJT04gaXMgbm90IHNldAojIENPTkZJR19BSVhfUEFSVElUSU9OIGlzIG5vdCBzZXQK
IyBDT05GSUdfT1NGX1BBUlRJVElPTiBpcyBub3Qgc2V0CkNPTkZJR19BTUlHQV9QQVJUSVRJT049
eQpDT05GSUdfQVRBUklfUEFSVElUSU9OPXkKQ09ORklHX01BQ19QQVJUSVRJT049eQpDT05GSUdf
TVNET1NfUEFSVElUSU9OPXkKQ09ORklHX0JTRF9ESVNLTEFCRUw9eQojIENPTkZJR19NSU5JWF9T
VUJQQVJUSVRJT04gaXMgbm90IHNldAojIENPTkZJR19TT0xBUklTX1g4Nl9QQVJUSVRJT04gaXMg
bm90IHNldAojIENPTkZJR19VTklYV0FSRV9ESVNLTEFCRUwgaXMgbm90IHNldApDT05GSUdfTERN
X1BBUlRJVElPTj15CiMgQ09ORklHX0xETV9ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX1NHSV9Q
QVJUSVRJT04gaXMgbm90IHNldAojIENPTkZJR19VTFRSSVhfUEFSVElUSU9OIGlzIG5vdCBzZXQK
IyBDT05GSUdfU1VOX1BBUlRJVElPTiBpcyBub3Qgc2V0CiMgQ09ORklHX0tBUk1BX1BBUlRJVElP
TiBpcyBub3Qgc2V0CkNPTkZJR19FRklfUEFSVElUSU9OPXkKIyBDT05GSUdfU1lTVjY4X1BBUlRJ
VElPTiBpcyBub3Qgc2V0CiMgQ09ORklHX0NNRExJTkVfUEFSVElUSU9OIGlzIG5vdCBzZXQKIyBl
bmQgb2YgUGFydGl0aW9uIFR5cGVzCgpDT05GSUdfQkxLX01RX1BDST15CkNPTkZJR19CTEtfTVFf
VklSVElPPXkKQ09ORklHX0JMS19QTT15CkNPTkZJR19CTE9DS19IT0xERVJfREVQUkVDQVRFRD15
CkNPTkZJR19CTEtfTVFfU1RBQ0tJTkc9eQoKIwojIElPIFNjaGVkdWxlcnMKIwojIENPTkZJR19N
UV9JT1NDSEVEX0RFQURMSU5FIGlzIG5vdCBzZXQKQ09ORklHX01RX0lPU0NIRURfS1lCRVI9eQoj
IENPTkZJR19JT1NDSEVEX0JGUSBpcyBub3Qgc2V0CiMgZW5kIG9mIElPIFNjaGVkdWxlcnMKCkNP
TkZJR19QUkVFTVBUX05PVElGSUVSUz15CkNPTkZJR19QQURBVEE9eQpDT05GSUdfQVNOMT15CkNP
TkZJR19VTklOTElORV9TUElOX1VOTE9DSz15CkNPTkZJR19BUkNIX1NVUFBPUlRTX0FUT01JQ19S
TVc9eQpDT05GSUdfTVVURVhfU1BJTl9PTl9PV05FUj15CkNPTkZJR19SV1NFTV9TUElOX09OX09X
TkVSPXkKQ09ORklHX0xPQ0tfU1BJTl9PTl9PV05FUj15CkNPTkZJR19BUkNIX0hBU19NTUlPV0I9
eQpDT05GSUdfTU1JT1dCPXkKQ09ORklHX0FSQ0hfSEFTX05PTl9PVkVSTEFQUElOR19BRERSRVNT
X1NQQUNFPXkKQ09ORklHX0ZSRUVaRVI9eQoKIwojIEV4ZWN1dGFibGUgZmlsZSBmb3JtYXRzCiMK
Q09ORklHX0JJTkZNVF9FTEY9eQpDT05GSUdfQ09NUEFUX0JJTkZNVF9FTEY9eQpDT05GSUdfRUxG
Q09SRT15CkNPTkZJR19DT1JFX0RVTVBfREVGQVVMVF9FTEZfSEVBREVSUz15CkNPTkZJR19CSU5G
TVRfU0NSSVBUPXkKQ09ORklHX0JJTkZNVF9NSVNDPXkKQ09ORklHX0NPUkVEVU1QPXkKIyBlbmQg
b2YgRXhlY3V0YWJsZSBmaWxlIGZvcm1hdHMKCiMKIyBNZW1vcnkgTWFuYWdlbWVudCBvcHRpb25z
CiMKQ09ORklHX1pQT09MPXkKQ09ORklHX1NXQVA9eQpDT05GSUdfWlNXQVA9eQpDT05GSUdfWlNX
QVBfREVGQVVMVF9PTj15CkNPTkZJR19aU1dBUF9FWENMVVNJVkVfTE9BRFNfREVGQVVMVF9PTj15
CiMgQ09ORklHX1pTV0FQX0NPTVBSRVNTT1JfREVGQVVMVF9ERUZMQVRFIGlzIG5vdCBzZXQKIyBD
T05GSUdfWlNXQVBfQ09NUFJFU1NPUl9ERUZBVUxUX0xaTyBpcyBub3Qgc2V0CiMgQ09ORklHX1pT
V0FQX0NPTVBSRVNTT1JfREVGQVVMVF84NDIgaXMgbm90IHNldAojIENPTkZJR19aU1dBUF9DT01Q
UkVTU09SX0RFRkFVTFRfTFo0IGlzIG5vdCBzZXQKIyBDT05GSUdfWlNXQVBfQ09NUFJFU1NPUl9E
RUZBVUxUX0xaNEhDIGlzIG5vdCBzZXQKQ09ORklHX1pTV0FQX0NPTVBSRVNTT1JfREVGQVVMVF9a
U1REPXkKQ09ORklHX1pTV0FQX0NPTVBSRVNTT1JfREVGQVVMVD0ienN0ZCIKIyBDT05GSUdfWlNX
QVBfWlBPT0xfREVGQVVMVF9aQlVEIGlzIG5vdCBzZXQKIyBDT05GSUdfWlNXQVBfWlBPT0xfREVG
QVVMVF9aM0ZPTEQgaXMgbm90IHNldApDT05GSUdfWlNXQVBfWlBPT0xfREVGQVVMVF9aU01BTExP
Qz15CkNPTkZJR19aU1dBUF9aUE9PTF9ERUZBVUxUPSJ6c21hbGxvYyIKIyBDT05GSUdfWkJVRCBp
cyBub3Qgc2V0CiMgQ09ORklHX1ozRk9MRCBpcyBub3Qgc2V0CkNPTkZJR19aU01BTExPQz15CiMg
Q09ORklHX1pTTUFMTE9DX1NUQVQgaXMgbm90IHNldApDT05GSUdfWlNNQUxMT0NfQ0hBSU5fU0la
RT04CgojCiMgU0xBQiBhbGxvY2F0b3Igb3B0aW9ucwojCiMgQ09ORklHX1NMQUJfREVQUkVDQVRF
RCBpcyBub3Qgc2V0CkNPTkZJR19TTFVCPXkKIyBDT05GSUdfU0xVQl9USU5ZIGlzIG5vdCBzZXQK
IyBDT05GSUdfU0xBQl9NRVJHRV9ERUZBVUxUIGlzIG5vdCBzZXQKQ09ORklHX1NMQUJfRlJFRUxJ
U1RfUkFORE9NPXkKQ09ORklHX1NMQUJfRlJFRUxJU1RfSEFSREVORUQ9eQojIENPTkZJR19TTFVC
X1NUQVRTIGlzIG5vdCBzZXQKIyBDT05GSUdfU0xVQl9DUFVfUEFSVElBTCBpcyBub3Qgc2V0CkNP
TkZJR19SQU5ET01fS01BTExPQ19DQUNIRVM9eQojIGVuZCBvZiBTTEFCIGFsbG9jYXRvciBvcHRp
b25zCgpDT05GSUdfU0hVRkZMRV9QQUdFX0FMTE9DQVRPUj15CiMgQ09ORklHX0NPTVBBVF9CUksg
aXMgbm90IHNldApDT05GSUdfU0VMRUNUX01FTU9SWV9NT0RFTD15CkNPTkZJR19TUEFSU0VNRU1f
TUFOVUFMPXkKQ09ORklHX1NQQVJTRU1FTT15CkNPTkZJR19TUEFSU0VNRU1fRVhUUkVNRT15CkNP
TkZJR19TUEFSU0VNRU1fVk1FTU1BUF9FTkFCTEU9eQpDT05GSUdfU1BBUlNFTUVNX1ZNRU1NQVA9
eQpDT05GSUdfQVJDSF9XQU5UX09QVElNSVpFX0RBWF9WTUVNTUFQPXkKQ09ORklHX0hBVkVfRkFT
VF9HVVA9eQpDT05GSUdfQVJDSF9LRUVQX01FTUJMT0NLPXkKQ09ORklHX01FTU9SWV9JU09MQVRJ
T049eQpDT05GSUdfRVhDTFVTSVZFX1NZU1RFTV9SQU09eQpDT05GSUdfQVJDSF9FTkFCTEVfTUVN
T1JZX0hPVFBMVUc9eQpDT05GSUdfQVJDSF9FTkFCTEVfTUVNT1JZX0hPVFJFTU9WRT15CiMgQ09O
RklHX01FTU9SWV9IT1RQTFVHIGlzIG5vdCBzZXQKQ09ORklHX0FSQ0hfTUhQX01FTU1BUF9PTl9N
RU1PUllfRU5BQkxFPXkKQ09ORklHX1NQTElUX1BUTE9DS19DUFVTPTQKQ09ORklHX0FSQ0hfRU5B
QkxFX1NQTElUX1BNRF9QVExPQ0s9eQpDT05GSUdfQ09NUEFDVElPTj15CkNPTkZJR19DT01QQUNU
X1VORVZJQ1RBQkxFX0RFRkFVTFQ9MQpDT05GSUdfUEFHRV9SRVBPUlRJTkc9eQpDT05GSUdfTUlH
UkFUSU9OPXkKQ09ORklHX0FSQ0hfRU5BQkxFX0hVR0VQQUdFX01JR1JBVElPTj15CkNPTkZJR19B
UkNIX0VOQUJMRV9USFBfTUlHUkFUSU9OPXkKQ09ORklHX0hVR0VUTEJfUEFHRV9TSVpFX1ZBUklB
QkxFPXkKQ09ORklHX0NPTlRJR19BTExPQz15CkNPTkZJR19QQ1BfQkFUQ0hfU0NBTEVfTUFYPTUK
Q09ORklHX1BIWVNfQUREUl9UXzY0QklUPXkKQ09ORklHX01NVV9OT1RJRklFUj15CkNPTkZJR19L
U009eQpDT05GSUdfREVGQVVMVF9NTUFQX01JTl9BRERSPTY1NTM2CkNPTkZJR19UUkFOU1BBUkVO
VF9IVUdFUEFHRT15CiMgQ09ORklHX1RSQU5TUEFSRU5UX0hVR0VQQUdFX0FMV0FZUyBpcyBub3Qg
c2V0CkNPTkZJR19UUkFOU1BBUkVOVF9IVUdFUEFHRV9NQURWSVNFPXkKIyBDT05GSUdfUkVBRF9P
TkxZX1RIUF9GT1JfRlMgaXMgbm90IHNldApDT05GSUdfTkVFRF9QRVJfQ1BVX0VNQkVEX0ZJUlNU
X0NIVU5LPXkKQ09ORklHX05FRURfUEVSX0NQVV9QQUdFX0ZJUlNUX0NIVU5LPXkKQ09ORklHX1VT
RV9QRVJDUFVfTlVNQV9OT0RFX0lEPXkKQ09ORklHX0hBVkVfU0VUVVBfUEVSX0NQVV9BUkVBPXkK
Q09ORklHX0NNQT15CiMgQ09ORklHX0NNQV9ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX0NNQV9E
RUJVR0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfQ01BX1NZU0ZTIGlzIG5vdCBzZXQKQ09ORklHX0NN
QV9BUkVBUz0xOQpDT05GSUdfR0VORVJJQ19FQVJMWV9JT1JFTUFQPXkKQ09ORklHX0RFRkVSUkVE
X1NUUlVDVF9QQUdFX0lOSVQ9eQojIENPTkZJR19JRExFX1BBR0VfVFJBQ0tJTkcgaXMgbm90IHNl
dApDT05GSUdfQVJDSF9IQVNfQ1VSUkVOVF9TVEFDS19QT0lOVEVSPXkKQ09ORklHX0FSQ0hfSEFT
X1BURV9ERVZNQVA9eQpDT05GSUdfQVJDSF9VU0VTX0hJR0hfVk1BX0ZMQUdTPXkKQ09ORklHX0FS
Q0hfSEFTX1BLRVlTPXkKQ09ORklHX1ZNX0VWRU5UX0NPVU5URVJTPXkKIyBDT05GSUdfUEVSQ1BV
X1NUQVRTIGlzIG5vdCBzZXQKIyBDT05GSUdfR1VQX1RFU1QgaXMgbm90IHNldAojIENPTkZJR19E
TUFQT09MX1RFU1QgaXMgbm90IHNldApDT05GSUdfQVJDSF9IQVNfUFRFX1NQRUNJQUw9eQpDT05G
SUdfQVJDSF9IQVNfSFVHRVBEPXkKQ09ORklHX01FTUZEX0NSRUFURT15CiMgQ09ORklHX0FOT05f
Vk1BX05BTUUgaXMgbm90IHNldApDT05GSUdfVVNFUkZBVUxURkQ9eQpDT05GSUdfTFJVX0dFTj15
CkNPTkZJR19MUlVfR0VOX0VOQUJMRUQ9eQojIENPTkZJR19MUlVfR0VOX1NUQVRTIGlzIG5vdCBz
ZXQKQ09ORklHX0FSQ0hfU1VQUE9SVFNfUEVSX1ZNQV9MT0NLPXkKQ09ORklHX1BFUl9WTUFfTE9D
Sz15CkNPTkZJR19MT0NLX01NX0FORF9GSU5EX1ZNQT15CgojCiMgRGF0YSBBY2Nlc3MgTW9uaXRv
cmluZwojCiMgQ09ORklHX0RBTU9OIGlzIG5vdCBzZXQKIyBlbmQgb2YgRGF0YSBBY2Nlc3MgTW9u
aXRvcmluZwojIGVuZCBvZiBNZW1vcnkgTWFuYWdlbWVudCBvcHRpb25zCgpDT05GSUdfTkVUPXkK
Q09ORklHX05FVF9JTkdSRVNTPXkKQ09ORklHX05FVF9FR1JFU1M9eQpDT05GSUdfTkVUX1hHUkVT
Uz15CkNPTkZJR19TS0JfRVhURU5TSU9OUz15CgojCiMgTmV0d29ya2luZyBvcHRpb25zCiMKQ09O
RklHX1BBQ0tFVD15CkNPTkZJR19QQUNLRVRfRElBRz1tCkNPTkZJR19VTklYPXkKQ09ORklHX1VO
SVhfU0NNPXkKQ09ORklHX0FGX1VOSVhfT09CPXkKQ09ORklHX1VOSVhfRElBRz1tCkNPTkZJR19U
TFM9bQpDT05GSUdfVExTX0RFVklDRT15CiMgQ09ORklHX1RMU19UT0UgaXMgbm90IHNldApDT05G
SUdfWEZSTT15CkNPTkZJR19YRlJNX0FMR089eQpDT05GSUdfWEZSTV9VU0VSPW0KIyBDT05GSUdf
WEZSTV9JTlRFUkZBQ0UgaXMgbm90IHNldAojIENPTkZJR19YRlJNX1NVQl9QT0xJQ1kgaXMgbm90
IHNldAojIENPTkZJR19YRlJNX01JR1JBVEUgaXMgbm90IHNldAojIENPTkZJR19YRlJNX1NUQVRJ
U1RJQ1MgaXMgbm90IHNldApDT05GSUdfWEZSTV9BSD1tCkNPTkZJR19YRlJNX0VTUD1tCkNPTkZJ
R19YRlJNX0lQQ09NUD1tCkNPTkZJR19ORVRfS0VZPXkKIyBDT05GSUdfTkVUX0tFWV9NSUdSQVRF
IGlzIG5vdCBzZXQKIyBDT05GSUdfWERQX1NPQ0tFVFMgaXMgbm90IHNldApDT05GSUdfTkVUX0hB
TkRTSEFLRT15CiMgQ09ORklHX05FVF9IQU5EU0hBS0VfS1VOSVRfVEVTVCBpcyBub3Qgc2V0CkNP
TkZJR19JTkVUPXkKIyBDT05GSUdfSVBfTVVMVElDQVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfSVBf
QURWQU5DRURfUk9VVEVSIGlzIG5vdCBzZXQKIyBDT05GSUdfSVBfUE5QIGlzIG5vdCBzZXQKIyBD
T05GSUdfTkVUX0lQSVAgaXMgbm90IHNldAojIENPTkZJR19ORVRfSVBHUkVfREVNVVggaXMgbm90
IHNldApDT05GSUdfTkVUX0lQX1RVTk5FTD1tCkNPTkZJR19TWU5fQ09PS0lFUz15CiMgQ09ORklH
X05FVF9JUFZUSSBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVURQX1RVTk5FTD1tCiMgQ09ORklHX05F
VF9GT1UgaXMgbm90IHNldApDT05GSUdfSU5FVF9BSD1tCkNPTkZJR19JTkVUX0VTUD1tCiMgQ09O
RklHX0lORVRfRVNQX09GRkxPQUQgaXMgbm90IHNldAojIENPTkZJR19JTkVUX0VTUElOVENQIGlz
IG5vdCBzZXQKQ09ORklHX0lORVRfSVBDT01QPW0KQ09ORklHX0lORVRfVEFCTEVfUEVSVFVSQl9P
UkRFUj0xNgpDT05GSUdfSU5FVF9YRlJNX1RVTk5FTD1tCkNPTkZJR19JTkVUX1RVTk5FTD1tCiMg
Q09ORklHX0lORVRfRElBRyBpcyBub3Qgc2V0CkNPTkZJR19UQ1BfQ09OR19BRFZBTkNFRD15CiMg
Q09ORklHX1RDUF9DT05HX0JJQyBpcyBub3Qgc2V0CiMgQ09ORklHX1RDUF9DT05HX0NVQklDIGlz
IG5vdCBzZXQKQ09ORklHX1RDUF9DT05HX1dFU1RXT09EPXkKIyBDT05GSUdfVENQX0NPTkdfSFRD
UCBpcyBub3Qgc2V0CiMgQ09ORklHX1RDUF9DT05HX0hTVENQIGlzIG5vdCBzZXQKIyBDT05GSUdf
VENQX0NPTkdfSFlCTEEgaXMgbm90IHNldAojIENPTkZJR19UQ1BfQ09OR19WRUdBUyBpcyBub3Qg
c2V0CiMgQ09ORklHX1RDUF9DT05HX05WIGlzIG5vdCBzZXQKIyBDT05GSUdfVENQX0NPTkdfU0NB
TEFCTEUgaXMgbm90IHNldAojIENPTkZJR19UQ1BfQ09OR19MUCBpcyBub3Qgc2V0CiMgQ09ORklH
X1RDUF9DT05HX1ZFTk8gaXMgbm90IHNldAojIENPTkZJR19UQ1BfQ09OR19ZRUFIIGlzIG5vdCBz
ZXQKIyBDT05GSUdfVENQX0NPTkdfSUxMSU5PSVMgaXMgbm90IHNldAojIENPTkZJR19UQ1BfQ09O
R19EQ1RDUCBpcyBub3Qgc2V0CiMgQ09ORklHX1RDUF9DT05HX0NERyBpcyBub3Qgc2V0CiMgQ09O
RklHX1RDUF9DT05HX0JCUiBpcyBub3Qgc2V0CkNPTkZJR19ERUZBVUxUX1dFU1RXT09EPXkKIyBD
T05GSUdfREVGQVVMVF9SRU5PIGlzIG5vdCBzZXQKQ09ORklHX0RFRkFVTFRfVENQX0NPTkc9Indl
c3R3b29kIgojIENPTkZJR19UQ1BfQU8gaXMgbm90IHNldAojIENPTkZJR19UQ1BfTUQ1U0lHIGlz
IG5vdCBzZXQKQ09ORklHX0lQVjY9eQojIENPTkZJR19JUFY2X1JPVVRFUl9QUkVGIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSVBWNl9PUFRJTUlTVElDX0RBRCBpcyBub3Qgc2V0CkNPTkZJR19JTkVUNl9B
SD1tCkNPTkZJR19JTkVUNl9FU1A9bQojIENPTkZJR19JTkVUNl9FU1BfT0ZGTE9BRCBpcyBub3Qg
c2V0CiMgQ09ORklHX0lORVQ2X0VTUElOVENQIGlzIG5vdCBzZXQKQ09ORklHX0lORVQ2X0lQQ09N
UD1tCiMgQ09ORklHX0lQVjZfTUlQNiBpcyBub3Qgc2V0CkNPTkZJR19JTkVUNl9YRlJNX1RVTk5F
TD1tCkNPTkZJR19JTkVUNl9UVU5ORUw9bQojIENPTkZJR19JUFY2X1ZUSSBpcyBub3Qgc2V0CiMg
Q09ORklHX0lQVjZfU0lUIGlzIG5vdCBzZXQKIyBDT05GSUdfSVBWNl9UVU5ORUwgaXMgbm90IHNl
dAojIENPTkZJR19JUFY2X01VTFRJUExFX1RBQkxFUyBpcyBub3Qgc2V0CiMgQ09ORklHX0lQVjZf
TVJPVVRFIGlzIG5vdCBzZXQKIyBDT05GSUdfSVBWNl9TRUc2X0xXVFVOTkVMIGlzIG5vdCBzZXQK
IyBDT05GSUdfSVBWNl9TRUc2X0hNQUMgaXMgbm90IHNldAojIENPTkZJR19JUFY2X1JQTF9MV1RV
Tk5FTCBpcyBub3Qgc2V0CiMgQ09ORklHX0lQVjZfSU9BTTZfTFdUVU5ORUwgaXMgbm90IHNldAoj
IENPTkZJR19ORVRMQUJFTCBpcyBub3Qgc2V0CiMgQ09ORklHX01QVENQIGlzIG5vdCBzZXQKIyBD
T05GSUdfTkVUV09SS19TRUNNQVJLIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUV09SS19QSFlfVElN
RVNUQU1QSU5HIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVURklMVEVSIGlzIG5vdCBzZXQKIyBDT05G
SUdfQlBGSUxURVIgaXMgbm90IHNldAojIENPTkZJR19JUF9EQ0NQIGlzIG5vdCBzZXQKQ09ORklH
X0lQX1NDVFA9bQojIENPTkZJR19TQ1RQX0RCR19PQkpDTlQgaXMgbm90IHNldApDT05GSUdfU0NU
UF9ERUZBVUxUX0NPT0tJRV9ITUFDX01ENT15CiMgQ09ORklHX1NDVFBfREVGQVVMVF9DT09LSUVf
SE1BQ19TSEExIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NUUF9ERUZBVUxUX0NPT0tJRV9ITUFDX05P
TkUgaXMgbm90IHNldApDT05GSUdfU0NUUF9DT09LSUVfSE1BQ19NRDU9eQojIENPTkZJR19TQ1RQ
X0NPT0tJRV9ITUFDX1NIQTEgaXMgbm90IHNldAojIENPTkZJR19SRFMgaXMgbm90IHNldAojIENP
TkZJR19USVBDIGlzIG5vdCBzZXQKIyBDT05GSUdfQVRNIGlzIG5vdCBzZXQKIyBDT05GSUdfTDJU
UCBpcyBub3Qgc2V0CkNPTkZJR19TVFA9eQpDT05GSUdfQlJJREdFPXkKQ09ORklHX0JSSURHRV9J
R01QX1NOT09QSU5HPXkKIyBDT05GSUdfQlJJREdFX01SUCBpcyBub3Qgc2V0CiMgQ09ORklHX0JS
SURHRV9DRk0gaXMgbm90IHNldAojIENPTkZJR19ORVRfRFNBIGlzIG5vdCBzZXQKIyBDT05GSUdf
VkxBTl84MDIxUSBpcyBub3Qgc2V0CkNPTkZJR19MTEM9eQojIENPTkZJR19MTEMyIGlzIG5vdCBz
ZXQKIyBDT05GSUdfQVRBTEsgaXMgbm90IHNldAojIENPTkZJR19YMjUgaXMgbm90IHNldAojIENP
TkZJR19MQVBCIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhPTkVUIGlzIG5vdCBzZXQKIyBDT05GSUdf
NkxPV1BBTiBpcyBub3Qgc2V0CiMgQ09ORklHX0lFRUU4MDIxNTQgaXMgbm90IHNldApDT05GSUdf
TkVUX1NDSEVEPXkKCiMKIyBRdWV1ZWluZy9TY2hlZHVsaW5nCiMKIyBDT05GSUdfTkVUX1NDSF9I
VEIgaXMgbm90IHNldAojIENPTkZJR19ORVRfU0NIX0hGU0MgaXMgbm90IHNldAojIENPTkZJR19O
RVRfU0NIX1BSSU8gaXMgbm90IHNldAojIENPTkZJR19ORVRfU0NIX01VTFRJUSBpcyBub3Qgc2V0
CiMgQ09ORklHX05FVF9TQ0hfUkVEIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1NDSF9TRkIgaXMg
bm90IHNldAojIENPTkZJR19ORVRfU0NIX1NGUSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9TQ0hf
VEVRTCBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9TQ0hfVEJGIGlzIG5vdCBzZXQKIyBDT05GSUdf
TkVUX1NDSF9DQlMgaXMgbm90IHNldAojIENPTkZJR19ORVRfU0NIX0VURiBpcyBub3Qgc2V0CiMg
Q09ORklHX05FVF9TQ0hfVEFQUklPIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1NDSF9HUkVEIGlz
IG5vdCBzZXQKIyBDT05GSUdfTkVUX1NDSF9ORVRFTSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9T
Q0hfRFJSIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1NDSF9NUVBSSU8gaXMgbm90IHNldAojIENP
TkZJR19ORVRfU0NIX1NLQlBSSU8gaXMgbm90IHNldAojIENPTkZJR19ORVRfU0NIX0NIT0tFIGlz
IG5vdCBzZXQKIyBDT05GSUdfTkVUX1NDSF9RRlEgaXMgbm90IHNldAojIENPTkZJR19ORVRfU0NI
X0NPREVMIGlzIG5vdCBzZXQKQ09ORklHX05FVF9TQ0hfRlFfQ09ERUw9eQojIENPTkZJR19ORVRf
U0NIX0NBS0UgaXMgbm90IHNldAojIENPTkZJR19ORVRfU0NIX0ZRIGlzIG5vdCBzZXQKIyBDT05G
SUdfTkVUX1NDSF9ISEYgaXMgbm90IHNldAojIENPTkZJR19ORVRfU0NIX1BJRSBpcyBub3Qgc2V0
CiMgQ09ORklHX05FVF9TQ0hfUExVRyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9TQ0hfRVRTIGlz
IG5vdCBzZXQKQ09ORklHX05FVF9TQ0hfREVGQVVMVD15CkNPTkZJR19ERUZBVUxUX0ZRX0NPREVM
PXkKIyBDT05GSUdfREVGQVVMVF9QRklGT19GQVNUIGlzIG5vdCBzZXQKQ09ORklHX0RFRkFVTFRf
TkVUX1NDSD0iZnFfY29kZWwiCgojCiMgQ2xhc3NpZmljYXRpb24KIwojIENPTkZJR19ORVRfQ0xT
X0JBU0lDIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX0NMU19ST1VURTQgaXMgbm90IHNldAojIENP
TkZJR19ORVRfQ0xTX0ZXIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX0NMU19VMzIgaXMgbm90IHNl
dAojIENPTkZJR19ORVRfQ0xTX0ZMT1cgaXMgbm90IHNldAojIENPTkZJR19ORVRfQ0xTX0NHUk9V
UCBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9DTFNfQlBGIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVU
X0NMU19GTE9XRVIgaXMgbm90IHNldAojIENPTkZJR19ORVRfQ0xTX01BVENIQUxMIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTkVUX0VNQVRDSCBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9DTFNfQUNUIGlz
IG5vdCBzZXQKQ09ORklHX05FVF9TQ0hfRklGTz15CiMgQ09ORklHX0RDQiBpcyBub3Qgc2V0CkNP
TkZJR19ETlNfUkVTT0xWRVI9bQojIENPTkZJR19CQVRNQU5fQURWIGlzIG5vdCBzZXQKIyBDT05G
SUdfT1BFTlZTV0lUQ0ggaXMgbm90IHNldApDT05GSUdfVlNPQ0tFVFM9bQpDT05GSUdfVlNPQ0tF
VFNfRElBRz1tCiMgQ09ORklHX1ZTT0NLRVRTX0xPT1BCQUNLIGlzIG5vdCBzZXQKIyBDT05GSUdf
VklSVElPX1ZTT0NLRVRTIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUTElOS19ESUFHIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTVBMUyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9OU0ggaXMgbm90IHNldAoj
IENPTkZJR19IU1IgaXMgbm90IHNldAojIENPTkZJR19ORVRfU1dJVENIREVWIGlzIG5vdCBzZXQK
IyBDT05GSUdfTkVUX0wzX01BU1RFUl9ERVYgaXMgbm90IHNldAojIENPTkZJR19RUlRSIGlzIG5v
dCBzZXQKIyBDT05GSUdfTkVUX05DU0kgaXMgbm90IHNldApDT05GSUdfUENQVV9ERVZfUkVGQ05U
PXkKQ09ORklHX01BWF9TS0JfRlJBR1M9MTcKQ09ORklHX1JQUz15CkNPTkZJR19SRlNfQUNDRUw9
eQpDT05GSUdfU09DS19SWF9RVUVVRV9NQVBQSU5HPXkKQ09ORklHX1hQUz15CiMgQ09ORklHX0NH
Uk9VUF9ORVRfUFJJTyBpcyBub3Qgc2V0CkNPTkZJR19DR1JPVVBfTkVUX0NMQVNTSUQ9eQpDT05G
SUdfTkVUX1JYX0JVU1lfUE9MTD15CkNPTkZJR19CUUw9eQpDT05GSUdfQlBGX1NUUkVBTV9QQVJT
RVI9eQpDT05GSUdfTkVUX0ZMT1dfTElNSVQ9eQoKIwojIE5ldHdvcmsgdGVzdGluZwojCiMgQ09O
RklHX05FVF9QS1RHRU4gaXMgbm90IHNldAojIGVuZCBvZiBOZXR3b3JrIHRlc3RpbmcKIyBlbmQg
b2YgTmV0d29ya2luZyBvcHRpb25zCgojIENPTkZJR19IQU1SQURJTyBpcyBub3Qgc2V0CiMgQ09O
RklHX0NBTiBpcyBub3Qgc2V0CkNPTkZJR19CVD1tCkNPTkZJR19CVF9CUkVEUj15CkNPTkZJR19C
VF9SRkNPTU09bQpDT05GSUdfQlRfUkZDT01NX1RUWT15CkNPTkZJR19CVF9CTkVQPW0KQ09ORklH
X0JUX0JORVBfTUNfRklMVEVSPXkKQ09ORklHX0JUX0JORVBfUFJPVE9fRklMVEVSPXkKQ09ORklH
X0JUX0hJRFA9bQpDT05GSUdfQlRfSFM9eQpDT05GSUdfQlRfTEU9eQpDT05GSUdfQlRfTEVfTDJD
QVBfRUNSRUQ9eQojIENPTkZJR19CVF9MRURTIGlzIG5vdCBzZXQKQ09ORklHX0JUX01TRlRFWFQ9
eQpDT05GSUdfQlRfQU9TUEVYVD15CkNPTkZJR19CVF9ERUJVR0ZTPXkKIyBDT05GSUdfQlRfU0VM
RlRFU1QgaXMgbm90IHNldApDT05GSUdfQlRfRkVBVFVSRV9ERUJVRz15CgojCiMgQmx1ZXRvb3Ro
IGRldmljZSBkcml2ZXJzCiMKQ09ORklHX0JUX0lOVEVMPW0KQ09ORklHX0JUX0JDTT1tCkNPTkZJ
R19CVF9SVEw9bQpDT05GSUdfQlRfTVRLPW0KQ09ORklHX0JUX0hDSUJUVVNCPW0KQ09ORklHX0JU
X0hDSUJUVVNCX0FVVE9TVVNQRU5EPXkKQ09ORklHX0JUX0hDSUJUVVNCX1BPTExfU1lOQz15CkNP
TkZJR19CVF9IQ0lCVFVTQl9CQ009eQpDT05GSUdfQlRfSENJQlRVU0JfTVRLPXkKQ09ORklHX0JU
X0hDSUJUVVNCX1JUTD15CkNPTkZJR19CVF9IQ0lVQVJUPW0KQ09ORklHX0JUX0hDSVVBUlRfSDQ9
eQpDT05GSUdfQlRfSENJVUFSVF9CQ1NQPXkKQ09ORklHX0JUX0hDSVVBUlRfQVRIM0s9eQpDT05G
SUdfQlRfSENJVUFSVF9JTlRFTD15CkNPTkZJR19CVF9IQ0lVQVJUX0FHNlhYPXkKQ09ORklHX0JU
X0hDSUJDTTIwM1g9bQojIENPTkZJR19CVF9IQ0lCQ000Mzc3IGlzIG5vdCBzZXQKIyBDT05GSUdf
QlRfSENJQlBBMTBYIGlzIG5vdCBzZXQKQ09ORklHX0JUX0hDSUJGVVNCPW0KIyBDT05GSUdfQlRf
SENJVkhDSSBpcyBub3Qgc2V0CkNPTkZJR19CVF9NUlZMPW0KQ09ORklHX0JUX0FUSDNLPW0KIyBD
T05GSUdfQlRfVklSVElPIGlzIG5vdCBzZXQKIyBlbmQgb2YgQmx1ZXRvb3RoIGRldmljZSBkcml2
ZXJzCgojIENPTkZJR19BRl9SWFJQQyBpcyBub3Qgc2V0CiMgQ09ORklHX0FGX0tDTSBpcyBub3Qg
c2V0CkNPTkZJR19TVFJFQU1fUEFSU0VSPXkKIyBDT05GSUdfTUNUUCBpcyBub3Qgc2V0CkNPTkZJ
R19XSVJFTEVTUz15CkNPTkZJR19DRkc4MDIxMT1tCiMgQ09ORklHX05MODAyMTFfVEVTVE1PREUg
aXMgbm90IHNldAojIENPTkZJR19DRkc4MDIxMV9ERVZFTE9QRVJfV0FSTklOR1MgaXMgbm90IHNl
dAojIENPTkZJR19DRkc4MDIxMV9DRVJUSUZJQ0FUSU9OX09OVVMgaXMgbm90IHNldApDT05GSUdf
Q0ZHODAyMTFfUkVRVUlSRV9TSUdORURfUkVHREI9eQpDT05GSUdfQ0ZHODAyMTFfVVNFX0tFUk5F
TF9SRUdEQl9LRVlTPXkKQ09ORklHX0NGRzgwMjExX0RFRkFVTFRfUFM9eQojIENPTkZJR19DRkc4
MDIxMV9ERUJVR0ZTIGlzIG5vdCBzZXQKQ09ORklHX0NGRzgwMjExX0NSREFfU1VQUE9SVD15CiMg
Q09ORklHX0NGRzgwMjExX1dFWFQgaXMgbm90IHNldApDT05GSUdfQ0ZHODAyMTFfS1VOSVRfVEVT
VD1tCkNPTkZJR19NQUM4MDIxMT1tCkNPTkZJR19NQUM4MDIxMV9IQVNfUkM9eQpDT05GSUdfTUFD
ODAyMTFfUkNfTUlOU1RSRUw9eQpDT05GSUdfTUFDODAyMTFfUkNfREVGQVVMVF9NSU5TVFJFTD15
CkNPTkZJR19NQUM4MDIxMV9SQ19ERUZBVUxUPSJtaW5zdHJlbF9odCIKQ09ORklHX01BQzgwMjEx
X0tVTklUX1RFU1Q9bQojIENPTkZJR19NQUM4MDIxMV9NRVNIIGlzIG5vdCBzZXQKQ09ORklHX01B
QzgwMjExX0xFRFM9eQojIENPTkZJR19NQUM4MDIxMV9NRVNTQUdFX1RSQUNJTkcgaXMgbm90IHNl
dAojIENPTkZJR19NQUM4MDIxMV9ERUJVR19NRU5VIGlzIG5vdCBzZXQKQ09ORklHX01BQzgwMjEx
X1NUQV9IQVNIX01BWF9TSVpFPTAKQ09ORklHX1JGS0lMTD1tCkNPTkZJR19SRktJTExfTEVEUz15
CiMgQ09ORklHX1JGS0lMTF9JTlBVVCBpcyBub3Qgc2V0CiMgQ09ORklHX1JGS0lMTF9HUElPIGlz
IG5vdCBzZXQKQ09ORklHX05FVF85UD15CkNPTkZJR19ORVRfOVBfRkQ9eQpDT05GSUdfTkVUXzlQ
X1ZJUlRJTz15CiMgQ09ORklHX05FVF85UF9ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX0NBSUYg
aXMgbm90IHNldAojIENPTkZJR19DRVBIX0xJQiBpcyBub3Qgc2V0CiMgQ09ORklHX05GQyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1BTQU1QTEUgaXMgbm90IHNldAojIENPTkZJR19ORVRfSUZFIGlzIG5v
dCBzZXQKIyBDT05GSUdfTFdUVU5ORUwgaXMgbm90IHNldApDT05GSUdfRFNUX0NBQ0hFPXkKQ09O
RklHX0dST19DRUxMUz15CkNPTkZJR19TT0NLX1ZBTElEQVRFX1hNSVQ9eQpDT05GSUdfTkVUX1NF
TEZURVNUUz15CkNPTkZJR19ORVRfU09DS19NU0c9eQpDT05GSUdfUEFHRV9QT09MPXkKIyBDT05G
SUdfUEFHRV9QT09MX1NUQVRTIGlzIG5vdCBzZXQKQ09ORklHX0ZBSUxPVkVSPXkKQ09ORklHX0VU
SFRPT0xfTkVUTElOSz15CkNPTkZJR19ORVRERVZfQUREUl9MSVNUX1RFU1Q9bQpDT05GSUdfTkVU
X1RFU1Q9bQoKIwojIERldmljZSBEcml2ZXJzCiMKQ09ORklHX0hBVkVfUENJPXkKQ09ORklHX0ZP
UkNFX1BDST15CkNPTkZJR19QQ0k9eQpDT05GSUdfUENJX0RPTUFJTlM9eQpDT05GSUdfUENJX1NZ
U0NBTEw9eQpDT05GSUdfUENJRVBPUlRCVVM9eQpDT05GSUdfUENJRUFFUj15CiMgQ09ORklHX1BD
SUVBRVJfSU5KRUNUIGlzIG5vdCBzZXQKIyBDT05GSUdfUENJRV9FQ1JDIGlzIG5vdCBzZXQKQ09O
RklHX1BDSUVBU1BNPXkKQ09ORklHX1BDSUVBU1BNX0RFRkFVTFQ9eQojIENPTkZJR19QQ0lFQVNQ
TV9QT1dFUlNBVkUgaXMgbm90IHNldAojIENPTkZJR19QQ0lFQVNQTV9QT1dFUl9TVVBFUlNBVkUg
aXMgbm90IHNldAojIENPTkZJR19QQ0lFQVNQTV9QRVJGT1JNQU5DRSBpcyBub3Qgc2V0CkNPTkZJ
R19QQ0lFX1BNRT15CiMgQ09ORklHX1BDSUVfRFBDIGlzIG5vdCBzZXQKIyBDT05GSUdfUENJRV9Q
VE0gaXMgbm90IHNldApDT05GSUdfUENJX01TST15CkNPTkZJR19QQ0lfTVNJX0FSQ0hfRkFMTEJB
Q0tTPXkKQ09ORklHX1BDSV9RVUlSS1M9eQojIENPTkZJR19QQ0lfREVCVUcgaXMgbm90IHNldAoj
IENPTkZJR19QQ0lfU1RVQiBpcyBub3Qgc2V0CkNPTkZJR19QQ0lfQVRTPXkKIyBDT05GSUdfUENJ
X0lPViBpcyBub3Qgc2V0CkNPTkZJR19QQ0lfUFJJPXkKQ09ORklHX1BDSV9QQVNJRD15CkNPTkZJ
R19QQ0lfRFlOQU1JQ19PRl9OT0RFUz15CiMgQ09ORklHX1BDSUVfQlVTX1RVTkVfT0ZGIGlzIG5v
dCBzZXQKQ09ORklHX1BDSUVfQlVTX0RFRkFVTFQ9eQojIENPTkZJR19QQ0lFX0JVU19TQUZFIGlz
IG5vdCBzZXQKIyBDT05GSUdfUENJRV9CVVNfUEVSRk9STUFOQ0UgaXMgbm90IHNldAojIENPTkZJ
R19QQ0lFX0JVU19QRUVSMlBFRVIgaXMgbm90IHNldApDT05GSUdfVkdBX0FSQj15CkNPTkZJR19W
R0FfQVJCX01BWF9HUFVTPTQKIyBDT05GSUdfSE9UUExVR19QQ0kgaXMgbm90IHNldAoKIwojIFBD
SSBjb250cm9sbGVyIGRyaXZlcnMKIwojIENPTkZJR19QQ0lfRlRQQ0kxMDAgaXMgbm90IHNldAoj
IENPTkZJR19QQ0lfSE9TVF9HRU5FUklDIGlzIG5vdCBzZXQKIyBDT05GSUdfUENJRV9NSUNST0NI
SVBfSE9TVCBpcyBub3Qgc2V0CiMgQ09ORklHX1BDSUVfWElMSU5YIGlzIG5vdCBzZXQKCiMKIyBD
YWRlbmNlLWJhc2VkIFBDSWUgY29udHJvbGxlcnMKIwojIENPTkZJR19QQ0lFX0NBREVOQ0VfUExB
VF9IT1NUIGlzIG5vdCBzZXQKIyBDT05GSUdfUENJX0o3MjFFX0hPU1QgaXMgbm90IHNldAojIGVu
ZCBvZiBDYWRlbmNlLWJhc2VkIFBDSWUgY29udHJvbGxlcnMKCiMKIyBEZXNpZ25XYXJlLWJhc2Vk
IFBDSWUgY29udHJvbGxlcnMKIwojIENPTkZJR19QQ0lfTUVTT04gaXMgbm90IHNldAojIENPTkZJ
R19QQ0lFX0RXX1BMQVRfSE9TVCBpcyBub3Qgc2V0CiMgZW5kIG9mIERlc2lnbldhcmUtYmFzZWQg
UENJZSBjb250cm9sbGVycwoKIwojIE1vYml2ZWlsLWJhc2VkIFBDSWUgY29udHJvbGxlcnMKIwoj
IGVuZCBvZiBNb2JpdmVpbC1iYXNlZCBQQ0llIGNvbnRyb2xsZXJzCiMgZW5kIG9mIFBDSSBjb250
cm9sbGVyIGRyaXZlcnMKCiMKIyBQQ0kgRW5kcG9pbnQKIwojIENPTkZJR19QQ0lfRU5EUE9JTlQg
aXMgbm90IHNldAojIGVuZCBvZiBQQ0kgRW5kcG9pbnQKCiMKIyBQQ0kgc3dpdGNoIGNvbnRyb2xs
ZXIgZHJpdmVycwojCiMgQ09ORklHX1BDSV9TV19TV0lUQ0hURUMgaXMgbm90IHNldAojIGVuZCBv
ZiBQQ0kgc3dpdGNoIGNvbnRyb2xsZXIgZHJpdmVycwoKIyBDT05GSUdfQ1hMX0JVUyBpcyBub3Qg
c2V0CiMgQ09ORklHX1BDQ0FSRCBpcyBub3Qgc2V0CiMgQ09ORklHX1JBUElESU8gaXMgbm90IHNl
dAoKIwojIEdlbmVyaWMgRHJpdmVyIE9wdGlvbnMKIwojIENPTkZJR19VRVZFTlRfSEVMUEVSIGlz
IG5vdCBzZXQKQ09ORklHX0RFVlRNUEZTPXkKQ09ORklHX0RFVlRNUEZTX01PVU5UPXkKQ09ORklH
X0RFVlRNUEZTX1NBRkU9eQpDT05GSUdfU1RBTkRBTE9ORT15CkNPTkZJR19QUkVWRU5UX0ZJUk1X
QVJFX0JVSUxEPXkKCiMKIyBGaXJtd2FyZSBsb2FkZXIKIwpDT05GSUdfRldfTE9BREVSPXkKQ09O
RklHX0VYVFJBX0ZJUk1XQVJFPSIiCiMgQ09ORklHX0ZXX0xPQURFUl9VU0VSX0hFTFBFUiBpcyBu
b3Qgc2V0CkNPTkZJR19GV19MT0FERVJfQ09NUFJFU1M9eQojIENPTkZJR19GV19MT0FERVJfQ09N
UFJFU1NfWFogaXMgbm90IHNldApDT05GSUdfRldfTE9BREVSX0NPTVBSRVNTX1pTVEQ9eQojIENP
TkZJR19GV19VUExPQUQgaXMgbm90IHNldAojIGVuZCBvZiBGaXJtd2FyZSBsb2FkZXIKCkNPTkZJ
R19BTExPV19ERVZfQ09SRURVTVA9eQojIENPTkZJR19ERUJVR19EUklWRVIgaXMgbm90IHNldAoj
IENPTkZJR19ERUJVR19ERVZSRVMgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19URVNUX0RSSVZF
Ul9SRU1PVkUgaXMgbm90IHNldAojIENPTkZJR19URVNUX0FTWU5DX0RSSVZFUl9QUk9CRSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0RNX0tVTklUX1RFU1QgaXMgbm90IHNldApDT05GSUdfRFJJVkVSX1BF
X0tVTklUX1RFU1Q9bQpDT05GSUdfR0VORVJJQ19DUFVfQVVUT1BST0JFPXkKQ09ORklHX0dFTkVS
SUNfQ1BVX1ZVTE5FUkFCSUxJVElFUz15CkNPTkZJR19SRUdNQVA9eQpDT05GSUdfUkVHTUFQX0tV
TklUPW0KIyBDT05GSUdfUkVHTUFQX0JVSUxEIGlzIG5vdCBzZXQKQ09ORklHX1JFR01BUF9JMkM9
bQpDT05GSUdfUkVHTUFQX1JBTT1tCkNPTkZJR19ETUFfU0hBUkVEX0JVRkZFUj15CkNPTkZJR19E
TUFfRkVOQ0VfVFJBQ0U9eQojIENPTkZJR19GV19ERVZMSU5LX1NZTkNfU1RBVEVfVElNRU9VVCBp
cyBub3Qgc2V0CiMgZW5kIG9mIEdlbmVyaWMgRHJpdmVyIE9wdGlvbnMKCiMKIyBCdXMgZGV2aWNl
cwojCiMgQ09ORklHX01ISV9CVVMgaXMgbm90IHNldAojIENPTkZJR19NSElfQlVTX0VQIGlzIG5v
dCBzZXQKIyBlbmQgb2YgQnVzIGRldmljZXMKCiMKIyBDYWNoZSBEcml2ZXJzCiMKIyBlbmQgb2Yg
Q2FjaGUgRHJpdmVycwoKQ09ORklHX0NPTk5FQ1RPUj15CkNPTkZJR19QUk9DX0VWRU5UUz15Cgoj
CiMgRmlybXdhcmUgRHJpdmVycwojCgojCiMgQVJNIFN5c3RlbSBDb250cm9sIGFuZCBNYW5hZ2Vt
ZW50IEludGVyZmFjZSBQcm90b2NvbAojCiMgZW5kIG9mIEFSTSBTeXN0ZW0gQ29udHJvbCBhbmQg
TWFuYWdlbWVudCBJbnRlcmZhY2UgUHJvdG9jb2wKCkNPTkZJR19GSVJNV0FSRV9NRU1NQVA9eQoj
IENPTkZJR19HT09HTEVfRklSTVdBUkUgaXMgbm90IHNldAoKIwojIFF1YWxjb21tIGZpcm13YXJl
IGRyaXZlcnMKIwojIGVuZCBvZiBRdWFsY29tbSBmaXJtd2FyZSBkcml2ZXJzCgojCiMgVGVncmEg
ZmlybXdhcmUgZHJpdmVyCiMKIyBlbmQgb2YgVGVncmEgZmlybXdhcmUgZHJpdmVyCiMgZW5kIG9m
IEZpcm13YXJlIERyaXZlcnMKCiMgQ09ORklHX0dOU1MgaXMgbm90IHNldApDT05GSUdfTVREPW0K
IyBDT05GSUdfTVREX1RFU1RTIGlzIG5vdCBzZXQKCiMKIyBQYXJ0aXRpb24gcGFyc2VycwojCiMg
Q09ORklHX01URF9DTURMSU5FX1BBUlRTIGlzIG5vdCBzZXQKQ09ORklHX01URF9PRl9QQVJUUz1t
CiMgQ09ORklHX01URF9SRURCT09UX1BBUlRTIGlzIG5vdCBzZXQKIyBlbmQgb2YgUGFydGl0aW9u
IHBhcnNlcnMKCiMKIyBVc2VyIE1vZHVsZXMgQW5kIFRyYW5zbGF0aW9uIExheWVycwojCkNPTkZJ
R19NVERfQkxLREVWUz1tCkNPTkZJR19NVERfQkxPQ0s9bQojIENPTkZJR19NVERfQkxPQ0tfUk8g
aXMgbm90IHNldAoKIwojIE5vdGUgdGhhdCBpbiBzb21lIGNhc2VzIFVCSSBibG9jayBpcyBwcmVm
ZXJyZWQuIFNlZSBNVERfVUJJX0JMT0NLLgojCiMgQ09ORklHX0ZUTCBpcyBub3Qgc2V0CiMgQ09O
RklHX05GVEwgaXMgbm90IHNldAojIENPTkZJR19JTkZUTCBpcyBub3Qgc2V0CiMgQ09ORklHX1JG
RF9GVEwgaXMgbm90IHNldAojIENPTkZJR19TU0ZEQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NNX0ZU
TCBpcyBub3Qgc2V0CiMgQ09ORklHX01URF9PT1BTIGlzIG5vdCBzZXQKIyBDT05GSUdfTVREX1NX
QVAgaXMgbm90IHNldAojIENPTkZJR19NVERfUEFSVElUSU9ORURfTUFTVEVSIGlzIG5vdCBzZXQK
CiMKIyBSQU0vUk9NL0ZsYXNoIGNoaXAgZHJpdmVycwojCiMgQ09ORklHX01URF9DRkkgaXMgbm90
IHNldAojIENPTkZJR19NVERfSkVERUNQUk9CRSBpcyBub3Qgc2V0CkNPTkZJR19NVERfTUFQX0JB
TktfV0lEVEhfMT15CkNPTkZJR19NVERfTUFQX0JBTktfV0lEVEhfMj15CkNPTkZJR19NVERfTUFQ
X0JBTktfV0lEVEhfND15CkNPTkZJR19NVERfQ0ZJX0kxPXkKQ09ORklHX01URF9DRklfSTI9eQoj
IENPTkZJR19NVERfUkFNIGlzIG5vdCBzZXQKIyBDT05GSUdfTVREX1JPTSBpcyBub3Qgc2V0CiMg
Q09ORklHX01URF9BQlNFTlQgaXMgbm90IHNldAojIGVuZCBvZiBSQU0vUk9NL0ZsYXNoIGNoaXAg
ZHJpdmVycwoKIwojIE1hcHBpbmcgZHJpdmVycyBmb3IgY2hpcCBhY2Nlc3MKIwojIENPTkZJR19N
VERfQ09NUExFWF9NQVBQSU5HUyBpcyBub3Qgc2V0CiMgQ09ORklHX01URF9JTlRFTF9WUl9OT1Ig
aXMgbm90IHNldAojIENPTkZJR19NVERfUExBVFJBTSBpcyBub3Qgc2V0CiMgZW5kIG9mIE1hcHBp
bmcgZHJpdmVycyBmb3IgY2hpcCBhY2Nlc3MKCiMKIyBTZWxmLWNvbnRhaW5lZCBNVEQgZGV2aWNl
IGRyaXZlcnMKIwojIENPTkZJR19NVERfUE1DNTUxIGlzIG5vdCBzZXQKIyBDT05GSUdfTVREX1NM
UkFNIGlzIG5vdCBzZXQKIyBDT05GSUdfTVREX1BIUkFNIGlzIG5vdCBzZXQKIyBDT05GSUdfTVRE
X01URFJBTSBpcyBub3Qgc2V0CiMgQ09ORklHX01URF9CTE9DSzJNVEQgaXMgbm90IHNldApDT05G
SUdfTVREX1BPV0VSTlZfRkxBU0g9bQoKIwojIERpc2stT24tQ2hpcCBEZXZpY2UgRHJpdmVycwoj
CiMgQ09ORklHX01URF9ET0NHMyBpcyBub3Qgc2V0CiMgZW5kIG9mIFNlbGYtY29udGFpbmVkIE1U
RCBkZXZpY2UgZHJpdmVycwoKIwojIE5BTkQKIwojIENPTkZJR19NVERfT05FTkFORCBpcyBub3Qg
c2V0CiMgQ09ORklHX01URF9SQVdfTkFORCBpcyBub3Qgc2V0CgojCiMgRUNDIGVuZ2luZSBzdXBw
b3J0CiMKIyBDT05GSUdfTVREX05BTkRfRUNDX1NXX0hBTU1JTkcgaXMgbm90IHNldAojIENPTkZJ
R19NVERfTkFORF9FQ0NfU1dfQkNIIGlzIG5vdCBzZXQKIyBDT05GSUdfTVREX05BTkRfRUNDX01Y
SUMgaXMgbm90IHNldAojIGVuZCBvZiBFQ0MgZW5naW5lIHN1cHBvcnQKIyBlbmQgb2YgTkFORAoK
IwojIExQRERSICYgTFBERFIyIFBDTSBtZW1vcnkgZHJpdmVycwojCiMgQ09ORklHX01URF9MUERE
UiBpcyBub3Qgc2V0CiMgZW5kIG9mIExQRERSICYgTFBERFIyIFBDTSBtZW1vcnkgZHJpdmVycwoK
IyBDT05GSUdfTVREX1VCSSBpcyBub3Qgc2V0CiMgQ09ORklHX01URF9IWVBFUkJVUyBpcyBub3Qg
c2V0CkNPTkZJR19EVEM9eQpDT05GSUdfT0Y9eQojIENPTkZJR19PRl9VTklUVEVTVCBpcyBub3Qg
c2V0CkNPTkZJR19PRl9GTEFUVFJFRT15CkNPTkZJR19PRl9FQVJMWV9GTEFUVFJFRT15CkNPTkZJ
R19PRl9LT0JKPXkKQ09ORklHX09GX0RZTkFNSUM9eQpDT05GSUdfT0ZfQUREUkVTUz15CkNPTkZJ
R19PRl9JUlE9eQpDT05GSUdfT0ZfUkVTRVJWRURfTUVNPXkKIyBDT05GSUdfT0ZfT1ZFUkxBWSBp
cyBub3Qgc2V0CkNPTkZJR19BUkNIX01JR0hUX0hBVkVfUENfUEFSUE9SVD15CiMgQ09ORklHX1BB
UlBPUlQgaXMgbm90IHNldApDT05GSUdfQkxLX0RFVj15CiMgQ09ORklHX0JMS19ERVZfTlVMTF9C
TEsgaXMgbm90IHNldAojIENPTkZJR19CTEtfREVWX0ZEIGlzIG5vdCBzZXQKQ09ORklHX0NEUk9N
PXkKIyBDT05GSUdfQkxLX0RFVl9QQ0lFU1NEX01USVAzMlhYIGlzIG5vdCBzZXQKQ09ORklHX1pS
QU09bQojIENPTkZJR19aUkFNX0RFRl9DT01QX0xaT1JMRSBpcyBub3Qgc2V0CiMgQ09ORklHX1pS
QU1fREVGX0NPTVBfWlNURCBpcyBub3Qgc2V0CkNPTkZJR19aUkFNX0RFRl9DT01QX0xaND15CiMg
Q09ORklHX1pSQU1fREVGX0NPTVBfTFpPIGlzIG5vdCBzZXQKQ09ORklHX1pSQU1fREVGX0NPTVA9
Imx6NCIKIyBDT05GSUdfWlJBTV9XUklURUJBQ0sgaXMgbm90IHNldAojIENPTkZJR19aUkFNX01F
TU9SWV9UUkFDS0lORyBpcyBub3Qgc2V0CiMgQ09ORklHX1pSQU1fTVVMVElfQ09NUCBpcyBub3Qg
c2V0CkNPTkZJR19CTEtfREVWX0xPT1A9bQpDT05GSUdfQkxLX0RFVl9MT09QX01JTl9DT1VOVD04
CiMgQ09ORklHX0JMS19ERVZfRFJCRCBpcyBub3Qgc2V0CiMgQ09ORklHX0JMS19ERVZfTkJEIGlz
IG5vdCBzZXQKIyBDT05GSUdfQkxLX0RFVl9SQU0gaXMgbm90IHNldAojIENPTkZJR19DRFJPTV9Q
S1RDRFZEIGlzIG5vdCBzZXQKIyBDT05GSUdfQVRBX09WRVJfRVRIIGlzIG5vdCBzZXQKQ09ORklH
X1ZJUlRJT19CTEs9eQojIENPTkZJR19CTEtfREVWX1JCRCBpcyBub3Qgc2V0CiMgQ09ORklHX0JM
S19ERVZfVUJMSyBpcyBub3Qgc2V0CgojCiMgTlZNRSBTdXBwb3J0CiMKQ09ORklHX05WTUVfQ09S
RT15CkNPTkZJR19CTEtfREVWX05WTUU9eQojIENPTkZJR19OVk1FX01VTFRJUEFUSCBpcyBub3Qg
c2V0CkNPTkZJR19OVk1FX1ZFUkJPU0VfRVJST1JTPXkKIyBDT05GSUdfTlZNRV9IV01PTiBpcyBu
b3Qgc2V0CiMgQ09ORklHX05WTUVfRkMgaXMgbm90IHNldAojIENPTkZJR19OVk1FX1RDUCBpcyBu
b3Qgc2V0CiMgQ09ORklHX05WTUVfSE9TVF9BVVRIIGlzIG5vdCBzZXQKIyBDT05GSUdfTlZNRV9U
QVJHRVQgaXMgbm90IHNldAojIGVuZCBvZiBOVk1FIFN1cHBvcnQKCiMKIyBNaXNjIGRldmljZXMK
IwojIENPTkZJR19BRDUyNVhfRFBPVCBpcyBub3Qgc2V0CiMgQ09ORklHX0RVTU1ZX0lSUSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0lCTVZNQyBpcyBub3Qgc2V0CiMgQ09ORklHX1BIQU5UT00gaXMgbm90
IHNldAojIENPTkZJR19USUZNX0NPUkUgaXMgbm90IHNldAojIENPTkZJR19JQ1M5MzJTNDAxIGlz
IG5vdCBzZXQKIyBDT05GSUdfRU5DTE9TVVJFX1NFUlZJQ0VTIGlzIG5vdCBzZXQKIyBDT05GSUdf
SFBfSUxPIGlzIG5vdCBzZXQKIyBDT05GSUdfQVBEUzk4MDJBTFMgaXMgbm90IHNldAojIENPTkZJ
R19JU0wyOTAwMyBpcyBub3Qgc2V0CiMgQ09ORklHX0lTTDI5MDIwIGlzIG5vdCBzZXQKIyBDT05G
SUdfU0VOU09SU19UU0wyNTUwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19CSDE3NzAgaXMg
bm90IHNldAojIENPTkZJR19TRU5TT1JTX0FQRFM5OTBYIGlzIG5vdCBzZXQKIyBDT05GSUdfSE1D
NjM1MiBpcyBub3Qgc2V0CiMgQ09ORklHX0RTMTY4MiBpcyBub3Qgc2V0CiMgQ09ORklHX1NSQU0g
aXMgbm90IHNldAojIENPTkZJR19EV19YREFUQV9QQ0lFIGlzIG5vdCBzZXQKIyBDT05GSUdfUENJ
X0VORFBPSU5UX1RFU1QgaXMgbm90IHNldAojIENPTkZJR19YSUxJTlhfU0RGRUMgaXMgbm90IHNl
dAojIENPTkZJR19PUEVOX0RJQ0UgaXMgbm90IHNldAojIENPTkZJR19WQ1BVX1NUQUxMX0RFVEVD
VE9SIGlzIG5vdCBzZXQKIyBDT05GSUdfQzJQT1JUIGlzIG5vdCBzZXQKCiMKIyBFRVBST00gc3Vw
cG9ydAojCkNPTkZJR19FRVBST01fQVQyND1tCiMgQ09ORklHX0VFUFJPTV9NQVg2ODc1IGlzIG5v
dCBzZXQKIyBDT05GSUdfRUVQUk9NXzkzQ1g2IGlzIG5vdCBzZXQKIyBDT05GSUdfRUVQUk9NX0lE
VF84OUhQRVNYIGlzIG5vdCBzZXQKQ09ORklHX0VFUFJPTV9FRTEwMDQ9bQojIGVuZCBvZiBFRVBS
T00gc3VwcG9ydAoKIyBDT05GSUdfQ0I3MTBfQ09SRSBpcyBub3Qgc2V0CgojCiMgVGV4YXMgSW5z
dHJ1bWVudHMgc2hhcmVkIHRyYW5zcG9ydCBsaW5lIGRpc2NpcGxpbmUKIwojIENPTkZJR19USV9T
VCBpcyBub3Qgc2V0CiMgZW5kIG9mIFRleGFzIEluc3RydW1lbnRzIHNoYXJlZCB0cmFuc3BvcnQg
bGluZSBkaXNjaXBsaW5lCgojIENPTkZJR19TRU5TT1JTX0xJUzNfSTJDIGlzIG5vdCBzZXQKIyBD
T05GSUdfQUxURVJBX1NUQVBMIGlzIG5vdCBzZXQKIyBDT05GSUdfR0VOV1FFIGlzIG5vdCBzZXQK
IyBDT05GSUdfRUNITyBpcyBub3Qgc2V0CiMgQ09ORklHX0NYTCBpcyBub3Qgc2V0CiMgQ09ORklH
X0JDTV9WSyBpcyBub3Qgc2V0CiMgQ09ORklHX01JU0NfQUxDT1JfUENJIGlzIG5vdCBzZXQKIyBD
T05GSUdfTUlTQ19SVFNYX1BDSSBpcyBub3Qgc2V0CiMgQ09ORklHX01JU0NfUlRTWF9VU0IgaXMg
bm90IHNldAojIENPTkZJR19VQUNDRSBpcyBub3Qgc2V0CkNPTkZJR19QVlBBTklDPXkKQ09ORklH
X1BWUEFOSUNfTU1JTz1tCkNPTkZJR19QVlBBTklDX1BDST1tCiMgQ09ORklHX0dQX1BDSTFYWFhY
IGlzIG5vdCBzZXQKIyBlbmQgb2YgTWlzYyBkZXZpY2VzCgojCiMgU0NTSSBkZXZpY2Ugc3VwcG9y
dAojCkNPTkZJR19TQ1NJX01PRD15CiMgQ09ORklHX1JBSURfQVRUUlMgaXMgbm90IHNldApDT05G
SUdfU0NTSV9DT01NT049eQpDT05GSUdfU0NTST15CkNPTkZJR19TQ1NJX0RNQT15CiMgQ09ORklH
X1NDU0lfUFJPQ19GUyBpcyBub3Qgc2V0CgojCiMgU0NTSSBzdXBwb3J0IHR5cGUgKGRpc2ssIHRh
cGUsIENELVJPTSkKIwpDT05GSUdfQkxLX0RFVl9TRD15CiMgQ09ORklHX0NIUl9ERVZfU1QgaXMg
bm90IHNldApDT05GSUdfQkxLX0RFVl9TUj15CkNPTkZJR19DSFJfREVWX1NHPW0KQ09ORklHX0JM
S19ERVZfQlNHPXkKIyBDT05GSUdfQ0hSX0RFVl9TQ0ggaXMgbm90IHNldAojIENPTkZJR19TQ1NJ
X0NPTlNUQU5UUyBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfTE9HR0lORyBpcyBub3Qgc2V0CkNP
TkZJR19TQ1NJX1NDQU5fQVNZTkM9eQoKIwojIFNDU0kgVHJhbnNwb3J0cwojCiMgQ09ORklHX1ND
U0lfU1BJX0FUVFJTIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9GQ19BVFRSUyBpcyBub3Qgc2V0
CiMgQ09ORklHX1NDU0lfSVNDU0lfQVRUUlMgaXMgbm90IHNldApDT05GSUdfU0NTSV9TQVNfQVRU
UlM9bQojIENPTkZJR19TQ1NJX1NBU19MSUJTQVMgaXMgbm90IHNldApDT05GSUdfU0NTSV9TUlBf
QVRUUlM9eQojIGVuZCBvZiBTQ1NJIFRyYW5zcG9ydHMKCkNPTkZJR19TQ1NJX0xPV0xFVkVMPXkK
IyBDT05GSUdfSVNDU0lfVENQIGlzIG5vdCBzZXQKIyBDT05GSUdfSVNDU0lfQk9PVF9TWVNGUyBp
cyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfQ1hHQjNfSVNDU0kgaXMgbm90IHNldAojIENPTkZJR19T
Q1NJX0NYR0I0X0lTQ1NJIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9CTlgyX0lTQ1NJIGlzIG5v
dCBzZXQKIyBDT05GSUdfQkUySVNDU0kgaXMgbm90IHNldAojIENPTkZJR19CTEtfREVWXzNXX1hY
WFhfUkFJRCBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfSFBTQSBpcyBub3Qgc2V0CiMgQ09ORklH
X1NDU0lfM1dfOVhYWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfM1dfU0FTIGlzIG5vdCBzZXQK
IyBDT05GSUdfU0NTSV9BQ0FSRCBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfQUFDUkFJRCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NDU0lfQUlDN1hYWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfQUlD
NzlYWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfQUlDOTRYWCBpcyBub3Qgc2V0CiMgQ09ORklH
X1NDU0lfTVZTQVMgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX01WVU1JIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0NTSV9BRFZBTlNZUyBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfQVJDTVNSIGlzIG5v
dCBzZXQKIyBDT05GSUdfU0NTSV9FU0FTMlIgaXMgbm90IHNldAojIENPTkZJR19NRUdBUkFJRF9O
RVdHRU4gaXMgbm90IHNldAojIENPTkZJR19NRUdBUkFJRF9MRUdBQ1kgaXMgbm90IHNldAojIENP
TkZJR19NRUdBUkFJRF9TQVMgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX01QVDNTQVMgaXMgbm90
IHNldAojIENPTkZJR19TQ1NJX01QVDJTQVMgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX01QSTNN
UiBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfU01BUlRQUUkgaXMgbm90IHNldAojIENPTkZJR19T
Q1NJX0hQVElPUCBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfQlVTTE9HSUMgaXMgbm90IHNldAoj
IENPTkZJR19TQ1NJX01ZUkIgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX1NOSUMgaXMgbm90IHNl
dAojIENPTkZJR19TQ1NJX0RNWDMxOTFEIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9GRE9NQUlO
X1BDSSBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfSVBTIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NT
SV9JQk1WU0NTSSBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfSU5JVElPIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0NTSV9JTklBMTAwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9TVEVYIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0NTSV9TWU01M0M4WFhfMiBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfSVBS
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9RTE9HSUNfMTI4MCBpcyBub3Qgc2V0CiMgQ09ORklH
X1NDU0lfUUxBX0lTQ1NJIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9EQzM5NXggaXMgbm90IHNl
dAojIENPTkZJR19TQ1NJX0FNNTNDOTc0IGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9XRDcxOVgg
aXMgbm90IHNldAojIENPTkZJR19TQ1NJX0RFQlVHIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9Q
TUNSQUlEIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9QTTgwMDEgaXMgbm90IHNldApDT05GSUdf
U0NTSV9WSVJUSU89eQojIENPTkZJR19TQ1NJX0RIIGlzIG5vdCBzZXQKIyBlbmQgb2YgU0NTSSBk
ZXZpY2Ugc3VwcG9ydAoKQ09ORklHX0FUQT15CkNPTkZJR19TQVRBX0hPU1Q9eQpDT05GSUdfQVRB
X1ZFUkJPU0VfRVJST1I9eQojIENPTkZJR19BVEFfRk9SQ0UgaXMgbm90IHNldAojIENPTkZJR19T
QVRBX1BNUCBpcyBub3Qgc2V0CgojCiMgQ29udHJvbGxlcnMgd2l0aCBub24tU0ZGIG5hdGl2ZSBp
bnRlcmZhY2UKIwpDT05GSUdfU0FUQV9BSENJPXkKQ09ORklHX1NBVEFfTU9CSUxFX0xQTV9QT0xJ
Q1k9MApDT05GSUdfU0FUQV9BSENJX1BMQVRGT1JNPXkKIyBDT05GSUdfQUhDSV9EV0MgaXMgbm90
IHNldAojIENPTkZJR19BSENJX0NFVkEgaXMgbm90IHNldAojIENPTkZJR19TQVRBX0lOSUMxNjJY
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0FUQV9BQ0FSRF9BSENJIGlzIG5vdCBzZXQKQ09ORklHX1NB
VEFfU0lMMjQ9bQojIENPTkZJR19BVEFfU0ZGIGlzIG5vdCBzZXQKQ09ORklHX01EPXkKIyBDT05G
SUdfQkxLX0RFVl9NRCBpcyBub3Qgc2V0CiMgQ09ORklHX01EX0JJVE1BUF9GSUxFIGlzIG5vdCBz
ZXQKIyBDT05GSUdfQkNBQ0hFIGlzIG5vdCBzZXQKQ09ORklHX0JMS19ERVZfRE1fQlVJTFRJTj15
CkNPTkZJR19CTEtfREVWX0RNPW0KQ09ORklHX0RNX0RFQlVHPXkKQ09ORklHX0RNX0JVRklPPW0K
Q09ORklHX0RNX0RFQlVHX0JMT0NLX01BTkFHRVJfTE9DS0lORz15CiMgQ09ORklHX0RNX0RFQlVH
X0JMT0NLX1NUQUNLX1RSQUNJTkcgaXMgbm90IHNldApDT05GSUdfRE1fQklPX1BSSVNPTj1tCkNP
TkZJR19ETV9QRVJTSVNURU5UX0RBVEE9bQojIENPTkZJR19ETV9VTlNUUklQRUQgaXMgbm90IHNl
dApDT05GSUdfRE1fQ1JZUFQ9bQojIENPTkZJR19ETV9TTkFQU0hPVCBpcyBub3Qgc2V0CkNPTkZJ
R19ETV9USElOX1BST1ZJU0lPTklORz1tCiMgQ09ORklHX0RNX0NBQ0hFIGlzIG5vdCBzZXQKIyBD
T05GSUdfRE1fV1JJVEVDQUNIRSBpcyBub3Qgc2V0CiMgQ09ORklHX0RNX0VCUyBpcyBub3Qgc2V0
CiMgQ09ORklHX0RNX0VSQSBpcyBub3Qgc2V0CiMgQ09ORklHX0RNX0NMT05FIGlzIG5vdCBzZXQK
IyBDT05GSUdfRE1fTUlSUk9SIGlzIG5vdCBzZXQKIyBDT05GSUdfRE1fUkFJRCBpcyBub3Qgc2V0
CiMgQ09ORklHX0RNX1pFUk8gaXMgbm90IHNldAojIENPTkZJR19ETV9NVUxUSVBBVEggaXMgbm90
IHNldAojIENPTkZJR19ETV9ERUxBWSBpcyBub3Qgc2V0CiMgQ09ORklHX0RNX0RVU1QgaXMgbm90
IHNldApDT05GSUdfRE1fVUVWRU5UPXkKIyBDT05GSUdfRE1fRkxBS0VZIGlzIG5vdCBzZXQKIyBD
T05GSUdfRE1fVkVSSVRZIGlzIG5vdCBzZXQKIyBDT05GSUdfRE1fU1dJVENIIGlzIG5vdCBzZXQK
IyBDT05GSUdfRE1fTE9HX1dSSVRFUyBpcyBub3Qgc2V0CiMgQ09ORklHX0RNX0lOVEVHUklUWSBp
cyBub3Qgc2V0CiMgQ09ORklHX1RBUkdFVF9DT1JFIGlzIG5vdCBzZXQKQ09ORklHX0ZVU0lPTj15
CiMgQ09ORklHX0ZVU0lPTl9TUEkgaXMgbm90IHNldApDT05GSUdfRlVTSU9OX1NBUz1tCkNPTkZJ
R19GVVNJT05fTUFYX1NHRT0xMjgKIyBDT05GSUdfRlVTSU9OX0NUTCBpcyBub3Qgc2V0CiMgQ09O
RklHX0ZVU0lPTl9MT0dHSU5HIGlzIG5vdCBzZXQKCiMKIyBJRUVFIDEzOTQgKEZpcmVXaXJlKSBz
dXBwb3J0CiMKIyBDT05GSUdfRklSRVdJUkUgaXMgbm90IHNldAojIENPTkZJR19GSVJFV0lSRV9O
T1NZIGlzIG5vdCBzZXQKIyBlbmQgb2YgSUVFRSAxMzk0IChGaXJlV2lyZSkgc3VwcG9ydAoKIyBD
T05GSUdfTUFDSU5UT1NIX0RSSVZFUlMgaXMgbm90IHNldApDT05GSUdfTkVUREVWSUNFUz15CkNP
TkZJR19ORVRfQ09SRT15CiMgQ09ORklHX0JPTkRJTkcgaXMgbm90IHNldAojIENPTkZJR19EVU1N
WSBpcyBub3Qgc2V0CkNPTkZJR19XSVJFR1VBUkQ9bQojIENPTkZJR19XSVJFR1VBUkRfREVCVUcg
aXMgbm90IHNldAojIENPTkZJR19FUVVBTElaRVIgaXMgbm90IHNldAojIENPTkZJR19ORVRfRkMg
aXMgbm90IHNldAojIENPTkZJR19ORVRfVEVBTSBpcyBub3Qgc2V0CiMgQ09ORklHX01BQ1ZMQU4g
aXMgbm90IHNldAojIENPTkZJR19JUFZMQU4gaXMgbm90IHNldAojIENPTkZJR19WWExBTiBpcyBu
b3Qgc2V0CiMgQ09ORklHX0dFTkVWRSBpcyBub3Qgc2V0CiMgQ09ORklHX0JBUkVVRFAgaXMgbm90
IHNldAojIENPTkZJR19HVFAgaXMgbm90IHNldAojIENPTkZJR19NQUNTRUMgaXMgbm90IHNldApD
T05GSUdfTkVUQ09OU09MRT15CiMgQ09ORklHX05FVENPTlNPTEVfRVhURU5ERURfTE9HIGlzIG5v
dCBzZXQKQ09ORklHX05FVFBPTEw9eQpDT05GSUdfTkVUX1BPTExfQ09OVFJPTExFUj15CkNPTkZJ
R19UVU49eQojIENPTkZJR19UVU5fVk5FVF9DUk9TU19MRSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZF
VEggaXMgbm90IHNldApDT05GSUdfVklSVElPX05FVD15CiMgQ09ORklHX05MTU9OIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTkVUS0lUIGlzIG5vdCBzZXQKIyBDT05GSUdfQVJDTkVUIGlzIG5vdCBzZXQK
Q09ORklHX0VUSEVSTkVUPXkKIyBDT05GSUdfTkVUX1ZFTkRPUl8zQ09NIGlzIG5vdCBzZXQKIyBD
T05GSUdfTkVUX1ZFTkRPUl9BREFQVEVDIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9B
R0VSRSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfQUxBQ1JJVEVDSCBpcyBub3Qgc2V0
CiMgQ09ORklHX05FVF9WRU5ET1JfQUxURU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfQUxURVJBX1RT
RSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfQU1BWk9OIGlzIG5vdCBzZXQKIyBDT05G
SUdfTkVUX1ZFTkRPUl9BTUQgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX0FRVUFOVElB
IGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9BUkMgaXMgbm90IHNldAojIENPTkZJR19O
RVRfVkVORE9SX0FTSVggaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX0FUSEVST1MgaXMg
bm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9CUk9BRENPTT15CiMgQ09ORklHX0I0NCBpcyBub3Qg
c2V0CiMgQ09ORklHX0JDTUdFTkVUIGlzIG5vdCBzZXQKIyBDT05GSUdfQk5YMiBpcyBub3Qgc2V0
CiMgQ09ORklHX0NOSUMgaXMgbm90IHNldApDT05GSUdfVElHT04zPXkKQ09ORklHX1RJR09OM19I
V01PTj15CiMgQ09ORklHX0JOWDJYIGlzIG5vdCBzZXQKIyBDT05GSUdfU1lTVEVNUE9SVCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0JOWFQgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX0NBREVO
Q0UgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX0NBVklVTSBpcyBub3Qgc2V0CiMgQ09O
RklHX05FVF9WRU5ET1JfQ0hFTFNJTyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfQ0lT
Q08gaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX0NPUlRJTkEgaXMgbm90IHNldAojIENP
TkZJR19ORVRfVkVORE9SX0RBVklDT00gaXMgbm90IHNldAojIENPTkZJR19ETkVUIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9ERUMgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9S
X0RMSU5LIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9FTVVMRVggaXMgbm90IHNldAoj
IENPTkZJR19ORVRfVkVORE9SX0VOR0xFREVSIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRP
Ul9FWkNISVAgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX0ZVTkdJQkxFIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9HT09HTEUgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVO
RE9SX0hVQVdFSSBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX0lCTT15CiMgQ09ORklHX0lC
TVZFVEggaXMgbm90IHNldAojIENPTkZJR19JQk1WTklDIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVU
X1ZFTkRPUl9JTlRFTCBpcyBub3Qgc2V0CiMgQ09ORklHX0pNRSBpcyBub3Qgc2V0CiMgQ09ORklH
X05FVF9WRU5ET1JfTElURVggaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX01BUlZFTEwg
aXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX01FTExBTk9YIGlzIG5vdCBzZXQKIyBDT05G
SUdfTkVUX1ZFTkRPUl9NSUNSRUwgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX01JQ1JP
Q0hJUCBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfTUlDUk9TRU1JIGlzIG5vdCBzZXQK
IyBDT05GSUdfTkVUX1ZFTkRPUl9NSUNST1NPRlQgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVO
RE9SX01ZUkkgaXMgbm90IHNldAojIENPTkZJR19GRUFMTlggaXMgbm90IHNldAojIENPTkZJR19O
RVRfVkVORE9SX05JIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9OQVRTRU1JIGlzIG5v
dCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9ORVRFUklPTiBpcyBub3Qgc2V0CiMgQ09ORklHX05F
VF9WRU5ET1JfTkVUUk9OT01FIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9OVklESUEg
aXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX09LSSBpcyBub3Qgc2V0CiMgQ09ORklHX0VU
SE9DIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9QQUNLRVRfRU5HSU5FUyBpcyBub3Qg
c2V0CiMgQ09ORklHX05FVF9WRU5ET1JfUEVOU0FORE8gaXMgbm90IHNldAojIENPTkZJR19ORVRf
VkVORE9SX1FMT0dJQyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfQlJPQ0FERSBpcyBu
b3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfUVVBTENPTU0gaXMgbm90IHNldAojIENPTkZJR19O
RVRfVkVORE9SX1JEQyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfUkVBTFRFSyBpcyBu
b3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfUkVORVNBUyBpcyBub3Qgc2V0CiMgQ09ORklHX05F
VF9WRU5ET1JfUk9DS0VSIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9TQU1TVU5HIGlz
IG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9TRUVRIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVU
X1ZFTkRPUl9TSUxBTiBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfU0lTIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9TT0xBUkZMQVJFIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVU
X1ZFTkRPUl9TTVNDIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9TT0NJT05FWFQgaXMg
bm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX1NUTUlDUk8gaXMgbm90IHNldAojIENPTkZJR19O
RVRfVkVORE9SX1NVTiBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfU1lOT1BTWVMgaXMg
bm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX1RFSFVUSSBpcyBub3Qgc2V0CiMgQ09ORklHX05F
VF9WRU5ET1JfVEkgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX1ZFUlRFWENPTSBpcyBu
b3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfVklBIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZF
TkRPUl9XQU5HWFVOIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9XSVpORVQgaXMgbm90
IHNldAojIENPTkZJR19ORVRfVkVORE9SX1hJTElOWCBpcyBub3Qgc2V0CiMgQ09ORklHX0ZEREkg
aXMgbm90IHNldAojIENPTkZJR19ISVBQSSBpcyBub3Qgc2V0CkNPTkZJR19QSFlMSUI9eQpDT05G
SUdfU1dQSFk9eQojIENPTkZJR19MRURfVFJJR0dFUl9QSFkgaXMgbm90IHNldApDT05GSUdfUEhZ
TElCX0xFRFM9eQpDT05GSUdfRklYRURfUEhZPXkKCiMKIyBNSUkgUEhZIGRldmljZSBkcml2ZXJz
CiMKIyBDT05GSUdfQU1EX1BIWSBpcyBub3Qgc2V0CiMgQ09ORklHX0FESU5fUEhZIGlzIG5vdCBz
ZXQKIyBDT05GSUdfQURJTjExMDBfUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfQVFVQU5USUFfUEhZ
IGlzIG5vdCBzZXQKIyBDT05GSUdfQVg4ODc5NkJfUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfQlJP
QURDT01fUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfQkNNNTQxNDBfUEhZIGlzIG5vdCBzZXQKIyBD
T05GSUdfQkNNN1hYWF9QSFkgaXMgbm90IHNldAojIENPTkZJR19CQ004NDg4MV9QSFkgaXMgbm90
IHNldAojIENPTkZJR19CQ004N1hYX1BIWSBpcyBub3Qgc2V0CiMgQ09ORklHX0NJQ0FEQV9QSFkg
aXMgbm90IHNldAojIENPTkZJR19DT1JUSU5BX1BIWSBpcyBub3Qgc2V0CiMgQ09ORklHX0RBVklD
T01fUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfSUNQTFVTX1BIWSBpcyBub3Qgc2V0CiMgQ09ORklH
X0xYVF9QSFkgaXMgbm90IHNldAojIENPTkZJR19JTlRFTF9YV0FZX1BIWSBpcyBub3Qgc2V0CiMg
Q09ORklHX0xTSV9FVDEwMTFDX1BIWSBpcyBub3Qgc2V0CiMgQ09ORklHX01BUlZFTExfUEhZIGlz
IG5vdCBzZXQKIyBDT05GSUdfTUFSVkVMTF8xMEdfUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfTUFS
VkVMTF84OFEyWFhYX1BIWSBpcyBub3Qgc2V0CiMgQ09ORklHX01BUlZFTExfODhYMjIyMl9QSFkg
aXMgbm90IHNldAojIENPTkZJR19NQVhMSU5FQVJfR1BIWSBpcyBub3Qgc2V0CiMgQ09ORklHX01F
RElBVEVLX0dFX1BIWSBpcyBub3Qgc2V0CiMgQ09ORklHX01JQ1JFTF9QSFkgaXMgbm90IHNldAoj
IENPTkZJR19NSUNST0NISVBfVDFTX1BIWSBpcyBub3Qgc2V0CiMgQ09ORklHX01JQ1JPQ0hJUF9Q
SFkgaXMgbm90IHNldAojIENPTkZJR19NSUNST0NISVBfVDFfUEhZIGlzIG5vdCBzZXQKIyBDT05G
SUdfTUlDUk9TRU1JX1BIWSBpcyBub3Qgc2V0CiMgQ09ORklHX01PVE9SQ09NTV9QSFkgaXMgbm90
IHNldAojIENPTkZJR19OQVRJT05BTF9QSFkgaXMgbm90IHNldAojIENPTkZJR19OWFBfQ0JUWF9Q
SFkgaXMgbm90IHNldAojIENPTkZJR19OWFBfQzQ1X1RKQTExWFhfUEhZIGlzIG5vdCBzZXQKIyBD
T05GSUdfTlhQX1RKQTExWFhfUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfTkNOMjYwMDBfUEhZIGlz
IG5vdCBzZXQKIyBDT05GSUdfUVNFTUlfUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVBTFRFS19Q
SFkgaXMgbm90IHNldAojIENPTkZJR19SRU5FU0FTX1BIWSBpcyBub3Qgc2V0CiMgQ09ORklHX1JP
Q0tDSElQX1BIWSBpcyBub3Qgc2V0CiMgQ09ORklHX1NNU0NfUEhZIGlzIG5vdCBzZXQKIyBDT05G
SUdfU1RFMTBYUCBpcyBub3Qgc2V0CiMgQ09ORklHX1RFUkFORVRJQ1NfUEhZIGlzIG5vdCBzZXQK
IyBDT05GSUdfRFA4MzgyMl9QSFkgaXMgbm90IHNldAojIENPTkZJR19EUDgzVEM4MTFfUEhZIGlz
IG5vdCBzZXQKIyBDT05GSUdfRFA4Mzg0OF9QSFkgaXMgbm90IHNldAojIENPTkZJR19EUDgzODY3
X1BIWSBpcyBub3Qgc2V0CiMgQ09ORklHX0RQODM4NjlfUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdf
RFA4M1RENTEwX1BIWSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJVEVTU0VfUEhZIGlzIG5vdCBzZXQK
IyBDT05GSUdfWElMSU5YX0dNSUkyUkdNSUkgaXMgbm90IHNldAojIENPTkZJR19QU0VfQ09OVFJP
TExFUiBpcyBub3Qgc2V0CkNPTkZJR19NRElPX0RFVklDRT15CkNPTkZJR19NRElPX0JVUz15CkNP
TkZJR19GV05PREVfTURJTz15CkNPTkZJR19PRl9NRElPPXkKQ09ORklHX01ESU9fREVWUkVTPXkK
IyBDT05GSUdfTURJT19CSVRCQU5HIGlzIG5vdCBzZXQKIyBDT05GSUdfTURJT19CQ01fVU5JTUFD
IGlzIG5vdCBzZXQKIyBDT05GSUdfTURJT19ISVNJX0ZFTUFDIGlzIG5vdCBzZXQKIyBDT05GSUdf
TURJT19NVlVTQiBpcyBub3Qgc2V0CiMgQ09ORklHX01ESU9fT0NURU9OIGlzIG5vdCBzZXQKIyBD
T05GSUdfTURJT19JUFE0MDE5IGlzIG5vdCBzZXQKIyBDT05GSUdfTURJT19USFVOREVSIGlzIG5v
dCBzZXQKCiMKIyBNRElPIE11bHRpcGxleGVycwojCiMgQ09ORklHX01ESU9fQlVTX01VWF9HUElP
IGlzIG5vdCBzZXQKIyBDT05GSUdfTURJT19CVVNfTVVYX01VTFRJUExFWEVSIGlzIG5vdCBzZXQK
IyBDT05GSUdfTURJT19CVVNfTVVYX01NSU9SRUcgaXMgbm90IHNldAoKIwojIFBDUyBkZXZpY2Ug
ZHJpdmVycwojCiMgZW5kIG9mIFBDUyBkZXZpY2UgZHJpdmVycwoKIyBDT05GSUdfUFBQIGlzIG5v
dCBzZXQKIyBDT05GSUdfU0xJUCBpcyBub3Qgc2V0CgojCiMgSG9zdC1zaWRlIFVTQiBzdXBwb3J0
IGlzIG5lZWRlZCBmb3IgVVNCIE5ldHdvcmsgQWRhcHRlciBzdXBwb3J0CiMKIyBDT05GSUdfVVNC
X05FVF9EUklWRVJTIGlzIG5vdCBzZXQKQ09ORklHX1dMQU49eQojIENPTkZJR19XTEFOX1ZFTkRP
Ul9BRE1URUsgaXMgbm90IHNldApDT05GSUdfQVRIX0NPTU1PTj1tCkNPTkZJR19XTEFOX1ZFTkRP
Ul9BVEg9eQpDT05GSUdfQVRIX0RFQlVHPXkKQ09ORklHX0FUSDVLPW0KQ09ORklHX0FUSDVLX0RF
QlVHPXkKQ09ORklHX0FUSDVLX1BDST15CiMgQ09ORklHX0FUSDlLIGlzIG5vdCBzZXQKIyBDT05G
SUdfQVRIOUtfSFRDIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0FSTDkxNzAgaXMgbm90IHNldAojIENP
TkZJR19BVEg2S0wgaXMgbm90IHNldAojIENPTkZJR19BUjU1MjMgaXMgbm90IHNldAojIENPTkZJ
R19XSUw2MjEwIGlzIG5vdCBzZXQKIyBDT05GSUdfQVRIMTBLIGlzIG5vdCBzZXQKIyBDT05GSUdf
V0NOMzZYWCBpcyBub3Qgc2V0CiMgQ09ORklHX1dMQU5fVkVORE9SX0FUTUVMIGlzIG5vdCBzZXQK
IyBDT05GSUdfV0xBTl9WRU5ET1JfQlJPQURDT00gaXMgbm90IHNldAojIENPTkZJR19XTEFOX1ZF
TkRPUl9DSVNDTyBpcyBub3Qgc2V0CiMgQ09ORklHX1dMQU5fVkVORE9SX0lOVEVMIGlzIG5vdCBz
ZXQKIyBDT05GSUdfV0xBTl9WRU5ET1JfSU5URVJTSUwgaXMgbm90IHNldAojIENPTkZJR19XTEFO
X1ZFTkRPUl9NQVJWRUxMIGlzIG5vdCBzZXQKIyBDT05GSUdfV0xBTl9WRU5ET1JfTUVESUFURUsg
aXMgbm90IHNldAojIENPTkZJR19XTEFOX1ZFTkRPUl9NSUNST0NISVAgaXMgbm90IHNldAojIENP
TkZJR19XTEFOX1ZFTkRPUl9QVVJFTElGSSBpcyBub3Qgc2V0CiMgQ09ORklHX1dMQU5fVkVORE9S
X1JBTElOSyBpcyBub3Qgc2V0CkNPTkZJR19XTEFOX1ZFTkRPUl9SRUFMVEVLPXkKIyBDT05GSUdf
UlRMODE4MCBpcyBub3Qgc2V0CiMgQ09ORklHX1JUTDgxODcgaXMgbm90IHNldAojIENPTkZJR19S
VExfQ0FSRFMgaXMgbm90IHNldApDT05GSUdfUlRMOFhYWFU9bQojIENPTkZJR19SVEw4WFhYVV9V
TlRFU1RFRCBpcyBub3Qgc2V0CiMgQ09ORklHX1JUVzg4IGlzIG5vdCBzZXQKIyBDT05GSUdfUlRX
ODkgaXMgbm90IHNldAojIENPTkZJR19XTEFOX1ZFTkRPUl9SU0kgaXMgbm90IHNldAojIENPTkZJ
R19XTEFOX1ZFTkRPUl9TSUxBQlMgaXMgbm90IHNldAojIENPTkZJR19XTEFOX1ZFTkRPUl9TVCBp
cyBub3Qgc2V0CiMgQ09ORklHX1dMQU5fVkVORE9SX1RJIGlzIG5vdCBzZXQKIyBDT05GSUdfV0xB
Tl9WRU5ET1JfWllEQVMgaXMgbm90IHNldAojIENPTkZJR19XTEFOX1ZFTkRPUl9RVUFOVEVOTkEg
aXMgbm90IHNldAojIENPTkZJR19VU0JfTkVUX1JORElTX1dMQU4gaXMgbm90IHNldAojIENPTkZJ
R19NQUM4MDIxMV9IV1NJTSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJUlRfV0lGSSBpcyBub3Qgc2V0
CiMgQ09ORklHX1dBTiBpcyBub3Qgc2V0CgojCiMgV2lyZWxlc3MgV0FOCiMKIyBDT05GSUdfV1dB
TiBpcyBub3Qgc2V0CiMgZW5kIG9mIFdpcmVsZXNzIFdBTgoKIyBDT05GSUdfVk1YTkVUMyBpcyBu
b3Qgc2V0CiMgQ09ORklHX05FVERFVlNJTSBpcyBub3Qgc2V0CkNPTkZJR19ORVRfRkFJTE9WRVI9
eQojIENPTkZJR19JU0ROIGlzIG5vdCBzZXQKCiMKIyBJbnB1dCBkZXZpY2Ugc3VwcG9ydAojCkNP
TkZJR19JTlBVVD15CkNPTkZJR19JTlBVVF9MRURTPW0KQ09ORklHX0lOUFVUX0ZGX01FTUxFU1M9
bQojIENPTkZJR19JTlBVVF9TUEFSU0VLTUFQIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfTUFU
UklYS01BUCBpcyBub3Qgc2V0CgojCiMgVXNlcmxhbmQgaW50ZXJmYWNlcwojCiMgQ09ORklHX0lO
UFVUX01PVVNFREVWIGlzIG5vdCBzZXQKQ09ORklHX0lOUFVUX0pPWURFVj1tCkNPTkZJR19JTlBV
VF9FVkRFVj1tCiMgQ09ORklHX0lOUFVUX0VWQlVHIGlzIG5vdCBzZXQKQ09ORklHX0lOUFVUX0tV
TklUX1RFU1Q9bQoKIwojIElucHV0IERldmljZSBEcml2ZXJzCiMKIyBDT05GSUdfSU5QVVRfS0VZ
Qk9BUkQgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9NT1VTRSBpcyBub3Qgc2V0CkNPTkZJR19J
TlBVVF9KT1lTVElDSz15CiMgQ09ORklHX0pPWVNUSUNLX0FOQUxPRyBpcyBub3Qgc2V0CiMgQ09O
RklHX0pPWVNUSUNLX0EzRCBpcyBub3Qgc2V0CiMgQ09ORklHX0pPWVNUSUNLX0FESSBpcyBub3Qg
c2V0CiMgQ09ORklHX0pPWVNUSUNLX0NPQlJBIGlzIG5vdCBzZXQKIyBDT05GSUdfSk9ZU1RJQ0tf
R0YySyBpcyBub3Qgc2V0CiMgQ09ORklHX0pPWVNUSUNLX0dSSVAgaXMgbm90IHNldAojIENPTkZJ
R19KT1lTVElDS19HUklQX01QIGlzIG5vdCBzZXQKIyBDT05GSUdfSk9ZU1RJQ0tfR1VJTExFTU9U
IGlzIG5vdCBzZXQKIyBDT05GSUdfSk9ZU1RJQ0tfSU5URVJBQ1QgaXMgbm90IHNldAojIENPTkZJ
R19KT1lTVElDS19TSURFV0lOREVSIGlzIG5vdCBzZXQKIyBDT05GSUdfSk9ZU1RJQ0tfVE1EQyBp
cyBub3Qgc2V0CiMgQ09ORklHX0pPWVNUSUNLX0lGT1JDRSBpcyBub3Qgc2V0CiMgQ09ORklHX0pP
WVNUSUNLX1dBUlJJT1IgaXMgbm90IHNldAojIENPTkZJR19KT1lTVElDS19NQUdFTExBTiBpcyBu
b3Qgc2V0CiMgQ09ORklHX0pPWVNUSUNLX1NQQUNFT1JCIGlzIG5vdCBzZXQKIyBDT05GSUdfSk9Z
U1RJQ0tfU1BBQ0VCQUxMIGlzIG5vdCBzZXQKIyBDT05GSUdfSk9ZU1RJQ0tfU1RJTkdFUiBpcyBu
b3Qgc2V0CiMgQ09ORklHX0pPWVNUSUNLX1RXSURKT1kgaXMgbm90IHNldAojIENPTkZJR19KT1lT
VElDS19aSEVOSFVBIGlzIG5vdCBzZXQKIyBDT05GSUdfSk9ZU1RJQ0tfQVM1MDExIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSk9ZU1RJQ0tfSk9ZRFVNUCBpcyBub3Qgc2V0CkNPTkZJR19KT1lTVElDS19Y
UEFEPW0KIyBDT05GSUdfSk9ZU1RJQ0tfWFBBRF9GRiBpcyBub3Qgc2V0CkNPTkZJR19KT1lTVElD
S19YUEFEX0xFRFM9eQojIENPTkZJR19KT1lTVElDS19QWFJDIGlzIG5vdCBzZXQKIyBDT05GSUdf
Sk9ZU1RJQ0tfUVdJSUMgaXMgbm90IHNldAojIENPTkZJR19KT1lTVElDS19GU0lBNkIgaXMgbm90
IHNldAojIENPTkZJR19KT1lTVElDS19TRU5TRUhBVCBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVU
X1RBQkxFVCBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX1RPVUNIU0NSRUVOIGlzIG5vdCBzZXQK
Q09ORklHX0lOUFVUX01JU0M9eQojIENPTkZJR19JTlBVVF9BRDcxNFggaXMgbm90IHNldAojIENP
TkZJR19JTlBVVF9BVE1FTF9DQVBUT1VDSCBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX0JNQTE1
MCBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX0UzWDBfQlVUVE9OIGlzIG5vdCBzZXQKIyBDT05G
SUdfSU5QVVRfTU1BODQ1MCBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX0dQSU9fQkVFUEVSIGlz
IG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfR1BJT19ERUNPREVSIGlzIG5vdCBzZXQKIyBDT05GSUdf
SU5QVVRfR1BJT19WSUJSQSBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX0FUSV9SRU1PVEUyIGlz
IG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfS0VZU1BBTl9SRU1PVEUgaXMgbm90IHNldAojIENPTkZJ
R19JTlBVVF9LWFRKOSBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX1BPV0VSTUFURSBpcyBub3Qg
c2V0CiMgQ09ORklHX0lOUFVUX1lFQUxJTksgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9DTTEw
OSBpcyBub3Qgc2V0CkNPTkZJR19JTlBVVF9VSU5QVVQ9bQojIENPTkZJR19JTlBVVF9QQ0Y4NTc0
IGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfR1BJT19ST1RBUllfRU5DT0RFUiBpcyBub3Qgc2V0
CiMgQ09ORklHX0lOUFVUX0RBNzI4MF9IQVBUSUNTIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRf
QURYTDM0WCBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX0lCTV9QQU5FTCBpcyBub3Qgc2V0CiMg
Q09ORklHX0lOUFVUX0lNU19QQ1UgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9JUVMyNjlBIGlz
IG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfSVFTNjI2QSBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVU
X0lRUzcyMjIgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9DTUEzMDAwIGlzIG5vdCBzZXQKIyBD
T05GSUdfSU5QVVRfRFJWMjYwWF9IQVBUSUNTIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfRFJW
MjY2NV9IQVBUSUNTIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfRFJWMjY2N19IQVBUSUNTIGlz
IG5vdCBzZXQKIyBDT05GSUdfUk1JNF9DT1JFIGlzIG5vdCBzZXQKCiMKIyBIYXJkd2FyZSBJL08g
cG9ydHMKIwojIENPTkZJR19TRVJJTyBpcyBub3Qgc2V0CkNPTkZJR19BUkNIX01JR0hUX0hBVkVf
UENfU0VSSU89eQojIENPTkZJR19HQU1FUE9SVCBpcyBub3Qgc2V0CiMgZW5kIG9mIEhhcmR3YXJl
IEkvTyBwb3J0cwojIGVuZCBvZiBJbnB1dCBkZXZpY2Ugc3VwcG9ydAoKIwojIENoYXJhY3RlciBk
ZXZpY2VzCiMKQ09ORklHX1RUWT15CkNPTkZJR19WVD15CkNPTkZJR19DT05TT0xFX1RSQU5TTEFU
SU9OUz15CkNPTkZJR19WVF9DT05TT0xFPXkKQ09ORklHX0hXX0NPTlNPTEU9eQpDT05GSUdfVlRf
SFdfQ09OU09MRV9CSU5ESU5HPXkKQ09ORklHX1VOSVg5OF9QVFlTPXkKIyBDT05GSUdfTEVHQUNZ
X1BUWVMgaXMgbm90IHNldAojIENPTkZJR19MRUdBQ1lfVElPQ1NUSSBpcyBub3Qgc2V0CkNPTkZJ
R19MRElTQ19BVVRPTE9BRD15CgojCiMgU2VyaWFsIGRyaXZlcnMKIwpDT05GSUdfU0VSSUFMX0VB
UkxZQ09OPXkKQ09ORklHX1NFUklBTF84MjUwPXkKIyBDT05GSUdfU0VSSUFMXzgyNTBfREVQUkVD
QVRFRF9PUFRJT05TIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMXzgyNTBfMTY1NTBBX1ZBUklB
TlRTIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMXzgyNTBfRklOVEVLIGlzIG5vdCBzZXQKQ09O
RklHX1NFUklBTF84MjUwX0NPTlNPTEU9eQojIENPTkZJR19TRVJJQUxfODI1MF9QQ0kgaXMgbm90
IHNldAojIENPTkZJR19TRVJJQUxfODI1MF9FWEFSIGlzIG5vdCBzZXQKQ09ORklHX1NFUklBTF84
MjUwX05SX1VBUlRTPTgKQ09ORklHX1NFUklBTF84MjUwX1JVTlRJTUVfVUFSVFM9NAojIENPTkZJ
R19TRVJJQUxfODI1MF9FWFRFTkRFRCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF84MjUwX1BD
STFYWFhYIGlzIG5vdCBzZXQKQ09ORklHX1NFUklBTF84MjUwX0ZTTD15CiMgQ09ORklHX1NFUklB
TF84MjUwX0RXIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMXzgyNTBfUlQyODhYIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0VSSUFMXzgyNTBfUEVSSUNPTSBpcyBub3Qgc2V0CkNPTkZJR19TRVJJQUxf
T0ZfUExBVEZPUk09eQoKIwojIE5vbi04MjUwIHNlcmlhbCBwb3J0IHN1cHBvcnQKIwojIENPTkZJ
R19TRVJJQUxfVUFSVExJVEUgaXMgbm90IHNldApDT05GSUdfU0VSSUFMX0NPUkU9eQpDT05GSUdf
U0VSSUFMX0NPUkVfQ09OU09MRT15CiMgQ09ORklHX1NFUklBTF9JQ09NIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0VSSUFMX0pTTSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9TSUZJVkUgaXMgbm90
IHNldAojIENPTkZJR19TRVJJQUxfU0NDTlhQIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMX1ND
MTZJUzdYWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9BTFRFUkFfSlRBR1VBUlQgaXMgbm90
IHNldAojIENPTkZJR19TRVJJQUxfQUxURVJBX1VBUlQgaXMgbm90IHNldAojIENPTkZJR19TRVJJ
QUxfWElMSU5YX1BTX1VBUlQgaXMgbm90IHNldAojIENPTkZJR19TRVJJQUxfQVJDIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0VSSUFMX1JQMiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9GU0xfTFBV
QVJUIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMX0ZTTF9MSU5GTEVYVUFSVCBpcyBub3Qgc2V0
CiMgQ09ORklHX1NFUklBTF9DT05FWEFOVF9ESUdJQ09MT1IgaXMgbm90IHNldAojIENPTkZJR19T
RVJJQUxfU1BSRCBpcyBub3Qgc2V0CiMgZW5kIG9mIFNlcmlhbCBkcml2ZXJzCgpDT05GSUdfU0VS
SUFMX01DVFJMX0dQSU89eQojIENPTkZJR19TRVJJQUxfTk9OU1RBTkRBUkQgaXMgbm90IHNldApD
T05GSUdfUFBDX0VQQVBSX0hWX0JZVEVDSEFOPXkKIyBDT05GSUdfUFBDX0VBUkxZX0RFQlVHX0VI
Vl9CQyBpcyBub3Qgc2V0CiMgQ09ORklHX05fR1NNIGlzIG5vdCBzZXQKIyBDT05GSUdfTk9aT01J
IGlzIG5vdCBzZXQKIyBDT05GSUdfTlVMTF9UVFkgaXMgbm90IHNldApDT05GSUdfSFZDX0RSSVZF
Uj15CkNPTkZJR19IVkNfSVJRPXkKIyBDT05GSUdfSFZDX0NPTlNPTEUgaXMgbm90IHNldApDT05G
SUdfSFZDX09QQUw9eQojIENPTkZJR19IVkNfUlRBUyBpcyBub3Qgc2V0CiMgQ09ORklHX0hWQ19V
REJHIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMX0RFVl9CVVMgaXMgbm90IHNldAojIENPTkZJ
R19UVFlfUFJJTlRLIGlzIG5vdCBzZXQKQ09ORklHX1ZJUlRJT19DT05TT0xFPXkKIyBDT05GSUdf
SUJNX0JTUiBpcyBub3Qgc2V0CiMgQ09ORklHX1BPV0VSTlZfT1BfUEFORUwgaXMgbm90IHNldApD
T05GSUdfSVBNSV9IQU5ETEVSPXkKIyBDT05GSUdfSVBNSV9QQU5JQ19FVkVOVCBpcyBub3Qgc2V0
CkNPTkZJR19JUE1JX0RFVklDRV9JTlRFUkZBQ0U9eQojIENPTkZJR19JUE1JX1NJIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSVBNSV9TU0lGIGlzIG5vdCBzZXQKIyBDT05GSUdfSVBNSV9JUE1CIGlzIG5v
dCBzZXQKQ09ORklHX0lQTUlfUE9XRVJOVj15CiMgQ09ORklHX0lQTUlfV0FUQ0hET0cgaXMgbm90
IHNldAojIENPTkZJR19JUE1JX1BPV0VST0ZGIGlzIG5vdCBzZXQKIyBDT05GSUdfU1NJRl9JUE1J
X0JNQyBpcyBub3Qgc2V0CiMgQ09ORklHX0lQTUJfREVWSUNFX0lOVEVSRkFDRSBpcyBub3Qgc2V0
CkNPTkZJR19IV19SQU5ET009eQojIENPTkZJR19IV19SQU5ET01fVElNRVJJT01FTSBpcyBub3Qg
c2V0CiMgQ09ORklHX0hXX1JBTkRPTV9CQTQzMSBpcyBub3Qgc2V0CkNPTkZJR19IV19SQU5ET01f
VklSVElPPXkKIyBDT05GSUdfSFdfUkFORE9NX1BTRVJJRVMgaXMgbm90IHNldApDT05GSUdfSFdf
UkFORE9NX1BPV0VSTlY9eQojIENPTkZJR19IV19SQU5ET01fQ0NUUk5HIGlzIG5vdCBzZXQKIyBD
T05GSUdfSFdfUkFORE9NX1hJUEhFUkEgaXMgbm90IHNldAojIENPTkZJR19BUFBMSUNPTSBpcyBu
b3Qgc2V0CkNPTkZJR19ERVZNRU09eQpDT05GSUdfTlZSQU09bQpDT05GSUdfREVWUE9SVD15CiMg
Q09ORklHX0hBTkdDSEVDS19USU1FUiBpcyBub3Qgc2V0CiMgQ09ORklHX1RDR19UUE0gaXMgbm90
IHNldAojIENPTkZJR19YSUxMWUJVUyBpcyBub3Qgc2V0CiMgQ09ORklHX1hJTExZVVNCIGlzIG5v
dCBzZXQKIyBlbmQgb2YgQ2hhcmFjdGVyIGRldmljZXMKCiMKIyBJMkMgc3VwcG9ydAojCkNPTkZJ
R19JMkM9eQpDT05GSUdfSTJDX0JPQVJESU5GTz15CiMgQ09ORklHX0kyQ19DT01QQVQgaXMgbm90
IHNldApDT05GSUdfSTJDX0NIQVJERVY9eQojIENPTkZJR19JMkNfTVVYIGlzIG5vdCBzZXQKQ09O
RklHX0kyQ19IRUxQRVJfQVVUTz15CkNPTkZJR19JMkNfQUxHT0JJVD1tCgojCiMgSTJDIEhhcmR3
YXJlIEJ1cyBzdXBwb3J0CiMKCiMKIyBQQyBTTUJ1cyBob3N0IGNvbnRyb2xsZXIgZHJpdmVycwoj
CiMgQ09ORklHX0kyQ19BTEkxNTM1IGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX0FMSTE1NjMgaXMg
bm90IHNldAojIENPTkZJR19JMkNfQUxJMTVYMyBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19BTUQ3
NTYgaXMgbm90IHNldAojIENPTkZJR19JMkNfQU1EODExMSBpcyBub3Qgc2V0CiMgQ09ORklHX0ky
Q19JODAxIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX0lTQ0ggaXMgbm90IHNldAojIENPTkZJR19J
MkNfUElJWDQgaXMgbm90IHNldAojIENPTkZJR19JMkNfTkZPUkNFMiBpcyBub3Qgc2V0CiMgQ09O
RklHX0kyQ19OVklESUFfR1BVIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX1NJUzU1OTUgaXMgbm90
IHNldAojIENPTkZJR19JMkNfU0lTNjMwIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX1NJUzk2WCBp
cyBub3Qgc2V0CiMgQ09ORklHX0kyQ19WSUEgaXMgbm90IHNldAojIENPTkZJR19JMkNfVklBUFJP
IGlzIG5vdCBzZXQKCiMKIyBJMkMgc3lzdGVtIGJ1cyBkcml2ZXJzIChtb3N0bHkgZW1iZWRkZWQg
LyBzeXN0ZW0tb24tY2hpcCkKIwojIENPTkZJR19JMkNfQ0JVU19HUElPIGlzIG5vdCBzZXQKIyBD
T05GSUdfSTJDX0RFU0lHTldBUkVfUExBVEZPUk0gaXMgbm90IHNldAojIENPTkZJR19JMkNfREVT
SUdOV0FSRV9QQ0kgaXMgbm90IHNldAojIENPTkZJR19JMkNfRU1FVjIgaXMgbm90IHNldAojIENP
TkZJR19JMkNfR1BJTyBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19NUEMgaXMgbm90IHNldAojIENP
TkZJR19JMkNfT0NPUkVTIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX1BDQV9QTEFURk9STSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0kyQ19SSzNYIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX1NJTVRFQyBp
cyBub3Qgc2V0CiMgQ09ORklHX0kyQ19YSUxJTlggaXMgbm90IHNldAoKIwojIEV4dGVybmFsIEky
Qy9TTUJ1cyBhZGFwdGVyIGRyaXZlcnMKIwojIENPTkZJR19JMkNfRElPTEFOX1UyQyBpcyBub3Qg
c2V0CiMgQ09ORklHX0kyQ19DUDI2MTUgaXMgbm90IHNldAojIENPTkZJR19JMkNfUENJMVhYWFgg
aXMgbm90IHNldAojIENPTkZJR19JMkNfUk9CT1RGVVpaX09TSUYgaXMgbm90IHNldAojIENPTkZJ
R19JMkNfVEFPU19FVk0gaXMgbm90IHNldAojIENPTkZJR19JMkNfVElOWV9VU0IgaXMgbm90IHNl
dAoKIwojIE90aGVyIEkyQy9TTUJ1cyBidXMgZHJpdmVycwojCkNPTkZJR19JMkNfT1BBTD15CiMg
Q09ORklHX0kyQ19WSVJUSU8gaXMgbm90IHNldAojIGVuZCBvZiBJMkMgSGFyZHdhcmUgQnVzIHN1
cHBvcnQKCiMgQ09ORklHX0kyQ19TVFVCIGlzIG5vdCBzZXQKQ09ORklHX0kyQ19TTEFWRT15CiMg
Q09ORklHX0kyQ19TTEFWRV9FRVBST00gaXMgbm90IHNldAojIENPTkZJR19JMkNfU0xBVkVfVEVT
VFVOSVQgaXMgbm90IHNldAojIENPTkZJR19JMkNfREVCVUdfQ09SRSBpcyBub3Qgc2V0CiMgQ09O
RklHX0kyQ19ERUJVR19BTEdPIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX0RFQlVHX0JVUyBpcyBu
b3Qgc2V0CiMgZW5kIG9mIEkyQyBzdXBwb3J0CgojIENPTkZJR19JM0MgaXMgbm90IHNldAojIENP
TkZJR19TUEkgaXMgbm90IHNldAojIENPTkZJR19TUE1JIGlzIG5vdCBzZXQKIyBDT05GSUdfSFNJ
IGlzIG5vdCBzZXQKIyBDT05GSUdfUFBTIGlzIG5vdCBzZXQKCiMKIyBQVFAgY2xvY2sgc3VwcG9y
dAojCiMgQ09ORklHX1BUUF8xNTg4X0NMT0NLIGlzIG5vdCBzZXQKQ09ORklHX1BUUF8xNTg4X0NM
T0NLX09QVElPTkFMPXkKCiMKIyBFbmFibGUgUEhZTElCIGFuZCBORVRXT1JLX1BIWV9USU1FU1RB
TVBJTkcgdG8gc2VlIHRoZSBhZGRpdGlvbmFsIGNsb2Nrcy4KIwojIGVuZCBvZiBQVFAgY2xvY2sg
c3VwcG9ydAoKIyBDT05GSUdfUElOQ1RSTCBpcyBub3Qgc2V0CkNPTkZJR19HUElPTElCPXkKQ09O
RklHX0dQSU9MSUJfRkFTVFBBVEhfTElNSVQ9NTEyCkNPTkZJR19PRl9HUElPPXkKQ09ORklHX0dQ
SU9MSUJfSVJRQ0hJUD15CiMgQ09ORklHX0RFQlVHX0dQSU8gaXMgbm90IHNldAojIENPTkZJR19H
UElPX1NZU0ZTIGlzIG5vdCBzZXQKQ09ORklHX0dQSU9fQ0RFVj15CiMgQ09ORklHX0dQSU9fQ0RF
Vl9WMSBpcyBub3Qgc2V0CgojCiMgTWVtb3J5IG1hcHBlZCBHUElPIGRyaXZlcnMKIwojIENPTkZJ
R19HUElPXzc0WFhfTU1JTyBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fQUxURVJBIGlzIG5vdCBz
ZXQKIyBDT05GSUdfR1BJT19DQURFTkNFIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19EV0FQQiBp
cyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fRlRHUElPMDEwIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJ
T19HRU5FUklDX1BMQVRGT1JNIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19HUkdQSU8gaXMgbm90
IHNldAojIENPTkZJR19HUElPX0hMV0QgaXMgbm90IHNldAojIENPTkZJR19HUElPX01CODZTN1gg
aXMgbm90IHNldAojIENPTkZJR19HUElPX1NJRklWRSBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9f
WElMSU5YIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19BTURfRkNIIGlzIG5vdCBzZXQKIyBlbmQg
b2YgTWVtb3J5IG1hcHBlZCBHUElPIGRyaXZlcnMKCiMKIyBJMkMgR1BJTyBleHBhbmRlcnMKIwoj
IENPTkZJR19HUElPX0FETlAgaXMgbm90IHNldAojIENPTkZJR19HUElPX0ZYTDY0MDggaXMgbm90
IHNldAojIENPTkZJR19HUElPX0RTNDUyMCBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fR1dfUExE
IGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19NQVg3MzAwIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJ
T19NQVg3MzJYIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19QQ0E5NTNYIGlzIG5vdCBzZXQKIyBD
T05GSUdfR1BJT19QQ0E5NTcwIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19QQ0Y4NTdYIGlzIG5v
dCBzZXQKIyBDT05GSUdfR1BJT19UUElDMjgxMCBpcyBub3Qgc2V0CiMgZW5kIG9mIEkyQyBHUElP
IGV4cGFuZGVycwoKIwojIE1GRCBHUElPIGV4cGFuZGVycwojCiMgZW5kIG9mIE1GRCBHUElPIGV4
cGFuZGVycwoKIwojIFBDSSBHUElPIGV4cGFuZGVycwojCiMgQ09ORklHX0dQSU9fQlQ4WFggaXMg
bm90IHNldAojIENPTkZJR19HUElPX1BDSV9JRElPXzE2IGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJ
T19QQ0lFX0lESU9fMjQgaXMgbm90IHNldAojIENPTkZJR19HUElPX1JEQzMyMVggaXMgbm90IHNl
dAojIGVuZCBvZiBQQ0kgR1BJTyBleHBhbmRlcnMKCiMKIyBVU0IgR1BJTyBleHBhbmRlcnMKIwoj
IGVuZCBvZiBVU0IgR1BJTyBleHBhbmRlcnMKCiMKIyBWaXJ0dWFsIEdQSU8gZHJpdmVycwojCkNP
TkZJR19HUElPX0FHR1JFR0FUT1I9bQojIENPTkZJR19HUElPX0xBVENIIGlzIG5vdCBzZXQKIyBD
T05GSUdfR1BJT19NT0NLVVAgaXMgbm90IHNldApDT05GSUdfR1BJT19WSVJUSU89bQpDT05GSUdf
R1BJT19TSU09bQojIGVuZCBvZiBWaXJ0dWFsIEdQSU8gZHJpdmVycwoKIyBDT05GSUdfVzEgaXMg
bm90IHNldAojIENPTkZJR19QT1dFUl9SRVNFVCBpcyBub3Qgc2V0CkNPTkZJR19QT1dFUl9TVVBQ
TFk9eQojIENPTkZJR19QT1dFUl9TVVBQTFlfREVCVUcgaXMgbm90IHNldApDT05GSUdfUE9XRVJf
U1VQUExZX0hXTU9OPXkKIyBDT05GSUdfSVA1WFhYX1BPV0VSIGlzIG5vdCBzZXQKIyBDT05GSUdf
VEVTVF9QT1dFUiBpcyBub3Qgc2V0CiMgQ09ORklHX0NIQVJHRVJfQURQNTA2MSBpcyBub3Qgc2V0
CiMgQ09ORklHX0JBVFRFUllfQ1cyMDE1IGlzIG5vdCBzZXQKIyBDT05GSUdfQkFUVEVSWV9EUzI3
ODAgaXMgbm90IHNldAojIENPTkZJR19CQVRURVJZX0RTMjc4MSBpcyBub3Qgc2V0CiMgQ09ORklH
X0JBVFRFUllfRFMyNzgyIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFUVEVSWV9TQU1TVU5HX1NESSBp
cyBub3Qgc2V0CiMgQ09ORklHX0JBVFRFUllfU0JTIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0hBUkdF
Ul9TQlMgaXMgbm90IHNldAojIENPTkZJR19CQVRURVJZX0JRMjdYWFggaXMgbm90IHNldAojIENP
TkZJR19CQVRURVJZX01BWDE3MDQyIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0hBUkdFUl9NQVg4OTAz
IGlzIG5vdCBzZXQKIyBDT05GSUdfQ0hBUkdFUl9MUDg3MjcgaXMgbm90IHNldAojIENPTkZJR19D
SEFSR0VSX0dQSU8gaXMgbm90IHNldAojIENPTkZJR19DSEFSR0VSX0xUMzY1MSBpcyBub3Qgc2V0
CiMgQ09ORklHX0NIQVJHRVJfTFRDNDE2MkwgaXMgbm90IHNldAojIENPTkZJR19DSEFSR0VSX0RF
VEVDVE9SX01BWDE0NjU2IGlzIG5vdCBzZXQKIyBDT05GSUdfQ0hBUkdFUl9NQVg3Nzk3NiBpcyBu
b3Qgc2V0CiMgQ09ORklHX0NIQVJHRVJfQlEyNDE1WCBpcyBub3Qgc2V0CiMgQ09ORklHX0NIQVJH
RVJfQlEyNDI1NyBpcyBub3Qgc2V0CiMgQ09ORklHX0NIQVJHRVJfQlEyNDczNSBpcyBub3Qgc2V0
CiMgQ09ORklHX0NIQVJHRVJfQlEyNTE1WCBpcyBub3Qgc2V0CiMgQ09ORklHX0NIQVJHRVJfQlEy
NTg5MCBpcyBub3Qgc2V0CiMgQ09ORklHX0NIQVJHRVJfQlEyNTk4MCBpcyBub3Qgc2V0CiMgQ09O
RklHX0NIQVJHRVJfQlEyNTZYWCBpcyBub3Qgc2V0CiMgQ09ORklHX0JBVFRFUllfR0FVR0VfTFRD
Mjk0MSBpcyBub3Qgc2V0CiMgQ09ORklHX0JBVFRFUllfR09MREZJU0ggaXMgbm90IHNldAojIENP
TkZJR19CQVRURVJZX1JUNTAzMyBpcyBub3Qgc2V0CiMgQ09ORklHX0NIQVJHRVJfUlQ5NDU1IGlz
IG5vdCBzZXQKIyBDT05GSUdfQ0hBUkdFUl9CRDk5OTU0IGlzIG5vdCBzZXQKIyBDT05GSUdfQkFU
VEVSWV9VRzMxMDUgaXMgbm90IHNldAojIENPTkZJR19GVUVMX0dBVUdFX01NODAxMyBpcyBub3Qg
c2V0CkNPTkZJR19IV01PTj15CkNPTkZJR19IV01PTl9ERUJVR19DSElQPXkKCiMKIyBOYXRpdmUg
ZHJpdmVycwojCiMgQ09ORklHX1NFTlNPUlNfQUQ3NDE0IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VO
U09SU19BRDc0MTggaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0FETTEwMjEgaXMgbm90IHNl
dAojIENPTkZJR19TRU5TT1JTX0FETTEwMjUgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0FE
TTEwMjYgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0FETTEwMjkgaXMgbm90IHNldAojIENP
TkZJR19TRU5TT1JTX0FETTEwMzEgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0FETTExNzcg
aXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0FETTkyNDAgaXMgbm90IHNldAojIENPTkZJR19T
RU5TT1JTX0FEVDc0MTAgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0FEVDc0MTEgaXMgbm90
IHNldAojIENPTkZJR19TRU5TT1JTX0FEVDc0NjIgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JT
X0FEVDc0NzAgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0FEVDc0NzUgaXMgbm90IHNldAoj
IENPTkZJR19TRU5TT1JTX0FIVDEwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19BUVVBQ09N
UFVURVJfRDVORVhUIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19BUzM3MCBpcyBub3Qgc2V0
CiMgQ09ORklHX1NFTlNPUlNfQVNDNzYyMSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQVhJ
X0ZBTl9DT05UUk9MIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19BVFhQMSBpcyBub3Qgc2V0
CiMgQ09ORklHX1NFTlNPUlNfQ09SU0FJUl9DUFJPIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09S
U19DT1JTQUlSX1BTVSBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX0RSSVZFVEVNUD1tCiMgQ09O
RklHX1NFTlNPUlNfRFM2MjAgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0RTMTYyMSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfSTVLX0FNQiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNP
UlNfRjc1Mzc1UyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfRlRTVEVVVEFURVMgaXMgbm90
IHNldAojIENPTkZJR19TRU5TT1JTX0dMNTE4U00gaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JT
X0dMNTIwU00gaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0c3NjBBIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0VOU09SU19HNzYyIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19HUElPX0ZBTiBp
cyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfSElINjEzMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NF
TlNPUlNfSFMzMDAxIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19JQk1BRU0gaXMgbm90IHNl
dAojIENPTkZJR19TRU5TT1JTX0lCTVBFWCBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX0lCTVBP
V0VSTlY9bQpDT05GSUdfU0VOU09SU19KQzQyPW0KIyBDT05GSUdfU0VOU09SU19QT1dFUlogaXMg
bm90IHNldAojIENPTkZJR19TRU5TT1JTX1BPV1IxMjIwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VO
U09SU19MSU5FQUdFIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19MVEMyOTQ1IGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0VOU09SU19MVEMyOTQ3X0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNP
UlNfTFRDMjk5MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTFRDMjk5MSBpcyBub3Qgc2V0
CiMgQ09ORklHX1NFTlNPUlNfTFRDMjk5MiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTFRD
NDE1MSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTFRDNDIxNSBpcyBub3Qgc2V0CiMgQ09O
RklHX1NFTlNPUlNfTFRDNDIyMiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTFRDNDI0NSBp
cyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTFRDNDI2MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NF
TlNPUlNfTFRDNDI2MSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTUFYMTI3IGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0VOU09SU19NQVgxNjA2NSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNf
TUFYMTYxOSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTUFYMTY2OCBpcyBub3Qgc2V0CiMg
Q09ORklHX1NFTlNPUlNfTUFYMTk3IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19NQVgzMTcz
MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTUFYMzE3NjAgaXMgbm90IHNldAojIENPTkZJ
R19NQVgzMTgyNyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTUFYNjYyMCBpcyBub3Qgc2V0
CiMgQ09ORklHX1NFTlNPUlNfTUFYNjYyMSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTUFY
NjYzOSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTUFYNjY0MiBpcyBub3Qgc2V0CiMgQ09O
RklHX1NFTlNPUlNfTUFYNjY1MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTUFYNjY5NyBp
cyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTUFYMzE3OTAgaXMgbm90IHNldAojIENPTkZJR19T
RU5TT1JTX01DMzRWUjUwMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTUNQMzAyMSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfVEM2NTQgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JT
X1RQUzIzODYxIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19NUjc1MjAzIGlzIG5vdCBzZXQK
IyBDT05GSUdfU0VOU09SU19MTTYzIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19MTTczIGlz
IG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19MTTc1IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09S
U19MTTc3IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19MTTc4IGlzIG5vdCBzZXQKIyBDT05G
SUdfU0VOU09SU19MTTgwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19MTTgzIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0VOU09SU19MTTg1IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19MTTg3
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19MTTkwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VO
U09SU19MTTkyIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19MTTkzIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0VOU09SU19MTTk1MjM0IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19MTTk1MjQx
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19MTTk1MjQ1IGlzIG5vdCBzZXQKIyBDT05GSUdf
U0VOU09SU19OQ1Q2Nzc1X0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTkNUNzgwMiBp
cyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTkNUNzkwNCBpcyBub3Qgc2V0CiMgQ09ORklHX1NF
TlNPUlNfTlBDTTdYWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTlpYVF9LUkFLRU4yIGlz
IG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19OWlhUX1NNQVJUMiBpcyBub3Qgc2V0CiMgQ09ORklH
X1NFTlNPUlNfT0NDX1A4X0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfUENGODU5MSBp
cyBub3Qgc2V0CiMgQ09ORklHX1BNQlVTIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19TQlRT
SSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfU0JSTUkgaXMgbm90IHNldAojIENPTkZJR19T
RU5TT1JTX1NIVDE1IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19TSFQyMSBpcyBub3Qgc2V0
CiMgQ09ORklHX1NFTlNPUlNfU0hUM3ggaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1NIVDR4
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19TSFRDMSBpcyBub3Qgc2V0CiMgQ09ORklHX1NF
TlNPUlNfU0lTNTU5NSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfRU1DMTQwMyBpcyBub3Qg
c2V0CiMgQ09ORklHX1NFTlNPUlNfRU1DMjEwMyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNf
RU1DMjMwNSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfRU1DNlcyMDEgaXMgbm90IHNldAoj
IENPTkZJR19TRU5TT1JTX1NNU0M0N00xOTIgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1NU
VFM3NTEgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0FEQzEyOEQ4MTggaXMgbm90IHNldAoj
IENPTkZJR19TRU5TT1JTX0FEUzc4MjggaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0FNQzY4
MjEgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0lOQTIwOSBpcyBub3Qgc2V0CiMgQ09ORklH
X1NFTlNPUlNfSU5BMlhYIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19JTkEyMzggaXMgbm90
IHNldAojIENPTkZJR19TRU5TT1JTX0lOQTMyMjEgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JT
X1RDNzQgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1RITUM1MCBpcyBub3Qgc2V0CiMgQ09O
RklHX1NFTlNPUlNfVE1QMTAyIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19UTVAxMDMgaXMg
bm90IHNldAojIENPTkZJR19TRU5TT1JTX1RNUDEwOCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNP
UlNfVE1QNDAxIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19UTVA0MjEgaXMgbm90IHNldAoj
IENPTkZJR19TRU5TT1JTX1RNUDQ2NCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfVE1QNTEz
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19WSUE2ODZBIGlzIG5vdCBzZXQKIyBDT05GSUdf
U0VOU09SU19WVDgyMzEgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1c4Mzc3M0cgaXMgbm90
IHNldAojIENPTkZJR19TRU5TT1JTX1c4Mzc4MUQgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JT
X1c4Mzc5MUQgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1c4Mzc5MkQgaXMgbm90IHNldAoj
IENPTkZJR19TRU5TT1JTX1c4Mzc5MyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfVzgzNzk1
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19XODNMNzg1VFMgaXMgbm90IHNldAojIENPTkZJ
R19TRU5TT1JTX1c4M0w3ODZORyBpcyBub3Qgc2V0CiMgQ09ORklHX1RIRVJNQUwgaXMgbm90IHNl
dApDT05GSUdfV0FUQ0hET0c9eQpDT05GSUdfV0FUQ0hET0dfQ09SRT15CiMgQ09ORklHX1dBVENI
RE9HX05PV0FZT1VUIGlzIG5vdCBzZXQKQ09ORklHX1dBVENIRE9HX0hBTkRMRV9CT09UX0VOQUJM
RUQ9eQpDT05GSUdfV0FUQ0hET0dfT1BFTl9USU1FT1VUPTAKQ09ORklHX1dBVENIRE9HX1NZU0ZT
PXkKIyBDT05GSUdfV0FUQ0hET0dfSFJUSU1FUl9QUkVUSU1FT1VUIGlzIG5vdCBzZXQKCiMKIyBX
YXRjaGRvZyBQcmV0aW1lb3V0IEdvdmVybm9ycwojCiMgQ09ORklHX1dBVENIRE9HX1BSRVRJTUVP
VVRfR09WIGlzIG5vdCBzZXQKCiMKIyBXYXRjaGRvZyBEZXZpY2UgRHJpdmVycwojCkNPTkZJR19T
T0ZUX1dBVENIRE9HPW0KIyBDT05GSUdfR1BJT19XQVRDSERPRyBpcyBub3Qgc2V0CiMgQ09ORklH
X1hJTElOWF9XQVRDSERPRyBpcyBub3Qgc2V0CiMgQ09ORklHX1pJSVJBVkVfV0FUQ0hET0cgaXMg
bm90IHNldAojIENPTkZJR19DQURFTkNFX1dBVENIRE9HIGlzIG5vdCBzZXQKIyBDT05GSUdfRFdf
V0FUQ0hET0cgaXMgbm90IHNldAojIENPTkZJR19NQVg2M1hYX1dBVENIRE9HIGlzIG5vdCBzZXQK
IyBDT05GSUdfQUxJTTcxMDFfV0RUIGlzIG5vdCBzZXQKIyBDT05GSUdfSTYzMDBFU0JfV0RUIGlz
IG5vdCBzZXQKIyBDT05GSUdfTUVOX0EyMV9XRFQgaXMgbm90IHNldAojIENPTkZJR19QU0VSSUVT
X1dEVCBpcyBub3Qgc2V0CiMgQ09ORklHX1dBVENIRE9HX1JUQVMgaXMgbm90IHNldAoKIwojIFBD
SS1iYXNlZCBXYXRjaGRvZyBDYXJkcwojCiMgQ09ORklHX1BDSVBDV0FUQ0hET0cgaXMgbm90IHNl
dAojIENPTkZJR19XRFRQQ0kgaXMgbm90IHNldAoKIwojIFVTQi1iYXNlZCBXYXRjaGRvZyBDYXJk
cwojCiMgQ09ORklHX1VTQlBDV0FUQ0hET0cgaXMgbm90IHNldApDT05GSUdfU1NCX1BPU1NJQkxF
PXkKIyBDT05GSUdfU1NCIGlzIG5vdCBzZXQKQ09ORklHX0JDTUFfUE9TU0lCTEU9eQojIENPTkZJ
R19CQ01BIGlzIG5vdCBzZXQKCiMKIyBNdWx0aWZ1bmN0aW9uIGRldmljZSBkcml2ZXJzCiMKIyBD
T05GSUdfTUZEX0FDVDg5NDVBIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0FTMzcxMSBpcyBub3Qg
c2V0CiMgQ09ORklHX01GRF9TTVBSTyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9BUzM3MjIgaXMg
bm90IHNldAojIENPTkZJR19QTUlDX0FEUDU1MjAgaXMgbm90IHNldAojIENPTkZJR19NRkRfQUFU
Mjg3MF9DT1JFIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0FUTUVMX0ZMRVhDT00gaXMgbm90IHNl
dAojIENPTkZJR19NRkRfQVRNRUxfSExDREMgaXMgbm90IHNldAojIENPTkZJR19NRkRfQkNNNTkw
WFggaXMgbm90IHNldAojIENPTkZJR19NRkRfQkQ5NTcxTVdWIGlzIG5vdCBzZXQKIyBDT05GSUdf
TUZEX0FYUDIwWF9JMkMgaXMgbm90IHNldAojIENPTkZJR19NRkRfQ1M0Mkw0M19JMkMgaXMgbm90
IHNldAojIENPTkZJR19NRkRfTUFERVJBIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX01BWDU5NzAg
aXMgbm90IHNldAojIENPTkZJR19QTUlDX0RBOTAzWCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9E
QTkwNTJfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0RBOTA1NSBpcyBub3Qgc2V0CiMgQ09O
RklHX01GRF9EQTkwNjIgaXMgbm90IHNldAojIENPTkZJR19NRkRfREE5MDYzIGlzIG5vdCBzZXQK
IyBDT05GSUdfTUZEX0RBOTE1MCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9ETE4yIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTUZEX0dBVEVXT1JLU19HU0MgaXMgbm90IHNldAojIENPTkZJR19NRkRfTUMx
M1hYWF9JMkMgaXMgbm90IHNldAojIENPTkZJR19NRkRfTVAyNjI5IGlzIG5vdCBzZXQKIyBDT05G
SUdfTUZEX0hJNjQyMV9QTUlDIGlzIG5vdCBzZXQKIyBDT05GSUdfTFBDX0lDSCBpcyBub3Qgc2V0
CiMgQ09ORklHX0xQQ19TQ0ggaXMgbm90IHNldAojIENPTkZJR19NRkRfSVFTNjJYIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTUZEX0pBTlpfQ01PRElPIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0tFTVBM
RCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF84OFBNODAwIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZE
Xzg4UE04MDUgaXMgbm90IHNldAojIENPTkZJR19NRkRfODhQTTg2MFggaXMgbm90IHNldAojIENP
TkZJR19NRkRfTUFYMTQ1NzcgaXMgbm90IHNldAojIENPTkZJR19NRkRfTUFYNzc1NDEgaXMgbm90
IHNldAojIENPTkZJR19NRkRfTUFYNzc2MjAgaXMgbm90IHNldAojIENPTkZJR19NRkRfTUFYNzc2
NTAgaXMgbm90IHNldAojIENPTkZJR19NRkRfTUFYNzc2ODYgaXMgbm90IHNldAojIENPTkZJR19N
RkRfTUFYNzc2OTMgaXMgbm90IHNldAojIENPTkZJR19NRkRfTUFYNzc3MTQgaXMgbm90IHNldAoj
IENPTkZJR19NRkRfTUFYNzc4NDMgaXMgbm90IHNldAojIENPTkZJR19NRkRfTUFYODkwNyBpcyBu
b3Qgc2V0CiMgQ09ORklHX01GRF9NQVg4OTI1IGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX01BWDg5
OTcgaXMgbm90IHNldAojIENPTkZJR19NRkRfTUFYODk5OCBpcyBub3Qgc2V0CiMgQ09ORklHX01G
RF9NVDYzNjAgaXMgbm90IHNldAojIENPTkZJR19NRkRfTVQ2MzcwIGlzIG5vdCBzZXQKIyBDT05G
SUdfTUZEX01UNjM5NyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9NRU5GMjFCTUMgaXMgbm90IHNl
dAojIENPTkZJR19NRkRfVklQRVJCT0FSRCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9OVFhFQyBp
cyBub3Qgc2V0CiMgQ09ORklHX01GRF9SRVRVIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1BDRjUw
NjMzIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1NZNzYzNkEgaXMgbm90IHNldAojIENPTkZJR19N
RkRfUkRDMzIxWCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9SVDQ4MzEgaXMgbm90IHNldAojIENP
TkZJR19NRkRfUlQ1MDMzIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1JUNTEyMCBpcyBub3Qgc2V0
CiMgQ09ORklHX01GRF9SQzVUNTgzIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1JLOFhYX0kyQyBp
cyBub3Qgc2V0CiMgQ09ORklHX01GRF9STjVUNjE4IGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1NF
Q19DT1JFIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1NJNDc2WF9DT1JFIGlzIG5vdCBzZXQKIyBD
T05GSUdfTUZEX1NNNTAxIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1NLWTgxNDUyIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTUZEX1NUTVBFIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1NZU0NPTiBpcyBu
b3Qgc2V0CiMgQ09ORklHX01GRF9MUDM5NDMgaXMgbm90IHNldAojIENPTkZJR19NRkRfTFA4Nzg4
IGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1RJX0xNVSBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9Q
QUxNQVMgaXMgbm90IHNldAojIENPTkZJR19UUFM2MTA1WCBpcyBub3Qgc2V0CiMgQ09ORklHX1RQ
UzY1MDEwIGlzIG5vdCBzZXQKIyBDT05GSUdfVFBTNjUwN1ggaXMgbm90IHNldAojIENPTkZJR19N
RkRfVFBTNjUwODYgaXMgbm90IHNldAojIENPTkZJR19NRkRfVFBTNjUwOTAgaXMgbm90IHNldAoj
IENPTkZJR19NRkRfVFBTNjUyMTcgaXMgbm90IHNldAojIENPTkZJR19NRkRfVElfTFA4NzNYIGlz
IG5vdCBzZXQKIyBDT05GSUdfTUZEX1RJX0xQODc1NjUgaXMgbm90IHNldAojIENPTkZJR19NRkRf
VFBTNjUyMTggaXMgbm90IHNldAojIENPTkZJR19NRkRfVFBTNjUyMTkgaXMgbm90IHNldAojIENP
TkZJR19NRkRfVFBTNjU4NlggaXMgbm90IHNldAojIENPTkZJR19NRkRfVFBTNjU5MTAgaXMgbm90
IHNldAojIENPTkZJR19NRkRfVFBTNjU5MTJfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1RQ
UzY1OTRfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfVFdMNDAzMF9DT1JFIGlzIG5vdCBzZXQKIyBD
T05GSUdfVFdMNjA0MF9DT1JFIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1dMMTI3M19DT1JFIGlz
IG5vdCBzZXQKIyBDT05GSUdfTUZEX0xNMzUzMyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9UQzM1
ODlYIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1RRTVg4NiBpcyBub3Qgc2V0CiMgQ09ORklHX01G
RF9WWDg1NSBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9MT0NITkFHQVIgaXMgbm90IHNldAojIENP
TkZJR19NRkRfQVJJWk9OQV9JMkMgaXMgbm90IHNldAojIENPTkZJR19NRkRfV004NDAwIGlzIG5v
dCBzZXQKIyBDT05GSUdfTUZEX1dNODMxWF9JMkMgaXMgbm90IHNldAojIENPTkZJR19NRkRfV004
MzUwX0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9XTTg5OTQgaXMgbm90IHNldAojIENPTkZJ
R19NRkRfUk9ITV9CRDcxOFhYIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1JPSE1fQkQ3MTgyOCBp
cyBub3Qgc2V0CiMgQ09ORklHX01GRF9ST0hNX0JEOTU3WE1VRiBpcyBub3Qgc2V0CiMgQ09ORklH
X01GRF9TVFBNSUMxIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1NUTUZYIGlzIG5vdCBzZXQKIyBD
T05GSUdfTUZEX0FUQzI2MFhfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1FDT01fUE04MDA4
IGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1JTTVVfSTJDIGlzIG5vdCBzZXQKIyBlbmQgb2YgTXVs
dGlmdW5jdGlvbiBkZXZpY2UgZHJpdmVycwoKIyBDT05GSUdfUkVHVUxBVE9SIGlzIG5vdCBzZXQK
IyBDT05GSUdfUkNfQ09SRSBpcyBub3Qgc2V0CgojCiMgQ0VDIHN1cHBvcnQKIwojIENPTkZJR19N
RURJQV9DRUNfU1VQUE9SVCBpcyBub3Qgc2V0CiMgZW5kIG9mIENFQyBzdXBwb3J0CgojIENPTkZJ
R19NRURJQV9TVVBQT1JUIGlzIG5vdCBzZXQKCiMKIyBHcmFwaGljcyBzdXBwb3J0CiMKQ09ORklH
X0FQRVJUVVJFX0hFTFBFUlM9eQpDT05GSUdfVklERU9fQ01ETElORT15CkNPTkZJR19WSURFT19O
T01PREVTRVQ9eQojIENPTkZJR19BVVhESVNQTEFZIGlzIG5vdCBzZXQKIyBDT05GSUdfQUdQIGlz
IG5vdCBzZXQKQ09ORklHX0RSTT15CiMgQ09ORklHX0RSTV9ERUJVR19NTSBpcyBub3Qgc2V0CkNP
TkZJR19EUk1fS1VOSVRfVEVTVF9IRUxQRVJTPW0KQ09ORklHX0RSTV9LVU5JVF9URVNUPW0KQ09O
RklHX0RSTV9LTVNfSEVMUEVSPXkKIyBDT05GSUdfRFJNX0RFQlVHX0RQX01TVF9UT1BPTE9HWV9S
RUZTIGlzIG5vdCBzZXQKQ09ORklHX0RSTV9ERUJVR19NT0RFU0VUX0xPQ0s9eQpDT05GSUdfRFJN
X0ZCREVWX0VNVUxBVElPTj15CkNPTkZJR19EUk1fRkJERVZfT1ZFUkFMTE9DPTEwMAojIENPTkZJ
R19EUk1fRkJERVZfTEVBS19QSFlTX1NNRU0gaXMgbm90IHNldAojIENPTkZJR19EUk1fTE9BRF9F
RElEX0ZJUk1XQVJFIGlzIG5vdCBzZXQKQ09ORklHX0RSTV9ESVNQTEFZX0hFTFBFUj1tCkNPTkZJ
R19EUk1fRElTUExBWV9EUF9IRUxQRVI9eQojIENPTkZJR19EUk1fRFBfQVVYX0NIQVJERVYgaXMg
bm90IHNldAojIENPTkZJR19EUk1fRFBfQ0VDIGlzIG5vdCBzZXQKQ09ORklHX0RSTV9UVE09bQpD
T05GSUdfRFJNX1RUTV9LVU5JVF9URVNUPW0KQ09ORklHX0RSTV9FWEVDPW0KQ09ORklHX0RSTV9C
VUREWT1tCkNPTkZJR19EUk1fVlJBTV9IRUxQRVI9bQpDT05GSUdfRFJNX1RUTV9IRUxQRVI9bQpD
T05GSUdfRFJNX0dFTV9TSE1FTV9IRUxQRVI9bQpDT05GSUdfRFJNX1NVQkFMTE9DX0hFTFBFUj1t
CgojCiMgSTJDIGVuY29kZXIgb3IgaGVscGVyIGNoaXBzCiMKIyBDT05GSUdfRFJNX0kyQ19DSDcw
MDYgaXMgbm90IHNldAojIENPTkZJR19EUk1fSTJDX1NJTDE2NCBpcyBub3Qgc2V0CiMgQ09ORklH
X0RSTV9JMkNfTlhQX1REQTk5OFggaXMgbm90IHNldAojIENPTkZJR19EUk1fSTJDX05YUF9UREE5
OTUwIGlzIG5vdCBzZXQKIyBlbmQgb2YgSTJDIGVuY29kZXIgb3IgaGVscGVyIGNoaXBzCgojCiMg
QVJNIGRldmljZXMKIwojIENPTkZJR19EUk1fS09NRURBIGlzIG5vdCBzZXQKIyBlbmQgb2YgQVJN
IGRldmljZXMKCkNPTkZJR19EUk1fUkFERU9OPW0KQ09ORklHX0RSTV9SQURFT05fVVNFUlBUUj15
CiMgQ09ORklHX0RSTV9BTURHUFUgaXMgbm90IHNldAojIENPTkZJR19EUk1fTk9VVkVBVSBpcyBu
b3Qgc2V0CkNPTkZJR19EUk1fVkdFTT1tCiMgQ09ORklHX0RSTV9WS01TIGlzIG5vdCBzZXQKIyBD
T05GSUdfRFJNX1VETCBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9BU1QgaXMgbm90IHNldAojIENP
TkZJR19EUk1fTUdBRzIwMCBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9RWEwgaXMgbm90IHNldApD
T05GSUdfRFJNX1ZJUlRJT19HUFU9bQpDT05GSUdfRFJNX1ZJUlRJT19HUFVfS01TPXkKQ09ORklH
X0RSTV9QQU5FTD15CgojCiMgRGlzcGxheSBQYW5lbHMKIwojIENPTkZJR19EUk1fUEFORUxfTFZE
UyBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9QQU5FTF9TSU1QTEUgaXMgbm90IHNldAojIENPTkZJ
R19EUk1fUEFORUxfRURQIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1BBTkVMX09MSU1FWF9MQ0Rf
T0xJTlVYSU5PIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1BBTkVMX1NBTVNVTkdfQVROQTMzWEMy
MCBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9QQU5FTF9TQU1TVU5HX1M2RDdBQTAgaXMgbm90IHNl
dAojIENPTkZJR19EUk1fUEFORUxfU0FNU1VOR19TNkU2M00wIGlzIG5vdCBzZXQKIyBDT05GSUdf
RFJNX1BBTkVMX1NBTVNVTkdfUzZFODhBMF9BTVM0NTJFRjAxIGlzIG5vdCBzZXQKIyBDT05GSUdf
RFJNX1BBTkVMX1NBTVNVTkdfUzZFOEFBMCBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9QQU5FTF9T
RUlLT180M1dWRjFHIGlzIG5vdCBzZXQKIyBlbmQgb2YgRGlzcGxheSBQYW5lbHMKCkNPTkZJR19E
Uk1fQlJJREdFPXkKQ09ORklHX0RSTV9QQU5FTF9CUklER0U9eQoKIwojIERpc3BsYXkgSW50ZXJm
YWNlIEJyaWRnZXMKIwojIENPTkZJR19EUk1fQ0hJUE9ORV9JQ042MjExIGlzIG5vdCBzZXQKIyBD
T05GSUdfRFJNX0NIUk9OVEVMX0NINzAzMyBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9ESVNQTEFZ
X0NPTk5FQ1RPUiBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9JVEVfSVQ2NTA1IGlzIG5vdCBzZXQK
IyBDT05GSUdfRFJNX0xPTlRJVU1fTFQ4OTEyQiBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9MT05U
SVVNX0xUOTIxMSBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9MT05USVVNX0xUOTYxMSBpcyBub3Qg
c2V0CiMgQ09ORklHX0RSTV9MT05USVVNX0xUOTYxMVVYQyBpcyBub3Qgc2V0CiMgQ09ORklHX0RS
TV9JVEVfSVQ2NjEyMSBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9MVkRTX0NPREVDIGlzIG5vdCBz
ZXQKIyBDT05GSUdfRFJNX01FR0FDSElQU19TVERQWFhYWF9HRV9CODUwVjNfRlcgaXMgbm90IHNl
dAojIENPTkZJR19EUk1fTldMX01JUElfRFNJIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX05YUF9Q
VE4zNDYwIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1BBUkFERV9QUzg2MjIgaXMgbm90IHNldAoj
IENPTkZJR19EUk1fUEFSQURFX1BTODY0MCBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9TQU1TVU5H
X0RTSU0gaXMgbm90IHNldAojIENPTkZJR19EUk1fU0lMX1NJSTg2MjAgaXMgbm90IHNldAojIENP
TkZJR19EUk1fU0lJOTAyWCBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9TSUk5MjM0IGlzIG5vdCBz
ZXQKIyBDT05GSUdfRFJNX1NJTVBMRV9CUklER0UgaXMgbm90IHNldAojIENPTkZJR19EUk1fVEhJ
TkVfVEhDNjNMVkQxMDI0IGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1RPU0hJQkFfVEMzNTg3NjIg
aXMgbm90IHNldAojIENPTkZJR19EUk1fVE9TSElCQV9UQzM1ODc2NCBpcyBub3Qgc2V0CiMgQ09O
RklHX0RSTV9UT1NISUJBX1RDMzU4NzY3IGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1RPU0hJQkFf
VEMzNTg3NjggaXMgbm90IHNldAojIENPTkZJR19EUk1fVE9TSElCQV9UQzM1ODc3NSBpcyBub3Qg
c2V0CiMgQ09ORklHX0RSTV9USV9ETFBDMzQzMyBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9USV9U
RlA0MTAgaXMgbm90IHNldAojIENPTkZJR19EUk1fVElfU042NURTSTgzIGlzIG5vdCBzZXQKIyBD
T05GSUdfRFJNX1RJX1NONjVEU0k4NiBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9USV9UUEQxMlMw
MTUgaXMgbm90IHNldAojIENPTkZJR19EUk1fQU5BTE9HSVhfQU5YNjM0NSBpcyBub3Qgc2V0CiMg
Q09ORklHX0RSTV9BTkFMT0dJWF9BTlg3OFhYIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX0FOQUxP
R0lYX0FOWDc2MjUgaXMgbm90IHNldAojIENPTkZJR19EUk1fSTJDX0FEVjc1MTEgaXMgbm90IHNl
dAojIENPTkZJR19EUk1fQ0ROU19EU0kgaXMgbm90IHNldAojIENPTkZJR19EUk1fQ0ROU19NSERQ
ODU0NiBpcyBub3Qgc2V0CiMgZW5kIG9mIERpc3BsYXkgSW50ZXJmYWNlIEJyaWRnZXMKCiMgQ09O
RklHX0RSTV9MT09OR1NPTiBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9FVE5BVklWIGlzIG5vdCBz
ZXQKIyBDT05GSUdfRFJNX0xPR0lDVkMgaXMgbm90IHNldAojIENPTkZJR19EUk1fQVJDUEdVIGlz
IG5vdCBzZXQKQ09ORklHX0RSTV9CT0NIUz1tCiMgQ09ORklHX0RSTV9DSVJSVVNfUUVNVSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0RSTV9HTTEyVTMyMCBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9PRkRS
TSBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9TSU1QTEVEUk0gaXMgbm90IHNldAojIENPTkZJR19E
Uk1fR1VEIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1NTRDEzMFggaXMgbm90IHNldAojIENPTkZJ
R19EUk1fTEVHQUNZIGlzIG5vdCBzZXQKQ09ORklHX0RSTV9FWFBPUlRfRk9SX1RFU1RTPXkKQ09O
RklHX0RSTV9QQU5FTF9PUklFTlRBVElPTl9RVUlSS1M9eQpDT05GSUdfRFJNX0xJQl9SQU5ET009
eQoKIwojIEZyYW1lIGJ1ZmZlciBEZXZpY2VzCiMKQ09ORklHX0ZCPXkKQ09ORklHX0ZCX01BQ01P
REVTPXkKIyBDT05GSUdfRkJfQ0lSUlVTIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfUE0yIGlzIG5v
dCBzZXQKIyBDT05GSUdfRkJfQ1lCRVIyMDAwIGlzIG5vdCBzZXQKQ09ORklHX0ZCX09GPXkKIyBD
T05GSUdfRkJfQVNJTElBTlQgaXMgbm90IHNldAojIENPTkZJR19GQl9JTVNUVCBpcyBub3Qgc2V0
CiMgQ09ORklHX0ZCX1VWRVNBIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfT1BFTkNPUkVTIGlzIG5v
dCBzZXQKIyBDT05GSUdfRkJfUzFEMTNYWFggaXMgbm90IHNldAojIENPTkZJR19GQl9OVklESUEg
aXMgbm90IHNldAojIENPTkZJR19GQl9SSVZBIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfSTc0MCBp
cyBub3Qgc2V0CiMgQ09ORklHX0ZCX01BVFJPWCBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1JBREVP
TiBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX0FUWTEyOCBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX0FU
WSBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1MzIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfU0FWQUdF
IGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfU0lTIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfTkVPTUFH
SUMgaXMgbm90IHNldAojIENPTkZJR19GQl9LWVJPIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfM0RG
WCBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1ZUODYyMyBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1RS
SURFTlQgaXMgbm90IHNldAojIENPTkZJR19GQl9BUksgaXMgbm90IHNldAojIENPTkZJR19GQl9Q
TTMgaXMgbm90IHNldAojIENPTkZJR19GQl9DQVJNSU5FIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJf
U01TQ1VGWCBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX0lCTV9HWFQ0NTAwIGlzIG5vdCBzZXQKIyBD
T05GSUdfRkJfVklSVFVBTCBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX01FVFJPTk9NRSBpcyBub3Qg
c2V0CiMgQ09ORklHX0ZCX01CODYyWFggaXMgbm90IHNldAojIENPTkZJR19GQl9TSU1QTEUgaXMg
bm90IHNldAojIENPTkZJR19GQl9TU0QxMzA3IGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfU003MTIg
aXMgbm90IHNldApDT05GSUdfRkJfQ09SRT15CkNPTkZJR19GQl9OT1RJRlk9eQojIENPTkZJR19G
SVJNV0FSRV9FRElEIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfREVWSUNFIGlzIG5vdCBzZXQKQ09O
RklHX0ZCX0NGQl9GSUxMUkVDVD15CkNPTkZJR19GQl9DRkJfQ09QWUFSRUE9eQpDT05GSUdfRkJf
Q0ZCX0lNQUdFQkxJVD15CkNPTkZJR19GQl9TWVNfRklMTFJFQ1Q9eQpDT05GSUdfRkJfU1lTX0NP
UFlBUkVBPXkKQ09ORklHX0ZCX1NZU19JTUFHRUJMSVQ9eQpDT05GSUdfRkJfRk9SRUlHTl9FTkRJ
QU49eQpDT05GSUdfRkJfQk9USF9FTkRJQU49eQojIENPTkZJR19GQl9CSUdfRU5ESUFOIGlzIG5v
dCBzZXQKIyBDT05GSUdfRkJfTElUVExFX0VORElBTiBpcyBub3Qgc2V0CkNPTkZJR19GQl9TWVNf
Rk9QUz15CkNPTkZJR19GQl9ERUZFUlJFRF9JTz15CkNPTkZJR19GQl9JT01FTV9GT1BTPXkKQ09O
RklHX0ZCX0lPTUVNX0hFTFBFUlM9eQpDT05GSUdfRkJfU1lTTUVNX0hFTFBFUlM9eQpDT05GSUdf
RkJfU1lTTUVNX0hFTFBFUlNfREVGRVJSRUQ9eQojIENPTkZJR19GQl9NT0RFX0hFTFBFUlMgaXMg
bm90IHNldAojIENPTkZJR19GQl9USUxFQkxJVFRJTkcgaXMgbm90IHNldAojIGVuZCBvZiBGcmFt
ZSBidWZmZXIgRGV2aWNlcwoKIwojIEJhY2tsaWdodCAmIExDRCBkZXZpY2Ugc3VwcG9ydAojCkNP
TkZJR19MQ0RfQ0xBU1NfREVWSUNFPW0KQ09ORklHX0xDRF9QTEFURk9STT1tCkNPTkZJR19CQUNL
TElHSFRfQ0xBU1NfREVWSUNFPW0KIyBDT05GSUdfQkFDS0xJR0hUX0tURDI1MyBpcyBub3Qgc2V0
CiMgQ09ORklHX0JBQ0tMSUdIVF9LVFo4ODY2IGlzIG5vdCBzZXQKIyBDT05GSUdfQkFDS0xJR0hU
X1FDT01fV0xFRCBpcyBub3Qgc2V0CiMgQ09ORklHX0JBQ0tMSUdIVF9BRFA4ODYwIGlzIG5vdCBz
ZXQKIyBDT05GSUdfQkFDS0xJR0hUX0FEUDg4NzAgaXMgbm90IHNldAojIENPTkZJR19CQUNLTElH
SFRfTE0zNjM5IGlzIG5vdCBzZXQKIyBDT05GSUdfQkFDS0xJR0hUX0dQSU8gaXMgbm90IHNldAoj
IENPTkZJR19CQUNLTElHSFRfTFY1MjA3TFAgaXMgbm90IHNldAojIENPTkZJR19CQUNLTElHSFRf
QkQ2MTA3IGlzIG5vdCBzZXQKIyBDT05GSUdfQkFDS0xJR0hUX0FSQ1hDTk4gaXMgbm90IHNldApD
T05GSUdfQkFDS0xJR0hUX0xFRD1tCiMgZW5kIG9mIEJhY2tsaWdodCAmIExDRCBkZXZpY2Ugc3Vw
cG9ydAoKQ09ORklHX0hETUk9eQoKIwojIENvbnNvbGUgZGlzcGxheSBkcml2ZXIgc3VwcG9ydAoj
CkNPTkZJR19EVU1NWV9DT05TT0xFPXkKQ09ORklHX0RVTU1ZX0NPTlNPTEVfQ09MVU1OUz04MApD
T05GSUdfRFVNTVlfQ09OU09MRV9ST1dTPTI1CkNPTkZJR19GUkFNRUJVRkZFUl9DT05TT0xFPXkK
IyBDT05GSUdfRlJBTUVCVUZGRVJfQ09OU09MRV9MRUdBQ1lfQUNDRUxFUkFUSU9OIGlzIG5vdCBz
ZXQKQ09ORklHX0ZSQU1FQlVGRkVSX0NPTlNPTEVfREVURUNUX1BSSU1BUlk9eQojIENPTkZJR19G
UkFNRUJVRkZFUl9DT05TT0xFX1JPVEFUSU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfRlJBTUVCVUZG
RVJfQ09OU09MRV9ERUZFUlJFRF9UQUtFT1ZFUiBpcyBub3Qgc2V0CiMgZW5kIG9mIENvbnNvbGUg
ZGlzcGxheSBkcml2ZXIgc3VwcG9ydAoKIyBDT05GSUdfTE9HTyBpcyBub3Qgc2V0CiMgZW5kIG9m
IEdyYXBoaWNzIHN1cHBvcnQKCiMgQ09ORklHX0RSTV9BQ0NFTCBpcyBub3Qgc2V0CkNPTkZJR19T
T1VORD1tCkNPTkZJR19TTkQ9bQpDT05GSUdfU05EX1RJTUVSPW0KQ09ORklHX1NORF9QQ009bQpD
T05GSUdfU05EX0hXREVQPW0KQ09ORklHX1NORF9TRVFfREVWSUNFPW0KQ09ORklHX1NORF9SQVdN
SURJPW0KQ09ORklHX1NORF9KQUNLPXkKQ09ORklHX1NORF9KQUNLX0lOUFVUX0RFVj15CiMgQ09O
RklHX1NORF9PU1NFTVVMIGlzIG5vdCBzZXQKQ09ORklHX1NORF9QQ01fVElNRVI9eQpDT05GSUdf
U05EX0hSVElNRVI9bQpDT05GSUdfU05EX0RZTkFNSUNfTUlOT1JTPXkKQ09ORklHX1NORF9NQVhf
Q0FSRFM9NgojIENPTkZJR19TTkRfU1VQUE9SVF9PTERfQVBJIGlzIG5vdCBzZXQKQ09ORklHX1NO
RF9QUk9DX0ZTPXkKQ09ORklHX1NORF9WRVJCT1NFX1BST0NGUz15CiMgQ09ORklHX1NORF9WRVJC
T1NFX1BSSU5USyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9DVExfRkFTVF9MT09LVVAgaXMgbm90
IHNldAojIENPTkZJR19TTkRfREVCVUcgaXMgbm90IHNldApDT05GSUdfU05EX0NUTF9JTlBVVF9W
QUxJREFUSU9OPXkKQ09ORklHX1NORF9WTUFTVEVSPXkKQ09ORklHX1NORF9TRVFVRU5DRVI9bQoj
IENPTkZJR19TTkRfU0VRX0RVTU1ZIGlzIG5vdCBzZXQKQ09ORklHX1NORF9TRVFfSFJUSU1FUl9E
RUZBVUxUPXkKQ09ORklHX1NORF9TRVFfTUlESV9FVkVOVD1tCkNPTkZJR19TTkRfU0VRX01JREk9
bQpDT05GSUdfU05EX1NFUV9WSVJNSURJPW0KIyBDT05GSUdfU05EX1NFUV9VTVAgaXMgbm90IHNl
dApDT05GSUdfU05EX0RSSVZFUlM9eQojIENPTkZJR19TTkRfRFVNTVkgaXMgbm90IHNldApDT05G
SUdfU05EX0FMT09QPW0KIyBDT05GSUdfU05EX1BDTVRFU1QgaXMgbm90IHNldApDT05GSUdfU05E
X1ZJUk1JREk9bQojIENPTkZJR19TTkRfTVRQQVYgaXMgbm90IHNldAojIENPTkZJR19TTkRfU0VS
SUFMX1UxNjU1MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9NUFU0MDEgaXMgbm90IHNldApDT05G
SUdfU05EX1BDST15CiMgQ09ORklHX1NORF9BRDE4ODkgaXMgbm90IHNldAojIENPTkZJR19TTkRf
QUxTNDAwMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9BVElJWFAgaXMgbm90IHNldAojIENPTkZJ
R19TTkRfQVRJSVhQX01PREVNIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0FVODgxMCBpcyBub3Qg
c2V0CiMgQ09ORklHX1NORF9BVTg4MjAgaXMgbm90IHNldAojIENPTkZJR19TTkRfQVU4ODMwIGlz
IG5vdCBzZXQKIyBDT05GSUdfU05EX0FXMiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9CVDg3WCBp
cyBub3Qgc2V0CiMgQ09ORklHX1NORF9DQTAxMDYgaXMgbm90IHNldAojIENPTkZJR19TTkRfQ01J
UENJIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX09YWUdFTiBpcyBub3Qgc2V0CiMgQ09ORklHX1NO
RF9DUzQyODEgaXMgbm90IHNldAojIENPTkZJR19TTkRfQ1M0NlhYIGlzIG5vdCBzZXQKIyBDT05G
SUdfU05EX0NUWEZJIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0RBUkxBMjAgaXMgbm90IHNldAoj
IENPTkZJR19TTkRfR0lOQTIwIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0xBWUxBMjAgaXMgbm90
IHNldAojIENPTkZJR19TTkRfREFSTEEyNCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9HSU5BMjQg
aXMgbm90IHNldAojIENPTkZJR19TTkRfTEFZTEEyNCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9N
T05BIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX01JQSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9F
Q0hPM0cgaXMgbm90IHNldAojIENPTkZJR19TTkRfSU5ESUdPIGlzIG5vdCBzZXQKIyBDT05GSUdf
U05EX0lORElHT0lPIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0lORElHT0RKIGlzIG5vdCBzZXQK
IyBDT05GSUdfU05EX0lORElHT0lPWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9JTkRJR09ESlgg
aXMgbm90IHNldAojIENPTkZJR19TTkRfRU5TMTM3MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9F
TlMxMzcxIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0ZNODAxIGlzIG5vdCBzZXQKIyBDT05GSUdf
U05EX0hEU1AgaXMgbm90IHNldAojIENPTkZJR19TTkRfSERTUE0gaXMgbm90IHNldAojIENPTkZJ
R19TTkRfSUNFMTcyNCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9JTlRFTDhYMCBpcyBub3Qgc2V0
CiMgQ09ORklHX1NORF9JTlRFTDhYME0gaXMgbm90IHNldAojIENPTkZJR19TTkRfS09SRzEyMTIg
aXMgbm90IHNldAojIENPTkZJR19TTkRfTE9MQSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9MWDY0
NjRFUyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9NSVhBUlQgaXMgbm90IHNldAojIENPTkZJR19T
TkRfTk0yNTYgaXMgbm90IHNldAojIENPTkZJR19TTkRfUENYSFIgaXMgbm90IHNldAojIENPTkZJ
R19TTkRfUklQVElERSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9STUUzMiBpcyBub3Qgc2V0CiMg
Q09ORklHX1NORF9STUU5NiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9STUU5NjUyIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU05EX1NFNlggaXMgbm90IHNldAojIENPTkZJR19TTkRfVklBODJYWCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NORF9WSUE4MlhYX01PREVNIGlzIG5vdCBzZXQKIyBDT05GSUdfU05E
X1ZJUlRVT1NPIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1ZYMjIyIGlzIG5vdCBzZXQKIyBDT05G
SUdfU05EX1lNRlBDSSBpcyBub3Qgc2V0CgojCiMgSEQtQXVkaW8KIwpDT05GSUdfU05EX0hEQT1t
CkNPTkZJR19TTkRfSERBX0lOVEVMPW0KQ09ORklHX1NORF9IREFfSFdERVA9eQpDT05GSUdfU05E
X0hEQV9SRUNPTkZJRz15CiMgQ09ORklHX1NORF9IREFfSU5QVVRfQkVFUCBpcyBub3Qgc2V0CiMg
Q09ORklHX1NORF9IREFfUEFUQ0hfTE9BREVSIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0hEQV9D
SVJSVVNfU0NPREVDX0tVTklUX1RFU1QgaXMgbm90IHNldAojIENPTkZJR19TTkRfSERBX0NPREVD
X1JFQUxURUsgaXMgbm90IHNldAojIENPTkZJR19TTkRfSERBX0NPREVDX0FOQUxPRyBpcyBub3Qg
c2V0CiMgQ09ORklHX1NORF9IREFfQ09ERUNfU0lHTUFURUwgaXMgbm90IHNldAojIENPTkZJR19T
TkRfSERBX0NPREVDX1ZJQSBpcyBub3Qgc2V0CkNPTkZJR19TTkRfSERBX0NPREVDX0hETUk9bQoj
IENPTkZJR19TTkRfSERBX0NPREVDX0NJUlJVUyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9IREFf
Q09ERUNfQ1M4NDA5IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0hEQV9DT0RFQ19DT05FWEFOVCBp
cyBub3Qgc2V0CiMgQ09ORklHX1NORF9IREFfQ09ERUNfQ0EwMTEwIGlzIG5vdCBzZXQKIyBDT05G
SUdfU05EX0hEQV9DT0RFQ19DQTAxMzIgaXMgbm90IHNldAojIENPTkZJR19TTkRfSERBX0NPREVD
X0NNRURJQSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9IREFfQ09ERUNfU0kzMDU0IGlzIG5vdCBz
ZXQKIyBDT05GSUdfU05EX0hEQV9HRU5FUklDIGlzIG5vdCBzZXQKQ09ORklHX1NORF9IREFfUE9X
RVJfU0FWRV9ERUZBVUxUPTAKIyBDT05GSUdfU05EX0hEQV9JTlRFTF9IRE1JX1NJTEVOVF9TVFJF
QU0gaXMgbm90IHNldAojIENPTkZJR19TTkRfSERBX0NUTF9ERVZfSUQgaXMgbm90IHNldAojIGVu
ZCBvZiBIRC1BdWRpbwoKQ09ORklHX1NORF9IREFfQ09SRT1tCkNPTkZJR19TTkRfSERBX0NPTVBP
TkVOVD15CkNPTkZJR19TTkRfSERBX1BSRUFMTE9DX1NJWkU9MjA0OApDT05GSUdfU05EX0lOVEVM
X0RTUF9DT05GSUc9bQojIENPTkZJR19TTkRfUFBDIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1VT
QiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0MgaXMgbm90IHNldAojIENPTkZJR19TTkRfVklS
VElPIGlzIG5vdCBzZXQKQ09ORklHX0hJRF9TVVBQT1JUPXkKQ09ORklHX0hJRD1tCkNPTkZJR19I
SURfQkFUVEVSWV9TVFJFTkdUSD15CkNPTkZJR19ISURSQVc9eQpDT05GSUdfVUhJRD1tCkNPTkZJ
R19ISURfR0VORVJJQz1tCgojCiMgU3BlY2lhbCBISUQgZHJpdmVycwojCiMgQ09ORklHX0hJRF9B
NFRFQ0ggaXMgbm90IHNldAojIENPTkZJR19ISURfQUNDVVRPVUNIIGlzIG5vdCBzZXQKIyBDT05G
SUdfSElEX0FDUlVYIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0FQUExFIGlzIG5vdCBzZXQKIyBD
T05GSUdfSElEX0FQUExFSVIgaXMgbm90IHNldAojIENPTkZJR19ISURfQVNVUyBpcyBub3Qgc2V0
CiMgQ09ORklHX0hJRF9BVVJFQUwgaXMgbm90IHNldAojIENPTkZJR19ISURfQkVMS0lOIGlzIG5v
dCBzZXQKIyBDT05GSUdfSElEX0JFVE9QX0ZGIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0JJR0JF
Tl9GRiBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9DSEVSUlkgaXMgbm90IHNldAojIENPTkZJR19I
SURfQ0hJQ09OWSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9DT1JTQUlSIGlzIG5vdCBzZXQKIyBD
T05GSUdfSElEX0NPVUdBUiBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9NQUNBTExZIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSElEX1BST0RJS0VZUyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9DTUVESUEg
aXMgbm90IHNldAojIENPTkZJR19ISURfQ1AyMTEyIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0NS
RUFUSVZFX1NCMDU0MCBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9DWVBSRVNTIGlzIG5vdCBzZXQK
IyBDT05GSUdfSElEX0RSQUdPTlJJU0UgaXMgbm90IHNldAojIENPTkZJR19ISURfRU1TX0ZGIGlz
IG5vdCBzZXQKIyBDT05GSUdfSElEX0VMQU4gaXMgbm90IHNldAojIENPTkZJR19ISURfRUxFQ09N
IGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0VMTyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9FVklT
SU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0VaS0VZIGlzIG5vdCBzZXQKIyBDT05GSUdfSElE
X0ZUMjYwIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0dFTUJJUkQgaXMgbm90IHNldAojIENPTkZJ
R19ISURfR0ZSTSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9HTE9SSU9VUyBpcyBub3Qgc2V0CiMg
Q09ORklHX0hJRF9IT0xURUsgaXMgbm90IHNldAojIENPTkZJR19ISURfR09PR0xFX1NUQURJQV9G
RiBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9WSVZBTERJIGlzIG5vdCBzZXQKIyBDT05GSUdfSElE
X0dUNjgzUiBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9LRVlUT1VDSCBpcyBub3Qgc2V0CiMgQ09O
RklHX0hJRF9LWUUgaXMgbm90IHNldApDT05GSUdfSElEX1VDTE9HSUM9bQojIENPTkZJR19ISURf
V0FMVE9QIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1ZJRVdTT05JQyBpcyBub3Qgc2V0CiMgQ09O
RklHX0hJRF9WUkMyIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1hJQU9NSSBpcyBub3Qgc2V0CiMg
Q09ORklHX0hJRF9HWVJBVElPTiBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9JQ0FERSBpcyBub3Qg
c2V0CiMgQ09ORklHX0hJRF9JVEUgaXMgbm90IHNldAojIENPTkZJR19ISURfSkFCUkEgaXMgbm90
IHNldAojIENPTkZJR19ISURfVFdJTkhBTiBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9LRU5TSU5H
VE9OIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0xDUE9XRVIgaXMgbm90IHNldAojIENPTkZJR19I
SURfTEVEIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0xFTk9WTyBpcyBub3Qgc2V0CiMgQ09ORklH
X0hJRF9MRVRTS0VUQ0ggaXMgbm90IHNldAojIENPTkZJR19ISURfTE9HSVRFQ0ggaXMgbm90IHNl
dAojIENPTkZJR19ISURfTUFHSUNNT1VTRSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9NQUxUUk9O
IGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX01BWUZMQVNIIGlzIG5vdCBzZXQKIyBDT05GSUdfSElE
X01FR0FXT1JMRF9GRiBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9SRURSQUdPTiBpcyBub3Qgc2V0
CkNPTkZJR19ISURfTUlDUk9TT0ZUPW0KIyBDT05GSUdfSElEX01PTlRFUkVZIGlzIG5vdCBzZXQK
IyBDT05GSUdfSElEX01VTFRJVE9VQ0ggaXMgbm90IHNldApDT05GSUdfSElEX05JTlRFTkRPPW0K
IyBDT05GSUdfTklOVEVORE9fRkYgaXMgbm90IHNldAojIENPTkZJR19ISURfTlRJIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSElEX05UUklHIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX05WSURJQV9TSElF
TEQgaXMgbm90IHNldAojIENPTkZJR19ISURfT1JURUsgaXMgbm90IHNldAojIENPTkZJR19ISURf
UEFOVEhFUkxPUkQgaXMgbm90IHNldAojIENPTkZJR19ISURfUEVOTU9VTlQgaXMgbm90IHNldAoj
IENPTkZJR19ISURfUEVUQUxZTlggaXMgbm90IHNldAojIENPTkZJR19ISURfUElDT0xDRCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0hJRF9QTEFOVFJPTklDUyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9Q
WFJDIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1JBWkVSIGlzIG5vdCBzZXQKIyBDT05GSUdfSElE
X1BSSU1BWCBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9SRVRST0RFIGlzIG5vdCBzZXQKQ09ORklH
X0hJRF9ST0NDQVQ9bQojIENPTkZJR19ISURfU0FJVEVLIGlzIG5vdCBzZXQKIyBDT05GSUdfSElE
X1NBTVNVTkcgaXMgbm90IHNldAojIENPTkZJR19ISURfU0VNSVRFSyBpcyBub3Qgc2V0CiMgQ09O
RklHX0hJRF9TSUdNQU1JQ1JPIGlzIG5vdCBzZXQKQ09ORklHX0hJRF9TT05ZPW0KIyBDT05GSUdf
U09OWV9GRiBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9TUEVFRExJTksgaXMgbm90IHNldAojIENP
TkZJR19ISURfU1RFQU0gaXMgbm90IHNldAojIENPTkZJR19ISURfU1RFRUxTRVJJRVMgaXMgbm90
IHNldAojIENPTkZJR19ISURfU1VOUExVUyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9STUkgaXMg
bm90IHNldAojIENPTkZJR19ISURfR1JFRU5BU0lBIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1NN
QVJUSk9ZUExVUyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9USVZPIGlzIG5vdCBzZXQKIyBDT05G
SUdfSElEX1RPUFNFRUQgaXMgbm90IHNldAojIENPTkZJR19ISURfVE9QUkUgaXMgbm90IHNldAoj
IENPTkZJR19ISURfVEhJTkdNIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1RIUlVTVE1BU1RFUiBp
cyBub3Qgc2V0CiMgQ09ORklHX0hJRF9VRFJBV19QUzMgaXMgbm90IHNldAojIENPTkZJR19ISURf
VTJGWkVSTyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9XQUNPTSBpcyBub3Qgc2V0CkNPTkZJR19I
SURfV0lJTU9URT1tCiMgQ09ORklHX0hJRF9YSU5NTyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9a
RVJPUExVUyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9aWURBQ1JPTiBpcyBub3Qgc2V0CiMgQ09O
RklHX0hJRF9TRU5TT1JfSFVCIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0FMUFMgaXMgbm90IHNl
dAojIENPTkZJR19ISURfTUNQMjIyMSBpcyBub3Qgc2V0CkNPTkZJR19ISURfS1VOSVRfVEVTVD1t
CiMgZW5kIG9mIFNwZWNpYWwgSElEIGRyaXZlcnMKCiMKIyBISUQtQlBGIHN1cHBvcnQKIwojIGVu
ZCBvZiBISUQtQlBGIHN1cHBvcnQKCiMKIyBVU0IgSElEIHN1cHBvcnQKIwpDT05GSUdfVVNCX0hJ
RD1tCiMgQ09ORklHX0hJRF9QSUQgaXMgbm90IHNldApDT05GSUdfVVNCX0hJRERFVj15CgojCiMg
VVNCIEhJRCBCb290IFByb3RvY29sIGRyaXZlcnMKIwojIENPTkZJR19VU0JfS0JEIGlzIG5vdCBz
ZXQKIyBDT05GSUdfVVNCX01PVVNFIGlzIG5vdCBzZXQKIyBlbmQgb2YgVVNCIEhJRCBCb290IFBy
b3RvY29sIGRyaXZlcnMKIyBlbmQgb2YgVVNCIEhJRCBzdXBwb3J0CgojIENPTkZJR19JMkNfSElE
IGlzIG5vdCBzZXQKQ09ORklHX1VTQl9PSENJX0xJVFRMRV9FTkRJQU49eQpDT05GSUdfVVNCX1NV
UFBPUlQ9eQpDT05GSUdfVVNCX0NPTU1PTj1tCkNPTkZJR19VU0JfTEVEX1RSSUc9eQojIENPTkZJ
R19VU0JfVUxQSV9CVVMgaXMgbm90IHNldAojIENPTkZJR19VU0JfQ09OTl9HUElPIGlzIG5vdCBz
ZXQKQ09ORklHX1VTQl9BUkNIX0hBU19IQ0Q9eQpDT05GSUdfVVNCPW0KQ09ORklHX1VTQl9QQ0k9
eQojIENPTkZJR19VU0JfUENJX0FNRCBpcyBub3Qgc2V0CkNPTkZJR19VU0JfQU5OT1VOQ0VfTkVX
X0RFVklDRVM9eQoKIwojIE1pc2NlbGxhbmVvdXMgVVNCIG9wdGlvbnMKIwpDT05GSUdfVVNCX0RF
RkFVTFRfUEVSU0lTVD15CiMgQ09ORklHX1VTQl9GRVdfSU5JVF9SRVRSSUVTIGlzIG5vdCBzZXQK
IyBDT05GSUdfVVNCX0RZTkFNSUNfTUlOT1JTIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX09URyBp
cyBub3Qgc2V0CiMgQ09ORklHX1VTQl9PVEdfUFJPRFVDVExJU1QgaXMgbm90IHNldAojIENPTkZJ
R19VU0JfT1RHX0RJU0FCTEVfRVhURVJOQUxfSFVCIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0xF
RFNfVFJJR0dFUl9VU0JQT1JUIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9BVVRPU1VTUEVORF9ERUxB
WT0yCkNPTkZJR19VU0JfTU9OPW0KCiMKIyBVU0IgSG9zdCBDb250cm9sbGVyIERyaXZlcnMKIwoj
IENPTkZJR19VU0JfQzY3WDAwX0hDRCBpcyBub3Qgc2V0CkNPTkZJR19VU0JfWEhDSV9IQ0Q9bQoj
IENPTkZJR19VU0JfWEhDSV9EQkdDQVAgaXMgbm90IHNldApDT05GSUdfVVNCX1hIQ0lfUENJPW0K
IyBDT05GSUdfVVNCX1hIQ0lfUENJX1JFTkVTQVMgaXMgbm90IHNldAojIENPTkZJR19VU0JfWEhD
SV9QTEFURk9STSBpcyBub3Qgc2V0CkNPTkZJR19VU0JfRUhDSV9IQ0Q9bQpDT05GSUdfVVNCX0VI
Q0lfUk9PVF9IVUJfVFQ9eQpDT05GSUdfVVNCX0VIQ0lfVFRfTkVXU0NIRUQ9eQpDT05GSUdfVVNC
X0VIQ0lfUENJPW0KIyBDT05GSUdfVVNCX0VIQ0lfRlNMIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9F
SENJX0hDRF9QUENfT0Y9eQojIENPTkZJR19VU0JfRUhDSV9IQ0RfUExBVEZPUk0gaXMgbm90IHNl
dAojIENPTkZJR19VU0JfT1hVMjEwSFBfSENEIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0lTUDEx
NlhfSENEIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX09IQ0lfSENEIGlzIG5vdCBzZXQKIyBDT05G
SUdfVVNCX1VIQ0lfSENEIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NMODExX0hDRCBpcyBub3Qg
c2V0CiMgQ09ORklHX1VTQl9SOEE2NjU5N19IQ0QgaXMgbm90IHNldAojIENPTkZJR19VU0JfSENE
X1RFU1RfTU9ERSBpcyBub3Qgc2V0CgojCiMgVVNCIERldmljZSBDbGFzcyBkcml2ZXJzCiMKIyBD
T05GSUdfVVNCX0FDTSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9QUklOVEVSIGlzIG5vdCBzZXQK
IyBDT05GSUdfVVNCX1dETSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9UTUMgaXMgbm90IHNldAoK
IwojIE5PVEU6IFVTQl9TVE9SQUdFIGRlcGVuZHMgb24gU0NTSSBidXQgQkxLX0RFVl9TRCBtYXkK
IwoKIwojIGFsc28gYmUgbmVlZGVkOyBzZWUgVVNCX1NUT1JBR0UgSGVscCBmb3IgbW9yZSBpbmZv
CiMKQ09ORklHX1VTQl9TVE9SQUdFPW0KIyBDT05GSUdfVVNCX1NUT1JBR0VfREVCVUcgaXMgbm90
IHNldAojIENPTkZJR19VU0JfU1RPUkFHRV9SRUFMVEVLIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNC
X1NUT1JBR0VfREFUQUZBQiBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TVE9SQUdFX0ZSRUVDT00g
aXMgbm90IHNldAojIENPTkZJR19VU0JfU1RPUkFHRV9JU0QyMDAgaXMgbm90IHNldAojIENPTkZJ
R19VU0JfU1RPUkFHRV9VU0JBVCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TVE9SQUdFX1NERFIw
OSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TVE9SQUdFX1NERFI1NSBpcyBub3Qgc2V0CiMgQ09O
RklHX1VTQl9TVE9SQUdFX0pVTVBTSE9UIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NUT1JBR0Vf
QUxBVURBIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NUT1JBR0VfT05FVE9VQ0ggaXMgbm90IHNl
dAojIENPTkZJR19VU0JfU1RPUkFHRV9LQVJNQSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TVE9S
QUdFX0NZUFJFU1NfQVRBQ0IgaXMgbm90IHNldAojIENPTkZJR19VU0JfU1RPUkFHRV9FTkVfVUI2
MjUwIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9VQVM9bQoKIwojIFVTQiBJbWFnaW5nIGRldmljZXMK
IwojIENPTkZJR19VU0JfTURDODAwIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX01JQ1JPVEVLIGlz
IG5vdCBzZXQKIyBDT05GSUdfVVNCSVBfQ09SRSBpcyBub3Qgc2V0CgojCiMgVVNCIGR1YWwtbW9k
ZSBjb250cm9sbGVyIGRyaXZlcnMKIwojIENPTkZJR19VU0JfQ0ROU19TVVBQT1JUIGlzIG5vdCBz
ZXQKIyBDT05GSUdfVVNCX01VU0JfSERSQyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9EV0MzIGlz
IG5vdCBzZXQKIyBDT05GSUdfVVNCX0RXQzIgaXMgbm90IHNldAojIENPTkZJR19VU0JfQ0hJUElE
RUEgaXMgbm90IHNldAojIENPTkZJR19VU0JfSVNQMTc2MCBpcyBub3Qgc2V0CgojCiMgVVNCIHBv
cnQgZHJpdmVycwojCkNPTkZJR19VU0JfU0VSSUFMPW0KIyBDT05GSUdfVVNCX1NFUklBTF9HRU5F
UklDIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9TSU1QTEUgaXMgbm90IHNldAojIENP
TkZJR19VU0JfU0VSSUFMX0FJUkNBQkxFIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9B
UkszMTE2IGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9CRUxLSU4gaXMgbm90IHNldAoj
IENPTkZJR19VU0JfU0VSSUFMX0NIMzQxIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9X
SElURUhFQVQgaXMgbm90IHNldAojIENPTkZJR19VU0JfU0VSSUFMX0RJR0lfQUNDRUxFUE9SVCBp
cyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TRVJJQUxfQ1AyMTBYIGlzIG5vdCBzZXQKIyBDT05GSUdf
VVNCX1NFUklBTF9DWVBSRVNTX004IGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9FTVBF
RyBpcyBub3Qgc2V0CkNPTkZJR19VU0JfU0VSSUFMX0ZURElfU0lPPW0KIyBDT05GSUdfVVNCX1NF
UklBTF9WSVNPUiBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TRVJJQUxfSVBBUSBpcyBub3Qgc2V0
CiMgQ09ORklHX1VTQl9TRVJJQUxfSVIgaXMgbm90IHNldAojIENPTkZJR19VU0JfU0VSSUFMX0VE
R0VQT1JUIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9FREdFUE9SVF9USSBpcyBub3Qg
c2V0CiMgQ09ORklHX1VTQl9TRVJJQUxfRjgxMjMyIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NF
UklBTF9GODE1M1ggaXMgbm90IHNldAojIENPTkZJR19VU0JfU0VSSUFMX0dBUk1JTiBpcyBub3Qg
c2V0CiMgQ09ORklHX1VTQl9TRVJJQUxfSVBXIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklB
TF9JVVUgaXMgbm90IHNldAojIENPTkZJR19VU0JfU0VSSUFMX0tFWVNQQU5fUERBIGlzIG5vdCBz
ZXQKIyBDT05GSUdfVVNCX1NFUklBTF9LRVlTUEFOIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NF
UklBTF9LTFNJIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9LT0JJTF9TQ1QgaXMgbm90
IHNldAojIENPTkZJR19VU0JfU0VSSUFMX01DVF9VMjMyIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNC
X1NFUklBTF9NRVRSTyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TRVJJQUxfTU9TNzcyMCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1VTQl9TRVJJQUxfTU9TNzg0MCBpcyBub3Qgc2V0CiMgQ09ORklHX1VT
Ql9TRVJJQUxfTVhVUE9SVCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TRVJJQUxfTkFWTUFOIGlz
IG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9QTDIzMDMgaXMgbm90IHNldAojIENPTkZJR19V
U0JfU0VSSUFMX09USTY4NTggaXMgbm90IHNldAojIENPTkZJR19VU0JfU0VSSUFMX1FDQVVYIGlz
IG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9RVUFMQ09NTSBpcyBub3Qgc2V0CiMgQ09ORklH
X1VTQl9TRVJJQUxfU1BDUDhYNSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TRVJJQUxfU0FGRSBp
cyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TRVJJQUxfU0lFUlJBV0lSRUxFU1MgaXMgbm90IHNldAoj
IENPTkZJR19VU0JfU0VSSUFMX1NZTUJPTCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TRVJJQUxf
VEkgaXMgbm90IHNldAojIENPTkZJR19VU0JfU0VSSUFMX0NZQkVSSkFDSyBpcyBub3Qgc2V0CiMg
Q09ORklHX1VTQl9TRVJJQUxfT1BUSU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9P
TU5JTkVUIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9PUFRJQ09OIGlzIG5vdCBzZXQK
IyBDT05GSUdfVVNCX1NFUklBTF9YU0VOU19NVCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TRVJJ
QUxfV0lTSEJPTkUgaXMgbm90IHNldAojIENPTkZJR19VU0JfU0VSSUFMX1NTVTEwMCBpcyBub3Qg
c2V0CiMgQ09ORklHX1VTQl9TRVJJQUxfUVQyIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklB
TF9VUEQ3OEYwNzMwIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9YUiBpcyBub3Qgc2V0
CiMgQ09ORklHX1VTQl9TRVJJQUxfREVCVUcgaXMgbm90IHNldAoKIwojIFVTQiBNaXNjZWxsYW5l
b3VzIGRyaXZlcnMKIwojIENPTkZJR19VU0JfRU1JNjIgaXMgbm90IHNldAojIENPTkZJR19VU0Jf
RU1JMjYgaXMgbm90IHNldAojIENPTkZJR19VU0JfQURVVFVYIGlzIG5vdCBzZXQKIyBDT05GSUdf
VVNCX1NFVlNFRyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9MRUdPVE9XRVIgaXMgbm90IHNldAoj
IENPTkZJR19VU0JfTENEIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0NZUFJFU1NfQ1k3QzYzIGlz
IG5vdCBzZXQKIyBDT05GSUdfVVNCX0NZVEhFUk0gaXMgbm90IHNldAojIENPTkZJR19VU0JfSURN
T1VTRSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9BUFBMRURJU1BMQVkgaXMgbm90IHNldAojIENP
TkZJR19BUFBMRV9NRklfRkFTVENIQVJHRSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TSVNVU0JW
R0EgaXMgbm90IHNldAojIENPTkZJR19VU0JfTEQgaXMgbm90IHNldAojIENPTkZJR19VU0JfVFJB
TkNFVklCUkFUT1IgaXMgbm90IHNldAojIENPTkZJR19VU0JfSU9XQVJSSU9SIGlzIG5vdCBzZXQK
IyBDT05GSUdfVVNCX1RFU1QgaXMgbm90IHNldAojIENPTkZJR19VU0JfRUhTRVRfVEVTVF9GSVhU
VVJFIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0lTSUdIVEZXIGlzIG5vdCBzZXQKIyBDT05GSUdf
VVNCX1lVUkVYIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0VaVVNCX0ZYMiBpcyBub3Qgc2V0CiMg
Q09ORklHX1VTQl9IVUJfVVNCMjUxWEIgaXMgbm90IHNldAojIENPTkZJR19VU0JfSFNJQ19VU0Iz
NTAzIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0hTSUNfVVNCNDYwNCBpcyBub3Qgc2V0CiMgQ09O
RklHX1VTQl9MSU5LX0xBWUVSX1RFU1QgaXMgbm90IHNldAojIENPTkZJR19VU0JfQ0hBT1NLRVkg
aXMgbm90IHNldAojIENPTkZJR19VU0JfT05CT0FSRF9IVUIgaXMgbm90IHNldAoKIwojIFVTQiBQ
aHlzaWNhbCBMYXllciBkcml2ZXJzCiMKIyBDT05GSUdfTk9QX1VTQl9YQ0VJViBpcyBub3Qgc2V0
CiMgQ09ORklHX1VTQl9HUElPX1ZCVVMgaXMgbm90IHNldAojIENPTkZJR19VU0JfSVNQMTMwMSBp
cyBub3Qgc2V0CiMgZW5kIG9mIFVTQiBQaHlzaWNhbCBMYXllciBkcml2ZXJzCgojIENPTkZJR19V
U0JfR0FER0VUIGlzIG5vdCBzZXQKIyBDT05GSUdfVFlQRUMgaXMgbm90IHNldAojIENPTkZJR19V
U0JfUk9MRV9TV0lUQ0ggaXMgbm90IHNldAojIENPTkZJR19NTUMgaXMgbm90IHNldAojIENPTkZJ
R19TQ1NJX1VGU0hDRCBpcyBub3Qgc2V0CiMgQ09ORklHX01FTVNUSUNLIGlzIG5vdCBzZXQKQ09O
RklHX05FV19MRURTPXkKQ09ORklHX0xFRFNfQ0xBU1M9eQojIENPTkZJR19MRURTX0NMQVNTX0ZM
QVNIIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19DTEFTU19NVUxUSUNPTE9SIGlzIG5vdCBzZXQK
Q09ORklHX0xFRFNfQlJJR0hUTkVTU19IV19DSEFOR0VEPXkKCiMKIyBMRUQgZHJpdmVycwojCiMg
Q09ORklHX0xFRFNfQU4zMDI1OUEgaXMgbm90IHNldAojIENPTkZJR19MRURTX0FXMjAwWFggaXMg
bm90IHNldAojIENPTkZJR19MRURTX0FXMjAxMyBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfQkNN
NjMyOCBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfQkNNNjM1OCBpcyBub3Qgc2V0CiMgQ09ORklH
X0xFRFNfTE0zNTMwIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19MTTM1MzIgaXMgbm90IHNldAoj
IENPTkZJR19MRURTX0xNMzY0MiBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfTE0zNjkyWCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0xFRFNfUENBOTUzMiBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfR1BJ
TyBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfTFAzOTQ0IGlzIG5vdCBzZXQKIyBDT05GSUdfTEVE
U19MUDM5NTIgaXMgbm90IHNldAojIENPTkZJR19MRURTX0xQNTBYWCBpcyBub3Qgc2V0CiMgQ09O
RklHX0xFRFNfTFA1NVhYX0NPTU1PTiBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfTFA4ODYwIGlz
IG5vdCBzZXQKIyBDT05GSUdfTEVEU19QQ0E5NTVYIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19Q
Q0E5NjNYIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19QQ0E5OTVYIGlzIG5vdCBzZXQKIyBDT05G
SUdfTEVEU19CRDI2MDZNVlYgaXMgbm90IHNldAojIENPTkZJR19MRURTX0JEMjgwMiBpcyBub3Qg
c2V0CiMgQ09ORklHX0xFRFNfTFQzNTkzIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19UQ0E2NTA3
IGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19UTEM1OTFYWCBpcyBub3Qgc2V0CiMgQ09ORklHX0xF
RFNfTE0zNTV4IGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19JUzMxRkwzMTlYIGlzIG5vdCBzZXQK
IyBDT05GSUdfTEVEU19JUzMxRkwzMlhYIGlzIG5vdCBzZXQKCiMKIyBMRUQgZHJpdmVyIGZvciBi
bGluaygxKSBVU0IgUkdCIExFRCBpcyB1bmRlciBTcGVjaWFsIEhJRCBkcml2ZXJzIChISURfVEhJ
TkdNKQojCiMgQ09ORklHX0xFRFNfQkxJTktNIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19QT1dF
Uk5WIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19NTFhSRUcgaXMgbm90IHNldAojIENPTkZJR19M
RURTX1VTRVIgaXMgbm90IHNldAojIENPTkZJR19MRURTX0xNMzY5NyBpcyBub3Qgc2V0CgojCiMg
Rmxhc2ggYW5kIFRvcmNoIExFRCBkcml2ZXJzCiMKCiMKIyBSR0IgTEVEIGRyaXZlcnMKIwoKIwoj
IExFRCBUcmlnZ2VycwojCkNPTkZJR19MRURTX1RSSUdHRVJTPXkKIyBDT05GSUdfTEVEU19UUklH
R0VSX1RJTUVSIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19UUklHR0VSX09ORVNIT1QgaXMgbm90
IHNldAojIENPTkZJR19MRURTX1RSSUdHRVJfRElTSyBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNf
VFJJR0dFUl9NVEQgaXMgbm90IHNldAojIENPTkZJR19MRURTX1RSSUdHRVJfSEVBUlRCRUFUIGlz
IG5vdCBzZXQKIyBDT05GSUdfTEVEU19UUklHR0VSX0JBQ0tMSUdIVCBpcyBub3Qgc2V0CiMgQ09O
RklHX0xFRFNfVFJJR0dFUl9DUFUgaXMgbm90IHNldAojIENPTkZJR19MRURTX1RSSUdHRVJfQUNU
SVZJVFkgaXMgbm90IHNldAojIENPTkZJR19MRURTX1RSSUdHRVJfR1BJTyBpcyBub3Qgc2V0CiMg
Q09ORklHX0xFRFNfVFJJR0dFUl9ERUZBVUxUX09OIGlzIG5vdCBzZXQKCiMKIyBpcHRhYmxlcyB0
cmlnZ2VyIGlzIHVuZGVyIE5ldGZpbHRlciBjb25maWcgKExFRCB0YXJnZXQpCiMKIyBDT05GSUdf
TEVEU19UUklHR0VSX1RSQU5TSUVOVCBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfVFJJR0dFUl9D
QU1FUkEgaXMgbm90IHNldApDT05GSUdfTEVEU19UUklHR0VSX1BBTklDPXkKIyBDT05GSUdfTEVE
U19UUklHR0VSX05FVERFViBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfVFJJR0dFUl9QQVRURVJO
IGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19UUklHR0VSX0FVRElPIGlzIG5vdCBzZXQKIyBDT05G
SUdfTEVEU19UUklHR0VSX1RUWSBpcyBub3Qgc2V0CgojCiMgU2ltcGxlIExFRCBkcml2ZXJzCiMK
IyBDT05GSUdfQUNDRVNTSUJJTElUWSBpcyBub3Qgc2V0CiMgQ09ORklHX0lORklOSUJBTkQgaXMg
bm90IHNldApDT05GSUdfRURBQ19BVE9NSUNfU0NSVUI9eQpDT05GSUdfRURBQ19TVVBQT1JUPXkK
IyBDT05GSUdfRURBQyBpcyBub3Qgc2V0CkNPTkZJR19SVENfTElCPXkKQ09ORklHX1JUQ19DTEFT
Uz15CiMgQ09ORklHX1JUQ19IQ1RPU1lTIGlzIG5vdCBzZXQKQ09ORklHX1JUQ19TWVNUT0hDPXkK
Q09ORklHX1JUQ19TWVNUT0hDX0RFVklDRT0icnRjMCIKIyBDT05GSUdfUlRDX0RFQlVHIGlzIG5v
dCBzZXQKQ09ORklHX1JUQ19MSUJfS1VOSVRfVEVTVD1tCkNPTkZJR19SVENfTlZNRU09eQoKIwoj
IFJUQyBpbnRlcmZhY2VzCiMKQ09ORklHX1JUQ19JTlRGX1NZU0ZTPXkKQ09ORklHX1JUQ19JTlRG
X1BST0M9eQpDT05GSUdfUlRDX0lOVEZfREVWPXkKIyBDT05GSUdfUlRDX0lOVEZfREVWX1VJRV9F
TVVMIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9URVNUIGlzIG5vdCBzZXQKCiMKIyBJMkMg
UlRDIGRyaXZlcnMKIwojIENPTkZJR19SVENfRFJWX0FCQjVaRVMzIGlzIG5vdCBzZXQKIyBDT05G
SUdfUlRDX0RSVl9BQkVPWjkgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX0FCWDgwWCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfRFMxMzA3IGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RS
Vl9EUzEzNzQgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX0RTMTY3MiBpcyBub3Qgc2V0CiMg
Q09ORklHX1JUQ19EUlZfSFlNODU2MyBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfTUFYNjkw
MCBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfTkNUMzAxOFkgaXMgbm90IHNldAojIENPTkZJ
R19SVENfRFJWX1JTNUMzNzIgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX0lTTDEyMDggaXMg
bm90IHNldAojIENPTkZJR19SVENfRFJWX0lTTDEyMDIyIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRD
X0RSVl9JU0wxMjAyNiBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfWDEyMDUgaXMgbm90IHNl
dAojIENPTkZJR19SVENfRFJWX1BDRjg1MjMgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX1BD
Rjg1MDYzIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9QQ0Y4NTM2MyBpcyBub3Qgc2V0CiMg
Q09ORklHX1JUQ19EUlZfUENGODU2MyBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfUENGODU4
MyBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfTTQxVDgwIGlzIG5vdCBzZXQKIyBDT05GSUdf
UlRDX0RSVl9CUTMySyBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfUzM1MzkwQSBpcyBub3Qg
c2V0CiMgQ09ORklHX1JUQ19EUlZfRk0zMTMwIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9S
WDgwMTAgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX1JYODU4MSBpcyBub3Qgc2V0CiMgQ09O
RklHX1JUQ19EUlZfUlg4MDI1IGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9FTTMwMjcgaXMg
bm90IHNldAojIENPTkZJR19SVENfRFJWX1JWMzAyOCBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19E
UlZfUlYzMDMyIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9SVjg4MDMgaXMgbm90IHNldAoj
IENPTkZJR19SVENfRFJWX1NEMzA3OCBpcyBub3Qgc2V0CgojCiMgU1BJIFJUQyBkcml2ZXJzCiMK
Q09ORklHX1JUQ19JMkNfQU5EX1NQST15CgojCiMgU1BJIGFuZCBJMkMgUlRDIGRyaXZlcnMKIwoj
IENPTkZJR19SVENfRFJWX0RTMzIzMiBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfUENGMjEy
NyBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfUlYzMDI5QzIgaXMgbm90IHNldAojIENPTkZJ
R19SVENfRFJWX1JYNjExMCBpcyBub3Qgc2V0CgojCiMgUGxhdGZvcm0gUlRDIGRyaXZlcnMKIwoj
IENPTkZJR19SVENfRFJWX0NNT1MgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX0RTMTI4NiBp
cyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfRFMxNTExIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRD
X0RSVl9EUzE1NTMgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX0RTMTY4NV9GQU1JTFkgaXMg
bm90IHNldAojIENPTkZJR19SVENfRFJWX0RTMTc0MiBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19E
UlZfRFMyNDA0IGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9TVEsxN1RBOCBpcyBub3Qgc2V0
CiMgQ09ORklHX1JUQ19EUlZfTTQ4VDg2IGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9NNDhU
MzUgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX000OFQ1OSBpcyBub3Qgc2V0CiMgQ09ORklH
X1JUQ19EUlZfTVNNNjI0MiBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfUlA1QzAxIGlzIG5v
dCBzZXQKQ09ORklHX1JUQ19EUlZfT1BBTD15CiMgQ09ORklHX1JUQ19EUlZfWllOUU1QIGlzIG5v
dCBzZXQKCiMKIyBvbi1DUFUgUlRDIGRyaXZlcnMKIwojIENPTkZJR19SVENfRFJWX0dFTkVSSUMg
aXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX0NBREVOQ0UgaXMgbm90IHNldAojIENPTkZJR19S
VENfRFJWX0ZUUlRDMDEwIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9SNzMwMSBpcyBub3Qg
c2V0CgojCiMgSElEIFNlbnNvciBSVEMgZHJpdmVycwojCiMgQ09ORklHX1JUQ19EUlZfR09MREZJ
U0ggaXMgbm90IHNldAojIENPTkZJR19ETUFERVZJQ0VTIGlzIG5vdCBzZXQKCiMKIyBETUFCVUYg
b3B0aW9ucwojCkNPTkZJR19TWU5DX0ZJTEU9eQojIENPTkZJR19TV19TWU5DIGlzIG5vdCBzZXQK
Q09ORklHX1VETUFCVUY9eQojIENPTkZJR19ETUFCVUZfTU9WRV9OT1RJRlkgaXMgbm90IHNldApD
T05GSUdfRE1BQlVGX0RFQlVHPXkKIyBDT05GSUdfRE1BQlVGX1NFTEZURVNUUyBpcyBub3Qgc2V0
CkNPTkZJR19ETUFCVUZfSEVBUFM9eQojIENPTkZJR19ETUFCVUZfU1lTRlNfU1RBVFMgaXMgbm90
IHNldApDT05GSUdfRE1BQlVGX0hFQVBTX1NZU1RFTT15CiMgZW5kIG9mIERNQUJVRiBvcHRpb25z
CgojIENPTkZJR19VSU8gaXMgbm90IHNldAojIENPTkZJR19WRklPIGlzIG5vdCBzZXQKQ09ORklH
X0lSUV9CWVBBU1NfTUFOQUdFUj15CkNPTkZJR19WSVJUX0RSSVZFUlM9eQpDT05GSUdfVklSVElP
X0FOQ0hPUj15CkNPTkZJR19WSVJUSU89eQpDT05GSUdfVklSVElPX1BDSV9MSUI9eQpDT05GSUdf
VklSVElPX1BDSV9MSUJfTEVHQUNZPXkKQ09ORklHX1ZJUlRJT19NRU5VPXkKQ09ORklHX1ZJUlRJ
T19QQ0k9eQpDT05GSUdfVklSVElPX1BDSV9MRUdBQ1k9eQojIENPTkZJR19WSVJUSU9fQkFMTE9P
TiBpcyBub3Qgc2V0CkNPTkZJR19WSVJUSU9fSU5QVVQ9eQojIENPTkZJR19WSVJUSU9fTU1JTyBp
cyBub3Qgc2V0CkNPTkZJR19WSVJUSU9fRE1BX1NIQVJFRF9CVUZGRVI9bQojIENPTkZJR19WRFBB
IGlzIG5vdCBzZXQKQ09ORklHX1ZIT1NUX0lPVExCPXkKQ09ORklHX1ZIT1NUX1RBU0s9eQpDT05G
SUdfVkhPU1Q9eQpDT05GSUdfVkhPU1RfTUVOVT15CkNPTkZJR19WSE9TVF9ORVQ9eQojIENPTkZJ
R19WSE9TVF9WU09DSyBpcyBub3Qgc2V0CiMgQ09ORklHX1ZIT1NUX0NST1NTX0VORElBTl9MRUdB
Q1kgaXMgbm90IHNldAoKIwojIE1pY3Jvc29mdCBIeXBlci1WIGd1ZXN0IHN1cHBvcnQKIwojIGVu
ZCBvZiBNaWNyb3NvZnQgSHlwZXItViBndWVzdCBzdXBwb3J0CgojIENPTkZJR19HUkVZQlVTIGlz
IG5vdCBzZXQKIyBDT05GSUdfQ09NRURJIGlzIG5vdCBzZXQKIyBDT05GSUdfU1RBR0lORyBpcyBu
b3Qgc2V0CiMgQ09ORklHX0dPTERGSVNIIGlzIG5vdCBzZXQKQ09ORklHX0hBVkVfQ0xLPXkKQ09O
RklHX0hBVkVfQ0xLX1BSRVBBUkU9eQpDT05GSUdfQ09NTU9OX0NMSz15CiMgQ09ORklHX0NPTU1P
Tl9DTEtfTUFYOTQ4NSBpcyBub3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9DTEtfU0k1MzQxIGlzIG5v
dCBzZXQKIyBDT05GSUdfQ09NTU9OX0NMS19TSTUzNTEgaXMgbm90IHNldAojIENPTkZJR19DT01N
T05fQ0xLX1NJNTE0IGlzIG5vdCBzZXQKIyBDT05GSUdfQ09NTU9OX0NMS19TSTU0NCBpcyBub3Qg
c2V0CiMgQ09ORklHX0NPTU1PTl9DTEtfU0k1NzAgaXMgbm90IHNldAojIENPTkZJR19DT01NT05f
Q0xLX0NEQ0U3MDYgaXMgbm90IHNldAojIENPTkZJR19DT01NT05fQ0xLX0NEQ0U5MjUgaXMgbm90
IHNldAojIENPTkZJR19DT01NT05fQ0xLX0NTMjAwMF9DUCBpcyBub3Qgc2V0CiMgQ09ORklHX0NP
TU1PTl9DTEtfQVhJX0NMS0dFTiBpcyBub3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9DTEtfUlM5X1BD
SUUgaXMgbm90IHNldAojIENPTkZJR19DT01NT05fQ0xLX1NJNTIxWFggaXMgbm90IHNldAojIENP
TkZJR19DT01NT05fQ0xLX1ZDMyBpcyBub3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9DTEtfVkM1IGlz
IG5vdCBzZXQKIyBDT05GSUdfQ09NTU9OX0NMS19WQzcgaXMgbm90IHNldAojIENPTkZJR19DT01N
T05fQ0xLX0ZJWEVEX01NSU8gaXMgbm90IHNldAojIENPTkZJR19YSUxJTlhfVkNVIGlzIG5vdCBz
ZXQKIyBDT05GSUdfQ09NTU9OX0NMS19YTE5YX0NMS1daUkQgaXMgbm90IHNldApDT05GSUdfQ0xL
X0tVTklUX1RFU1Q9bQpDT05GSUdfQ0xLX0dBVEVfS1VOSVRfVEVTVD1tCkNPTkZJR19DTEtfRkRf
S1VOSVRfVEVTVD1tCiMgQ09ORklHX0hXU1BJTkxPQ0sgaXMgbm90IHNldAoKIwojIENsb2NrIFNv
dXJjZSBkcml2ZXJzCiMKIyBlbmQgb2YgQ2xvY2sgU291cmNlIGRyaXZlcnMKCiMgQ09ORklHX01B
SUxCT1ggaXMgbm90IHNldApDT05GSUdfSU9NTVVfQVBJPXkKQ09ORklHX0lPTU1VX1NVUFBPUlQ9
eQoKIwojIEdlbmVyaWMgSU9NTVUgUGFnZXRhYmxlIFN1cHBvcnQKIwojIGVuZCBvZiBHZW5lcmlj
IElPTU1VIFBhZ2V0YWJsZSBTdXBwb3J0CgojIENPTkZJR19JT01NVV9ERUJVR0ZTIGlzIG5vdCBz
ZXQKQ09ORklHX0lPTU1VX0RFRkFVTFRfRE1BX1NUUklDVD15CiMgQ09ORklHX0lPTU1VX0RFRkFV
TFRfRE1BX0xBWlkgaXMgbm90IHNldAojIENPTkZJR19JT01NVV9ERUZBVUxUX1BBU1NUSFJPVUdI
IGlzIG5vdCBzZXQKQ09ORklHX09GX0lPTU1VPXkKIyBDT05GSUdfSU9NTVVGRCBpcyBub3Qgc2V0
CkNPTkZJR19TUEFQUl9UQ0VfSU9NTVU9eQoKIwojIFJlbW90ZXByb2MgZHJpdmVycwojCiMgQ09O
RklHX1JFTU9URVBST0MgaXMgbm90IHNldAojIGVuZCBvZiBSZW1vdGVwcm9jIGRyaXZlcnMKCiMK
IyBScG1zZyBkcml2ZXJzCiMKIyBDT05GSUdfUlBNU0dfVklSVElPIGlzIG5vdCBzZXQKIyBlbmQg
b2YgUnBtc2cgZHJpdmVycwoKIyBDT05GSUdfU09VTkRXSVJFIGlzIG5vdCBzZXQKCiMKIyBTT0Mg
KFN5c3RlbSBPbiBDaGlwKSBzcGVjaWZpYyBEcml2ZXJzCiMKCiMKIyBBbWxvZ2ljIFNvQyBkcml2
ZXJzCiMKIyBlbmQgb2YgQW1sb2dpYyBTb0MgZHJpdmVycwoKIwojIEJyb2FkY29tIFNvQyBkcml2
ZXJzCiMKIyBlbmQgb2YgQnJvYWRjb20gU29DIGRyaXZlcnMKCiMKIyBOWFAvRnJlZXNjYWxlIFFv
cklRIFNvQyBkcml2ZXJzCiMKIyBDT05GSUdfUVVJQ0NfRU5HSU5FIGlzIG5vdCBzZXQKIyBlbmQg
b2YgTlhQL0ZyZWVzY2FsZSBRb3JJUSBTb0MgZHJpdmVycwoKIwojIGZ1aml0c3UgU29DIGRyaXZl
cnMKIwojIGVuZCBvZiBmdWppdHN1IFNvQyBkcml2ZXJzCgojCiMgaS5NWCBTb0MgZHJpdmVycwoj
CiMgZW5kIG9mIGkuTVggU29DIGRyaXZlcnMKCiMKIyBFbmFibGUgTGl0ZVggU29DIEJ1aWxkZXIg
c3BlY2lmaWMgZHJpdmVycwojCiMgQ09ORklHX0xJVEVYX1NPQ19DT05UUk9MTEVSIGlzIG5vdCBz
ZXQKIyBlbmQgb2YgRW5hYmxlIExpdGVYIFNvQyBCdWlsZGVyIHNwZWNpZmljIGRyaXZlcnMKCiMg
Q09ORklHX1dQQ000NTBfU09DIGlzIG5vdCBzZXQKCiMKIyBRdWFsY29tbSBTb0MgZHJpdmVycwoj
CiMgZW5kIG9mIFF1YWxjb21tIFNvQyBkcml2ZXJzCgojIENPTkZJR19TT0NfVEkgaXMgbm90IHNl
dAoKIwojIFhpbGlueCBTb0MgZHJpdmVycwojCiMgZW5kIG9mIFhpbGlueCBTb0MgZHJpdmVycwoj
IGVuZCBvZiBTT0MgKFN5c3RlbSBPbiBDaGlwKSBzcGVjaWZpYyBEcml2ZXJzCgojCiMgUE0gRG9t
YWlucwojCgojCiMgQW1sb2dpYyBQTSBEb21haW5zCiMKIyBlbmQgb2YgQW1sb2dpYyBQTSBEb21h
aW5zCgojCiMgQnJvYWRjb20gUE0gRG9tYWlucwojCiMgZW5kIG9mIEJyb2FkY29tIFBNIERvbWFp
bnMKCiMKIyBpLk1YIFBNIERvbWFpbnMKIwojIGVuZCBvZiBpLk1YIFBNIERvbWFpbnMKCiMKIyBR
dWFsY29tbSBQTSBEb21haW5zCiMKIyBlbmQgb2YgUXVhbGNvbW0gUE0gRG9tYWlucwojIGVuZCBv
ZiBQTSBEb21haW5zCgojIENPTkZJR19QTV9ERVZGUkVRIGlzIG5vdCBzZXQKIyBDT05GSUdfRVhU
Q09OIGlzIG5vdCBzZXQKIyBDT05GSUdfTUVNT1JZIGlzIG5vdCBzZXQKIyBDT05GSUdfSUlPIGlz
IG5vdCBzZXQKIyBDT05GSUdfTlRCIGlzIG5vdCBzZXQKIyBDT05GSUdfUFdNIGlzIG5vdCBzZXQK
CiMKIyBJUlEgY2hpcCBzdXBwb3J0CiMKQ09ORklHX0lSUUNISVA9eQojIENPTkZJR19BTF9GSUMg
aXMgbm90IHNldAojIENPTkZJR19YSUxJTlhfSU5UQyBpcyBub3Qgc2V0CiMgZW5kIG9mIElSUSBj
aGlwIHN1cHBvcnQKCiMgQ09ORklHX0lQQUNLX0JVUyBpcyBub3Qgc2V0CiMgQ09ORklHX1JFU0VU
X0NPTlRST0xMRVIgaXMgbm90IHNldAoKIwojIFBIWSBTdWJzeXN0ZW0KIwojIENPTkZJR19HRU5F
UklDX1BIWSBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9DQU5fVFJBTlNDRUlWRVIgaXMgbm90IHNl
dAoKIwojIFBIWSBkcml2ZXJzIGZvciBCcm9hZGNvbSBwbGF0Zm9ybXMKIwojIENPTkZJR19CQ01f
S09OQV9VU0IyX1BIWSBpcyBub3Qgc2V0CiMgZW5kIG9mIFBIWSBkcml2ZXJzIGZvciBCcm9hZGNv
bSBwbGF0Zm9ybXMKCiMgQ09ORklHX1BIWV9DQURFTkNFX1RPUlJFTlQgaXMgbm90IHNldAojIENP
TkZJR19QSFlfQ0FERU5DRV9EUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX0NBREVOQ0VfRFBI
WV9SWCBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9DQURFTkNFX1NBTFZPIGlzIG5vdCBzZXQKIyBD
T05GSUdfUEhZX1BYQV8yOE5NX0hTSUMgaXMgbm90IHNldAojIENPTkZJR19QSFlfUFhBXzI4Tk1f
VVNCMiBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9NQVBQSE9ORV9NRE02NjAwIGlzIG5vdCBzZXQK
IyBlbmQgb2YgUEhZIFN1YnN5c3RlbQoKIyBDT05GSUdfUE9XRVJDQVAgaXMgbm90IHNldAojIENP
TkZJR19NQ0IgaXMgbm90IHNldAoKIwojIFBlcmZvcm1hbmNlIG1vbml0b3Igc3VwcG9ydAojCiMg
ZW5kIG9mIFBlcmZvcm1hbmNlIG1vbml0b3Igc3VwcG9ydAoKQ09ORklHX1JBUz15CiMgQ09ORklH
X1VTQjQgaXMgbm90IHNldAoKIwojIEFuZHJvaWQKIwojIENPTkZJR19BTkRST0lEX0JJTkRFUl9J
UEMgaXMgbm90IHNldAojIGVuZCBvZiBBbmRyb2lkCgojIENPTkZJR19MSUJOVkRJTU0gaXMgbm90
IHNldAojIENPTkZJR19EQVggaXMgbm90IHNldApDT05GSUdfTlZNRU09eQpDT05GSUdfTlZNRU1f
U1lTRlM9eQoKIwojIExheW91dCBUeXBlcwojCiMgQ09ORklHX05WTUVNX0xBWU9VVF9TTDI4X1ZQ
RCBpcyBub3Qgc2V0CiMgQ09ORklHX05WTUVNX0xBWU9VVF9PTklFX1RMViBpcyBub3Qgc2V0CiMg
ZW5kIG9mIExheW91dCBUeXBlcwoKIyBDT05GSUdfTlZNRU1fUk1FTSBpcyBub3Qgc2V0CkNPTkZJ
R19OVk1FTV9VX0JPT1RfRU5WPW0KCiMKIyBIVyB0cmFjaW5nIHN1cHBvcnQKIwojIENPTkZJR19T
VE0gaXMgbm90IHNldAojIENPTkZJR19JTlRFTF9USCBpcyBub3Qgc2V0CiMgZW5kIG9mIEhXIHRy
YWNpbmcgc3VwcG9ydAoKIyBDT05GSUdfRlBHQSBpcyBub3Qgc2V0CiMgQ09ORklHX0ZTSSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NJT1ggaXMgbm90IHNldAojIENPTkZJR19TTElNQlVTIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSU5URVJDT05ORUNUIGlzIG5vdCBzZXQKIyBDT05GSUdfQ09VTlRFUiBpcyBu
b3Qgc2V0CiMgQ09ORklHX01PU1QgaXMgbm90IHNldAojIENPTkZJR19QRUNJIGlzIG5vdCBzZXQK
IyBDT05GSUdfSFRFIGlzIG5vdCBzZXQKIyBlbmQgb2YgRGV2aWNlIERyaXZlcnMKCiMKIyBGaWxl
IHN5c3RlbXMKIwpDT05GSUdfVkFMSURBVEVfRlNfUEFSU0VSPXkKQ09ORklHX0ZTX0lPTUFQPXkK
Q09ORklHX0JVRkZFUl9IRUFEPXkKQ09ORklHX0xFR0FDWV9ESVJFQ1RfSU89eQojIENPTkZJR19F
WFQyX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfRVhUM19GUyBpcyBub3Qgc2V0CkNPTkZJR19FWFQ0
X0ZTPXkKQ09ORklHX0VYVDRfVVNFX0ZPUl9FWFQyPXkKQ09ORklHX0VYVDRfRlNfUE9TSVhfQUNM
PXkKIyBDT05GSUdfRVhUNF9GU19TRUNVUklUWSBpcyBub3Qgc2V0CiMgQ09ORklHX0VYVDRfREVC
VUcgaXMgbm90IHNldAojIENPTkZJR19FWFQ0X0tVTklUX1RFU1RTIGlzIG5vdCBzZXQKQ09ORklH
X0pCRDI9eQojIENPTkZJR19KQkQyX0RFQlVHIGlzIG5vdCBzZXQKQ09ORklHX0ZTX01CQ0FDSEU9
eQojIENPTkZJR19SRUlTRVJGU19GUyBpcyBub3Qgc2V0CiMgQ09ORklHX0pGU19GUyBpcyBub3Qg
c2V0CiMgQ09ORklHX1hGU19GUyBpcyBub3Qgc2V0CiMgQ09ORklHX0dGUzJfRlMgaXMgbm90IHNl
dAojIENPTkZJR19PQ0ZTMl9GUyBpcyBub3Qgc2V0CkNPTkZJR19CVFJGU19GUz15CkNPTkZJR19C
VFJGU19GU19QT1NJWF9BQ0w9eQojIENPTkZJR19CVFJGU19GU19SVU5fU0FOSVRZX1RFU1RTIGlz
IG5vdCBzZXQKIyBDT05GSUdfQlRSRlNfREVCVUcgaXMgbm90IHNldAojIENPTkZJR19CVFJGU19B
U1NFUlQgaXMgbm90IHNldAojIENPTkZJR19CVFJGU19GU19SRUZfVkVSSUZZIGlzIG5vdCBzZXQK
IyBDT05GSUdfTklMRlMyX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfRjJGU19GUyBpcyBub3Qgc2V0
CkNPTkZJR19CQ0FDSEVGU19GUz1tCiMgQ09ORklHX0JDQUNIRUZTX1FVT1RBIGlzIG5vdCBzZXQK
IyBDT05GSUdfQkNBQ0hFRlNfRVJBU1VSRV9DT0RJTkcgaXMgbm90IHNldApDT05GSUdfQkNBQ0hF
RlNfUE9TSVhfQUNMPXkKQ09ORklHX0JDQUNIRUZTX0RFQlVHX1RSQU5TQUNUSU9OUz15CiMgQ09O
RklHX0JDQUNIRUZTX0RFQlVHIGlzIG5vdCBzZXQKQ09ORklHX0JDQUNIRUZTX1RFU1RTPXkKIyBD
T05GSUdfQkNBQ0hFRlNfTE9DS19USU1FX1NUQVRTIGlzIG5vdCBzZXQKIyBDT05GSUdfQkNBQ0hF
RlNfTk9fTEFURU5DWV9BQ0NUIGlzIG5vdCBzZXQKIyBDT05GSUdfTUVBTl9BTkRfVkFSSUFOQ0Vf
VU5JVF9URVNUIGlzIG5vdCBzZXQKQ09ORklHX0ZTX1BPU0lYX0FDTD15CkNPTkZJR19FWFBPUlRG
Uz15CkNPTkZJR19FWFBPUlRGU19CTE9DS19PUFM9eQpDT05GSUdfRklMRV9MT0NLSU5HPXkKIyBD
T05GSUdfRlNfRU5DUllQVElPTiBpcyBub3Qgc2V0CiMgQ09ORklHX0ZTX1ZFUklUWSBpcyBub3Qg
c2V0CkNPTkZJR19GU05PVElGWT15CkNPTkZJR19ETk9USUZZPXkKQ09ORklHX0lOT1RJRllfVVNF
Uj15CkNPTkZJR19GQU5PVElGWT15CiMgQ09ORklHX0ZBTk9USUZZX0FDQ0VTU19QRVJNSVNTSU9O
UyBpcyBub3Qgc2V0CiMgQ09ORklHX1FVT1RBIGlzIG5vdCBzZXQKQ09ORklHX0FVVE9GU19GUz15
CkNPTkZJR19GVVNFX0ZTPXkKIyBDT05GSUdfQ1VTRSBpcyBub3Qgc2V0CkNPTkZJR19WSVJUSU9f
RlM9eQojIENPTkZJR19PVkVSTEFZX0ZTIGlzIG5vdCBzZXQKCiMKIyBDYWNoZXMKIwpDT05GSUdf
TkVURlNfU1VQUE9SVD15CiMgQ09ORklHX05FVEZTX1NUQVRTIGlzIG5vdCBzZXQKIyBDT05GSUdf
RlNDQUNIRSBpcyBub3Qgc2V0CiMgZW5kIG9mIENhY2hlcwoKIwojIENELVJPTS9EVkQgRmlsZXN5
c3RlbXMKIwpDT05GSUdfSVNPOTY2MF9GUz15CkNPTkZJR19KT0xJRVQ9eQpDT05GSUdfWklTT0ZT
PXkKQ09ORklHX1VERl9GUz1tCiMgZW5kIG9mIENELVJPTS9EVkQgRmlsZXN5c3RlbXMKCiMKIyBE
T1MvRkFUL0VYRkFUL05UIEZpbGVzeXN0ZW1zCiMKQ09ORklHX0ZBVF9GUz1tCkNPTkZJR19NU0RP
U19GUz1tCkNPTkZJR19WRkFUX0ZTPW0KQ09ORklHX0ZBVF9ERUZBVUxUX0NPREVQQUdFPTQzNwpD
T05GSUdfRkFUX0RFRkFVTFRfSU9DSEFSU0VUPSJpc284ODU5LTE1IgpDT05GSUdfRkFUX0RFRkFV
TFRfVVRGOD15CkNPTkZJR19GQVRfS1VOSVRfVEVTVD1tCkNPTkZJR19FWEZBVF9GUz1tCkNPTkZJ
R19FWEZBVF9ERUZBVUxUX0lPQ0hBUlNFVD0idXRmOCIKIyBDT05GSUdfTlRGU19GUyBpcyBub3Qg
c2V0CkNPTkZJR19OVEZTM19GUz1tCiMgQ09ORklHX05URlMzXzY0QklUX0NMVVNURVIgaXMgbm90
IHNldApDT05GSUdfTlRGUzNfTFpYX1hQUkVTUz15CiMgQ09ORklHX05URlMzX0ZTX1BPU0lYX0FD
TCBpcyBub3Qgc2V0CiMgZW5kIG9mIERPUy9GQVQvRVhGQVQvTlQgRmlsZXN5c3RlbXMKCiMKIyBQ
c2V1ZG8gZmlsZXN5c3RlbXMKIwpDT05GSUdfUFJPQ19GUz15CiMgQ09ORklHX1BST0NfS0NPUkUg
aXMgbm90IHNldApDT05GSUdfUFJPQ19TWVNDVEw9eQpDT05GSUdfUFJPQ19QQUdFX01PTklUT1I9
eQojIENPTkZJR19QUk9DX0NISUxEUkVOIGlzIG5vdCBzZXQKQ09ORklHX0tFUk5GUz15CkNPTkZJ
R19TWVNGUz15CkNPTkZJR19UTVBGUz15CkNPTkZJR19UTVBGU19QT1NJWF9BQ0w9eQpDT05GSUdf
VE1QRlNfWEFUVFI9eQojIENPTkZJR19UTVBGU19JTk9ERTY0IGlzIG5vdCBzZXQKIyBDT05GSUdf
VE1QRlNfUVVPVEEgaXMgbm90IHNldApDT05GSUdfQVJDSF9TVVBQT1JUU19IVUdFVExCRlM9eQpD
T05GSUdfSFVHRVRMQkZTPXkKQ09ORklHX0hVR0VUTEJfUEFHRT15CkNPTkZJR19BUkNIX0hBU19H
SUdBTlRJQ19QQUdFPXkKQ09ORklHX0NPTkZJR0ZTX0ZTPW0KIyBlbmQgb2YgUHNldWRvIGZpbGVz
eXN0ZW1zCgpDT05GSUdfTUlTQ19GSUxFU1lTVEVNUz15CiMgQ09ORklHX09SQU5HRUZTX0ZTIGlz
IG5vdCBzZXQKIyBDT05GSUdfQURGU19GUyBpcyBub3Qgc2V0CkNPTkZJR19BRkZTX0ZTPW0KIyBD
T05GSUdfRUNSWVBUX0ZTIGlzIG5vdCBzZXQKQ09ORklHX0hGU19GUz1tCkNPTkZJR19IRlNQTFVT
X0ZTPW0KQ09ORklHX0JFRlNfRlM9bQpDT05GSUdfQkVGU19ERUJVRz15CiMgQ09ORklHX0JGU19G
UyBpcyBub3Qgc2V0CiMgQ09ORklHX0VGU19GUyBpcyBub3Qgc2V0CkNPTkZJR19KRkZTMl9GUz1t
CkNPTkZJR19KRkZTMl9GU19ERUJVRz0wCkNPTkZJR19KRkZTMl9GU19XUklURUJVRkZFUj15CkNP
TkZJR19KRkZTMl9GU19XQlVGX1ZFUklGWT15CiMgQ09ORklHX0pGRlMyX1NVTU1BUlkgaXMgbm90
IHNldAojIENPTkZJR19KRkZTMl9GU19YQVRUUiBpcyBub3Qgc2V0CiMgQ09ORklHX0pGRlMyX0NP
TVBSRVNTSU9OX09QVElPTlMgaXMgbm90IHNldApDT05GSUdfSkZGUzJfWkxJQj15CkNPTkZJR19K
RkZTMl9SVElNRT15CiMgQ09ORklHX0NSQU1GUyBpcyBub3Qgc2V0CkNPTkZJR19TUVVBU0hGUz1t
CkNPTkZJR19TUVVBU0hGU19GSUxFX0NBQ0hFPXkKIyBDT05GSUdfU1FVQVNIRlNfRklMRV9ESVJF
Q1QgaXMgbm90IHNldApDT05GSUdfU1FVQVNIRlNfREVDT01QX1NJTkdMRT15CkNPTkZJR19TUVVB
U0hGU19ERUNPTVBfTVVMVEk9eQpDT05GSUdfU1FVQVNIRlNfREVDT01QX01VTFRJX1BFUkNQVT15
CkNPTkZJR19TUVVBU0hGU19DSE9JQ0VfREVDT01QX0JZX01PVU5UPXkKQ09ORklHX1NRVUFTSEZT
X01PVU5UX0RFQ09NUF9USFJFQURTPXkKIyBDT05GSUdfU1FVQVNIRlNfWEFUVFIgaXMgbm90IHNl
dApDT05GSUdfU1FVQVNIRlNfWkxJQj15CiMgQ09ORklHX1NRVUFTSEZTX0xaNCBpcyBub3Qgc2V0
CiMgQ09ORklHX1NRVUFTSEZTX0xaTyBpcyBub3Qgc2V0CiMgQ09ORklHX1NRVUFTSEZTX1haIGlz
IG5vdCBzZXQKQ09ORklHX1NRVUFTSEZTX1pTVEQ9eQojIENPTkZJR19TUVVBU0hGU180S19ERVZC
TEtfU0laRSBpcyBub3Qgc2V0CiMgQ09ORklHX1NRVUFTSEZTX0VNQkVEREVEIGlzIG5vdCBzZXQK
Q09ORklHX1NRVUFTSEZTX0ZSQUdNRU5UX0NBQ0hFX1NJWkU9MwojIENPTkZJR19WWEZTX0ZTIGlz
IG5vdCBzZXQKIyBDT05GSUdfTUlOSVhfRlMgaXMgbm90IHNldAojIENPTkZJR19PTUZTX0ZTIGlz
IG5vdCBzZXQKIyBDT05GSUdfSFBGU19GUyBpcyBub3Qgc2V0CiMgQ09ORklHX1FOWDRGU19GUyBp
cyBub3Qgc2V0CiMgQ09ORklHX1FOWDZGU19GUyBpcyBub3Qgc2V0CiMgQ09ORklHX1JPTUZTX0ZT
IGlzIG5vdCBzZXQKQ09ORklHX1BTVE9SRT1tCkNPTkZJR19QU1RPUkVfREVGQVVMVF9LTVNHX0JZ
VEVTPTEwMjQwCkNPTkZJR19QU1RPUkVfQ09NUFJFU1M9eQojIENPTkZJR19QU1RPUkVfQ09OU09M
RSBpcyBub3Qgc2V0CiMgQ09ORklHX1BTVE9SRV9QTVNHIGlzIG5vdCBzZXQKIyBDT05GSUdfUFNU
T1JFX1JBTSBpcyBub3Qgc2V0CiMgQ09ORklHX1BTVE9SRV9CTEsgaXMgbm90IHNldAojIENPTkZJ
R19TWVNWX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfVUZTX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdf
RVJPRlNfRlMgaXMgbm90IHNldApDT05GSUdfTkVUV09SS19GSUxFU1lTVEVNUz15CkNPTkZJR19O
RlNfRlM9bQojIENPTkZJR19ORlNfVjIgaXMgbm90IHNldAojIENPTkZJR19ORlNfVjMgaXMgbm90
IHNldApDT05GSUdfTkZTX1Y0PW0KIyBDT05GSUdfTkZTX1NXQVAgaXMgbm90IHNldApDT05GSUdf
TkZTX1Y0XzE9eQpDT05GSUdfTkZTX1Y0XzI9eQpDT05GSUdfUE5GU19GSUxFX0xBWU9VVD1tCkNP
TkZJR19QTkZTX0JMT0NLPW0KQ09ORklHX1BORlNfRkxFWEZJTEVfTEFZT1VUPW0KQ09ORklHX05G
U19WNF8xX0lNUExFTUVOVEFUSU9OX0lEX0RPTUFJTj0ia2VybmVsLm9yZyIKIyBDT05GSUdfTkZT
X1Y0XzFfTUlHUkFUSU9OIGlzIG5vdCBzZXQKQ09ORklHX05GU19WNF9TRUNVUklUWV9MQUJFTD15
CiMgQ09ORklHX05GU19VU0VfTEVHQUNZX0ROUyBpcyBub3Qgc2V0CkNPTkZJR19ORlNfVVNFX0tF
Uk5FTF9ETlM9eQpDT05GSUdfTkZTX0RFQlVHPXkKQ09ORklHX05GU19ESVNBQkxFX1VEUF9TVVBQ
T1JUPXkKIyBDT05GSUdfTkZTX1Y0XzJfUkVBRF9QTFVTIGlzIG5vdCBzZXQKQ09ORklHX05GU0Q9
bQojIENPTkZJR19ORlNEX1YyIGlzIG5vdCBzZXQKIyBDT05GSUdfTkZTRF9WM19BQ0wgaXMgbm90
IHNldApDT05GSUdfTkZTRF9WND15CkNPTkZJR19ORlNEX1BORlM9eQpDT05GSUdfTkZTRF9CTE9D
S0xBWU9VVD15CkNPTkZJR19ORlNEX1NDU0lMQVlPVVQ9eQojIENPTkZJR19ORlNEX0ZMRVhGSUxF
TEFZT1VUIGlzIG5vdCBzZXQKQ09ORklHX05GU0RfVjRfMl9JTlRFUl9TU0M9eQojIENPTkZJR19O
RlNEX1Y0X1NFQ1VSSVRZX0xBQkVMIGlzIG5vdCBzZXQKQ09ORklHX0dSQUNFX1BFUklPRD1tCkNP
TkZJR19MT0NLRD1tCkNPTkZJR19MT0NLRF9WND15CkNPTkZJR19ORlNfQ09NTU9OPXkKQ09ORklH
X05GU19WNF8yX1NTQ19IRUxQRVI9eQpDT05GSUdfU1VOUlBDPW0KQ09ORklHX1NVTlJQQ19HU1M9
bQpDT05GSUdfU1VOUlBDX0JBQ0tDSEFOTkVMPXkKQ09ORklHX1JQQ1NFQ19HU1NfS1JCNT1tCiMg
Q09ORklHX1JQQ1NFQ19HU1NfS1JCNV9LVU5JVF9URVNUIGlzIG5vdCBzZXQKQ09ORklHX1NVTlJQ
Q19ERUJVRz15CiMgQ09ORklHX0NFUEhfRlMgaXMgbm90IHNldApDT05GSUdfQ0lGUz1tCkNPTkZJ
R19DSUZTX1NUQVRTMj15CkNPTkZJR19DSUZTX0FMTE9XX0lOU0VDVVJFX0xFR0FDWT15CiMgQ09O
RklHX0NJRlNfVVBDQUxMIGlzIG5vdCBzZXQKQ09ORklHX0NJRlNfWEFUVFI9eQpDT05GSUdfQ0lG
U19QT1NJWD15CkNPTkZJR19DSUZTX0RFQlVHPXkKIyBDT05GSUdfQ0lGU19ERUJVRzIgaXMgbm90
IHNldAojIENPTkZJR19DSUZTX0RFQlVHX0RVTVBfS0VZUyBpcyBub3Qgc2V0CkNPTkZJR19DSUZT
X0RGU19VUENBTEw9eQpDT05GSUdfQ0lGU19TV05fVVBDQUxMPXkKIyBDT05GSUdfU01CX1NFUlZF
UiBpcyBub3Qgc2V0CkNPTkZJR19TTUJGUz1tCiMgQ09ORklHX0NPREFfRlMgaXMgbm90IHNldAoj
IENPTkZJR19BRlNfRlMgaXMgbm90IHNldApDT05GSUdfOVBfRlM9eQpDT05GSUdfOVBfRlNfUE9T
SVhfQUNMPXkKIyBDT05GSUdfOVBfRlNfU0VDVVJJVFkgaXMgbm90IHNldApDT05GSUdfTkxTPXkK
Q09ORklHX05MU19ERUZBVUxUPSJ1dGY4IgpDT05GSUdfTkxTX0NPREVQQUdFXzQzNz1tCiMgQ09O
RklHX05MU19DT0RFUEFHRV83MzcgaXMgbm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfNzc1
IGlzIG5vdCBzZXQKQ09ORklHX05MU19DT0RFUEFHRV84NTA9bQojIENPTkZJR19OTFNfQ09ERVBB
R0VfODUyIGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0NPREVQQUdFXzg1NSBpcyBub3Qgc2V0CiMg
Q09ORklHX05MU19DT0RFUEFHRV84NTcgaXMgbm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0Vf
ODYwIGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0NPREVQQUdFXzg2MSBpcyBub3Qgc2V0CiMgQ09O
RklHX05MU19DT0RFUEFHRV84NjIgaXMgbm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfODYz
IGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0NPREVQQUdFXzg2NCBpcyBub3Qgc2V0CiMgQ09ORklH
X05MU19DT0RFUEFHRV84NjUgaXMgbm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfODY2IGlz
IG5vdCBzZXQKIyBDT05GSUdfTkxTX0NPREVQQUdFXzg2OSBpcyBub3Qgc2V0CiMgQ09ORklHX05M
U19DT0RFUEFHRV85MzYgaXMgbm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfOTUwIGlzIG5v
dCBzZXQKIyBDT05GSUdfTkxTX0NPREVQQUdFXzkzMiBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19D
T0RFUEFHRV85NDkgaXMgbm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfODc0IGlzIG5vdCBz
ZXQKIyBDT05GSUdfTkxTX0lTTzg4NTlfOCBpcyBub3Qgc2V0CkNPTkZJR19OTFNfQ09ERVBBR0Vf
MTI1MD1tCiMgQ09ORklHX05MU19DT0RFUEFHRV8xMjUxIGlzIG5vdCBzZXQKIyBDT05GSUdfTkxT
X0FTQ0lJIGlzIG5vdCBzZXQKQ09ORklHX05MU19JU084ODU5XzE9bQojIENPTkZJR19OTFNfSVNP
ODg1OV8yIGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0lTTzg4NTlfMyBpcyBub3Qgc2V0CiMgQ09O
RklHX05MU19JU084ODU5XzQgaXMgbm90IHNldAojIENPTkZJR19OTFNfSVNPODg1OV81IGlzIG5v
dCBzZXQKIyBDT05GSUdfTkxTX0lTTzg4NTlfNiBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19JU084
ODU5XzcgaXMgbm90IHNldAojIENPTkZJR19OTFNfSVNPODg1OV85IGlzIG5vdCBzZXQKIyBDT05G
SUdfTkxTX0lTTzg4NTlfMTMgaXMgbm90IHNldAojIENPTkZJR19OTFNfSVNPODg1OV8xNCBpcyBu
b3Qgc2V0CkNPTkZJR19OTFNfSVNPODg1OV8xNT1tCiMgQ09ORklHX05MU19LT0k4X1IgaXMgbm90
IHNldAojIENPTkZJR19OTFNfS09JOF9VIGlzIG5vdCBzZXQKQ09ORklHX05MU19NQUNfUk9NQU49
bQojIENPTkZJR19OTFNfTUFDX0NFTFRJQyBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19NQUNfQ0VO
VEVVUk8gaXMgbm90IHNldAojIENPTkZJR19OTFNfTUFDX0NST0FUSUFOIGlzIG5vdCBzZXQKIyBD
T05GSUdfTkxTX01BQ19DWVJJTExJQyBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19NQUNfR0FFTElD
IGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX01BQ19HUkVFSyBpcyBub3Qgc2V0CiMgQ09ORklHX05M
U19NQUNfSUNFTEFORCBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19NQUNfSU5VSVQgaXMgbm90IHNl
dAojIENPTkZJR19OTFNfTUFDX1JPTUFOSUFOIGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX01BQ19U
VVJLSVNIIGlzIG5vdCBzZXQKQ09ORklHX05MU19VVEY4PXkKQ09ORklHX05MU19VQ1MyX1VUSUxT
PW0KIyBDT05GSUdfRExNIGlzIG5vdCBzZXQKQ09ORklHX1VOSUNPREU9bQojIENPTkZJR19VTklD
T0RFX05PUk1BTElaQVRJT05fU0VMRlRFU1QgaXMgbm90IHNldApDT05GSUdfSU9fV1E9eQojIGVu
ZCBvZiBGaWxlIHN5c3RlbXMKCiMKIyBTZWN1cml0eSBvcHRpb25zCiMKQ09ORklHX0tFWVM9eQpD
T05GSUdfS0VZU19SRVFVRVNUX0NBQ0hFPXkKIyBDT05GSUdfUEVSU0lTVEVOVF9LRVlSSU5HUyBp
cyBub3Qgc2V0CiMgQ09ORklHX1RSVVNURURfS0VZUyBpcyBub3Qgc2V0CiMgQ09ORklHX0VOQ1JZ
UFRFRF9LRVlTIGlzIG5vdCBzZXQKQ09ORklHX0tFWV9ESF9PUEVSQVRJT05TPXkKQ09ORklHX0tF
WV9OT1RJRklDQVRJT05TPXkKIyBDT05GSUdfU0VDVVJJVFlfRE1FU0dfUkVTVFJJQ1QgaXMgbm90
IHNldApDT05GSUdfU0VDVVJJVFk9eQojIENPTkZJR19TRUNVUklUWUZTIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0VDVVJJVFlfTkVUV09SSyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFQ1VSSVRZX1BBVEgg
aXMgbm90IHNldApDT05GSUdfSEFSREVORURfVVNFUkNPUFk9eQpDT05GSUdfRk9SVElGWV9TT1VS
Q0U9eQojIENPTkZJR19TVEFUSUNfVVNFUk1PREVIRUxQRVIgaXMgbm90IHNldAojIENPTkZJR19T
RUNVUklUWV9TTUFDSyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFQ1VSSVRZX1RPTU9ZTyBpcyBub3Qg
c2V0CiMgQ09ORklHX1NFQ1VSSVRZX0FQUEFSTU9SIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VDVVJJ
VFlfTE9BRFBJTiBpcyBub3Qgc2V0CkNPTkZJR19TRUNVUklUWV9ZQU1BPXkKIyBDT05GSUdfU0VD
VVJJVFlfU0FGRVNFVElEIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VDVVJJVFlfTE9DS0RPV05fTFNN
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VDVVJJVFlfTEFORExPQ0sgaXMgbm90IHNldAojIENPTkZJ
R19JTlRFR1JJVFkgaXMgbm90IHNldApDT05GSUdfREVGQVVMVF9TRUNVUklUWV9EQUM9eQpDT05G
SUdfTFNNPSJ5YW1hLGxvYWRwaW4sc2FmZXNldGlkLGludGVncml0eSIKCiMKIyBLZXJuZWwgaGFy
ZGVuaW5nIG9wdGlvbnMKIwoKIwojIE1lbW9yeSBpbml0aWFsaXphdGlvbgojCkNPTkZJR19DQ19I
QVNfQVVUT19WQVJfSU5JVF9QQVRURVJOPXkKQ09ORklHX0NDX0hBU19BVVRPX1ZBUl9JTklUX1pF
Uk9fQkFSRT15CkNPTkZJR19DQ19IQVNfQVVUT19WQVJfSU5JVF9aRVJPPXkKIyBDT05GSUdfSU5J
VF9TVEFDS19OT05FIGlzIG5vdCBzZXQKQ09ORklHX0lOSVRfU1RBQ0tfQUxMX1BBVFRFUk49eQoj
IENPTkZJR19JTklUX1NUQUNLX0FMTF9aRVJPIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5JVF9PTl9B
TExPQ19ERUZBVUxUX09OIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5JVF9PTl9GUkVFX0RFRkFVTFRf
T04gaXMgbm90IHNldApDT05GSUdfQ0NfSEFTX1pFUk9fQ0FMTF9VU0VEX1JFR1M9eQpDT05GSUdf
WkVST19DQUxMX1VTRURfUkVHUz15CiMgZW5kIG9mIE1lbW9yeSBpbml0aWFsaXphdGlvbgoKIwoj
IEhhcmRlbmluZyBvZiBrZXJuZWwgZGF0YSBzdHJ1Y3R1cmVzCiMKQ09ORklHX0xJU1RfSEFSREVO
RUQ9eQpDT05GSUdfQlVHX09OX0RBVEFfQ09SUlVQVElPTj15CiMgZW5kIG9mIEhhcmRlbmluZyBv
ZiBrZXJuZWwgZGF0YSBzdHJ1Y3R1cmVzCgojIENPTkZJR19SQU5EU1RSVUNUX05PTkUgaXMgbm90
IHNldAojIENPTkZJR19SQU5EU1RSVUNUX0ZVTEwgaXMgbm90IHNldApDT05GSUdfUkFORFNUUlVD
VF9QRVJGT1JNQU5DRT15CkNPTkZJR19SQU5EU1RSVUNUPXkKQ09ORklHX0dDQ19QTFVHSU5fUkFO
RFNUUlVDVD15CiMgZW5kIG9mIEtlcm5lbCBoYXJkZW5pbmcgb3B0aW9ucwojIGVuZCBvZiBTZWN1
cml0eSBvcHRpb25zCgpDT05GSUdfWE9SX0JMT0NLUz15CkNPTkZJR19DUllQVE89eQoKIwojIENy
eXB0byBjb3JlIG9yIGhlbHBlcgojCkNPTkZJR19DUllQVE9fQUxHQVBJPXkKQ09ORklHX0NSWVBU
T19BTEdBUEkyPXkKQ09ORklHX0NSWVBUT19BRUFEPXkKQ09ORklHX0NSWVBUT19BRUFEMj15CkNP
TkZJR19DUllQVE9fU0lHMj15CkNPTkZJR19DUllQVE9fU0tDSVBIRVI9eQpDT05GSUdfQ1JZUFRP
X1NLQ0lQSEVSMj15CkNPTkZJR19DUllQVE9fSEFTSD15CkNPTkZJR19DUllQVE9fSEFTSDI9eQpD
T05GSUdfQ1JZUFRPX1JORz1tCkNPTkZJR19DUllQVE9fUk5HMj15CkNPTkZJR19DUllQVE9fUk5H
X0RFRkFVTFQ9bQpDT05GSUdfQ1JZUFRPX0FLQ0lQSEVSMj15CkNPTkZJR19DUllQVE9fQUtDSVBI
RVI9eQpDT05GSUdfQ1JZUFRPX0tQUDI9eQpDT05GSUdfQ1JZUFRPX0tQUD15CkNPTkZJR19DUllQ
VE9fQUNPTVAyPXkKQ09ORklHX0NSWVBUT19NQU5BR0VSPXkKQ09ORklHX0NSWVBUT19NQU5BR0VS
Mj15CkNPTkZJR19DUllQVE9fVVNFUj1tCiMgQ09ORklHX0NSWVBUT19NQU5BR0VSX0RJU0FCTEVf
VEVTVFMgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fTUFOQUdFUl9FWFRSQV9URVNUUyBpcyBu
b3Qgc2V0CkNPTkZJR19DUllQVE9fTlVMTD1tCkNPTkZJR19DUllQVE9fTlVMTDI9bQpDT05GSUdf
Q1JZUFRPX1BDUllQVD1tCkNPTkZJR19DUllQVE9fQ1JZUFREPW0KQ09ORklHX0NSWVBUT19BVVRI
RU5DPW0KIyBDT05GSUdfQ1JZUFRPX1RFU1QgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX0VOR0lO
RT15CiMgZW5kIG9mIENyeXB0byBjb3JlIG9yIGhlbHBlcgoKIwojIFB1YmxpYy1rZXkgY3J5cHRv
Z3JhcGh5CiMKQ09ORklHX0NSWVBUT19SU0E9eQpDT05GSUdfQ1JZUFRPX0RIPXkKIyBDT05GSUdf
Q1JZUFRPX0RIX1JGQzc5MTlfR1JPVVBTIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19FQ0M9bQpD
T05GSUdfQ1JZUFRPX0VDREg9bQojIENPTkZJR19DUllQVE9fRUNEU0EgaXMgbm90IHNldAojIENP
TkZJR19DUllQVE9fRUNSRFNBIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX1NNMiBpcyBub3Qg
c2V0CiMgQ09ORklHX0NSWVBUT19DVVJWRTI1NTE5IGlzIG5vdCBzZXQKIyBlbmQgb2YgUHVibGlj
LWtleSBjcnlwdG9ncmFwaHkKCiMKIyBCbG9jayBjaXBoZXJzCiMKQ09ORklHX0NSWVBUT19BRVM9
bQojIENPTkZJR19DUllQVE9fQUVTX1RJIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0FSSUEg
aXMgbm90IHNldAojIENPTkZJR19DUllQVE9fQkxPV0ZJU0ggaXMgbm90IHNldAojIENPTkZJR19D
UllQVE9fQ0FNRUxMSUEgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fQ0FTVDUgaXMgbm90IHNl
dAojIENPTkZJR19DUllQVE9fQ0FTVDYgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX0RFUz1tCiMg
Q09ORklHX0NSWVBUT19GQ1JZUFQgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fU0VSUEVOVCBp
cyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19TTTRfR0VORVJJQyBpcyBub3Qgc2V0CiMgQ09ORklH
X0NSWVBUT19UV09GSVNIIGlzIG5vdCBzZXQKIyBlbmQgb2YgQmxvY2sgY2lwaGVycwoKIwojIExl
bmd0aC1wcmVzZXJ2aW5nIGNpcGhlcnMgYW5kIG1vZGVzCiMKQ09ORklHX0NSWVBUT19BRElBTlRV
TT1tCkNPTkZJR19DUllQVE9fQ0hBQ0hBMjA9bQpDT05GSUdfQ1JZUFRPX0NCQz1tCiMgQ09ORklH
X0NSWVBUT19DRkIgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX0NUUj1tCiMgQ09ORklHX0NSWVBU
T19DVFMgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX0VDQj15CiMgQ09ORklHX0NSWVBUT19IQ1RS
MiBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19LRVlXUkFQIGlzIG5vdCBzZXQKIyBDT05GSUdf
Q1JZUFRPX0xSVyBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19PRkIgaXMgbm90IHNldAojIENP
TkZJR19DUllQVE9fUENCQyBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fWFRTPW0KQ09ORklHX0NS
WVBUT19OSFBPTFkxMzA1PW0KIyBlbmQgb2YgTGVuZ3RoLXByZXNlcnZpbmcgY2lwaGVycyBhbmQg
bW9kZXMKCiMKIyBBRUFEIChhdXRoZW50aWNhdGVkIGVuY3J5cHRpb24gd2l0aCBhc3NvY2lhdGVk
IGRhdGEpIGNpcGhlcnMKIwojIENPTkZJR19DUllQVE9fQUVHSVMxMjggaXMgbm90IHNldAojIENP
TkZJR19DUllQVE9fQ0hBQ0hBMjBQT0xZMTMwNSBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fQ0NN
PW0KQ09ORklHX0NSWVBUT19HQ009bQpDT05GSUdfQ1JZUFRPX0dFTklWPW0KQ09ORklHX0NSWVBU
T19TRVFJVj1tCkNPTkZJR19DUllQVE9fRUNIQUlOSVY9bQpDT05GSUdfQ1JZUFRPX0VTU0lWPW0K
IyBlbmQgb2YgQUVBRCAoYXV0aGVudGljYXRlZCBlbmNyeXB0aW9uIHdpdGggYXNzb2NpYXRlZCBk
YXRhKSBjaXBoZXJzCgojCiMgSGFzaGVzLCBkaWdlc3RzLCBhbmQgTUFDcwojCkNPTkZJR19DUllQ
VE9fQkxBS0UyQj15CkNPTkZJR19DUllQVE9fQ01BQz1tCkNPTkZJR19DUllQVE9fR0hBU0g9bQpD
T05GSUdfQ1JZUFRPX0hNQUM9eQpDT05GSUdfQ1JZUFRPX01END1tCkNPTkZJR19DUllQVE9fTUQ1
PW0KIyBDT05GSUdfQ1JZUFRPX01JQ0hBRUxfTUlDIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19Q
T0xZMTMwNT1tCiMgQ09ORklHX0NSWVBUT19STUQxNjAgaXMgbm90IHNldApDT05GSUdfQ1JZUFRP
X1NIQTE9bQpDT05GSUdfQ1JZUFRPX1NIQTI1Nj15CkNPTkZJR19DUllQVE9fU0hBNTEyPW0KQ09O
RklHX0NSWVBUT19TSEEzPW0KIyBDT05GSUdfQ1JZUFRPX1NNM19HRU5FUklDIGlzIG5vdCBzZXQK
IyBDT05GSUdfQ1JZUFRPX1NUUkVFQk9HIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX1ZNQUMg
aXMgbm90IHNldAojIENPTkZJR19DUllQVE9fV1A1MTIgaXMgbm90IHNldAojIENPTkZJR19DUllQ
VE9fWENCQyBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fWFhIQVNIPXkKIyBlbmQgb2YgSGFzaGVz
LCBkaWdlc3RzLCBhbmQgTUFDcwoKIwojIENSQ3MgKGN5Y2xpYyByZWR1bmRhbmN5IGNoZWNrcykK
IwpDT05GSUdfQ1JZUFRPX0NSQzMyQz15CiMgQ09ORklHX0NSWVBUT19DUkMzMiBpcyBub3Qgc2V0
CiMgQ09ORklHX0NSWVBUT19DUkNUMTBESUYgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fQ1JD
NjRfUk9DS1NPRlQgaXMgbm90IHNldAojIGVuZCBvZiBDUkNzIChjeWNsaWMgcmVkdW5kYW5jeSBj
aGVja3MpCgojCiMgQ29tcHJlc3Npb24KIwpDT05GSUdfQ1JZUFRPX0RFRkxBVEU9bQpDT05GSUdf
Q1JZUFRPX0xaTz15CiMgQ09ORklHX0NSWVBUT184NDIgaXMgbm90IHNldApDT05GSUdfQ1JZUFRP
X0xaND1tCiMgQ09ORklHX0NSWVBUT19MWjRIQyBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fWlNU
RD15CiMgZW5kIG9mIENvbXByZXNzaW9uCgojCiMgUmFuZG9tIG51bWJlciBnZW5lcmF0aW9uCiMK
IyBDT05GSUdfQ1JZUFRPX0FOU0lfQ1BSTkcgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX0RSQkdf
TUVOVT1tCkNPTkZJR19DUllQVE9fRFJCR19ITUFDPXkKQ09ORklHX0NSWVBUT19EUkJHX0hBU0g9
eQpDT05GSUdfQ1JZUFRPX0RSQkdfQ1RSPXkKQ09ORklHX0NSWVBUT19EUkJHPW0KQ09ORklHX0NS
WVBUT19KSVRURVJFTlRST1BZPW0KQ09ORklHX0NSWVBUT19KSVRURVJFTlRST1BZX01FTU9SWV9C
TE9DS1M9NjQKQ09ORklHX0NSWVBUT19KSVRURVJFTlRST1BZX01FTU9SWV9CTE9DS1NJWkU9MzIK
Q09ORklHX0NSWVBUT19KSVRURVJFTlRST1BZX09TUj0xCkNPTkZJR19DUllQVE9fS0RGODAwMTA4
X0NUUj15CiMgZW5kIG9mIFJhbmRvbSBudW1iZXIgZ2VuZXJhdGlvbgoKIwojIFVzZXJzcGFjZSBp
bnRlcmZhY2UKIwpDT05GSUdfQ1JZUFRPX1VTRVJfQVBJPXkKQ09ORklHX0NSWVBUT19VU0VSX0FQ
SV9IQVNIPXkKQ09ORklHX0NSWVBUT19VU0VSX0FQSV9TS0NJUEhFUj1tCkNPTkZJR19DUllQVE9f
VVNFUl9BUElfUk5HPW0KIyBDT05GSUdfQ1JZUFRPX1VTRVJfQVBJX1JOR19DQVZQIGlzIG5vdCBz
ZXQKQ09ORklHX0NSWVBUT19VU0VSX0FQSV9BRUFEPW0KIyBDT05GSUdfQ1JZUFRPX1VTRVJfQVBJ
X0VOQUJMRV9PQlNPTEVURSBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19TVEFUUyBpcyBub3Qg
c2V0CiMgZW5kIG9mIFVzZXJzcGFjZSBpbnRlcmZhY2UKCkNPTkZJR19DUllQVE9fSEFTSF9JTkZP
PXkKCiMKIyBBY2NlbGVyYXRlZCBDcnlwdG9ncmFwaGljIEFsZ29yaXRobXMgZm9yIENQVSAocG93
ZXJwYykKIwpDT05GSUdfQ1JZUFRPX0NSQzMyQ19WUE1TVU09eQpDT05GSUdfQ1JZUFRPX01ENV9Q
UEM9bQpDT05GSUdfQ1JZUFRPX1NIQTFfUFBDPW0KIyBlbmQgb2YgQWNjZWxlcmF0ZWQgQ3J5cHRv
Z3JhcGhpYyBBbGdvcml0aG1zIGZvciBDUFUgKHBvd2VycGMpCgpDT05GSUdfQ1JZUFRPX0hXPXkK
Q09ORklHX0NSWVBUT19ERVZfTlg9eQpDT05GSUdfQ1JZUFRPX0RFVl9OWF9FTkNSWVBUPW0KQ09O
RklHX0NSWVBUT19ERVZfTlhfQ09NUFJFU1M9eQojIENPTkZJR19DUllQVE9fREVWX0FUTUVMX0VD
QyBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19ERVZfQVRNRUxfU0hBMjA0QSBpcyBub3Qgc2V0
CiMgQ09ORklHX0NSWVBUT19ERVZfTklUUk9YX0NOTjU1WFggaXMgbm90IHNldApDT05GSUdfQ1JZ
UFRPX0RFVl9WTVg9eQpDT05GSUdfQ1JZUFRPX0RFVl9WTVhfRU5DUllQVD1tCkNPTkZJR19DUllQ
VE9fREVWX1ZJUlRJTz15CiMgQ09ORklHX0NSWVBUT19ERVZfU0FGRVhDRUwgaXMgbm90IHNldAoj
IENPTkZJR19DUllQVE9fREVWX0NDUkVFIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0RFVl9B
TUxPR0lDX0dYTCBpcyBub3Qgc2V0CkNPTkZJR19BU1lNTUVUUklDX0tFWV9UWVBFPXkKQ09ORklH
X0FTWU1NRVRSSUNfUFVCTElDX0tFWV9TVUJUWVBFPXkKQ09ORklHX1g1MDlfQ0VSVElGSUNBVEVf
UEFSU0VSPXkKQ09ORklHX1BLQ1M4X1BSSVZBVEVfS0VZX1BBUlNFUj1tCkNPTkZJR19QS0NTN19N
RVNTQUdFX1BBUlNFUj15CiMgQ09ORklHX1BLQ1M3X1RFU1RfS0VZIGlzIG5vdCBzZXQKIyBDT05G
SUdfU0lHTkVEX1BFX0ZJTEVfVkVSSUZJQ0FUSU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfRklQU19T
SUdOQVRVUkVfU0VMRlRFU1QgaXMgbm90IHNldAoKIwojIENlcnRpZmljYXRlcyBmb3Igc2lnbmF0
dXJlIGNoZWNraW5nCiMKQ09ORklHX1NZU1RFTV9UUlVTVEVEX0tFWVJJTkc9eQpDT05GSUdfU1lT
VEVNX1RSVVNURURfS0VZUz0iIgojIENPTkZJR19TWVNURU1fRVhUUkFfQ0VSVElGSUNBVEUgaXMg
bm90IHNldAojIENPTkZJR19TRUNPTkRBUllfVFJVU1RFRF9LRVlSSU5HIGlzIG5vdCBzZXQKIyBD
T05GSUdfU1lTVEVNX0JMQUNLTElTVF9LRVlSSU5HIGlzIG5vdCBzZXQKIyBlbmQgb2YgQ2VydGlm
aWNhdGVzIGZvciBzaWduYXR1cmUgY2hlY2tpbmcKCkNPTkZJR19CSU5BUllfUFJJTlRGPXkKCiMK
IyBMaWJyYXJ5IHJvdXRpbmVzCiMKQ09ORklHX1JBSUQ2X1BRPXkKQ09ORklHX1JBSUQ2X1BRX0JF
TkNITUFSSz15CkNPTkZJR19MSU5FQVJfUkFOR0VTPW0KIyBDT05GSUdfUEFDS0lORyBpcyBub3Qg
c2V0CkNPTkZJR19CSVRSRVZFUlNFPXkKQ09ORklHX0dFTkVSSUNfU1RSTkNQWV9GUk9NX1VTRVI9
eQpDT05GSUdfR0VORVJJQ19TVFJOTEVOX1VTRVI9eQpDT05GSUdfR0VORVJJQ19ORVRfVVRJTFM9
eQojIENPTkZJR19DT1JESUMgaXMgbm90IHNldApDT05GSUdfUFJJTUVfTlVNQkVSUz1tCkNPTkZJ
R19SQVRJT05BTD15CkNPTkZJR19HRU5FUklDX1BDSV9JT01BUD15CkNPTkZJR19HRU5FUklDX0lP
TUFQPXkKQ09ORklHX0FSQ0hfVVNFX0NNUFhDSEdfTE9DS1JFRj15CkNPTkZJR19BUkNIX0hBU19G
QVNUX01VTFRJUExJRVI9eQoKIwojIENyeXB0byBsaWJyYXJ5IHJvdXRpbmVzCiMKQ09ORklHX0NS
WVBUT19MSUJfVVRJTFM9eQpDT05GSUdfQ1JZUFRPX0xJQl9BRVM9bQpDT05GSUdfQ1JZUFRPX0xJ
Ql9BUkM0PW0KQ09ORklHX0NSWVBUT19MSUJfR0YxMjhNVUw9bQpDT05GSUdfQ1JZUFRPX0xJQl9C
TEFLRTJTX0dFTkVSSUM9eQpDT05GSUdfQ1JZUFRPX0xJQl9DSEFDSEFfR0VORVJJQz1tCkNPTkZJ
R19DUllQVE9fTElCX0NIQUNIQT1tCkNPTkZJR19DUllQVE9fTElCX0NVUlZFMjU1MTlfR0VORVJJ
Qz1tCkNPTkZJR19DUllQVE9fTElCX0NVUlZFMjU1MTk9bQpDT05GSUdfQ1JZUFRPX0xJQl9ERVM9
bQpDT05GSUdfQ1JZUFRPX0xJQl9QT0xZMTMwNV9SU0laRT0xCkNPTkZJR19DUllQVE9fTElCX1BP
TFkxMzA1X0dFTkVSSUM9bQpDT05GSUdfQ1JZUFRPX0xJQl9QT0xZMTMwNT1tCkNPTkZJR19DUllQ
VE9fTElCX0NIQUNIQTIwUE9MWTEzMDU9bQpDT05GSUdfQ1JZUFRPX0xJQl9TSEExPXkKQ09ORklH
X0NSWVBUT19MSUJfU0hBMjU2PXkKIyBlbmQgb2YgQ3J5cHRvIGxpYnJhcnkgcm91dGluZXMKCiMg
Q09ORklHX0NSQ19DQ0lUVCBpcyBub3Qgc2V0CkNPTkZJR19DUkMxNj15CiMgQ09ORklHX0NSQ19U
MTBESUYgaXMgbm90IHNldAojIENPTkZJR19DUkM2NF9ST0NLU09GVCBpcyBub3Qgc2V0CkNPTkZJ
R19DUkNfSVRVX1Q9bQpDT05GSUdfQ1JDMzI9eQojIENPTkZJR19DUkMzMl9TRUxGVEVTVCBpcyBu
b3Qgc2V0CkNPTkZJR19DUkMzMl9TTElDRUJZOD15CiMgQ09ORklHX0NSQzMyX1NMSUNFQlk0IGlz
IG5vdCBzZXQKIyBDT05GSUdfQ1JDMzJfU0FSV0FURSBpcyBub3Qgc2V0CiMgQ09ORklHX0NSQzMy
X0JJVCBpcyBub3Qgc2V0CkNPTkZJR19DUkM2ND1tCiMgQ09ORklHX0NSQzQgaXMgbm90IHNldAoj
IENPTkZJR19DUkM3IGlzIG5vdCBzZXQKQ09ORklHX0xJQkNSQzMyQz15CiMgQ09ORklHX0NSQzgg
aXMgbm90IHNldApDT05GSUdfWFhIQVNIPXkKIyBDT05GSUdfUkFORE9NMzJfU0VMRlRFU1QgaXMg
bm90IHNldApDT05GSUdfODQyX0RFQ09NUFJFU1M9eQpDT05GSUdfWkxJQl9JTkZMQVRFPXkKQ09O
RklHX1pMSUJfREVGTEFURT15CkNPTkZJR19MWk9fQ09NUFJFU1M9eQpDT05GSUdfTFpPX0RFQ09N
UFJFU1M9eQpDT05GSUdfTFo0X0NPTVBSRVNTPW0KQ09ORklHX0xaNEhDX0NPTVBSRVNTPW0KQ09O
RklHX0xaNF9ERUNPTVBSRVNTPW0KQ09ORklHX1pTVERfQ09NTU9OPXkKQ09ORklHX1pTVERfQ09N
UFJFU1M9eQpDT05GSUdfWlNURF9ERUNPTVBSRVNTPXkKIyBDT05GSUdfWFpfREVDIGlzIG5vdCBz
ZXQKQ09ORklHX0RFQ09NUFJFU1NfR1pJUD15CkNPTkZJR19ERUNPTVBSRVNTX1pTVEQ9eQpDT05G
SUdfR0VORVJJQ19BTExPQ0FUT1I9eQpDT05GSUdfSU5URVJWQUxfVFJFRT15CkNPTkZJR19YQVJS
QVlfTVVMVEk9eQpDT05GSUdfQVNTT0NJQVRJVkVfQVJSQVk9eQpDT05GSUdfQ0xPU1VSRVM9eQpD
T05GSUdfSEFTX0lPTUVNPXkKQ09ORklHX0hBU19JT1BPUlQ9eQpDT05GSUdfSEFTX0lPUE9SVF9N
QVA9eQpDT05GSUdfSEFTX0RNQT15CkNPTkZJR19ETUFfT1BTPXkKQ09ORklHX0RNQV9PUFNfQllQ
QVNTPXkKQ09ORklHX0FSQ0hfSEFTX0RNQV9NQVBfRElSRUNUPXkKQ09ORklHX05FRURfU0dfRE1B
X0xFTkdUSD15CkNPTkZJR19ORUVEX0RNQV9NQVBfU1RBVEU9eQpDT05GSUdfQVJDSF9ETUFfQURE
Ul9UXzY0QklUPXkKQ09ORklHX0RNQV9ERUNMQVJFX0NPSEVSRU5UPXkKQ09ORklHX0FSQ0hfRE1B
X0RFRkFVTFRfQ09IRVJFTlQ9eQpDT05GSUdfU1dJT1RMQj15CiMgQ09ORklHX1NXSU9UTEJfRFlO
QU1JQyBpcyBub3Qgc2V0CiMgQ09ORklHX0RNQV9SRVNUUklDVEVEX1BPT0wgaXMgbm90IHNldAoj
IENPTkZJR19ETUFfQVBJX0RFQlVHIGlzIG5vdCBzZXQKIyBDT05GSUdfRE1BX01BUF9CRU5DSE1B
UksgaXMgbm90IHNldApDT05GSUdfU0dMX0FMTE9DPXkKQ09ORklHX0lPTU1VX0hFTFBFUj15CiMg
Q09ORklHX0ZPUkNFX05SX0NQVVMgaXMgbm90IHNldApDT05GSUdfQ1BVX1JNQVA9eQpDT05GSUdf
RFFMPXkKQ09ORklHX0dMT0I9eQojIENPTkZJR19HTE9CX1NFTEZURVNUIGlzIG5vdCBzZXQKQ09O
RklHX05MQVRUUj15CkNPTkZJR19DTFpfVEFCPXkKIyBDT05GSUdfSVJRX1BPTEwgaXMgbm90IHNl
dApDT05GSUdfTVBJTElCPXkKQ09ORklHX0xJQkZEVD15CkNPTkZJR19PSURfUkVHSVNUUlk9eQpD
T05GSUdfSEFWRV9HRU5FUklDX1ZEU089eQpDT05GSUdfR0VORVJJQ19HRVRUSU1FT0ZEQVk9eQpD
T05GSUdfR0VORVJJQ19WRFNPX1RJTUVfTlM9eQpDT05GSUdfRk9OVF9TVVBQT1JUPXkKIyBDT05G
SUdfRk9OVFMgaXMgbm90IHNldApDT05GSUdfRk9OVF84eDg9eQpDT05GSUdfRk9OVF84eDE2PXkK
Q09ORklHX1NHX1BPT0w9eQpDT05GSUdfQVJDSF9IQVNfUE1FTV9BUEk9eQpDT05GSUdfQVJDSF9I
QVNfTUVNUkVNQVBfQ09NUEFUX0FMSUdOPXkKQ09ORklHX0FSQ0hfSEFTX1VBQ0NFU1NfRkxVU0hD
QUNIRT15CkNPTkZJR19BUkNIX0hBU19DT1BZX01DPXkKQ09ORklHX0FSQ0hfU1RBQ0tXQUxLPXkK
Q09ORklHX1NUQUNLREVQT1Q9eQpDT05GSUdfU0JJVE1BUD15CiMgQ09ORklHX0xXUV9URVNUIGlz
IG5vdCBzZXQKIyBlbmQgb2YgTGlicmFyeSByb3V0aW5lcwoKQ09ORklHX0dFTkVSSUNfSU9SRU1B
UD15CgojCiMgS2VybmVsIGhhY2tpbmcKIwoKIwojIHByaW50ayBhbmQgZG1lc2cgb3B0aW9ucwoj
CkNPTkZJR19QUklOVEtfVElNRT15CiMgQ09ORklHX1BSSU5US19DQUxMRVIgaXMgbm90IHNldAoj
IENPTkZJR19TVEFDS1RSQUNFX0JVSUxEX0lEIGlzIG5vdCBzZXQKQ09ORklHX0NPTlNPTEVfTE9H
TEVWRUxfREVGQVVMVD03CkNPTkZJR19DT05TT0xFX0xPR0xFVkVMX1FVSUVUPTQKQ09ORklHX01F
U1NBR0VfTE9HTEVWRUxfREVGQVVMVD00CiMgQ09ORklHX0RZTkFNSUNfREVCVUcgaXMgbm90IHNl
dAojIENPTkZJR19EWU5BTUlDX0RFQlVHX0NPUkUgaXMgbm90IHNldApDT05GSUdfU1lNQk9MSUNf
RVJSTkFNRT15CkNPTkZJR19ERUJVR19CVUdWRVJCT1NFPXkKIyBlbmQgb2YgcHJpbnRrIGFuZCBk
bWVzZyBvcHRpb25zCgpDT05GSUdfREVCVUdfS0VSTkVMPXkKIyBDT05GSUdfREVCVUdfTUlTQyBp
cyBub3Qgc2V0CgojCiMgQ29tcGlsZS10aW1lIGNoZWNrcyBhbmQgY29tcGlsZXIgb3B0aW9ucwoj
CkNPTkZJR19ERUJVR19JTkZPPXkKQ09ORklHX0FTX0hBU19OT05fQ09OU1RfTEVCMTI4PXkKIyBD
T05GSUdfREVCVUdfSU5GT19OT05FIGlzIG5vdCBzZXQKQ09ORklHX0RFQlVHX0lORk9fRFdBUkZf
VE9PTENIQUlOX0RFRkFVTFQ9eQojIENPTkZJR19ERUJVR19JTkZPX0RXQVJGNCBpcyBub3Qgc2V0
CiMgQ09ORklHX0RFQlVHX0lORk9fRFdBUkY1IGlzIG5vdCBzZXQKQ09ORklHX0RFQlVHX0lORk9f
UkVEVUNFRD15CiMgQ09ORklHX0RFQlVHX0lORk9fQ09NUFJFU1NFRF9OT05FIGlzIG5vdCBzZXQK
IyBDT05GSUdfREVCVUdfSU5GT19DT01QUkVTU0VEX1pMSUIgaXMgbm90IHNldApDT05GSUdfREVC
VUdfSU5GT19DT01QUkVTU0VEX1pTVEQ9eQpDT05GSUdfREVCVUdfSU5GT19TUExJVD15CiMgQ09O
RklHX0dEQl9TQ1JJUFRTIGlzIG5vdCBzZXQKQ09ORklHX0ZSQU1FX1dBUk49MjA0OApDT05GSUdf
U1RSSVBfQVNNX1NZTVM9eQojIENPTkZJR19SRUFEQUJMRV9BU00gaXMgbm90IHNldAojIENPTkZJ
R19IRUFERVJTX0lOU1RBTEwgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19TRUNUSU9OX01JU01B
VENIIGlzIG5vdCBzZXQKQ09ORklHX1NFQ1RJT05fTUlTTUFUQ0hfV0FSTl9PTkxZPXkKIyBDT05G
SUdfREVCVUdfRk9SQ0VfRlVOQ1RJT05fQUxJR05fNjRCIGlzIG5vdCBzZXQKIyBDT05GSUdfVk1M
SU5VWF9NQVAgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19GT1JDRV9XRUFLX1BFUl9DUFUgaXMg
bm90IHNldAojIGVuZCBvZiBDb21waWxlLXRpbWUgY2hlY2tzIGFuZCBjb21waWxlciBvcHRpb25z
CgojCiMgR2VuZXJpYyBLZXJuZWwgRGVidWdnaW5nIEluc3RydW1lbnRzCiMKIyBDT05GSUdfTUFH
SUNfU1lTUlEgaXMgbm90IHNldApDT05GSUdfREVCVUdfRlM9eQpDT05GSUdfREVCVUdfRlNfQUxM
T1dfQUxMPXkKIyBDT05GSUdfREVCVUdfRlNfRElTQUxMT1dfTU9VTlQgaXMgbm90IHNldAojIENP
TkZJR19ERUJVR19GU19BTExPV19OT05FIGlzIG5vdCBzZXQKQ09ORklHX0hBVkVfQVJDSF9LR0RC
PXkKIyBDT05GSUdfS0dEQiBpcyBub3Qgc2V0CkNPTkZJR19BUkNIX0hBU19VQlNBTl9TQU5JVEla
RV9BTEw9eQojIENPTkZJR19VQlNBTiBpcyBub3Qgc2V0CkNPTkZJR19IQVZFX0FSQ0hfS0NTQU49
eQpDT05GSUdfSEFWRV9LQ1NBTl9DT01QSUxFUj15CiMgQ09ORklHX0tDU0FOIGlzIG5vdCBzZXQK
IyBlbmQgb2YgR2VuZXJpYyBLZXJuZWwgRGVidWdnaW5nIEluc3RydW1lbnRzCgojCiMgTmV0d29y
a2luZyBEZWJ1Z2dpbmcKIwojIENPTkZJR19ORVRfREVWX1JFRkNOVF9UUkFDS0VSIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTkVUX05TX1JFRkNOVF9UUkFDS0VSIGlzIG5vdCBzZXQKIyBDT05GSUdfREVC
VUdfTkVUIGlzIG5vdCBzZXQKIyBlbmQgb2YgTmV0d29ya2luZyBEZWJ1Z2dpbmcKCiMKIyBNZW1v
cnkgRGVidWdnaW5nCiMKIyBDT05GSUdfUEFHRV9FWFRFTlNJT04gaXMgbm90IHNldApDT05GSUdf
REVCVUdfUEFHRUFMTE9DPXkKIyBDT05GSUdfREVCVUdfUEFHRUFMTE9DX0VOQUJMRV9ERUZBVUxU
IGlzIG5vdCBzZXQKQ09ORklHX1NMVUJfREVCVUc9eQojIENPTkZJR19TTFVCX0RFQlVHX09OIGlz
IG5vdCBzZXQKIyBDT05GSUdfUEFHRV9PV05FUiBpcyBub3Qgc2V0CkNPTkZJR19QQUdFX1BPSVNP
TklORz15CkNPTkZJR19ERUJVR19ST0RBVEFfVEVTVD15CkNPTkZJR19BUkNIX0hBU19ERUJVR19X
WD15CkNPTkZJR19ERUJVR19XWD15CkNPTkZJR19HRU5FUklDX1BURFVNUD15CkNPTkZJR19QVERV
TVBfQ09SRT15CiMgQ09ORklHX1BURFVNUF9ERUJVR0ZTIGlzIG5vdCBzZXQKQ09ORklHX0hBVkVf
REVCVUdfS01FTUxFQUs9eQojIENPTkZJR19ERUJVR19LTUVNTEVBSyBpcyBub3Qgc2V0CiMgQ09O
RklHX1BFUl9WTUFfTE9DS19TVEFUUyBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX09CSkVDVFMg
aXMgbm90IHNldAojIENPTkZJR19TSFJJTktFUl9ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX0RF
QlVHX1NUQUNLX1VTQUdFIGlzIG5vdCBzZXQKQ09ORklHX1NDSEVEX1NUQUNLX0VORF9DSEVDSz15
CkNPTkZJR19BUkNIX0hBU19ERUJVR19WTV9QR1RBQkxFPXkKIyBDT05GSUdfREVCVUdfVk0gaXMg
bm90IHNldApDT05GSUdfREVCVUdfVk1fUEdUQUJMRT15CkNPTkZJR19BUkNIX0hBU19ERUJVR19W
SVJUVUFMPXkKIyBDT05GSUdfREVCVUdfVklSVFVBTCBpcyBub3Qgc2V0CkNPTkZJR19ERUJVR19N
RU1PUllfSU5JVD15CiMgQ09ORklHX0RFQlVHX1BFUl9DUFVfTUFQUyBpcyBub3Qgc2V0CkNPTkZJ
R19IQVZFX0RFQlVHX1NUQUNLT1ZFUkZMT1c9eQpDT05GSUdfREVCVUdfU1RBQ0tPVkVSRkxPVz15
CkNPTkZJR19IQVZFX0FSQ0hfS0FTQU49eQpDT05GSUdfSEFWRV9BUkNIX0tBU0FOX1ZNQUxMT0M9
eQpDT05GSUdfQVJDSF9ESVNBQkxFX0tBU0FOX0lOTElORT15CkNPTkZJR19DQ19IQVNfS0FTQU5f
R0VORVJJQz15CkNPTkZJR19DQ19IQVNfV09SS0lOR19OT1NBTklUSVpFX0FERFJFU1M9eQojIENP
TkZJR19LQVNBTiBpcyBub3Qgc2V0CkNPTkZJR19IQVZFX0FSQ0hfS0ZFTkNFPXkKQ09ORklHX0tG
RU5DRT15CkNPTkZJR19LRkVOQ0VfU0FNUExFX0lOVEVSVkFMPTEwMApDT05GSUdfS0ZFTkNFX05V
TV9PQkpFQ1RTPTI1NQpDT05GSUdfS0ZFTkNFX0RFRkVSUkFCTEU9eQojIENPTkZJR19LRkVOQ0Vf
U1RBVElDX0tFWVMgaXMgbm90IHNldApDT05GSUdfS0ZFTkNFX1NUUkVTU19URVNUX0ZBVUxUUz0w
CiMgZW5kIG9mIE1lbW9yeSBEZWJ1Z2dpbmcKCiMgQ09ORklHX0RFQlVHX1NISVJRIGlzIG5vdCBz
ZXQKCiMKIyBEZWJ1ZyBPb3BzLCBMb2NrdXBzIGFuZCBIYW5ncwojCiMgQ09ORklHX1BBTklDX09O
X09PUFMgaXMgbm90IHNldApDT05GSUdfUEFOSUNfT05fT09QU19WQUxVRT0wCkNPTkZJR19MT0NL
VVBfREVURUNUT1I9eQpDT05GSUdfU09GVExPQ0tVUF9ERVRFQ1RPUj15CiMgQ09ORklHX0JPT1RQ
QVJBTV9TT0ZUTE9DS1VQX1BBTklDIGlzIG5vdCBzZXQKQ09ORklHX0hBVkVfSEFSRExPQ0tVUF9E
RVRFQ1RPUl9CVUREWT15CkNPTkZJR19IQVJETE9DS1VQX0RFVEVDVE9SPXkKIyBDT05GSUdfSEFS
RExPQ0tVUF9ERVRFQ1RPUl9QRVJGIGlzIG5vdCBzZXQKIyBDT05GSUdfSEFSRExPQ0tVUF9ERVRF
Q1RPUl9CVUREWSBpcyBub3Qgc2V0CkNPTkZJR19IQVJETE9DS1VQX0RFVEVDVE9SX0FSQ0g9eQpD
T05GSUdfQk9PVFBBUkFNX0hBUkRMT0NLVVBfUEFOSUM9eQpDT05GSUdfREVURUNUX0hVTkdfVEFT
Sz15CkNPTkZJR19ERUZBVUxUX0hVTkdfVEFTS19USU1FT1VUPTYwCiMgQ09ORklHX0JPT1RQQVJB
TV9IVU5HX1RBU0tfUEFOSUMgaXMgbm90IHNldApDT05GSUdfV1FfV0FUQ0hET0c9eQojIENPTkZJ
R19XUV9DUFVfSU5URU5TSVZFX1JFUE9SVCBpcyBub3Qgc2V0CiMgQ09ORklHX1RFU1RfTE9DS1VQ
IGlzIG5vdCBzZXQKIyBlbmQgb2YgRGVidWcgT29wcywgTG9ja3VwcyBhbmQgSGFuZ3MKCiMKIyBT
Y2hlZHVsZXIgRGVidWdnaW5nCiMKIyBDT05GSUdfU0NIRURfREVCVUcgaXMgbm90IHNldApDT05G
SUdfU0NIRURfSU5GTz15CiMgQ09ORklHX1NDSEVEU1RBVFMgaXMgbm90IHNldAojIGVuZCBvZiBT
Y2hlZHVsZXIgRGVidWdnaW5nCgojIENPTkZJR19ERUJVR19USU1FS0VFUElORyBpcyBub3Qgc2V0
CgojCiMgTG9jayBEZWJ1Z2dpbmcgKHNwaW5sb2NrcywgbXV0ZXhlcywgZXRjLi4uKQojCkNPTkZJ
R19MT0NLX0RFQlVHR0lOR19TVVBQT1JUPXkKIyBDT05GSUdfUFJPVkVfTE9DS0lORyBpcyBub3Qg
c2V0CiMgQ09ORklHX0xPQ0tfU1RBVCBpcyBub3Qgc2V0CkNPTkZJR19ERUJVR19SVF9NVVRFWEVT
PXkKQ09ORklHX0RFQlVHX1NQSU5MT0NLPXkKQ09ORklHX0RFQlVHX01VVEVYRVM9eQojIENPTkZJ
R19ERUJVR19XV19NVVRFWF9TTE9XUEFUSCBpcyBub3Qgc2V0CkNPTkZJR19ERUJVR19SV1NFTVM9
eQojIENPTkZJR19ERUJVR19MT0NLX0FMTE9DIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfQVRP
TUlDX1NMRUVQIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfTE9DS0lOR19BUElfU0VMRlRFU1RT
IGlzIG5vdCBzZXQKIyBDT05GSUdfTE9DS19UT1JUVVJFX1RFU1QgaXMgbm90IHNldAojIENPTkZJ
R19XV19NVVRFWF9TRUxGVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX1NDRl9UT1JUVVJFX1RFU1Qg
aXMgbm90IHNldApDT05GSUdfQ1NEX0xPQ0tfV0FJVF9ERUJVRz15CkNPTkZJR19DU0RfTE9DS19X
QUlUX0RFQlVHX0RFRkFVTFQ9eQojIGVuZCBvZiBMb2NrIERlYnVnZ2luZyAoc3BpbmxvY2tzLCBt
dXRleGVzLCBldGMuLi4pCgojIENPTkZJR19ERUJVR19JUlFGTEFHUyBpcyBub3Qgc2V0CkNPTkZJ
R19TVEFDS1RSQUNFPXkKIyBDT05GSUdfV0FSTl9BTExfVU5TRUVERURfUkFORE9NIGlzIG5vdCBz
ZXQKIyBDT05GSUdfREVCVUdfS09CSkVDVCBpcyBub3Qgc2V0CgojCiMgRGVidWcga2VybmVsIGRh
dGEgc3RydWN0dXJlcwojCkNPTkZJR19ERUJVR19MSVNUPXkKIyBDT05GSUdfREVCVUdfUExJU1Qg
aXMgbm90IHNldApDT05GSUdfREVCVUdfU0c9eQpDT05GSUdfREVCVUdfTk9USUZJRVJTPXkKQ09O
RklHX0RFQlVHX0NMT1NVUkVTPXkKQ09ORklHX0RFQlVHX01BUExFX1RSRUU9eQojIGVuZCBvZiBE
ZWJ1ZyBrZXJuZWwgZGF0YSBzdHJ1Y3R1cmVzCgojCiMgUkNVIERlYnVnZ2luZwojCiMgQ09ORklH
X1JDVV9TQ0FMRV9URVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfUkNVX1RPUlRVUkVfVEVTVCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1JDVV9SRUZfU0NBTEVfVEVTVCBpcyBub3Qgc2V0CkNPTkZJR19SQ1Vf
Q1BVX1NUQUxMX1RJTUVPVVQ9NjAKQ09ORklHX1JDVV9FWFBfQ1BVX1NUQUxMX1RJTUVPVVQ9MApD
T05GSUdfUkNVX0NQVV9TVEFMTF9DUFVUSU1FPXkKIyBDT05GSUdfUkNVX1RSQUNFIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUkNVX0VRU19ERUJVRyBpcyBub3Qgc2V0CiMgZW5kIG9mIFJDVSBEZWJ1Z2dp
bmcKCiMgQ09ORklHX0RFQlVHX1dRX0ZPUkNFX1JSX0NQVSBpcyBub3Qgc2V0CiMgQ09ORklHX0NQ
VV9IT1RQTFVHX1NUQVRFX0NPTlRST0wgaXMgbm90IHNldAojIENPTkZJR19MQVRFTkNZVE9QIGlz
IG5vdCBzZXQKQ09ORklHX0hBVkVfRlVOQ1RJT05fVFJBQ0VSPXkKQ09ORklHX0hBVkVfRlVOQ1RJ
T05fR1JBUEhfVFJBQ0VSPXkKQ09ORklHX0hBVkVfRFlOQU1JQ19GVFJBQ0U9eQpDT05GSUdfSEFW
RV9GVFJBQ0VfTUNPVU5UX1JFQ09SRD15CkNPTkZJR19IQVZFX1NZU0NBTExfVFJBQ0VQT0lOVFM9
eQpDT05GSUdfSEFWRV9DX1JFQ09SRE1DT1VOVD15CkNPTkZJR19UUkFDSU5HX1NVUFBPUlQ9eQoj
IENPTkZJR19GVFJBQ0UgaXMgbm90IHNldAojIENPTkZJR19TQU1QTEVTIGlzIG5vdCBzZXQKQ09O
RklHX0FSQ0hfSEFTX0RFVk1FTV9JU19BTExPV0VEPXkKQ09ORklHX1NUUklDVF9ERVZNRU09eQpD
T05GSUdfSU9fU1RSSUNUX0RFVk1FTT15CgojCiMgcG93ZXJwYyBEZWJ1Z2dpbmcKIwojIENPTkZJ
R19QUENfRElTQUJMRV9XRVJST1IgaXMgbm90IHNldApDT05GSUdfUFBDX1dFUlJPUj15CkNPTkZJ
R19QUklOVF9TVEFDS19ERVBUSD02NAojIENPTkZJR19QUENfRU1VTEFURURfU1RBVFMgaXMgbm90
IHNldAojIENPTkZJR19DT0RFX1BBVENISU5HX1NFTEZURVNUIGlzIG5vdCBzZXQKIyBDT05GSUdf
SlVNUF9MQUJFTF9GRUFUVVJFX0NIRUNLUyBpcyBub3Qgc2V0CiMgQ09ORklHX0ZUUl9GSVhVUF9T
RUxGVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX01TSV9CSVRNQVBfU0VMRlRFU1QgaXMgbm90IHNl
dAojIENPTkZJR19HVUVTVF9TVEFURV9CVUZGRVJfVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX1BQ
Q19JUlFfU09GVF9NQVNLX0RFQlVHIGlzIG5vdCBzZXQKIyBDT05GSUdfUFBDX1JGSV9TUlJfREVC
VUcgaXMgbm90IHNldAojIENPTkZJR19YTU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfQk9PVFhfVEVY
VCBpcyBub3Qgc2V0CiMgQ09ORklHX1BQQ19FQVJMWV9ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklH
X1BQQ19GQVNUX0VORElBTl9TV0lUQ0ggaXMgbm90IHNldAojIGVuZCBvZiBwb3dlcnBjIERlYnVn
Z2luZwoKIwojIEtlcm5lbCBUZXN0aW5nIGFuZCBDb3ZlcmFnZQojCkNPTkZJR19LVU5JVD1tCiMg
Q09ORklHX0tVTklUX0RFQlVHRlMgaXMgbm90IHNldAojIENPTkZJR19LVU5JVF9URVNUIGlzIG5v
dCBzZXQKIyBDT05GSUdfS1VOSVRfRVhBTVBMRV9URVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfS1VO
SVRfQUxMX1RFU1RTIGlzIG5vdCBzZXQKQ09ORklHX0tVTklUX0RFRkFVTFRfRU5BQkxFRD15CiMg
Q09ORklHX05PVElGSUVSX0VSUk9SX0lOSkVDVElPTiBpcyBub3Qgc2V0CiMgQ09ORklHX0ZBVUxU
X0lOSkVDVElPTiBpcyBub3Qgc2V0CkNPTkZJR19BUkNIX0hBU19LQ09WPXkKQ09ORklHX0NDX0hB
U19TQU5DT1ZfVFJBQ0VfUEM9eQojIENPTkZJR19LQ09WIGlzIG5vdCBzZXQKQ09ORklHX1JVTlRJ
TUVfVEVTVElOR19NRU5VPXkKIyBDT05GSUdfVEVTVF9ESFJZIGlzIG5vdCBzZXQKIyBDT05GSUdf
TEtEVE0gaXMgbm90IHNldApDT05GSUdfQ1BVTUFTS19LVU5JVF9URVNUPW0KQ09ORklHX1RFU1Rf
TElTVF9TT1JUPW0KIyBDT05GSUdfVEVTVF9NSU5fSEVBUCBpcyBub3Qgc2V0CkNPTkZJR19URVNU
X1NPUlQ9bQojIENPTkZJR19URVNUX0RJVjY0IGlzIG5vdCBzZXQKQ09ORklHX1RFU1RfSU9WX0lU
RVI9bQpDT05GSUdfQkFDS1RSQUNFX1NFTEZfVEVTVD1tCiMgQ09ORklHX1RFU1RfUkVGX1RSQUNL
RVIgaXMgbm90IHNldAojIENPTkZJR19SQlRSRUVfVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX1JF
RURfU09MT01PTl9URVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5URVJWQUxfVFJFRV9URVNUIGlz
IG5vdCBzZXQKIyBDT05GSUdfUEVSQ1BVX1RFU1QgaXMgbm90IHNldApDT05GSUdfQVRPTUlDNjRf
U0VMRlRFU1Q9eQojIENPTkZJR19URVNUX0hFWERVTVAgaXMgbm90IHNldApDT05GSUdfU1RSSU5H
X1NFTEZURVNUPW0KQ09ORklHX1RFU1RfU1RSSU5HX0hFTFBFUlM9bQpDT05GSUdfVEVTVF9LU1RS
VE9YPXkKIyBDT05GSUdfVEVTVF9QUklOVEYgaXMgbm90IHNldAojIENPTkZJR19URVNUX1NDQU5G
IGlzIG5vdCBzZXQKQ09ORklHX1RFU1RfQklUTUFQPW0KIyBDT05GSUdfVEVTVF9VVUlEIGlzIG5v
dCBzZXQKQ09ORklHX1RFU1RfWEFSUkFZPW0KQ09ORklHX1RFU1RfTUFQTEVfVFJFRT1tCiMgQ09O
RklHX1RFU1RfUkhBU0hUQUJMRSBpcyBub3Qgc2V0CiMgQ09ORklHX1RFU1RfSURBIGlzIG5vdCBz
ZXQKIyBDT05GSUdfVEVTVF9MS00gaXMgbm90IHNldApDT05GSUdfVEVTVF9CSVRPUFM9bQpDT05G
SUdfVEVTVF9WTUFMTE9DPW0KIyBDT05GSUdfVEVTVF9VU0VSX0NPUFkgaXMgbm90IHNldApDT05G
SUdfVEVTVF9CUEY9bQojIENPTkZJR19URVNUX0JMQUNLSE9MRV9ERVYgaXMgbm90IHNldAojIENP
TkZJR19GSU5EX0JJVF9CRU5DSE1BUksgaXMgbm90IHNldAojIENPTkZJR19URVNUX0ZJUk1XQVJF
IGlzIG5vdCBzZXQKIyBDT05GSUdfVEVTVF9TWVNDVEwgaXMgbm90IHNldApDT05GSUdfQklURklF
TERfS1VOSVQ9bQpDT05GSUdfQ0hFQ0tTVU1fS1VOSVQ9bQpDT05GSUdfSEFTSF9LVU5JVF9URVNU
PW0KQ09ORklHX1JFU09VUkNFX0tVTklUX1RFU1Q9bQpDT05GSUdfU1lTQ1RMX0tVTklUX1RFU1Q9
bQpDT05GSUdfTElTVF9LVU5JVF9URVNUPW0KQ09ORklHX0hBU0hUQUJMRV9LVU5JVF9URVNUPW0K
Q09ORklHX0xJTkVBUl9SQU5HRVNfVEVTVD1tCkNPTkZJR19DTURMSU5FX0tVTklUX1RFU1Q9bQpD
T05GSUdfQklUU19URVNUPW0KQ09ORklHX1NMVUJfS1VOSVRfVEVTVD1tCiMgQ09ORklHX1JBVElP
TkFMX0tVTklUX1RFU1QgaXMgbm90IHNldApDT05GSUdfTUVNQ1BZX0tVTklUX1RFU1Q9bQpDT05G
SUdfTUVNQ1BZX1NMT1dfS1VOSVRfVEVTVD15CkNPTkZJR19JU19TSUdORURfVFlQRV9LVU5JVF9U
RVNUPW0KQ09ORklHX09WRVJGTE9XX0tVTklUX1RFU1Q9bQpDT05GSUdfU1RBQ0tJTklUX0tVTklU
X1RFU1Q9bQpDT05GSUdfRk9SVElGWV9LVU5JVF9URVNUPW0KQ09ORklHX1NUUkNBVF9LVU5JVF9U
RVNUPW0KQ09ORklHX1NUUlNDUFlfS1VOSVRfVEVTVD1tCiMgQ09ORklHX1NJUEhBU0hfS1VOSVRf
VEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX1RFU1RfVURFTEFZIGlzIG5vdCBzZXQKIyBDT05GSUdf
VEVTVF9TVEFUSUNfS0VZUyBpcyBub3Qgc2V0CiMgQ09ORklHX1RFU1RfS01PRCBpcyBub3Qgc2V0
CiMgQ09ORklHX1RFU1RfTUVNQ0FUX1AgaXMgbm90IHNldApDT05GSUdfVEVTVF9NRU1JTklUPW0K
Q09ORklHX1RFU1RfRlJFRV9QQUdFUz1tCiMgQ09ORklHX1RFU1RfT0JKUE9PTCBpcyBub3Qgc2V0
CkNPTkZJR19BUkNIX1VTRV9NRU1URVNUPXkKIyBDT05GSUdfTUVNVEVTVCBpcyBub3Qgc2V0CiMg
ZW5kIG9mIEtlcm5lbCBUZXN0aW5nIGFuZCBDb3ZlcmFnZQoKIwojIFJ1c3QgaGFja2luZwojCiMg
ZW5kIG9mIFJ1c3QgaGFja2luZwojIGVuZCBvZiBLZXJuZWwgaGFja2luZwoKIwojIEdlbnRvbyBM
aW51eAojCkNPTkZJR19HRU5UT09fTElOVVg9eQpDT05GSUdfR0VOVE9PX0xJTlVYX1VERVY9eQpD
T05GSUdfR0VOVE9PX0xJTlVYX1BPUlRBR0U9eQoKIwojIFN1cHBvcnQgZm9yIGluaXQgc3lzdGVt
cywgc3lzdGVtIGFuZCBzZXJ2aWNlIG1hbmFnZXJzCiMKQ09ORklHX0dFTlRPT19MSU5VWF9JTklU
X1NDUklQVD15CkNPTkZJR19HRU5UT09fTElOVVhfSU5JVF9TWVNURU1EPXkKIyBlbmQgb2YgU3Vw
cG9ydCBmb3IgaW5pdCBzeXN0ZW1zLCBzeXN0ZW0gYW5kIHNlcnZpY2UgbWFuYWdlcnMKCiMgQ09O
RklHX0dFTlRPT19LRVJORUxfU0VMRl9QUk9URUNUSU9OIGlzIG5vdCBzZXQKQ09ORklHX0dFTlRP
T19QUklOVF9GSVJNV0FSRV9JTkZPPXkKIyBlbmQgb2YgR2VudG9vIExpbnV4Cg==

--MP_/BOGJpdxgz_1o5Jmtf4+ozve--
