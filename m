Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9AE2205AC
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 09:00:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C7626E448;
	Wed, 15 Jul 2020 06:59:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC3B6E187
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 17:16:03 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06EHChrb153815;
 Tue, 14 Jul 2020 17:15:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type; s=corp-2020-01-29;
 bh=7Pb6O54ow1VQASDVJQvOoUC45VOUa7lVY8Ov4jBbY7g=;
 b=mr1HkAQaMguxlirGA0uLYeirOpjvHxgrSRQXAWD73n3oQn4TMgegU877OpPQPDkt4www
 Q0nd7EOyNHntzrRrkSNU2dpEPfPdoOF2vvSzGT4GfZ3k44EapTaLazUXTWT9Uj9qcPk8
 d7LOvqhBU630GiczL6ntluDpN6Hu0IuMxKj+y1q5zytGwGrOHYfV98E1ueblw2P3X+VH
 0fN/vRhEGVRh9+/EOydNIUwdZ1p9Ci3pvynoPpJXag258Djt6AmAOq1AsjW3aEZ8OgGG
 tJrO/+3Kmnm2hX+sldf//cHKwjCg/25KWIvObimVgWzLNY5VtXHdhUZAvGMhl4dl0HEh kg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 3274ur6ryk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 14 Jul 2020 17:15:58 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06EHDarG170505;
 Tue, 14 Jul 2020 17:15:57 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 327q6spy46-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Jul 2020 17:15:57 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 06EHFtmN018901;
 Tue, 14 Jul 2020 17:15:55 GMT
Received: from [10.39.221.185] (/10.39.221.185)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 14 Jul 2020 10:15:55 -0700
Subject: Re: [PATCH] fbdev: Detect integer underflow at "struct
 fbcon_ops"->clear_margins.
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
References: <189fc902-db7c-9886-cc31-c0348435303a@i-love.sakura.ne.jp>
 <20200712111013.11881-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <20200712111013.11881-2-penguin-kernel@I-love.SAKURA.ne.jp>
 <CGME20200714072231eucas1p17c53f0a661346ebfd316ebd5796ca346@eucas1p1.samsung.com>
 <db4b3346-b9f8-a428-1445-1fcbd8521e1d@samsung.com>
 <e00078d1-e5fb-a019-3036-cb182ed2e40b@i-love.sakura.ne.jp>
From: George Kennedy <george.kennedy@oracle.com>
Organization: Oracle Corporation
Message-ID: <c5bf6d5c-8d0a-8df5-2a11-38bf37a11d67@oracle.com>
Date: Tue, 14 Jul 2020 13:15:53 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e00078d1-e5fb-a019-3036-cb182ed2e40b@i-love.sakura.ne.jp>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9682
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007140126
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9682
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007140126
X-Mailman-Approved-At: Wed, 15 Jul 2020 06:59:56 +0000
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
Cc: linux-fbdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Dan Carpenter <dan.carpenter@oracle.com>,
 Jiri Slaby <jslaby@suse.com>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: multipart/mixed; boundary="===============0679935968=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0679935968==
Content-Type: multipart/alternative;
 boundary="------------4967EE9DDB85FA5DE5760002"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------4967EE9DDB85FA5DE5760002
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Tetsuo,

Can you try the a.out built from the original Syzkaller modified repro C 
program? It walks 0-7 through xres and yres of the fb_var_screeninfo struct.

// https://syzkaller.appspot.com/bug?id=a565882df74fa76f10d3a6fec4be31098dbb37c6
// autogenerated by syzkaller (https://github.com/google/syzkaller)

#define _GNU_SOURCE

#include <endian.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/syscall.h>
#include <sys/types.h>
#include <sys/fcntl.h>
#include <unistd.h>

#include <errno.h>

#include <linux/fb.h>

int verbose = 0;

void
dumpit(unsigned char *buf, int count, int addr)
{
     int i, j;
     char bp[256];

     memset(bp, 0, 256);

     for (i = j = 0; i < count; i++, j++) {
         if (j == 16) {
             j = 0;
             printf("%s\n", bp);
             memset(bp, 0, 256);
         }
         if (j == 0) {
             sprintf(&bp[strlen(bp)], "%x: ", addr + i);
         }
         sprintf(&bp[strlen(bp)], "%02x ", buf[i]);
     }
     if (j != 0) {
         printf("%s\n", bp);
     }
}

uint64_t r[1] = {0xffffffffffffffff};

