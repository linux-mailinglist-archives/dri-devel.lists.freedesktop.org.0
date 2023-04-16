Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B94156E36AB
	for <lists+dri-devel@lfdr.de>; Sun, 16 Apr 2023 11:38:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A508B10E2CE;
	Sun, 16 Apr 2023 09:38:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 461 seconds by postgrey-1.36 at gabe;
 Sun, 16 Apr 2023 09:38:18 UTC
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B8210E1D9;
 Sun, 16 Apr 2023 09:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1681637893; i=markus.elfring@web.de;
 bh=/v7J9qb+S1Ei+KmfiIERdQOeXfeF2fvCstCNfkjfefo=;
 h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
 b=gzxuTj6gjxWHu58rBVezOb/3F/NsssK+m70GUAh/RbD7CaKO0NKeGST1L1sTzweAY
 OwupIJsfN466JB5oUJcLaYORSeMhJDxnrRqBSuThwd1jJx3DhnofOPTy8s4HLf3plf
 7HPzJlGUnCBI9Epy6BcJH2aefLid4j4fDAvuone71VjTcZ7AbCjn5FhcfPIxVKcOtk
 wCTGa6v6IwlFs9OeFJlTJSFWViR6OldIsfp9Ryj4rKzSL2UMEzF2YATmXo7y80aeRo
 o41uyjRkTPh95Dm+W3beO/dNeHEd4vGGnJ/QIBVV0cUTf3yt5daimdCETWKEBkhHIR
 ml8ewscdF2qog==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MXoYS-1prHBZ1QL6-00Y8qj; Sun, 16
 Apr 2023 11:38:13 +0200
Message-ID: <e6f9b34e-58d9-b1aa-8b12-8d4a55153d1d@web.de>
Date: Sun, 16 Apr 2023 11:38:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: [PATCH 3/9] drm/nouveau/debugfs: Use seq_putc() in
 nouveau_debugfs_pstate_get()
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
X-Provags-ID: V03:K1:4D4ESLHPB8pyiBmbTozBYVsVfRFBzRRNDKTiTI7dxS4chI5F2c5
 enS3S4JZ7OYOci9SvxH607Us8zZEc2uGkr7kzS7dLUF9vtJ0emw9MQ6rPjJmsTpGoZmr+Ej
 YS9pdQ+HrlIElxQ3lmYIyRm1ljmzG6lb5VS2Ng5HMuvq/L9qU82GVnLc9t+8SbuLzgWre13
 tj+Hvt6YvXZpHeg0FZaEg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:H3TNyIVyf2A=;+bPz2fL98vAVhmLicVPq68J01Ya
 Hsa62yaENUDxCVdka8agUgVl55jQd5CU5SAqaaAx9Ho2tkZss1B59/QQyb/U15xpYVvT11zwx
 j9DTO3vLbkmI8dneTK7+zZFZQF0ctYRUQpApw9c42xdLda7mJ65J3NbYQ9AW9ss2rZzfpC+mG
 45TbJ6DcP6nvvfvcjJvyasXnX4R4znFeIoTJ7T/+rafG/mqctE7hTAIKxBLLTcPQ8dmAh/VYB
 lnJBcs2bJiR49O6PWVUol7rWPQhitkFV/mXl+ccVAilcScMdrgZoSgo1dmN36J+WuTV//RMWI
 iY3vEHmagZD7aOQj8Y7LxjphPnnIBXDVw6m+03A6A81f3NQLrWUP0TNx1VNCDMIeunoDaMdBW
 hhu2p0Hv6VDwuP0tZf46r2QV8lY30HblYtMXm4jv3d/4iRol8Tath7xQ75Yx+tQQT7e/rup1S
 LJHb/RW5yVhLQMfRQ2VBsS/5xZ16ZIQ3FuieW9JBRvNLrXS97n29Kxw2HO7khW2sLmnF5Uz4n
 0K7BQSxEqWmF+4dXIJqfkc434/WhuMAvSNfVI/JPaynP6krJh6weuo9rqXyYOpzvbxe7GwIBM
 4TIlWiCW8fzpjwAigQz7BIdErxDcRkmtQfxmkZaUK5Aer8iwihNRocx1rMZJk7GPaDDrpd6eh
 sGRAN06QWI2jd6y+g88E9Ab+za222qmfuN+G+mk9V3yHKZkf6hcPNasTow4s0gfC41vZjfyhX
 +fRnxw83huy2tSwk235g6KWmbq9YVCbzyko6P8PQmhQGLn7O1a8Kb4pX4n02N1ChtukriYZ+3
 V7EuVubeHCawnKobPkkUTfweto0sN+Ykem3dy3YzjF2TpDJD8Js6N1OReJc5+JJdOLC/qxyhA
 XZyx8T/KnZ+78a2BqOCV7eG5eo2MQLEjh7jsuwJBgNIPr6EbPPpc4X1Mu
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

Date: Sat, 15 Apr 2023 21:48:47 +0200

A single character (line break) should be put into a sequence.
Thus use the corresponding function =E2=80=9Cseq_putc=E2=80=9D.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/gpu/drm/nouveau/nouveau_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/n=
ouveau/nouveau_debugfs.c
index a859a086f308..13c82eea8828 100644
=2D-- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -132,7 +132,7 @@ nouveau_debugfs_pstate_get(struct seq_file *m, void *d=
ata)
 				seq_printf(m, " DC");
 		}

-		seq_printf(m, "\n");
+		seq_putc(m, '\n');
 	}

 	return 0;
=2D-
2.40.0

