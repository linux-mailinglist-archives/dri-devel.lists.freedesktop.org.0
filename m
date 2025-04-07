Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CE4A7E44F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 17:28:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EECA810E4F3;
	Mon,  7 Apr 2025 15:28:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47DF410E521;
 Mon,  7 Apr 2025 15:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:Date:Cc:To:
 From:Subject:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=cu8/fOYfr6iCFW+BEE74lsV/9YUSO/y5fXceNLxZeBU=; b=ks/jJhAXugRMdBXAQj2yQVtCVX
 mVJ8/iomdSE6BVKEksFa2X2UVIAkTTzrvIJe5FGIbhRxzasBmyzqv1++0sgnmQ6AjX6Ui3WAGjG7O
 TIa0v4fQtSeFNuw/qtEJ0R+Jaiypupk6XneSVNV21qLq1RMtXbbR4/lUb2HZpIDjz8ycEJHlEJE5/
 9ZFJte5qYxzQ8i+rK0Qmvna6HTtuBQffz/PWd0kiuhEwwFKbsZwMoVo7+G27Ab14ei0z67CUNk0bD
 +mvYp8yBUkNEwkRPMWyLX8BKNeUxNM8EfBLr1sWlrWTJjIIdSNjkOJAZ78meUFS0PxKiSUCAtTpRr
 YYXZquKw==;
Received: from [172.31.31.145] (helo=u09cd745991455d.ant.amazon.com)
 by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
 id 1u1oOM-000000081JS-0oa6; Mon, 07 Apr 2025 15:28:06 +0000
Message-ID: <69997152cb8688a63b50fd8d3f189cc0e2668225.camel@infradead.org>
Subject: [6.13.6 stable regression?] Nouveau reboot failure in
 r535_gsp_msg_recv()
From: David Woodhouse <dwmw2@infradead.org>
To: dri-devel <dri-devel@lists.freedesktop.org>, nouveau@lists.freedesktop.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon, 07 Apr 2025 16:28:06 +0100
Content-Type: multipart/signed; micalg="sha-256";
 protocol="application/pkcs7-signature"; 
 boundary="=-x9YTX8Ea+h0Bwu4qEJ9c"
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
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


--=-x9YTX8Ea+h0Bwu4qEJ9c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have a Thinkpad P1 Gen6 with combined Intel + NVIDIA graphics:

00:02.0 VGA compatible controller [0300]: Intel Corporation Raptor Lake-P [=
Iris Xe Graphics] [8086:a7a0] (rev 04)
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation AD107GLM [RTX =
2000 Ada Generation Laptop GPU] [10de:28b8] (rev a1)

There's supposed to be USB-C display support but that's never worked
and I have no idea how to even start debugging it.

It does have an HDMI port in the laptop itself, which does sometimes
work. I've grown accustomed to having to reboot the laptop to get it to
output to that port, like it's the 1990s again.

When I updated from 6.13.4 to 6.13.6 even *that* stopped working
because the laptop doesn't even reboot so I have to power cycle it.
This time at least I have some way to start debugging it; there's a
backtrace on screen.

Image to text below; full images at=20
 http://david.woodhou.se/PXL_20250326_092807612.MP.jpg
 http://david.woodhou.se/PXL_20250326_092800399.MP.jpg
 http://david.woodhou.se/PXL_20250313_153455231.MP.jpg