int main(int argc, char **argv)
{
   syscall(__NR_mmap, 0x20000000ul, 0x1000000ul, 3ul, 0x32ul, -1, 0);
   intptr_t res = 0;
   uint32_t activate = FB_ACTIVATE_NOW;
   struct fb_var_screeninfo *varp = (struct fb_var_screeninfo *)0x200001c0;
   struct fb_var_screeninfo *starting_varp = malloc(sizeof(struct fb_var_screeninfo *));
   char *vp = (char *)varp;
   int i, sum, rtn, c;
   extern char *optarg;
   int limit = 0, passes = 0;
   unsigned int start_address = 0;
   unsigned int pattern = 0;
   int breakit = 1;
	
	while ((c = getopt (argc, argv, "a:v")) != -1)
	switch (c)
	{
	case 'a':
		activate = strtol(optarg, 0, 0);
		break;
	case 'v':
		verbose++;
		break;
	default:
		fprintf(stderr, "\nusage: %s [-a <activate code>] [-v]\n\n", argv[0]);
		return -1;
	}

	int fd = open("/dev/fb0", O_RDWR);
	if (fd < 0) {
		perror("open");
		return 0;
	}
	printf("fd: %d\n", fd);
	r[0] = fd;


	rtn = syscall(__NR_ioctl, r[0], 0x4600ul, 0x200001c0ul);
	if (rtn < 0) {
		perror("ioctl");
		fprintf(stderr, "rtn=%d, errno=%d\n", rtn, errno);
	}

	if (verbose) {
		printf("FBIOGET_VSCREENINFO:\n");
		dumpit((unsigned char *)vp, sizeof(struct fb_var_screeninfo), 0x200001c0);
	}

	memcpy(starting_varp, varp, sizeof(struct fb_var_screeninfo));

	fprintf(stderr, "activate = %d\n", activate);

	varp->activate = activate;

	if (verbose) {
		printf("Pre FBIOPUT_VSCREENINFO:\n");
		dumpit((unsigned char *)vp, sizeof(struct fb_var_screeninfo), 0x200001c0);

		sleep(2);
	}

	rtn = syscall(__NR_ioctl, r[0], 0x4601ul, 0x200001c0ul);
	if (rtn < 0) {
		perror("ioctl");
		fprintf(stderr, "rtn=%d, errno=%d\n", rtn, errno);
	}
	limit = 2;
	for (pattern = 0 ; pattern < 8 ; pattern++) {
		unsigned long addr = 0x200001c0;
		passes = 0;
		printf("\nWalk START addr = 0x%x, Break pattern=%x\n", addr, pattern);
		while (addr <= 0x2000025c) {
			fprintf(stderr, "======================== %d: addr=%x ========================\n", passes, addr);
			memcpy(varp, starting_varp, sizeof(struct fb_var_screeninfo));
			*(uint32_t*)addr = pattern;
			varp->activate = activate;
			printf("Pre FBIOPUT_VSCREENINFO: pattern=%x\n", pattern);
			dumpit((unsigned char *)vp, sizeof(struct fb_var_screeninfo), 0x200001c0);
			sleep(3);
			rtn = syscall(__NR_ioctl, r[0], 0x4601ul, 0x200001c0ul);
			if (rtn < 0) {
				perror("ioctl");
				fprintf(stderr, "rtn=%d, errno=%d\n", rtn, errno);
			}
			addr += 4;
			passes++;
			if (passes == limit)
				break;
		}
	}
	close(fd);

	return 0;
}

With my patch it gets output like the following:

[root@localhost ~]# ./fb_break
fd: 3
activate = 0

Walk START addr = 0x200001c0, Break pattern=0
======================== 0: addr=200001c0 ========================
Pre FBIOPUT_VSCREENINFO: pattern=0
200001c0: 00 00 00 00 00 03 00 00 00 04 00 00 00 03 00 00
200001d0: 00 00 00 00 00 00 00 00 20 00 00 00 00 00 00 00
200001e0: 10 00 00 00 08 00 00 00 00 00 00 00 08 00 00 00
200001f0: 08 00 00 00 00 00 00 00 00 00 00 00 08 00 00 00
20000200: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20000210: 00 00 00 00 00 00 00 00 2c 01 00 00 90 01 00 00
20000220: 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20000230: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20000240: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20000250: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
ioctl: Invalid argument
rtn=-1, errno=22
======================== 1: addr=200001c4 ========================
Pre FBIOPUT_VSCREENINFO: pattern=0
200001c0: 00 04 00 00 00 00 00 00 00 04 00 00 00 03 00 00
200001d0: 00 00 00 00 00 00 00 00 20 00 00 00 00 00 00 00
200001e0: 10 00 00 00 08 00 00 00 00 00 00 00 08 00 00 00
200001f0: 08 00 00 00 00 00 00 00 00 00 00 00 08 00 00 00
20000200: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20000210: 00 00 00 00 00 00 00 00 2c 01 00 00 90 01 00 00
20000220: 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20000230: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20000240: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20000250: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
ioctl: Invalid argument
rtn=-1, errno=22

