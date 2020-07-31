Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 620D5234010
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 09:36:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B6C46E9F1;
	Fri, 31 Jul 2020 07:36:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690086E991
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 03:23:26 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id BF54E6A5BC16A5AFAD55;
 Fri, 31 Jul 2020 11:23:18 +0800 (CST)
Received: from [127.0.0.1] (10.174.176.211) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0;
 Fri, 31 Jul 2020 11:23:16 +0800
Subject: Re: [PATCH] vgacon: Fix an out-of-bounds in vgacon_scrollback_update()
To: Jiri Slaby <jirislaby@kernel.org>, <b.zolnierkie@samsung.com>
References: <20200713105730.550334-1-yangyingliang@huawei.com>
 <220220f1-48f7-46f6-952f-ab41fa57d6a1@kernel.org>
 <c3714d73-d5fe-c77a-e554-bb1ff4fd6980@huawei.com>
 <9aecd7ac-5060-6b8d-61f8-393431eb243f@kernel.org>
From: Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <3df26fed-5ade-df26-6417-380401b9650b@huawei.com>
Date: Fri, 31 Jul 2020 11:23:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <9aecd7ac-5060-6b8d-61f8-393431eb243f@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.174.176.211]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 31 Jul 2020 07:36:08 +0000
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?B?5byg5LqR5rW3?= <zhangyunhai@nsfocus.com>
Content-Type: multipart/mixed; boundary="===============0223218378=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0223218378==
Content-Type: multipart/alternative;
	boundary="------------95DB5BCD802867F1A99AF3F3"
Content-Language: en-US

--------------95DB5BCD802867F1A99AF3F3
Content-Type: text/plain; charset="iso-8859-2"; format=flowed
Content-Transfer-Encoding: quoted-printable


On 2020/7/30 21:38, Jiri Slaby wrote:
> On 30. 07. 20, 15:24, Yang Yingliang wrote:
>> On 2020/7/30 19:04, Jiri Slaby wrote:
>>> On 13. 07. 20, 12:57, Yang Yingliang wrote:
>>>> I got a slab-out-of-bounds report when I doing fuzz test.
>>>>
>>>> [=A0 334.989515]
>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> [=A0 334.989577] BUG: KASAN: slab-out-of-bounds in
>>>> vgacon_scroll+0x57a/0x8ed
>>>> [=A0 334.989588] Write of size 1766 at addr ffff8883de69ff3e by task=

>>>> test/2658
>>>> [=A0 334.989593]
>>>> [=A0 334.989608] CPU: 3 PID: 2658 Comm: test Not tainted
>>>> 5.7.0-rc5-00005-g152036d1379f #789
>>>> [=A0 334.989617] Hardware name: QEMU Standard PC (i440FX + PIIX, 199=
6),
>>>> BIOS rel-1.12.1-0-ga5cab58e9a3f-prebuilt.qemu.org 04/01/2014
>>>> [=A0 334.989624] Call Trace:
>>>> [=A0 334.989646]=A0 dump_stack+0xe4/0x14e
>>>> [=A0 334.989676]=A0 print_address_description.constprop.5+0x3f/0x60
>>>> [=A0 334.989699]=A0 ? vgacon_scroll+0x57a/0x8ed
>>>> [=A0 334.989710]=A0 __kasan_report.cold.8+0x92/0xaf
>>>> [=A0 334.989735]=A0 ? vgacon_scroll+0x57a/0x8ed
>>>> [=A0 334.989761]=A0 kasan_report+0x37/0x50
>>>> [=A0 334.989789]=A0 check_memory_region+0x1c1/0x1e0
>>>> [=A0 334.989806]=A0 memcpy+0x38/0x60
>>>> [=A0 334.989824]=A0 vgacon_scroll+0x57a/0x8ed
>>>> [=A0 334.989876]=A0 con_scroll+0x4ef/0x5e0
>>> ...
>>>> Because vgacon_scrollback_cur->tail plus memcpy size is greater than=