[608593.5728743 CPU: 15 UID: 626640614 PID: 17529 Comm: WebKitWebProces Tai=
nt
[608593.576062] Tainted: [W]=3DWARN
C608593.579235] Hardware name: LENOVO 21FVS16V08/21FVS16V80, BIOS N3ZET45W =
(1.
[608593.582441] RIP: 0010:r535_gsp_msgq_wait+0x1c4/0x1f0 [nouveau]
[608593.585775] Code: 8b 45 cc 31 d2 05 2f 10 00 00 Od ff Of 00 00 48 c1 e8=
 Bc
[608593.589119] RSP: 0018: ffffb169c23e7818 EFLAGS: 00010246
[608593.592450] RAX: 0000000000000000 RBX: 0000000000000028 RCX: 0000000000=
000
[608593.595812] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000
[608593.599162] RBP: ffffb169c23e7858 R08: 000-----------00 R09: 000000
[608593.602505] R10: 00000-0000-00-00 R11: 000-----------00 R12: 00000000
[608593.605829] R13: ffff9b2fa3362000 R14: ffffb169c23e7878 R15: 0000000000=
0000
[608593.609167] FS: 0000752bd596fbc0(0000) GS: ffff9b463f580000(0000) kn1GS=
:000
[608593.612510] CS: 0010 DS: 0000 ES: 0000 CRO: 0000000080050033
[608593.615870] CR2: 00007ea21329a7b4 CR3: 00000002b2782005 CR4: 0000000000=
f72e1
[608593.619235] PKRU: 55555554
[608593.622604] Call Trace:
[608593.625968] <TASK>
[608593.629323] ? show_regs+0x6c/0x80
[608593.632693] ?__warn+0x8d/0x150
[608593.636055] ? r535_gsp_msgq_wait+0x1c4/0x1f0 [nouveau]
[608593.639533] ? report_bug+0x182/0x1b0
[608593.642908] ? handle_bug+0x6e/0xb0
[608593.646279] ? exc_invalid_op+0x18/0x80
[608593.649640] ?asm_exc_invalid_op+0x1b/0x20
[608593.652991] ? r535_gsp_msgq_wait+0x1c4/0x1f0 [nouveau]
[608593.656476] ? r535_gsp_msgq_wait+0x8a/0x1f0 [nouveau]
[608593.659943] r535_gsp_msg_recv+0x51/0x280 [nouveau]
[608593.663419] r535_gsp_rpc_send+0x1c9/0x2d0 [nouveau]
[688593.666895]
[608593.670362] ? __kvmalloc_node_noprof+0x24/0x100
r535_gsp_rpc_push+0x156/0x160 [nouveau]
[608593.673731] r535_gsp_rpc_rm_free+0x76/0xe0 [nouveau]
[608593.677217] r535_gr_obj_dtor+0x2b/0x40 [nouveau]
[608593.680696] nvkm_object_dtor+0xb9/0x1b0 [nouveau]
[608593.684088]
[608593.687417]
[608593.690741] nvkm_object_del+0x2b/0xc0 [nouveau]
nvkm_oproxy_dtor+0x30/0x60 [nouveau]
nvkm_object_dtor+0xb9/0x1b0 [nouveau]
[608593.694053] nvkm_object_del+0x2b/0xc0 [nouveau]
[608593.697366]
[608593.700661]
[608593.703958] nvkm_object_dtor+0x66/0x1b0 [nouveau]
nvkm_object_del+0x2b/0xc0 [nouveau]
nvkm_ioctl_del+0x38/0xb0 [nouveau]
[608593.707237] nvkm_ioctl+0x103/0x240 [nouveau]
[608593.710514] nvkm_client_ioctl+0xe/0x20 [nouveau]
[do_syscall_64+0x7e/0x170
[608593.751404]
nvif_object_dtor+0x78/0xb0 [nouveau]
nouveau_channel_del+0x8b/0x110 [nouveau]
nouveau_abi16_chan_fini.isra.0+0x143/0x1d0 [nouveau]
nouveau_abi16_fini+0x8d/0xd0 [nouveau]
nouveau_drm_postclose+0xa9/0x140 [nouveau]
drm_file_free+0x1e5/0x270
drm_release+0xb1/0x130
__fput+0xe5/0x2d0
_fput_sync+0x59/0x80
x64_sys_call+0x1a2d/0x2650
__x64_sys_close+0x3d/0x90
?__handle_mm_fault+AxAn
[608593.7542781
3

--=-x9YTX8Ea+h0Bwu4qEJ9c
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCD9Aw
ggSOMIIDdqADAgECAhAOmiw0ECVD4cWj5DqVrT9PMA0GCSqGSIb3DQEBCwUAMGUxCzAJBgNVBAYT
AlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20xJDAi
BgNVBAMTG0RpZ2lDZXJ0IEFzc3VyZWQgSUQgUm9vdCBDQTAeFw0yNDAxMzAwMDAwMDBaFw0zMTEx
MDkyMzU5NTlaMEExCzAJBgNVBAYTAkFVMRAwDgYDVQQKEwdWZXJva2V5MSAwHgYDVQQDExdWZXJv
a2V5IFNlY3VyZSBFbWFpbCBHMjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMjvgLKj
jfhCFqxYyRiW8g3cNFAvltDbK5AzcOaR7yVzVGadr4YcCVxjKrEJOgi7WEOH8rUgCNB5cTD8N/Et
GfZI+LGqSv0YtNa54T9D1AWJy08ZKkWvfGGIXN9UFAPMJ6OLLH/UUEgFa+7KlrEvMUupDFGnnR06
aDJAwtycb8yXtILj+TvfhLFhafxroXrflspavejQkEiHjNjtHnwbZ+o43g0/yxjwnarGI3kgcak7
nnI9/8Lqpq79tLHYwLajotwLiGTB71AGN5xK+tzB+D4eN9lXayrjcszgbOv2ZCgzExQUAIt98mre
8EggKs9mwtEuKAhYBIP/0K6WsoMnQCcCAwEAAaOCAVwwggFYMBIGA1UdEwEB/wQIMAYBAf8CAQAw
HQYDVR0OBBYEFIlICOogTndrhuWByNfhjWSEf/xwMB8GA1UdIwQYMBaAFEXroq/0ksuCMS1Ri6en
IZ3zbcgPMA4GA1UdDwEB/wQEAwIBhjAdBgNVHSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIweQYI
KwYBBQUHAQEEbTBrMCQGCCsGAQUFBzABhhhodHRwOi8vb2NzcC5kaWdpY2VydC5jb20wQwYIKwYB
BQUHMAKGN2h0dHA6Ly9jYWNlcnRzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydEFzc3VyZWRJRFJvb3RD
QS5jcnQwRQYDVR0fBD4wPDA6oDigNoY0aHR0cDovL2NybDMuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0
QXNzdXJlZElEUm9vdENBLmNybDARBgNVHSAECjAIMAYGBFUdIAAwDQYJKoZIhvcNAQELBQADggEB
ACiagCqvNVxOfSd0uYfJMiZsOEBXAKIR/kpqRp2YCfrP4Tz7fJogYN4fxNAw7iy/bPZcvpVCfe/H
/CCcp3alXL0I8M/rnEnRlv8ItY4MEF+2T/MkdXI3u1vHy3ua8SxBM8eT9LBQokHZxGUX51cE0kwa
uEOZ+PonVIOnMjuLp29kcNOVnzf8DGKiek+cT51FvGRjV6LbaxXOm2P47/aiaXrDD5O0RF5SiPo6
xD1/ClkCETyyEAE5LRJlXtx288R598koyFcwCSXijeVcRvBB1cNOLEbg7RMSw1AGq14fNe2cH1HG
W7xyduY/ydQt6gv5r21mDOQ5SaZSWC/ZRfLDuEYwggWbMIIEg6ADAgECAhAH5JEPagNRXYDiRPdl
c1vgMA0GCSqGSIb3DQEBCwUAMEExCzAJBgNVBAYTAkFVMRAwDgYDVQQKEwdWZXJva2V5MSAwHgYD
VQQDExdWZXJva2V5IFNlY3VyZSBFbWFpbCBHMjAeFw0yNDEyMzAwMDAwMDBaFw0yODAxMDQyMzU5
NTlaMB4xHDAaBgNVBAMME2R3bXcyQGluZnJhZGVhZC5vcmcwggIiMA0GCSqGSIb3DQEBAQUAA4IC
DwAwggIKAoICAQDali7HveR1thexYXx/W7oMk/3Wpyppl62zJ8+RmTQH4yZeYAS/SRV6zmfXlXaZ
sNOE6emg8WXLRS6BA70liot+u0O0oPnIvnx+CsMH0PD4tCKSCsdp+XphIJ2zkC9S7/yHDYnqegqt
w4smkqUqf0WX/ggH1Dckh0vHlpoS1OoxqUg+ocU6WCsnuz5q5rzFsHxhD1qGpgFdZEk2/c//ZvUN
i12vPWipk8TcJwHw9zoZ/ZrVNybpMCC0THsJ/UEVyuyszPtNYeYZAhOJ41vav1RhZJzYan4a1gU0
kKBPQklcpQEhq48woEu15isvwWh9/+5jjh0L+YNaN0I//nHSp6U9COUG9Z0cvnO8FM6PTqsnSbcc
0j+GchwOHRC7aP2t5v2stVx3KbptaYEzi4MQHxm/0+HQpMEVLLUiizJqS4PWPU6zfQTOMZ9uLQRR
ci+c5xhtMEBszlQDOvEQcyEG+hc++fH47K+MmZz21bFNfoBxLP6bjR6xtPXtREF5lLXxp+CJ6KKS
blPKeVRg/UtyJHeFKAZXO8Zeco7TZUMVHmK0ZZ1EpnZbnAhKE19Z+FJrQPQrlR0gO3lBzuyPPArV
hvWxjlO7S4DmaEhLzarWi/ze7EGwWSuI2eEa/8zU0INUsGI4ywe7vepQz7IqaAovAX0d+f1YjbmC
VsAwjhLmveFjNwIDAQABo4IBsDCCAawwHwYDVR0jBBgwFoAUiUgI6iBOd2uG5YHI1+GNZIR//HAw
HQYDVR0OBBYEFFxiGptwbOfWOtMk5loHw7uqWUOnMDAGA1UdEQQpMCeBE2R3bXcyQGluZnJhZGVh
ZC5vcmeBEGRhdmlkQHdvb2Rob3Uuc2UwFAYDVR0gBA0wCzAJBgdngQwBBQEBMA4GA1UdDwEB/wQE
AwIF4DAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQwewYDVR0fBHQwcjA3oDWgM4YxaHR0
cDovL2NybDMuZGlnaWNlcnQuY29tL1Zlcm9rZXlTZWN1cmVFbWFpbEcyLmNybDA3oDWgM4YxaHR0
cDovL2NybDQuZGlnaWNlcnQuY29tL1Zlcm9rZXlTZWN1cmVFbWFpbEcyLmNybDB2BggrBgEFBQcB
AQRqMGgwJAYIKwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmRpZ2ljZXJ0LmNvbTBABggrBgEFBQcwAoY0
aHR0cDovL2NhY2VydHMuZGlnaWNlcnQuY29tL1Zlcm9rZXlTZWN1cmVFbWFpbEcyLmNydDANBgkq
hkiG9w0BAQsFAAOCAQEAQXc4FPiPLRnTDvmOABEzkIumojfZAe5SlnuQoeFUfi+LsWCKiB8Uextv
iBAvboKhLuN6eG/NC6WOzOCppn4mkQxRkOdLNThwMHW0d19jrZFEKtEG/epZ/hw/DdScTuZ2m7im
8ppItAT6GXD3aPhXkXnJpC/zTs85uNSQR64cEcBFjjoQDuSsTeJ5DAWf8EMyhMuD8pcbqx5kRvyt
JPsWBQzv1Dsdv2LDPLNd/JUKhHSgr7nbUr4+aAP2PHTXGcEBh8lTeYea9p4d5k969pe0OHYMV5aL
xERqTagmSetuIwolkAuBCzA9vulg8Y49Nz2zrpUGfKGOD0FMqenYxdJHgDCCBZswggSDoAMCAQIC
EAfkkQ9qA1FdgOJE92VzW+AwDQYJKoZIhvcNAQELBQAwQTELMAkGA1UEBhMCQVUxEDAOBgNVBAoT
B1Zlcm9rZXkxIDAeBgNVBAMTF1Zlcm9rZXkgU2VjdXJlIEVtYWlsIEcyMB4XDTI0MTIzMDAwMDAw
MFoXDTI4MDEwNDIzNTk1OVowHjEcMBoGA1UEAwwTZHdtdzJAaW5mcmFkZWFkLm9yZzCCAiIwDQYJ
KoZIhvcNAQEBBQADggIPADCCAgoCggIBANqWLse95HW2F7FhfH9bugyT/danKmmXrbMnz5GZNAfj
Jl5gBL9JFXrOZ9eVdpmw04Tp6aDxZctFLoEDvSWKi367Q7Sg+ci+fH4KwwfQ8Pi0IpIKx2n5emEg
nbOQL1Lv/IcNiep6Cq3DiyaSpSp/RZf+CAfUNySHS8eWmhLU6jGpSD6hxTpYKye7PmrmvMWwfGEP
WoamAV1kSTb9z/9m9Q2LXa89aKmTxNwnAfD3Ohn9mtU3JukwILRMewn9QRXK7KzM+01h5hkCE4nj
W9q/VGFknNhqfhrWBTSQoE9CSVylASGrjzCgS7XmKy/BaH3/7mOOHQv5g1o3Qj/+cdKnpT0I5Qb1
nRy+c7wUzo9OqydJtxzSP4ZyHA4dELto/a3m/ay1XHcpum1pgTOLgxAfGb/T4dCkwRUstSKLMmpL
g9Y9TrN9BM4xn24tBFFyL5znGG0wQGzOVAM68RBzIQb6Fz758fjsr4yZnPbVsU1+gHEs/puNHrG0
9e1EQXmUtfGn4InoopJuU8p5VGD9S3Ikd4UoBlc7xl5yjtNlQxUeYrRlnUSmdlucCEoTX1n4UmtA
9CuVHSA7eUHO7I88CtWG9bGOU7tLgOZoSEvNqtaL/N7sQbBZK4jZ4Rr/zNTQg1SwYjjLB7u96lDP
sipoCi8BfR35/ViNuYJWwDCOEua94WM3AgMBAAGjggGwMIIBrDAfBgNVHSMEGDAWgBSJSAjqIE53
a4blgcjX4Y1khH/8cDAdBgNVHQ4EFgQUXGIam3Bs59Y60yTmWgfDu6pZQ6cwMAYDVR0RBCkwJ4ET
ZHdtdzJAaW5mcmFkZWFkLm9yZ4EQZGF2aWRAd29vZGhvdS5zZTAUBgNVHSAEDTALMAkGB2eBDAEF
AQEwDgYDVR0PAQH/BAQDAgXgMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEFBQcDBDB7BgNVHR8E
dDByMDegNaAzhjFodHRwOi8vY3JsMy5kaWdpY2VydC5jb20vVmVyb2tleVNlY3VyZUVtYWlsRzIu
Y3JsMDegNaAzhjFodHRwOi8vY3JsNC5kaWdpY2VydC5jb20vVmVyb2tleVNlY3VyZUVtYWlsRzIu
Y3JsMHYGCCsGAQUFBwEBBGowaDAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuZGlnaWNlcnQuY29t
MEAGCCsGAQUFBzAChjRodHRwOi8vY2FjZXJ0cy5kaWdpY2VydC5jb20vVmVyb2tleVNlY3VyZUVt
YWlsRzIuY3J0MA0GCSqGSIb3DQEBCwUAA4IBAQBBdzgU+I8tGdMO+Y4AETOQi6aiN9kB7lKWe5Ch
4VR+L4uxYIqIHxR7G2+IEC9ugqEu43p4b80LpY7M4KmmfiaRDFGQ50s1OHAwdbR3X2OtkUQq0Qb9
6ln+HD8N1JxO5nabuKbymki0BPoZcPdo+FeRecmkL/NOzzm41JBHrhwRwEWOOhAO5KxN4nkMBZ/w
QzKEy4PylxurHmRG/K0k+xYFDO/UOx2/YsM8s138lQqEdKCvudtSvj5oA/Y8dNcZwQGHyVN5h5r2
nh3mT3r2l7Q4dgxXlovERGpNqCZJ624jCiWQC4ELMD2+6WDxjj03PbOulQZ8oY4PQUyp6djF0keA
MYIDuzCCA7cCAQEwVTBBMQswCQYDVQQGEwJBVTEQMA4GA1UEChMHVmVyb2tleTEgMB4GA1UEAxMX
VmVyb2tleSBTZWN1cmUgRW1haWwgRzICEAfkkQ9qA1FdgOJE92VzW+AwDQYJYIZIAWUDBAIBBQCg
ggE3MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1MDQwNzE1Mjgw
NlowLwYJKoZIhvcNAQkEMSIEICKejBrqoRLpC8Xx1jd0yNjw16QW63s/PYwkDtrshdgHMGQGCSsG
AQQBgjcQBDFXMFUwQTELMAkGA1UEBhMCQVUxEDAOBgNVBAoTB1Zlcm9rZXkxIDAeBgNVBAMTF1Zl
cm9rZXkgU2VjdXJlIEVtYWlsIEcyAhAH5JEPagNRXYDiRPdlc1vgMGYGCyqGSIb3DQEJEAILMVeg
VTBBMQswCQYDVQQGEwJBVTEQMA4GA1UEChMHVmVyb2tleTEgMB4GA1UEAxMXVmVyb2tleSBTZWN1
cmUgRW1haWwgRzICEAfkkQ9qA1FdgOJE92VzW+AwDQYJKoZIhvcNAQEBBQAEggIARhnEpBrVYK8z
1+FnQtodlI1MU0z0uqrVE4bcAeEeAvxSDYWK39pFEJY0d1adQdDw8Kxy6steVsb37EOTzEXbqtSD
WbCpBeTNrbd2vtWvJF/sT6n/xaj6vzu1+oveB579gByDjd1Gp/m66q1U+Ur7fMJue/q80Is5CJbx
vWg1B8ZAk2zioNMVi0ueLNcIBPprzwkR9bO9o7xx3xcdx/h+Bk7SKERjhK8nJBR8U2dAvsA33lHi
Jy234Cm2tCVHtjnMvpeIhf/Y69yQlNz6L7NGANXOkAmKtwWLBDNkh5ciYCUTwzWkyrAO9mHVrj1U
CVT1/IKS8orJhlzOTMDkZP1MR2ZTd62JgAtHygexc2RlRQGFb4NOChZSMoCzRoil1q+DN18DRml1
krFIfw+b571vKhjBYl8sdc3PqLRgj2GyoKWazsXGFjsrz0xCzrgZ3Hcy42YPaQjIcaGeSXaamwiW
mjD/SQ+DrgnDUJDR1dwU6OG2HAiuLdYWy2G2cK68mlYBsyhciAXC9o1AoNIpNVlcMY/DYFF0Oqli
yDblXl2IJbCQSOAM2d+e8AfOrGkM98f7unRFlBAi3XOVCLlhWaesqwHoOJVoEYCFP7EiDiFcGnAQ
pqBzAbN3yKwx1wdJz/lGvg/kw3WcCO2CUC9hMcaVJyrpw1LU6Ik09WH/XtTKh1gAAAAAAAA=


--=-x9YTX8Ea+h0Bwu4qEJ9c--