Walk START addr = 0x200001c0, Break pattern=1
======================== 0: addr=200001c0 ========================
Pre FBIOPUT_VSCREENINFO: pattern=1
200001c0: 01 00 00 00 00 03 00 00 00 04 00 00 00 03 00 00
200001d0: 00 00 00 00 00 00 00 00 20 00 00 00 00 00 00 00
200001e0: 10 00 00 00 08 00 00 00 00 00 00 00 08 00 00 00
200001f0: 08 00 00 00 00 00 00 00 00 00 00 00 08 00 00 00
20000200: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20000210: 00 00 00 00 00 00 00 00 2c 01 00 00 90 01 00 00
20000220: 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20000230: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20000240: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20000250: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
ioctl: Invalid argument
rtn=-1, errno=22

...

======================== 1: addr=200001c4 ========================
Pre FBIOPUT_VSCREENINFO: pattern=7
200001c0: 00 04 00 00 07 00 00 00 00 04 00 00 00 03 00 00
200001d0: 00 00 00 00 00 00 00 00 20 00 00 00 00 00 00 00
200001e0: 10 00 00 00 08 00 00 00 00 00 00 00 08 00 00 00
200001f0: 08 00 00 00 00 00 00 00 00 00 00 00 08 00 00 00
20000200: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20000210: 00 00 00 00 00 00 00 00 2c 01 00 00 90 01 00 00
20000220: 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20000230: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20000240: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20000250: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
ioctl: Invalid argument
rtn=-1, errno=22
[root@localhost ~]#

Thank you,
George