>>>> vgacon_scrollback_cur->size. Fix this by checking the memcpy size.
>>>>
>>>> Reported-by: Hulk Robot <hulkci@huawei.com>
>>>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
>>>> ---
>>>>  =A0 drivers/video/console/vgacon.c | 11 ++++++++---
>>>>  =A0 1 file changed, 8 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/video/console/vgacon.c
>>>> b/drivers/video/console/vgacon.c
>>>> index 998b0de1812f..b51ffb9a208d 100644
>>>> --- a/drivers/video/console/vgacon.c
>>>> +++ b/drivers/video/console/vgacon.c
>>>> @@ -243,6 +243,7 @@ static void vgacon_scrollback_startup(void)
>>>>  =A0 static void vgacon_scrollback_update(struct vc_data *c, int t, =
int
>>>> count)
>>>>  =A0 {
>>>>  =A0=A0=A0=A0=A0 void *p;
>>>> +=A0=A0=A0 int size;
>>>>  =A0 =A0=A0=A0=A0=A0 if (!vgacon_scrollback_cur->data ||
>>>> !vgacon_scrollback_cur->size ||
>>>>  =A0=A0=A0=A0=A0=A0=A0=A0=A0 c->vc_num !=3D fg_console)
>>>> @@ -251,13 +252,17 @@ static void vgacon_scrollback_update(struct
>>>> vc_data *c, int t, int count)
>>>>  =A0=A0=A0=A0=A0 p =3D (void *) (c->vc_origin + t * c->vc_size_row);=

>>>>  =A0 =A0=A0=A0=A0=A0 while (count--) {
>>>> +=A0=A0=A0=A0=A0=A0=A0 size =3D vgacon_scrollback_cur->size -
>>>> vgacon_scrollback_cur->tail;
>>>> +=A0=A0=A0=A0=A0=A0=A0 if (size > c->vc_size_row)
>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 size =3D c->vc_size_row;
>>>> +
>>>>  =A0=A0=A0=A0=A0=A0=A0=A0=A0 scr_memcpyw(vgacon_scrollback_cur->data=
 +
>>>>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 vgacon_scrollba=
ck_cur->tail,
>>>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 p, c->vc_size_row);
>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 p, size);
>>> Are you sure the consumer can handle split lines? As vgacon_scrolldel=
ta
>>> (soff in particular) looks to me like it doesn't.
>>>
>>> Have you tested you patch? I mean with soft scrollback on the vga
>>> console?
>> I only test the patch with the reproduce program.
> Out of curiosity, what is it doing? Resize and then scroll by \n (line
> feed)? Can you share it?

// autogenerated by syzkaller (https://github.com/google/syzkaller)

#define _GNU_SOURCE

#include <dirent.h>
#include <endian.h>
#include <errno.h>
#include <fcntl.h>
#include <signal.h>
#include <stdarg.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/prctl.h>
#include <sys/stat.h>
#include <sys/syscall.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <time.h>
#include <unistd.h>

static void sleep_ms(uint64_t ms)
{
	usleep(ms * 1000);
}

static uint64_t current_time_ms(void)
{
	struct timespec ts;
	if (clock_gettime(CLOCK_MONOTONIC, &ts))
	exit(1);
	return (uint64_t)ts.tv_sec * 1000 + (uint64_t)ts.tv_nsec / 1000000;
}

static bool write_file(const char* file, const char* what, ...)
{
	char buf[1024];
	va_list args;
	va_start(args, what);
	vsnprintf(buf, sizeof(buf), what, args);
	va_end(args);
	buf[sizeof(buf) - 1] =3D 0;
	int len =3D strlen(buf);
	int fd =3D open(file, O_WRONLY | O_CLOEXEC);
	if (fd =3D=3D -1)
		return false;
	if (write(fd, buf, len) !=3D len) {
		int err =3D errno;
		close(fd);
		errno =3D err;
		return false;
	}
	close(fd);
	return true;
}

static long syz_open_dev(volatile long a0, volatile long a1, volatile lon=
g a2)
{
	if (a0 =3D=3D 0xc || a0 =3D=3D 0xb) {
		char buf[128];
		sprintf(buf, "/dev/%s/%d:%d", a0 =3D=3D 0xc ? "char" : "block", (uint8_=
t)a1, (uint8_t)a2);
		return open(buf, O_RDWR, 0);
	} else {
		char buf[1024];
		char* hash;
strncpy(buf, (char*)a0, sizeof(buf) - 1);
		buf[sizeof(buf) - 1] =3D 0;
		while ((hash =3D strchr(buf, '#'))) {
			*hash =3D '0' + (char)(a1 % 10);
			a1 /=3D 10;
		}
		return open(buf, a2, 0);
	}
}

static void kill_and_wait(int pid, int* status)
{
	kill(-pid, SIGKILL);
	kill(pid, SIGKILL);
	int i;
	for (i =3D 0; i < 100; i++) {
		if (waitpid(-1, status, WNOHANG | __WALL) =3D=3D pid)
			return;
		usleep(1000);
	}
	DIR* dir =3D opendir("/sys/fs/fuse/connections");
	if (dir) {
		for (;;) {
			struct dirent* ent =3D readdir(dir);
			if (!ent)
				break;
			if (strcmp(ent->d_name, ".") =3D=3D 0 || strcmp(ent->d_name, "..") =3D=
=3D 0)
				continue;
			char abort[300];
			snprintf(abort, sizeof(abort), "/sys/fs/fuse/connections/%s/abort", en=
t->d_name);
			int fd =3D open(abort, O_WRONLY);
			if (fd =3D=3D -1) {
				continue;
			}
			if (write(fd, abort, 1) < 0) {
			}
			close(fd);
		}
		closedir(dir);
	} else {
	}
	while (waitpid(-1, status, __WALL) !=3D pid) {
	}
}

static void setup_test()
{
	prctl(PR_SET_PDEATHSIG, SIGKILL, 0, 0, 0);
	setpgrp();
	write_file("/proc/self/oom_score_adj", "1000");
}

static void execute_one(void);

#define WAIT_FLAGS __WALL

static void loop(void)
{
	int iter;
	for (iter =3D 0;; iter++) {
		int pid =3D fork();
		if (pid < 0)
	exit(1);
		if (pid =3D=3D 0) {
			setup_test();
			execute_one();
			exit(0);
		}
		int status =3D 0;
		uint64_t start =3D current_time_ms();
		for (;;) {
			if (waitpid(-1, &status, WNOHANG | WAIT_FLAGS) =3D=3D pid)
				break;
			sleep_ms(1);
			if (current_time_ms() - start < 5 * 1000)
				continue;
			kill_and_wait(pid, &status);
			break;
		}
	}
}

uint64_t r[1] =3D {0xffffffffffffffff};

void execute_one(void)
{
		intptr_t res =3D 0;
	res =3D syz_open_dev(0xc, 4, 1);
	if (res !=3D -1)
		r[0] =3D res;
*(uint16_t*)0x20000000 =3D 0xc;
*(uint16_t*)0x20000002 =3D 0x373;
*(uint16_t*)0x20000004 =3D 0x1442;
	syscall(__NR_ioctl, r[0], 0x5609ul, 0x20000000ul);
memcpy((void*)0x20003500, "\x7f\x45\x4c\x46\x00\x00\x00\x00\x00\x00\x00\x=
00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x38\x0=
0\x00\x00\x00\x00\x00\x00\x01\x04\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00=
\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\=
x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x=
00\x00\x00\x00\x69\x2e\x77\x3d\x64\xf5\xe4\xb9\xaf\x86\xb6\xcb\x74\x6e\xe=
0\x71\x3a\xfb\x18\x4e\xb2\xb9\x99\x36\xd4\x71\x6d\xbf\xfc\x0d\xfb\xec\x4b=
\x82\x2d\xde\xa8\xb8\x79\x34\xcc\xe8\x11\x28\x49\x27\xb5\xe6\xeb\x37\x33\=
x73\xad\x27\x6b\xfd\x68\x18\x46\x9e\x3a\x35\xd0\x5b\x6f\x2f\xd5\x8a\x88\x=
96\xd0\x65\x16\x70\x95\x10\x0f\x97\xb8\xe6\x71\x60\x87\xcb\xf2\x92\x60\x4=
b\x89\x8a\xb8\xcf\x95\x85\x67\xef\x4e\xf3\xa8\x8e\xd4\x9f\x81\x83\x0a\x85=
\x54\x45\xff\x6c\xbd\xa4\xca\x4e\xae\x3d\x65\xef\x15\x76\xa2\x90\x16\xdb\=
xe3\xc9\x9c\x78\x30\x1e\x04\x8c\x17\x17\x06\xb3\x06\xc4\x87\x12\xc3\xe2\x=
5a\xb5\x83\x8a\xe3\x1e\x7d\xe1\xf1\xdc\x95\x79\xa7\x1c\xcb\x39\xf6\x05\x1=
e\xed\xd7\xf0\xb5\xa7\xc8\xb6\xfc\x41\xf4\x2d\x3e\x67\xba\xe8\xe4\x86\xa6=
\x31\x1e\xf2\x49\xda\x11\x41\xab\xfd\xc1\x0a\xe5\x69\x6b\xdb\xad\x95\xe4\=
x53\xb9\x37\xce\x6d\xad\x22\x39\xab\xd7\x9f\xcf\xa1\xdc\x84\xd7\x3b\xc2\x=
a3\xc6\xc3\x73\xa9\xd5\x3e\xf0\x01\xff\x18\x76\xe6\x47\xf4\x1b\x6a\x96\x8=
d\xc4\x9f\xe7\xc2\x93\x8a\x3d\xf9\x9b\xfd\x79\x5b\x7d\x2d\xb4\x82\x78\x38=
\x0f\x6b\xd0\xdc\xd2\x8b\x8e\xfe\xc1\xcf\xd5\x03\x98\x86\x7e\xf3\x29\xee\=
x1c\xb7\x34\xc1\x2f\xce\x5b\x51\x29\x2b\xe4\xef\xe7\x5e\x0d\x3f\x57\x8c\x=
c9\x89\xea\x55\xa0\x65\x00\x00\x00\x00\x00\x00\x00\x6f\x7e\x76\xa2\x37\x0=
e\x3e\x0b\x83\xa2\x6a\x88\x95\xa6\xac\x75\x4b\xee\xc4\x42\x87\xfa\xfd\x91=
\x3d\x6a\x4d\x92\x10\x71\x7c\xec\xaa\x58\x90\xbf\xa7\x5c\x72\xfd\x89\x6d\=
xb3\x07\x0f\xd2\x35\xd3\xdf\x78\x32\x51\x2f\x88\x03\x0e\x1d\x1c\xd5\xf3\x=
27\xa0\xe1\xd4\xc1\x05\xf7\x2d\xd1\x31\x87\x40\x7e\x92\x11\x28\xc5\x54\xb=
8\x49\x16\x6d\xdc\x79\xed\x21\xa4\x33\x7d\xdf\x56\x94\xad\xcf\x69\xd0\xb9=
\xb4\x6b\x6a\x67\x5c\x9d\x23\x1a\xec\xf2\x73\x03\xd2\x13\xf1\xdb\xe8\xb4\=
x79\x18\xd1\x50\x49\xc1\xd5\x85\xec\x84\xcd\x37\x0b\xed\x7b\xce\x6b\x31\x=
36\x1e\xfb\x69\x9d\xa8\xc2\x66\x65\x86\x9b\x25\x97\x1d\x59\x7c\x9c\x82\xe=
5\xe4\x1b\xd7\xe7\xb7\xda\xd8\x2a\x64\x96\xaf\xa7\x84\x40\x33\x97\x7a\x5a=
\xc0\x1f\x8c\xca\x91\x12\x94\x74\xb2\x5f\x25\xd1\xf1\xa2\x17\x87\x52\x89\=
x30\x2b\x3f\xf6\x45\x58\x31\x6e\x68\xa3\x5e\xd2\xa3\x80\xf7\xf0\xaf\x03\x=
9d\x1b\x33\xe8\x4e\x11\xf4\x19\x69\x8f\xc3\x0d\x0a\x72\xa3\xab\xb7\x66\xb=
1\x3b\xc4\x29\x58\x22\x0f\xae\xfc\x68\xcc\x66\x9b\x62\x4c\xc8\xce\x7e\xdc=
\xe5\x65\xbc\xc3\xde\xdc\x6f\xe4\x81\xd4\x4a\xd7\x0f\x37\xb7\x8f\x36\x89\=
x85\x6b\x0d\xb9\xe5\x4c\xc1\xfd\xd7\x1a\xa6\xc7\x0d\xf3\x8d\xcb\x5a\x9a\x=
6a\xea\x39\xf5\xe1\x42\xc7\x8a\xdc\x2e\x61\xb1\x4f\xea\x20\xd0\x0d\x50\x0=
8\xc2\xbe\x36\xe5\xc0\x67\xe2\x43\x1d\x39\xbd\xda\x47\xa4\xb3\x59\xb3\x2d=
\x6a\x7e\x3a\xbc\xa7\x53\xf0\x46\x61\xe6\x9c\xef\xcf\xad\x50\x79\x5b\xb0\=
xd9\x40\xba\xb3\x5e\xf9\x39\xee\x9e\xe0\xfe\xfc\x59\x14\xac\x60\xcf\xcb\x=
9e\x7a\x47\x6f\xda\x4c\x09\x9e\xa1\x15\x24\x9a\x40\xf2\xe5\x34\xf4\x80\x0=
3\x63\x08\x13\xe1\xab\xa9\xc2\x59\x15\x00\xe3\xc3\xe2\xa9\x0d\x5f\x0f\xa4=
\x53\x63\xbd\x72\xdc\xc9\xc2\x13\xc0\x0a\xbd\x7c\xec\xa8\x2d\x16\xac\x65\=
xf3\x58\xca\x62\x6c\x07\xba\x01\x72\xfa\x5a\xbe\x68\xfe\x92\xbe\xa2\xc7\x=
dc\xc6\xcd\xab\x10\x58\x4a\x9d\x2e\x61\x85\x56\x9f\x0e\x74\x6c\x49\xf8\x3=
d\x43\x43\x4f\xd3\x93\xf3\x1d\xcb\x31\x4c\xf6\x78\xed\x4b\x76\x1f\x46\x58=
\x58\x05\x9a\x59\x7d\xf9\x28\x0c\x7a\x49\x04\x6c\xda\x7e\x96\xe0\x22\x90\=
x64\x0d\xfa\x8f\xbd\xf1\xdb\x74\x75\x2d\x79\xe5\x20\x38\x8f\x0a\x20\xe8\x=
09\x31\xd6\x7a\x5b\xbb\x86\x9b\x38\x6d", 897);
	syscall(__NR_write, r[0], 0x20003500ul, 0x381ul);

}
int main(void)
{
		syscall(__NR_mmap, 0x20000000ul, 0x1000000ul, 3ul, 0x32ul, -1, 0);
			loop();
	return 0;
}

>
> thanks,

--------------95DB5BCD802867F1A99AF3F3
Content-Type: text/html; charset="iso-8859-2"
Content-Transfer-Encoding: base64

PGh0bWw+DQogIDxoZWFkPg0KICAgIDxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOw0KICAgICAgY2hhcnNldD1JU08tODg1OS0yIj4NCiAgPC9o
ZWFkPg0KICA8Ym9keT4NCiAgICA8cD48YnI+DQogICAgPC9wPg0KICAgIDxkaXYgY2xhc3M9
Im1vei1jaXRlLXByZWZpeCI+T24gMjAyMC83LzMwIDIxOjM4LCBKaXJpIFNsYWJ5IHdyb3Rl
Ojxicj4NCiAgICA8L2Rpdj4NCiAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIg0KICAgICAg
Y2l0ZT0ibWlkOjlhZWNkN2FjLTUwNjAtNmI4ZC02MWY4LTM5MzQzMWViMjQzZkBrZXJuZWwu
b3JnIj4NCiAgICAgIDxwcmUgY2xhc3M9Im1vei1xdW90ZS1wcmUiIHdyYXA9IiI+T24gMzAu
IDA3LiAyMCwgMTU6MjQsIFlhbmcgWWluZ2xpYW5nIHdyb3RlOg0KPC9wcmU+DQogICAgICA8
YmxvY2txdW90ZSB0eXBlPSJjaXRlIj4NCiAgICAgICAgPHByZSBjbGFzcz0ibW96LXF1b3Rl
LXByZSIgd3JhcD0iIj4NCk9uIDIwMjAvNy8zMCAxOTowNCwgSmlyaSBTbGFieSB3cm90ZToN
CjwvcHJlPg0KICAgICAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIj4NCiAgICAgICAgICA8
cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPk9uIDEzLiAwNy4gMjAsIDEyOjU3
LCBZYW5nIFlpbmdsaWFuZyB3cm90ZToNCjwvcHJlPg0KICAgICAgICAgIDxibG9ja3F1b3Rl
IHR5cGU9ImNpdGUiPg0KICAgICAgICAgICAgPHByZSBjbGFzcz0ibW96LXF1b3RlLXByZSIg
d3JhcD0iIj5JIGdvdCBhIHNsYWItb3V0LW9mLWJvdW5kcyByZXBvcnQgd2hlbiBJIGRvaW5n
IGZ1enogdGVzdC4NCg0KW6AgMzM0Ljk4OTUxNV0NCj09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KW6AgMzM0Ljk4
OTU3N10gQlVHOiBLQVNBTjogc2xhYi1vdXQtb2YtYm91bmRzIGluDQp2Z2Fjb25fc2Nyb2xs
KzB4NTdhLzB4OGVkDQpboCAzMzQuOTg5NTg4XSBXcml0ZSBvZiBzaXplIDE3NjYgYXQgYWRk
ciBmZmZmODg4M2RlNjlmZjNlIGJ5IHRhc2sNCnRlc3QvMjY1OA0KW6AgMzM0Ljk4OTU5M10N
ClugIDMzNC45ODk2MDhdIENQVTogMyBQSUQ6IDI2NTggQ29tbTogdGVzdCBOb3QgdGFpbnRl
ZA0KNS43LjAtcmM1LTAwMDA1LWcxNTIwMzZkMTM3OWYgIzc4OQ0KW6AgMzM0Ljk4OTYxN10g
SGFyZHdhcmUgbmFtZTogUUVNVSBTdGFuZGFyZCBQQyAoaTQ0MEZYICsgUElJWCwgMTk5Niks
DQpCSU9TIHJlbC0xLjEyLjEtMC1nYTVjYWI1OGU5YTNmLXByZWJ1aWx0LnFlbXUub3JnIDA0
LzAxLzIwMTQNClugIDMzNC45ODk2MjRdIENhbGwgVHJhY2U6DQpboCAzMzQuOTg5NjQ2XaAg
ZHVtcF9zdGFjaysweGU0LzB4MTRlDQpboCAzMzQuOTg5Njc2XaAgcHJpbnRfYWRkcmVzc19k
ZXNjcmlwdGlvbi5jb25zdHByb3AuNSsweDNmLzB4NjANClugIDMzNC45ODk2OTldoCA/IHZn
YWNvbl9zY3JvbGwrMHg1N2EvMHg4ZWQNClugIDMzNC45ODk3MTBdoCBfX2thc2FuX3JlcG9y
dC5jb2xkLjgrMHg5Mi8weGFmDQpboCAzMzQuOTg5NzM1XaAgPyB2Z2Fjb25fc2Nyb2xsKzB4
NTdhLzB4OGVkDQpboCAzMzQuOTg5NzYxXaAga2FzYW5fcmVwb3J0KzB4MzcvMHg1MA0KW6Ag
MzM0Ljk4OTc4OV2gIGNoZWNrX21lbW9yeV9yZWdpb24rMHgxYzEvMHgxZTANClugIDMzNC45
ODk4MDZdoCBtZW1jcHkrMHgzOC8weDYwDQpboCAzMzQuOTg5ODI0XaAgdmdhY29uX3Njcm9s
bCsweDU3YS8weDhlZA0KW6AgMzM0Ljk4OTg3Nl2gIGNvbl9zY3JvbGwrMHg0ZWYvMHg1ZTAN
CjwvcHJlPg0KICAgICAgICAgIDwvYmxvY2txdW90ZT4NCiAgICAgICAgICA8cHJlIGNsYXNz
PSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPi4uLg0KPC9wcmU+DQogICAgICAgICAgPGJsb2Nr
cXVvdGUgdHlwZT0iY2l0ZSI+DQogICAgICAgICAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUt
cHJlIiB3cmFwPSIiPkJlY2F1c2UgdmdhY29uX3Njcm9sbGJhY2tfY3VyLSZndDt0YWlsIHBs
dXMgbWVtY3B5IHNpemUgaXMgZ3JlYXRlciB0aGFuDQp2Z2Fjb25fc2Nyb2xsYmFja19jdXIt
Jmd0O3NpemUuIEZpeCB0aGlzIGJ5IGNoZWNraW5nIHRoZSBtZW1jcHkgc2l6ZS4NCg0KUmVw
b3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIg
aHJlZj0ibWFpbHRvOmh1bGtjaUBodWF3ZWkuY29tIj4mbHQ7aHVsa2NpQGh1YXdlaS5jb20m
Z3Q7PC9hPg0KU2lnbmVkLW9mZi1ieTogWWFuZyBZaW5nbGlhbmcgPGEgY2xhc3M9Im1vei10
eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOnlhbmd5aW5nbGlhbmdAaHVhd2VpLmNv
bSI+Jmx0O3lhbmd5aW5nbGlhbmdAaHVhd2VpLmNvbSZndDs8L2E+DQotLS0NCqAgZHJpdmVy
cy92aWRlby9jb25zb2xlL3ZnYWNvbi5jIHwgMTEgKysrKysrKystLS0NCqAgMSBmaWxlIGNo
YW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBh
L2RyaXZlcnMvdmlkZW8vY29uc29sZS92Z2Fjb24uYw0KYi9kcml2ZXJzL3ZpZGVvL2NvbnNv
bGUvdmdhY29uLmMNCmluZGV4IDk5OGIwZGUxODEyZi4uYjUxZmZiOWEyMDhkIDEwMDY0NA0K
LS0tIGEvZHJpdmVycy92aWRlby9jb25zb2xlL3ZnYWNvbi5jDQorKysgYi9kcml2ZXJzL3Zp
ZGVvL2NvbnNvbGUvdmdhY29uLmMNCkBAIC0yNDMsNiArMjQzLDcgQEAgc3RhdGljIHZvaWQg
dmdhY29uX3Njcm9sbGJhY2tfc3RhcnR1cCh2b2lkKQ0KoCBzdGF0aWMgdm9pZCB2Z2Fjb25f
c2Nyb2xsYmFja191cGRhdGUoc3RydWN0IHZjX2RhdGEgKmMsIGludCB0LCBpbnQNCmNvdW50
KQ0KoCB7DQqgoKCgoCB2b2lkICpwOw0KK6CgoCBpbnQgc2l6ZTsNCqAgoKCgoKAgaWYgKCF2
Z2Fjb25fc2Nyb2xsYmFja19jdXItJmd0O2RhdGEgfHwNCiF2Z2Fjb25fc2Nyb2xsYmFja19j
dXItJmd0O3NpemUgfHwNCqCgoKCgoKCgoCBjLSZndDt2Y19udW0gIT0gZmdfY29uc29sZSkN
CkBAIC0yNTEsMTMgKzI1MiwxNyBAQCBzdGF0aWMgdm9pZCB2Z2Fjb25fc2Nyb2xsYmFja191
cGRhdGUoc3RydWN0DQp2Y19kYXRhICpjLCBpbnQgdCwgaW50IGNvdW50KQ0KoKCgoKAgcCA9
ICh2b2lkICopIChjLSZndDt2Y19vcmlnaW4gKyB0ICogYy0mZ3Q7dmNfc2l6ZV9yb3cpOw0K
oCCgoKCgoCB3aGlsZSAoY291bnQtLSkgew0KK6CgoKCgoKAgc2l6ZSA9IHZnYWNvbl9zY3Jv
bGxiYWNrX2N1ci0mZ3Q7c2l6ZSAtDQp2Z2Fjb25fc2Nyb2xsYmFja19jdXItJmd0O3RhaWw7
DQoroKCgoKCgoCBpZiAoc2l6ZSAmZ3Q7IGMtJmd0O3ZjX3NpemVfcm93KQ0KK6CgoKCgoKCg
oKCgIHNpemUgPSBjLSZndDt2Y19zaXplX3JvdzsNCisNCqCgoKCgoKCgoCBzY3JfbWVtY3B5
dyh2Z2Fjb25fc2Nyb2xsYmFja19jdXItJmd0O2RhdGEgKw0KoKCgoKCgoKCgoKCgoKCgoKAg
dmdhY29uX3Njcm9sbGJhY2tfY3VyLSZndDt0YWlsLA0KLaCgoKCgoKCgoKCgoKCgoCBwLCBj
LSZndDt2Y19zaXplX3Jvdyk7DQoroKCgoKCgoKCgoKCgoKCgIHAsIHNpemUpOw0KPC9wcmU+
DQogICAgICAgICAgPC9ibG9ja3F1b3RlPg0KICAgICAgICAgIDxwcmUgY2xhc3M9Im1vei1x
dW90ZS1wcmUiIHdyYXA9IiI+QXJlIHlvdSBzdXJlIHRoZSBjb25zdW1lciBjYW4gaGFuZGxl
IHNwbGl0IGxpbmVzPyBBcyB2Z2Fjb25fc2Nyb2xsZGVsdGENCihzb2ZmIGluIHBhcnRpY3Vs
YXIpIGxvb2tzIHRvIG1lIGxpa2UgaXQgZG9lc24ndC4NCg0KSGF2ZSB5b3UgdGVzdGVkIHlv
dSBwYXRjaD8gSSBtZWFuIHdpdGggc29mdCBzY3JvbGxiYWNrIG9uIHRoZSB2Z2ENCmNvbnNv
bGU/DQo8L3ByZT4NCiAgICAgICAgPC9ibG9ja3F1b3RlPg0KICAgICAgICA8cHJlIGNsYXNz
PSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPg0KSSBvbmx5IHRlc3QgdGhlIHBhdGNoIHdpdGgg
dGhlIHJlcHJvZHVjZSBwcm9ncmFtLg0KPC9wcmU+DQogICAgICA8L2Jsb2NrcXVvdGU+DQog
ICAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPg0KT3V0IG9mIGN1cmlv
c2l0eSwgd2hhdCBpcyBpdCBkb2luZz8gUmVzaXplIGFuZCB0aGVuIHNjcm9sbCBieSBcbiAo
bGluZQ0KZmVlZCk/IENhbiB5b3Ugc2hhcmUgaXQ/PC9wcmU+DQogICAgPC9ibG9ja3F1b3Rl
Pg0KICAgIDxicj4NCiAgICA8cHJlIHN0eWxlPSJjb2xvcjogcmdiKDAsIDAsIDApOyBmb250
LXN0eWxlOiBub3JtYWw7IGZvbnQtdmFyaWFudC1saWdhdHVyZXM6IG5vcm1hbDsgZm9udC12
YXJpYW50LWNhcHM6IG5vcm1hbDsgZm9udC13ZWlnaHQ6IDQwMDsgbGV0dGVyLXNwYWNpbmc6
IG5vcm1hbDsgb3JwaGFuczogMjsgdGV4dC1hbGlnbjogc3RhcnQ7IHRleHQtaW5kZW50OiAw
cHg7IHRleHQtdHJhbnNmb3JtOiBub25lOyB3aWRvd3M6IDI7IHdvcmQtc3BhY2luZzogMHB4
OyAtd2Via2l0LXRleHQtc3Ryb2tlLXdpZHRoOiAwcHg7IHRleHQtZGVjb3JhdGlvbi1zdHls
ZTogaW5pdGlhbDsgdGV4dC1kZWNvcmF0aW9uLWNvbG9yOiBpbml0aWFsOyBvdmVyZmxvdy13
cmFwOiBicmVhay13b3JkOyB3aGl0ZS1zcGFjZTogcHJlLXdyYXA7Ij4vLyBhdXRvZ2VuZXJh
dGVkIGJ5IHN5emthbGxlciAoPGEgY2xhc3M9Im1vei10eHQtbGluay1mcmVldGV4dCIgaHJl
Zj0iaHR0cHM6Ly9naXRodWIuY29tL2dvb2dsZS9zeXprYWxsZXIiPmh0dHBzOi8vZ2l0aHVi
LmNvbS9nb29nbGUvc3l6a2FsbGVyPC9hPikNCg0KI2RlZmluZSBfR05VX1NPVVJDRSANCg0K
I2luY2x1ZGUgJmx0O2RpcmVudC5oJmd0Ow0KI2luY2x1ZGUgJmx0O2VuZGlhbi5oJmd0Ow0K
I2luY2x1ZGUgJmx0O2Vycm5vLmgmZ3Q7DQojaW5jbHVkZSAmbHQ7ZmNudGwuaCZndDsNCiNp
bmNsdWRlICZsdDtzaWduYWwuaCZndDsNCiNpbmNsdWRlICZsdDtzdGRhcmcuaCZndDsNCiNp
bmNsdWRlICZsdDtzdGRib29sLmgmZ3Q7DQojaW5jbHVkZSAmbHQ7c3RkaW50LmgmZ3Q7DQoj
aW5jbHVkZSAmbHQ7c3RkaW8uaCZndDsNCiNpbmNsdWRlICZsdDtzdGRsaWIuaCZndDsNCiNp
bmNsdWRlICZsdDtzdHJpbmcuaCZndDsNCiNpbmNsdWRlICZsdDtzeXMvcHJjdGwuaCZndDsN
CiNpbmNsdWRlICZsdDtzeXMvc3RhdC5oJmd0Ow0KI2luY2x1ZGUgJmx0O3N5cy9zeXNjYWxs
LmgmZ3Q7DQojaW5jbHVkZSAmbHQ7c3lzL3R5cGVzLmgmZ3Q7DQojaW5jbHVkZSAmbHQ7c3lz
L3dhaXQuaCZndDsNCiNpbmNsdWRlICZsdDt0aW1lLmgmZ3Q7DQojaW5jbHVkZSAmbHQ7dW5p
c3RkLmgmZ3Q7DQoNCnN0YXRpYyB2b2lkIHNsZWVwX21zKHVpbnQ2NF90IG1zKQ0Kew0KCXVz
bGVlcChtcyAqIDEwMDApOw0KfQ0KDQpzdGF0aWMgdWludDY0X3QgY3VycmVudF90aW1lX21z
KHZvaWQpDQp7DQoJc3RydWN0IHRpbWVzcGVjIHRzOw0KCWlmIChjbG9ja19nZXR0aW1lKENM
T0NLX01PTk9UT05JQywgJmFtcDt0cykpDQoJZXhpdCgxKTsNCglyZXR1cm4gKHVpbnQ2NF90
KXRzLnR2X3NlYyAqIDEwMDAgKyAodWludDY0X3QpdHMudHZfbnNlYyAvIDEwMDAwMDA7DQp9
DQoNCnN0YXRpYyBib29sIHdyaXRlX2ZpbGUoY29uc3QgY2hhciogZmlsZSwgY29uc3QgY2hh
ciogd2hhdCwgLi4uKQ0Kew0KCWNoYXIgYnVmWzEwMjRdOw0KCXZhX2xpc3QgYXJnczsNCgl2
YV9zdGFydChhcmdzLCB3aGF0KTsNCgl2c25wcmludGYoYnVmLCBzaXplb2YoYnVmKSwgd2hh
dCwgYXJncyk7DQoJdmFfZW5kKGFyZ3MpOw0KCWJ1ZltzaXplb2YoYnVmKSAtIDFdID0gMDsN
CglpbnQgbGVuID0gc3RybGVuKGJ1Zik7DQoJaW50IGZkID0gb3BlbihmaWxlLCBPX1dST05M
WSB8IE9fQ0xPRVhFQyk7DQoJaWYgKGZkID09IC0xKQ0KCQlyZXR1cm4gZmFsc2U7DQoJaWYg
KHdyaXRlKGZkLCBidWYsIGxlbikgIT0gbGVuKSB7DQoJCWludCBlcnIgPSBlcnJubzsNCgkJ
Y2xvc2UoZmQpOw0KCQllcnJubyA9IGVycjsNCgkJcmV0dXJuIGZhbHNlOw0KCX0NCgljbG9z
ZShmZCk7DQoJcmV0dXJuIHRydWU7DQp9DQoNCnN0YXRpYyBsb25nIHN5el9vcGVuX2Rldih2
b2xhdGlsZSBsb25nIGEwLCB2b2xhdGlsZSBsb25nIGExLCB2b2xhdGlsZSBsb25nIGEyKQ0K
ew0KCWlmIChhMCA9PSAweGMgfHwgYTAgPT0gMHhiKSB7DQoJCWNoYXIgYnVmWzEyOF07DQoJ
CXNwcmludGYoYnVmLCAiL2Rldi8lcy8lZDolZCIsIGEwID09IDB4YyA/ICJjaGFyIiA6ICJi
bG9jayIsICh1aW50OF90KWExLCAodWludDhfdClhMik7DQoJCXJldHVybiBvcGVuKGJ1Ziwg
T19SRFdSLCAwKTsNCgl9IGVsc2Ugew0KCQljaGFyIGJ1ZlsxMDI0XTsNCgkJY2hhciogaGFz
aDsNCnN0cm5jcHkoYnVmLCAoY2hhciopYTAsIHNpemVvZihidWYpIC0gMSk7DQoJCWJ1Zltz
aXplb2YoYnVmKSAtIDFdID0gMDsNCgkJd2hpbGUgKChoYXNoID0gc3RyY2hyKGJ1ZiwgJyMn
KSkpIHsNCgkJCSpoYXNoID0gJzAnICsgKGNoYXIpKGExICUgMTApOw0KCQkJYTEgLz0gMTA7
DQoJCX0NCgkJcmV0dXJuIG9wZW4oYnVmLCBhMiwgMCk7DQoJfQ0KfQ0KDQpzdGF0aWMgdm9p
ZCBraWxsX2FuZF93YWl0KGludCBwaWQsIGludCogc3RhdHVzKQ0Kew0KCWtpbGwoLXBpZCwg
U0lHS0lMTCk7DQoJa2lsbChwaWQsIFNJR0tJTEwpOw0KCWludCBpOw0KCWZvciAoaSA9IDA7
IGkgJmx0OyAxMDA7IGkrKykgew0KCQlpZiAod2FpdHBpZCgtMSwgc3RhdHVzLCBXTk9IQU5H
IHwgX19XQUxMKSA9PSBwaWQpDQoJCQlyZXR1cm47DQoJCXVzbGVlcCgxMDAwKTsNCgl9DQoJ
RElSKiBkaXIgPSBvcGVuZGlyKCIvc3lzL2ZzL2Z1c2UvY29ubmVjdGlvbnMiKTsNCglpZiAo
ZGlyKSB7DQoJCWZvciAoOzspIHsNCgkJCXN0cnVjdCBkaXJlbnQqIGVudCA9IHJlYWRkaXIo
ZGlyKTsNCgkJCWlmICghZW50KQ0KCQkJCWJyZWFrOw0KCQkJaWYgKHN0cmNtcChlbnQtJmd0
O2RfbmFtZSwgIi4iKSA9PSAwIHx8IHN0cmNtcChlbnQtJmd0O2RfbmFtZSwgIi4uIikgPT0g
MCkNCgkJCQljb250aW51ZTsNCgkJCWNoYXIgYWJvcnRbMzAwXTsNCgkJCXNucHJpbnRmKGFi
b3J0LCBzaXplb2YoYWJvcnQpLCAiL3N5cy9mcy9mdXNlL2Nvbm5lY3Rpb25zLyVzL2Fib3J0
IiwgZW50LSZndDtkX25hbWUpOw0KCQkJaW50IGZkID0gb3BlbihhYm9ydCwgT19XUk9OTFkp
Ow0KCQkJaWYgKGZkID09IC0xKSB7DQoJCQkJY29udGludWU7DQoJCQl9DQoJCQlpZiAod3Jp
dGUoZmQsIGFib3J0LCAxKSAmbHQ7IDApIHsNCgkJCX0NCgkJCWNsb3NlKGZkKTsNCgkJfQ0K
CQljbG9zZWRpcihkaXIpOw0KCX0gZWxzZSB7DQoJfQ0KCXdoaWxlICh3YWl0cGlkKC0xLCBz
dGF0dXMsIF9fV0FMTCkgIT0gcGlkKSB7DQoJfQ0KfQ0KDQpzdGF0aWMgdm9pZCBzZXR1cF90
ZXN0KCkNCnsNCglwcmN0bChQUl9TRVRfUERFQVRIU0lHLCBTSUdLSUxMLCAwLCAwLCAwKTsN
CglzZXRwZ3JwKCk7DQoJd3JpdGVfZmlsZSgiL3Byb2Mvc2VsZi9vb21fc2NvcmVfYWRqIiwg
IjEwMDAiKTsNCn0NCg0Kc3RhdGljIHZvaWQgZXhlY3V0ZV9vbmUodm9pZCk7DQoNCiNkZWZp
bmUgV0FJVF9GTEFHUyBfX1dBTEwNCg0Kc3RhdGljIHZvaWQgbG9vcCh2b2lkKQ0Kew0KCWlu
dCBpdGVyOw0KCWZvciAoaXRlciA9IDA7OyBpdGVyKyspIHsNCgkJaW50IHBpZCA9IGZvcmso
KTsNCgkJaWYgKHBpZCAmbHQ7IDApDQoJZXhpdCgxKTsNCgkJaWYgKHBpZCA9PSAwKSB7DQoJ
CQlzZXR1cF90ZXN0KCk7DQoJCQlleGVjdXRlX29uZSgpOw0KCQkJZXhpdCgwKTsNCgkJfQ0K
CQlpbnQgc3RhdHVzID0gMDsNCgkJdWludDY0X3Qgc3RhcnQgPSBjdXJyZW50X3RpbWVfbXMo
KTsNCgkJZm9yICg7Oykgew0KCQkJaWYgKHdhaXRwaWQoLTEsICZhbXA7c3RhdHVzLCBXTk9I
QU5HIHwgV0FJVF9GTEFHUykgPT0gcGlkKQ0KCQkJCWJyZWFrOw0KCQkJc2xlZXBfbXMoMSk7
DQoJCQlpZiAoY3VycmVudF90aW1lX21zKCkgLSBzdGFydCAmbHQ7IDUgKiAxMDAwKQ0KCQkJ
CWNvbnRpbnVlOw0KCQkJa2lsbF9hbmRfd2FpdChwaWQsICZhbXA7c3RhdHVzKTsNCgkJCWJy
ZWFrOw0KCQl9DQoJfQ0KfQ0KDQp1aW50NjRfdCByWzFdID0gezB4ZmZmZmZmZmZmZmZmZmZm
Zn07DQoNCnZvaWQgZXhlY3V0ZV9vbmUodm9pZCkNCnsNCgkJaW50cHRyX3QgcmVzID0gMDsN
CglyZXMgPSBzeXpfb3Blbl9kZXYoMHhjLCA0LCAxKTsNCglpZiAocmVzICE9IC0xKQ0KCQly
WzBdID0gcmVzOw0KKih1aW50MTZfdCopMHgyMDAwMDAwMCA9IDB4YzsNCioodWludDE2X3Qq
KTB4MjAwMDAwMDIgPSAweDM3MzsNCioodWludDE2X3QqKTB4MjAwMDAwMDQgPSAweDE0NDI7
DQoJc3lzY2FsbChfX05SX2lvY3RsLCByWzBdLCAweDU2MDl1bCwgMHgyMDAwMDAwMHVsKTsN
Cm1lbWNweSgodm9pZCopMHgyMDAwMzUwMCwgIlx4N2ZceDQ1XHg0Y1x4NDZceDAwXHgwMFx4
MDBceDAwXHgwMFx4MDBceDAwXHgwMFx4MDBceDAwXHgwMFx4MDBceDAwXHgwMFx4MDBceDAw
XHgwMFx4MDBceDAwXHgwMFx4MDBceDAwXHgwMFx4MjBceDM4XHgwMFx4MDBceDAwXHgwMFx4
MDBceDAwXHgwMFx4MDFceDA0XHgwMFx4MDBceDAwXHgwMFx4MjBceDAwXHgwMFx4MDBceDAw
XHgwMFx4MDBceDAwXHgwMFx4MDBceDAwXHgwMFx4MDBceDAwXHgwMFx4MDBceDAwXHgwMFx4
MDBceDAwXHgwMFx4MDBceDAwXHgwMFx4MDBceDAwXHgwMFx4MDBceDAwXHgwMFx4MDBceDAw
XHgwMFx4MDBceDAwXHgwMFx4MDBceDAwXHgwMFx4MDBceDAwXHgwMFx4MDBceDAwXHgwMFx4
MDBceDY5XHgyZVx4NzdceDNkXHg2NFx4ZjVceGU0XHhiOVx4YWZceDg2XHhiNlx4Y2JceDc0
XHg2ZVx4ZTBceDcxXHgzYVx4ZmJceDE4XHg0ZVx4YjJceGI5XHg5OVx4MzZceGQ0XHg3MVx4
NmRceGJmXHhmY1x4MGRceGZiXHhlY1x4NGJceDgyXHgyZFx4ZGVceGE4XHhiOFx4NzlceDM0
XHhjY1x4ZThceDExXHgyOFx4NDlceDI3XHhiNVx4ZTZceGViXHgzN1x4MzNceDczXHhhZFx4
MjdceDZiXHhmZFx4NjhceDE4XHg0Nlx4OWVceDNhXHgzNVx4ZDBceDViXHg2Zlx4MmZceGQ1
XHg4YVx4ODhceDk2XHhkMFx4NjVceDE2XHg3MFx4OTVceDEwXHgwZlx4OTdceGI4XHhlNlx4
NzFceDYwXHg4N1x4Y2JceGYyXHg5Mlx4NjBceDRiXHg4OVx4OGFceGI4XHhjZlx4OTVceDg1
XHg2N1x4ZWZceDRlXHhmM1x4YThceDhlXHhkNFx4OWZceDgxXHg4M1x4MGFceDg1XHg1NFx4
NDVceGZmXHg2Y1x4YmRceGE0XHhjYVx4NGVceGFlXHgzZFx4NjVceGVmXHgxNVx4NzZceGEy
XHg5MFx4MTZceGRiXHhlM1x4YzlceDljXHg3OFx4MzBceDFlXHgwNFx4OGNceDE3XHgxN1x4
MDZceGIzXHgwNlx4YzRceDg3XHgxMlx4YzNceGUyXHg1YVx4YjVceDgzXHg4YVx4ZTNceDFl
XHg3ZFx4ZTFceGYxXHhkY1x4OTVceDc5XHhhN1x4MWNceGNiXHgzOVx4ZjZceDA1XHgxZVx4
ZWRceGQ3XHhmMFx4YjVceGE3XHhjOFx4YjZceGZjXHg0MVx4ZjRceDJkXHgzZVx4NjdceGJh
XHhlOFx4ZTRceDg2XHhhNlx4MzFceDFlXHhmMlx4NDlceGRhXHgxMVx4NDFceGFiXHhmZFx4
YzFceDBhXHhlNVx4NjlceDZiXHhkYlx4YWRceDk1XHhlNFx4NTNceGI5XHgzN1x4Y2VceDZk
XHhhZFx4MjJceDM5XHhhYlx4ZDdceDlmXHhjZlx4YTFceGRjXHg4NFx4ZDdceDNiXHhjMlx4
YTNceGM2XHhjM1x4NzNceGE5XHhkNVx4M2VceGYwXHgwMVx4ZmZceDE4XHg3Nlx4ZTZceDQ3
XHhmNFx4MWJceDZhXHg5Nlx4OGRceGM0XHg5Zlx4ZTdceGMyXHg5M1x4OGFceDNkXHhmOVx4
OWJceGZkXHg3OVx4NWJceDdkXHgyZFx4YjRceDgyXHg3OFx4MzhceDBmXHg2Ylx4ZDBceGRj
XHhkMlx4OGJceDhlXHhmZVx4YzFceGNmXHhkNVx4MDNceDk4XHg4Nlx4N2VceGYzXHgyOVx4
ZWVceDFjXHhiN1x4MzRceGMxXHgyZlx4Y2VceDViXHg1MVx4MjlceDJiXHhlNFx4ZWZceGU3
XHg1ZVx4MGRceDNmXHg1N1x4OGNceGM5XHg4OVx4ZWFceDU1XHhhMFx4NjVceDAwXHgwMFx4
MDBceDAwXHgwMFx4MDBceDAwXHg2Zlx4N2VceDc2XHhhMlx4MzdceDBlXHgzZVx4MGJceDgz
XHhhMlx4NmFceDg4XHg5NVx4YTZceGFjXHg3NVx4NGJceGVlXHhjNFx4NDJceDg3XHhmYVx4
ZmRceDkxXHgzZFx4NmFceDRkXHg5Mlx4MTBceDcxXHg3Y1x4ZWNceGFhXHg1OFx4OTBceGJm
XHhhN1x4NWNceDcyXHhmZFx4ODlceDZkXHhiM1x4MDdceDBmXHhkMlx4MzVceGQzXHhkZlx4
NzhceDMyXHg1MVx4MmZceDg4XHgwM1x4MGVceDFkXHgxY1x4ZDVceGYzXHgyN1x4YTBceGUx
XHhkNFx4YzFceDA1XHhmN1x4MmRceGQxXHgzMVx4ODdceDQwXHg3ZVx4OTJceDExXHgyOFx4
YzVceDU0XHhiOFx4NDlceDE2XHg2ZFx4ZGNceDc5XHhlZFx4MjFceGE0XHgzM1x4N2RceGRm
XHg1Nlx4OTRceGFkXHhjZlx4NjlceGQwXHhiOVx4YjRceDZiXHg2YVx4NjdceDVjXHg5ZFx4
MjNceDFhXHhlY1x4ZjJceDczXHgwM1x4ZDJceDEzXHhmMVx4ZGJceGU4XHhiNFx4NzlceDE4
XHhkMVx4NTBceDQ5XHhjMVx4ZDVceDg1XHhlY1x4ODRceGNkXHgzN1x4MGJceGVkXHg3Ylx4
Y2VceDZiXHgzMVx4MzZceDFlXHhmYlx4NjlceDlkXHhhOFx4YzJceDY2XHg2NVx4ODZceDli
XHgyNVx4OTdceDFkXHg1OVx4N2NceDljXHg4Mlx4ZTVceGU0XHgxYlx4ZDdceGU3XHhiN1x4
ZGFceGQ4XHgyYVx4NjRceDk2XHhhZlx4YTdceDg0XHg0MFx4MzNceDk3XHg3YVx4NWFceGMw
XHgxZlx4OGNceGNhXHg5MVx4MTJceDk0XHg3NFx4YjJceDVmXHgyNVx4ZDFceGYxXHhhMlx4
MTdceDg3XHg1Mlx4ODlceDMwXHgyYlx4M2ZceGY2XHg0NVx4NThceDMxXHg2ZVx4NjhceGEz
XHg1ZVx4ZDJceGEzXHg4MFx4ZjdceGYwXHhhZlx4MDNceDlkXHgxYlx4MzNceGU4XHg0ZVx4
MTFceGY0XHgxOVx4NjlceDhmXHhjM1x4MGRceDBhXHg3Mlx4YTNceGFiXHhiN1x4NjZceGIx
XHgzYlx4YzRceDI5XHg1OFx4MjJceDBmXHhhZVx4ZmNceDY4XHhjY1x4NjZceDliXHg2Mlx4
NGNceGM4XHhjZVx4N2VceGRjXHhlNVx4NjVceGJjXHhjM1x4ZGVceGRjXHg2Zlx4ZTRceDgx
XHhkNFx4NGFceGQ3XHgwZlx4MzdceGI3XHg4Zlx4MzZceDg5XHg4NVx4NmJceDBkXHhiOVx4
ZTVceDRjXHhjMVx4ZmRceGQ3XHgxYVx4YTZceGM3XHgwZFx4ZjNceDhkXHhjYlx4NWFceDlh
XHg2YVx4ZWFceDM5XHhmNVx4ZTFceDQyXHhjN1x4OGFceGRjXHgyZVx4NjFceGIxXHg0Zlx4
ZWFceDIwXHhkMFx4MGRceDUwXHgwOFx4YzJceGJlXHgzNlx4ZTVceGMwXHg2N1x4ZTJceDQz
XHgxZFx4MzlceGJkXHhkYVx4NDdceGE0XHhiM1x4NTlceGIzXHgyZFx4NmFceDdlXHgzYVx4
YmNceGE3XHg1M1x4ZjBceDQ2XHg2MVx4ZTZceDljXHhlZlx4Y2ZceGFkXHg1MFx4NzlceDVi
XHhiMFx4ZDlceDQwXHhiYVx4YjNceDVlXHhmOVx4MzlceGVlXHg5ZVx4ZTBceGZlXHhmY1x4
NTlceDE0XHhhY1x4NjBceGNmXHhjYlx4OWVceDdhXHg0N1x4NmZceGRhXHg0Y1x4MDlceDll
XHhhMVx4MTVceDI0XHg5YVx4NDBceGYyXHhlNVx4MzRceGY0XHg4MFx4MDNceDYzXHgwOFx4
MTNceGUxXHhhYlx4YTlceGMyXHg1OVx4MTVceDAwXHhlM1x4YzNceGUyXHhhOVx4MGRceDVm
XHgwZlx4YTRceDUzXHg2M1x4YmRceDcyXHhkY1x4YzlceGMyXHgxM1x4YzBceDBhXHhiZFx4
N2NceGVjXHhhOFx4MmRceDE2XHhhY1x4NjVceGYzXHg1OFx4Y2FceDYyXHg2Y1x4MDdceGJh
XHgwMVx4NzJceGZhXHg1YVx4YmVceDY4XHhmZVx4OTJceGJlXHhhMlx4YzdceGRjXHhjNlx4
Y2RceGFiXHgxMFx4NThceDRhXHg5ZFx4MmVceDYxXHg4NVx4NTZceDlmXHgwZVx4NzRceDZj
XHg0OVx4ZjhceDNkXHg0M1x4NDNceDRmXHhkM1x4OTNceGYzXHgxZFx4Y2JceDMxXHg0Y1x4
ZjZceDc4XHhlZFx4NGJceDc2XHgxZlx4NDZceDU4XHg1OFx4MDVceDlhXHg1OVx4N2RceGY5
XHgyOFx4MGNceDdhXHg0OVx4MDRceDZjXHhkYVx4N2VceDk2XHhlMFx4MjJceDkwXHg2NFx4
MGRceGZhXHg4Zlx4YmRceGYxXHhkYlx4NzRceDc1XHgyZFx4NzlceGU1XHgyMFx4MzhceDhm
XHgwYVx4MjBceGU4XHgwOVx4MzFceGQ2XHg3YVx4NWJceGJiXHg4Nlx4OWJceDM4XHg2ZCIs
IDg5Nyk7DQoJc3lzY2FsbChfX05SX3dyaXRlLCByWzBdLCAweDIwMDAzNTAwdWwsIDB4Mzgx
dWwpOw0KDQp9DQppbnQgbWFpbih2b2lkKQ0Kew0KCQlzeXNjYWxsKF9fTlJfbW1hcCwgMHgy
MDAwMDAwMHVsLCAweDEwMDAwMDB1bCwgM3VsLCAweDMydWwsIC0xLCAwKTsNCgkJCWxvb3Ao
KTsNCglyZXR1cm4gMDsNCn08L3ByZT4NCiAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIg0K
ICAgICAgY2l0ZT0ibWlkOjlhZWNkN2FjLTUwNjAtNmI4ZC02MWY4LTM5MzQzMWViMjQzZkBr
ZXJuZWwub3JnIj4NCiAgICAgIDxwcmUgY2xhc3M9Im1vei1xdW90ZS1wcmUiIHdyYXA9IiI+
DQoNCnRoYW5rcywNCjwvcHJlPg0KICAgIDwvYmxvY2txdW90ZT4NCiAgPC9ib2R5Pg0KPC9o
dG1sPg0K
--------------95DB5BCD802867F1A99AF3F3--

--===============0223218378==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0223218378==--
