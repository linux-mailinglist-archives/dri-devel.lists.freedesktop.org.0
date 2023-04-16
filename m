Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 007AF6E36C4
	for <lists+dri-devel@lfdr.de>; Sun, 16 Apr 2023 11:46:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35A5B10E313;
	Sun, 16 Apr 2023 09:46:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D11A910E300;
 Sun, 16 Apr 2023 09:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1681638393; i=markus.elfring@web.de;
 bh=B4nuL0fbXbY4PmTiXJZNvK9dh47DUmihZMJ6KCRWbEo=;
 h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
 b=TF0Nwc3l+xoYuqA2JKn8KDHPMvngfNZMW8vYj/6PyR6xPttK0N1KBpdOVQb4KCr8O
 zEIdpRsL3YnBn3mHMa9/cSvH7NOwWblmGKnLnxSg92HnAEvMxICMWjQ2XHTprsGkaU
 /33oFCOvfm+3+126+qFS9J/4B5nuugqMF7LsQOnm6vsZYf/zEUtNG84ykVq9mOeUpr
 q8DFH0rfBCtZkhUzTl+3XJVw8p5ngbWZLlsS0E68xn9yNypspWDe6p6t3CyCg5wjhV
 qOUKF1BShdT2yBIal5EZpHSw6zDvyp+BvZu+4QIMDd8I0VEPpsBZMkWUiOSOWp/VHy
 pLmD5Wc8GsIHA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.83]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M2Phi-1pmLKx1eYw-004Hbw; Sun, 16
 Apr 2023 11:46:33 +0200
Message-ID: <b31019b1-bb73-ed93-3378-e551e17a4f32@web.de>
Date: Sun, 16 Apr 2023 11:46:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: [PATCH 7/9] drm/nouveau/pci: Move a variable assignment behind
 condition checks in nvkm_pcie_set_link()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <2a746461-844a-2ad6-7b52-03f13fe1b9bf@web.de>
In-Reply-To: <2a746461-844a-2ad6-7b52-03f13fe1b9bf@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WHlB3p722Ku0tx4+HuMXdFub+PZRs7lny9GdhiDV/7pFZxj3JTX
 o/lJm2/khsGcjGK9tqQHDbos0ch0nCC2EKl9NGQndDOspINW6FlK+2m3ghBL9etU4UbcdGY
 G87wO62FoVddKF0iqe3PNAwOIlkbjhAqyr2Me6ms/uydVn7eoLkwyl2ApBqEIlXQm7EAiY+
 yCbSzzGIx9nTKam83qanQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Q00Q201qcno=;SdVsotJg+5+rl0B6Tv0hduHhx8w
 NZg1PEpj0soY6scUI2Rw6RHheGEcMadB+NMW630a2X7+9jOzG7ttrNblJJrudwWu9xxqlEERD
 opnCi+Gvvwd80TJJbQifaFIuCfud5S10QXPb32IipZoSjQrvYEExtKDsexaJmaSyC5MhsC1VI
 PVZN5GDwpBHqwb97rweOZ8A0BTBYoC68tmj2s/y7TrQZ3Vx4KiQOyaXfmLCz5tB5BvVEtGYCy
 Au6olZHpqpXnn79Nn5k65TXS1d/t37H5HkFVgNXbyK9WY62QB/iYJpSTbotCksxZU7n65+ou/
 Kpbfnhtvxz5Xrujx7UnjqQrconMRb540dDL5vzEeyIjB/N9C85ocKsiW9Iez076hRwN+oSyUi
 gyFxNwPExNsYXxNFzB2/mkPempDP/MGPRj/7RiPpEkjDNAagJ/dSY2Bl9gw/BZqIryksjowPW
 RPkN+4pUpqtEd5+Y+TIEozbDAI1VniRGK+6u9+mZgGBwtrLkjacZYJUPL3LWTJoeRKKEaQ1So
 5jsMByhoz46AtdZSan7qVmH+hloTOxnhd3GFu5HUwO2oaAiWwtWzMUMcgCFKHnl7pM0d/F56Q
 uCaJg4NCr96QM03skqbY+qPGsfbDlm5yymMXNLDTXveb+s/JmMvR6d+RxT007kiqQUvFHEarC
 8qcPTddFjT0Ocg/E4z0dShrdA2gBZy2Jm7DHP14CRyYbM4Ge4I4Jw7Wnhe6bEVKq3WWYm5mfH
 gYpJg23hKum/isxo4NhVN1msg225mAPDsjOhMITC5m6PC5ZPdCktHLXpxTP7J/ul0Dpth1zZ/
 HenU2MoRMRuwdloMUZNkuTU1SBf/nv4XpbT7NFSMRUhM/MfiMj2kpBNhYtJD5HR8rQgjVuuN1
 ng37zy4RWn0JxqkDR1Zm75aXw22pMWeDpjZSrL6uxplHQj7oX2uA/Ejk8
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
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Date: Sun, 16 Apr 2023 08:18:40 +0200

The address of a data structure member was determined before
a corresponding null pointer check in the implementation of
the function =E2=80=9Cnvkm_pcie_set_link=E2=80=9D.

Thus avoid the risk for undefined behaviour by moving the assignment
for the variable =E2=80=9Csubdev=E2=80=9D behind some condition checks.

This issue was detected by using the Coccinelle software.

Fixes: bcc19d9bf5cd8d49428c487adced1aa101271b18 ("drm/nouveau/pci: impleme=
nt generic code for pcie speed change")
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/gpu/drm/nouveau/nvkm/subdev/pci/pcie.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/pcie.c b/drivers/gpu/=
drm/nouveau/nvkm/subdev/pci/pcie.c
index d71e5db5028a..b295f100e1c1 100644
=2D-- a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/pcie.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/pcie.c
@@ -114,7 +114,7 @@ nvkm_pcie_init(struct nvkm_pci *pci)
 int
 nvkm_pcie_set_link(struct nvkm_pci *pci, enum nvkm_pcie_speed speed, u8 w=
idth)
 {
-	struct nvkm_subdev *subdev =3D &pci->subdev;
+	struct nvkm_subdev *subdev;
 	enum nvkm_pcie_speed cur_speed, max_speed;
 	struct pci_bus *pbus;
 	int ret;
@@ -126,6 +126,7 @@ nvkm_pcie_set_link(struct nvkm_pci *pci, enum nvkm_pci=
e_speed speed, u8 width)
 	if (!pci->func->pcie.set_link)
 		return -ENOSYS;

+	subdev =3D &pci->subdev;
 	nvkm_trace(subdev, "requested %s\n", nvkm_pcie_speeds[speed]);

 	if (pci->func->pcie.version(pci) < 2) {
=2D-
2.40.0