On 7/14/2020 6:27 AM, Tetsuo Handa wrote:
> On 2020/07/14 16:22, Bartlomiej Zolnierkiewicz wrote:
>> How does this patch relate to:
>>
>> 	https://marc.info/?l=linux-fbdev&m=159415024816722&w=2
>>
>> ?
>>
>> It seems to address the same issue, I've added George and Dan to Cc:.
> George Kennedy's patch does not help for my case.
>
> You can try a.out built from
>
> ----------
> #include <sys/types.h>
> #include <sys/stat.h>
> #include <fcntl.h>
> #include <sys/ioctl.h>
> #include <linux/fb.h>
>
> int main(int argc, char *argv[])
> {
>          const int fd = open("/dev/fb0", O_ACCMODE);
>          struct fb_var_screeninfo var = { };
>          ioctl(fd, FBIOGET_VSCREENINFO, &var);
>          var.xres = var.yres = 16;
>          ioctl(fd, FBIOPUT_VSCREENINFO, &var);
>          return 0;
> }
> ----------
>
> with a fault injection patch
>
> ----------
> --- a/drivers/tty/vt/vt.c
> +++ b/drivers/tty/vt/vt.c
> @@ -1214,6 +1214,10 @@ static int vc_do_resize(struct tty_struct *tty, struct vc_data *vc,
>   
>   	if (new_screen_size > KMALLOC_MAX_SIZE)
>   		return -EINVAL;
> +	if (!strcmp(current->comm, "a.out")) {
> +		printk(KERN_INFO "Forcing memory allocation failure.\n");
> +		return -ENOMEM;
> +	}
>   	newscreen = kzalloc(new_screen_size, GFP_USER);
>   	if (!newscreen)
>   		return -ENOMEM;
> ----------
>
> . What my patch workarounds is cases when vc_do_resize() did not update vc->vc_{cols,rows} .
> Unless vc->vc_{cols,rows} are updated by vc_do_resize() in a way that avoids integer underflow at
>
> 	unsigned int rw = info->var.xres - (vc->vc_cols*cw);
> 	unsigned int bh = info->var.yres - (vc->vc_rows*ch);
>
> , this crash won't go away.
>
> [   39.995757][ T2788] Forcing memory allocation failure.
> [   39.996527][ T2788] BUG: unable to handle page fault for address: ffffa9d180d7b000
> [   39.996529][ T2788] #PF: supervisor write access in kernel mode
> [   39.996530][ T2788] #PF: error_code(0x0002) - not-present page
> [   39.996531][ T2788] PGD 13a48c067 P4D 13a48c067 PUD 13a48d067 PMD 1324e4067 PTE 0
> [   39.996547][ T2788] Oops: 0002 [#1] SMP
> [   39.996550][ T2788] CPU: 2 PID: 2788 Comm: a.out Not tainted 5.8.0-rc5+ #757
> [   39.996551][ T2788] Hardware name: VMware, Inc. VMware Virtual Platform/440BX Desktop Reference Platform, BIOS 6.00 02/27/2020
> [   39.996555][ T2788] RIP: 0010:bitfill_aligned+0x87/0x120 [cfbfillrect]


--------------4967EE9DDB85FA5DE5760002
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Hello Tetsuo,<br>
    <br>
    Can you try the a.out built from the original Syzkaller modified
    repro C program? It walks 0-7 through xres and yres of the
    fb_var_screeninfo struct.<br>
    <pre>// <a class="moz-txt-link-freetext" href="https://syzkaller.appspot.com/bug?id=a565882df74fa76f10d3a6fec4be31098dbb37c6">https://syzkaller.appspot.com/bug?id=a565882df74fa76f10d3a6fec4be31098dbb37c6</a>
// autogenerated by syzkaller (<a class="moz-txt-link-freetext" href="https://github.com/google/syzkaller">https://github.com/google/syzkaller</a>)

#define _GNU_SOURCE

#include &lt;endian.h&gt;
#include &lt;stdint.h&gt;
#include &lt;stdio.h&gt;
#include &lt;stdlib.h&gt;
#include &lt;string.h&gt;
#include &lt;sys/syscall.h&gt;
#include &lt;sys/types.h&gt;
#include &lt;sys/fcntl.h&gt;
#include &lt;unistd.h&gt;

#include &lt;errno.h&gt;

#include &lt;linux/fb.h&gt;

int verbose = 0;

void
dumpit(unsigned char *buf, int count, int addr)
{
    int i, j;
    char bp[256];

    memset(bp, 0, 256);

    for (i = j = 0; i &lt; count; i++, j++) {
        if (j == 16) {
            j = 0;
            printf("%s\n", bp);
            memset(bp, 0, 256);
        }
        if (j == 0) {
            sprintf(&amp;bp[strlen(bp)], "%x: ", addr + i);
        }
        sprintf(&amp;bp[strlen(bp)], "%02x ", buf[i]);
    }
    if (j != 0) {
        printf("%s\n", bp);
    }
}

uint64_t r[1] = {0xffffffffffffffff};

int main(int argc, char **argv)
{
  syscall(__NR_mmap, 0x20000000ul, 0x1000000ul, 3ul, 0x32ul, -1, 0);
  intptr_t res = 0;
  uint32_t activate = FB_ACTIVATE_NOW;
  struct fb_var_screeninfo *varp = (struct fb_var_screeninfo *)0x200001c0;
  struct fb_var_screeninfo *starting_varp = malloc(sizeof(struct fb_var_screeninfo *));
  char *vp = (char *)varp;
  int i, sum, rtn, c;
  extern char *optarg;
  int limit = 0, passes = 0;
  unsigned int start_address = 0;
  unsigned int pattern = 0;
  int breakit = 1;
	
	while ((c = getopt (argc, argv, "a:v")) != -1)
	switch (c)
	{
	case 'a':
		activate = strtol(optarg, 0, 0);
		break;
	case 'v':
		verbose++;
		break;
	default:
		fprintf(stderr, "\nusage: %s [-a &lt;activate code&gt;] [-v]\n\n", argv[0]);
		return -1;
	}

	int fd = open("/dev/fb0", O_RDWR);
	if (fd &lt; 0) {
		perror("open");
		return 0;
	}
	printf("fd: %d\n", fd);
	r[0] = fd;


	rtn = syscall(__NR_ioctl, r[0], 0x4600ul, 0x200001c0ul);
	if (rtn &lt; 0) {
		perror("ioctl");
		fprintf(stderr, "rtn=%d, errno=%d\n", rtn, errno);
	}

	if (verbose) {
		printf("FBIOGET_VSCREENINFO:\n");
		dumpit((unsigned char *)vp, sizeof(struct fb_var_screeninfo), 0x200001c0);
	}

	memcpy(starting_varp, varp, sizeof(struct fb_var_screeninfo));

	fprintf(stderr, "activate = %d\n", activate);

	varp-&gt;activate = activate;

	if (verbose) {
		printf("Pre FBIOPUT_VSCREENINFO:\n");
		dumpit((unsigned char *)vp, sizeof(struct fb_var_screeninfo), 0x200001c0);

		sleep(2);
	}

	rtn = syscall(__NR_ioctl, r[0], 0x4601ul, 0x200001c0ul);
	if (rtn &lt; 0) {
		perror("ioctl");
		fprintf(stderr, "rtn=%d, errno=%d\n", rtn, errno);
	}
	limit = 2;
	for (pattern = 0 ; pattern &lt; 8 ; pattern++) {
		unsigned long addr = 0x200001c0;
		passes = 0;
		printf("\nWalk START addr = 0x%x, Break pattern=%x\n", addr, pattern);
		while (addr &lt;= 0x2000025c) {
			fprintf(stderr, "======================== %d: addr=%x ========================\n", passes, addr);
			memcpy(varp, starting_varp, sizeof(struct fb_var_screeninfo));
			*(uint32_t*)addr = pattern;
			varp-&gt;activate = activate;
			printf("Pre FBIOPUT_VSCREENINFO: pattern=%x\n", pattern);
			dumpit((unsigned char *)vp, sizeof(struct fb_var_screeninfo), 0x200001c0);
			sleep(3);
			rtn = syscall(__NR_ioctl, r[0], 0x4601ul, 0x200001c0ul);
			if (rtn &lt; 0) {
				perror("ioctl");
				fprintf(stderr, "rtn=%d, errno=%d\n", rtn, errno);
			}
			addr += 4;
			passes++;
			if (passes == limit)
				break;
		}
	}
	close(fd);

	return 0;
}

</pre>
    With my patch it gets output like the following:<br>
    <pre>[root@localhost ~]# ./fb_break 
fd: 3
activate = 0

Walk START addr = 0x200001c0, Break pattern=0
======================== 0: addr=200001c0 ========================
Pre FBIOPUT_VSCREENINFO: pattern=0
200001c0: 00 00 00 00 00 03 00 00 00 04 00 00 00 03 00 00 
200001d0: 00 00 00 00 00 00 00 00 20 00 00 00 00 00 00 00 
200001e0: 10 00 00 00 08 00 00 00 00 00 00 00 08 00 00 00 
200001f0: 08 00 00 00 00 00 00 00 00 00 00 00 08 00 00 00 
20000200: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
20000210: 00 00 00 00 00 00 00 00 2c 01 00 00 90 01 00 00 
20000220: 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
20000230: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
20000240: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
20000250: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
ioctl: Invalid argument
rtn=-1, errno=22
======================== 1: addr=200001c4 ========================
Pre FBIOPUT_VSCREENINFO: pattern=0
200001c0: 00 04 00 00 00 00 00 00 00 04 00 00 00 03 00 00 
200001d0: 00 00 00 00 00 00 00 00 20 00 00 00 00 00 00 00 
200001e0: 10 00 00 00 08 00 00 00 00 00 00 00 08 00 00 00 
200001f0: 08 00 00 00 00 00 00 00 00 00 00 00 08 00 00 00 
20000200: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
20000210: 00 00 00 00 00 00 00 00 2c 01 00 00 90 01 00 00 
20000220: 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
20000230: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
20000240: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
20000250: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
ioctl: Invalid argument
rtn=-1, errno=22

Walk START addr = 0x200001c0, Break pattern=1
======================== 0: addr=200001c0 ========================
Pre FBIOPUT_VSCREENINFO: pattern=1
200001c0: 01 00 00 00 00 03 00 00 00 04 00 00 00 03 00 00 
200001d0: 00 00 00 00 00 00 00 00 20 00 00 00 00 00 00 00 
200001e0: 10 00 00 00 08 00 00 00 00 00 00 00 08 00 00 00 
200001f0: 08 00 00 00 00 00 00 00 00 00 00 00 08 00 00 00 
20000200: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
20000210: 00 00 00 00 00 00 00 00 2c 01 00 00 90 01 00 00 
20000220: 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
20000230: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
20000240: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
20000250: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
ioctl: Invalid argument
rtn=-1, errno=22

...

======================== 1: addr=200001c4 ========================
Pre FBIOPUT_VSCREENINFO: pattern=7
200001c0: 00 04 00 00 07 00 00 00 00 04 00 00 00 03 00 00 
200001d0: 00 00 00 00 00 00 00 00 20 00 00 00 00 00 00 00 
200001e0: 10 00 00 00 08 00 00 00 00 00 00 00 08 00 00 00 
200001f0: 08 00 00 00 00 00 00 00 00 00 00 00 08 00 00 00 
20000200: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
20000210: 00 00 00 00 00 00 00 00 2c 01 00 00 90 01 00 00 
20000220: 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
20000230: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
20000240: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
20000250: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
ioctl: Invalid argument
rtn=-1, errno=22
[root@localhost ~]# 
</pre>
    Thank you,<br>
    George<br>
    <br>
    <div class="moz-cite-prefix">On 7/14/2020 6:27 AM, Tetsuo Handa
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:e00078d1-e5fb-a019-3036-cb182ed2e40b@i-love.sakura.ne.jp">
      <pre class="moz-quote-pre" wrap="">On 2020/07/14 16:22, Bartlomiej Zolnierkiewicz wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">How does this patch relate to:

	<a class="moz-txt-link-freetext" href="https://marc.info/?l=linux-fbdev&amp;m=159415024816722&amp;w=2">https://marc.info/?l=linux-fbdev&amp;m=159415024816722&amp;w=2</a>

?

It seems to address the same issue, I've added George and Dan to Cc:.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
George Kennedy's patch does not help for my case.

You can try a.out built from

----------
#include &lt;sys/types.h&gt;
#include &lt;sys/stat.h&gt;
#include &lt;fcntl.h&gt;
#include &lt;sys/ioctl.h&gt;
#include &lt;linux/fb.h&gt;

int main(int argc, char *argv[])
{
        const int fd = open("/dev/fb0", O_ACCMODE);
        struct fb_var_screeninfo var = { };
        ioctl(fd, FBIOGET_VSCREENINFO, &amp;var);
        var.xres = var.yres = 16;
        ioctl(fd, FBIOPUT_VSCREENINFO, &amp;var);
        return 0;
}
----------

with a fault injection patch

----------
--- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -1214,6 +1214,10 @@ static int vc_do_resize(struct tty_struct *tty, struct vc_data *vc,
 
 	if (new_screen_size &gt; KMALLOC_MAX_SIZE)
 		return -EINVAL;
+	if (!strcmp(current-&gt;comm, "a.out")) {
+		printk(KERN_INFO "Forcing memory allocation failure.\n");
+		return -ENOMEM;
+	}
 	newscreen = kzalloc(new_screen_size, GFP_USER);
 	if (!newscreen)
 		return -ENOMEM;
----------

. What my patch workarounds is cases when vc_do_resize() did not update vc-&gt;vc_{cols,rows} .
Unless vc-&gt;vc_{cols,rows} are updated by vc_do_resize() in a way that avoids integer underflow at

	unsigned int rw = info-&gt;var.xres - (vc-&gt;vc_cols*cw);
	unsigned int bh = info-&gt;var.yres - (vc-&gt;vc_rows*ch);

, this crash won't go away.

[   39.995757][ T2788] Forcing memory allocation failure.
[   39.996527][ T2788] BUG: unable to handle page fault for address: ffffa9d180d7b000
[   39.996529][ T2788] #PF: supervisor write access in kernel mode
[   39.996530][ T2788] #PF: error_code(0x0002) - not-present page
[   39.996531][ T2788] PGD 13a48c067 P4D 13a48c067 PUD 13a48d067 PMD 1324e4067 PTE 0
[   39.996547][ T2788] Oops: 0002 [#1] SMP
[   39.996550][ T2788] CPU: 2 PID: 2788 Comm: a.out Not tainted 5.8.0-rc5+ #757
[   39.996551][ T2788] Hardware name: VMware, Inc. VMware Virtual Platform/440BX Desktop Reference Platform, BIOS 6.00 02/27/2020
[   39.996555][ T2788] RIP: 0010:bitfill_aligned+0x87/0x120 [cfbfillrect]
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------4967EE9DDB85FA5DE5760002--

--===============0679935968==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0679935968==--
