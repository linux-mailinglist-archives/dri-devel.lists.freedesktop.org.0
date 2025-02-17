Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE680A3873E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 16:10:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B07F510E046;
	Mon, 17 Feb 2025 15:10:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="gCg6LPAR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B21610E046
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 15:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1739805044;
 bh=xsqdmzcQVf4MaVLIq+wCHoFk6tUjSd/ZSKbG3ogYrWM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gCg6LPARAAeFfI2o/RKgT8DMH4oTejs18JXRaXx2LyQKw5onjWYm9SgVsTmBjPtlM
 pZWDyv7bH5FcAr67KlV6y7JpHgCKmyv/dwZLbmFbcqsKh3xTC1dSYNCj6YUEdBo8uY
 PNSUtM/3XMyuSIDauvfhgKhSYDF/MaD8CFxq+jiirWhK9uIUhMJVIuGsPMXRZKUGPl
 aLg9QsQpfv3CrBejxijBgMz3pn5/IU5EKfERRN8PE5ImgR6lBE0FnzXYdoImGYlbN7
 olEHbagdWKOn1eroAwABeGcg3Te/CbsLbM2gp3sx2GzLoxVYtAZmN7AUCYexsBv5lf
 uieOeFJKyMGVQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5437217E0CD1;
 Mon, 17 Feb 2025 16:10:43 +0100 (CET)
Message-ID: <358623c0-a81a-4a17-8979-f11de5b71675@collabora.com>
Date: Mon, 17 Feb 2025 16:10:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 41/42] drm/mediatek: mtk_hdmi_v2: Add debugfs ops and
 implement ABIST
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Cc: "robh@kernel.org" <robh@kernel.org>,
 "jie.qiu@mediatek.com" <jie.qiu@mediatek.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "mripard@kernel.org"
 <mripard@kernel.org>, =?UTF-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?=
 <jitao.shi@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 =?UTF-8?B?TGV3aXMgTGlhbyAo5buW5p+P6YieKQ==?= <Lewis.Liao@mediatek.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 =?UTF-8?B?VG9tbXlZTCBDaGVuICjpmbPlvaXoia8p?= <TommyYL.Chen@mediatek.com>,
 =?UTF-8?B?SXZlcyBDaGVuamggKOmZs+S/iuW8mCk=?= <Ives.Chenjh@mediatek.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "junzhi.zhao@mediatek.com" <junzhi.zhao@mediatek.com>
References: <20250211113409.1517534-1-angelogioacchino.delregno@collabora.com>
 <20250211113409.1517534-42-angelogioacchino.delregno@collabora.com>
 <0541a9bedef16763cc0279127ab258015b9a8a82.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <0541a9bedef16763cc0279127ab258015b9a8a82.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Il 14/02/25 06:21, CK Hu (胡俊光) ha scritto:
> On Tue, 2025-02-11 at 12:34 +0100, AngeloGioacchino Del Regno wrote:
>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>
>>
>> Implement the Automated Built-In Self-Test ABIST functionality
>> provided by the HDMIv2 IP and expose it through the "hdmi_abist"
>> debugfs file.
>>
>> Write "1" to this file to activate ABIST, or "0" to deactivate.
> 
> Describe what we would see when activate ABIST.
> Give some example of when to use it.
> 

Sure, I will.

>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_hdmi_v2.c | 123 +++++++++++++++++++++++++
>>   1 file changed, 123 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
>> index 36b7f8d8d218..f4a086b92dae 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
>> @@ -1170,6 +1170,128 @@ static int mtk_hdmi_v2_hdmi_write_infoframe(struct drm_bridge *bridge,
>>          return 0;
>>   }
>>
>> +static int mtk_hdmi_v2_set_abist(struct mtk_hdmi *hdmi, bool enable)
>> +{
>> +       struct drm_display_mode *mode = &hdmi->mode;
>> +       int abist_format = -EINVAL;
>> +       bool interlaced;
>> +
>> +       if (!enable) {
>> +               regmap_clear_bits(hdmi->regs, TOP_CFG00, HDMI_ABIST_ENABLE);
>> +               return 0;
>> +       }
>> +
>> +       if (!mode->hdisplay || !mode->vdisplay)
>> +               return -EINVAL;
>> +
>> +       interlaced = mode->flags & DRM_MODE_FLAG_INTERLACE;
>> +
>> +       switch (mode->hdisplay) {
>> +       case 720:
>> +               if (mode->vdisplay == 480)
>> +                       abist_format = 2;
>> +               else if (mode->vdisplay == 576)
>> +                       abist_format = 11;
>> +               break;
>> +       case 1280:
>> +               if (mode->vdisplay == 720)
>> +                       abist_format = 3;
>> +               break;
>> +       case 1440:
>> +               if (mode->vdisplay == 480)
>> +                       abist_format = interlaced ? 5 : 9;
>> +               else if (mode->vdisplay == 576)
>> +                       abist_format = interlaced ? 14 : 18;
>> +               break;
>> +       case 1920:
>> +               if (mode->vdisplay == 1080)
>> +                       abist_format = interlaced ? 4 : 10;
>> +               break;
>> +       case 3840:
>> +               if (mode->vdisplay == 2160)
>> +                       abist_format = 25;
>> +               break;
>> +       case 4096:
>> +               if (mode->vdisplay == 2160)
>> +                       abist_format = 26;
>> +               break;
>> +       default:
>> +               break;
>> +       }
>> +       if (!abist_format)
> 
> abist_format's initial value is -EINVAL, so this checking would never be true.
> Let abist_format's initial value be zero.
> 

No, because abist_format 0 is a valid format.

I'll change this to

if (abist_format < 0)
	return abist_format;

Thanks!

Regards,
Angelo

> Regards,
> CK
> 
>> +               return -EINVAL;
>> +
>> +       regmap_update_bits(hdmi->regs, TOP_CFG00, HDMI_ABIST_VIDEO_FORMAT,
>> +                          FIELD_PREP(HDMI_ABIST_VIDEO_FORMAT, abist_format));
>> +       regmap_set_bits(hdmi->regs, TOP_CFG00, HDMI_ABIST_ENABLE);
>> +       return 0;
>> +}
>> +
>> +static int mtk_hdmi_v2_debug_abist_show(struct seq_file *m, void *arg)
>> +{
>> +       struct mtk_hdmi *hdmi = m->private;
>> +       bool en;
>> +       u32 val;
>> +       int ret;
>> +
>> +       if (!hdmi)
>> +               return -EINVAL;
>> +
>> +       ret = regmap_read(hdmi->regs, TOP_CFG00, &val);
>> +       if (ret)
>> +               return ret;
>> +
>> +       en = FIELD_GET(HDMI_ABIST_ENABLE, val);
>> +
>> +       seq_printf(m, "HDMI Automated Built-In Self Test: %s\n",
>> +                  en ? "Enabled" : "Disabled");
>> +
>> +       return 0;
>> +}
>> +
>> +static ssize_t mtk_hdmi_v2_debug_abist_write(struct file *file,
>> +                                            const char __user *ubuf,
>> +                                            size_t len, loff_t *offp)
>> +{
>> +       struct seq_file *m = file->private_data;
>> +       int ret;
>> +       u32 en;
>> +
>> +       if (!m || !m->private || *offp)
>> +               return -EINVAL;
>> +
>> +       ret = kstrtouint_from_user(ubuf, len, 0, &en);
>> +       if (ret)
>> +               return ret;
>> +
>> +       if (en < 0 || en > 1)
>> +               return -EINVAL;
>> +
>> +       mtk_hdmi_v2_set_abist((struct mtk_hdmi *)m->private, en);
>> +       return len;
>> +}
>> +
>> +static int mtk_hdmi_v2_debug_abist_open(struct inode *inode, struct file *file)
>> +{
>> +       return single_open(file, mtk_hdmi_v2_debug_abist_show, inode->i_private);
>> +}
>> +
>> +static const struct file_operations mtk_hdmi_debug_abist_fops = {
>> +       .owner = THIS_MODULE,
>> +       .open = mtk_hdmi_v2_debug_abist_open,
>> +       .read = seq_read,
>> +       .write = mtk_hdmi_v2_debug_abist_write,
>> +       .llseek = seq_lseek,
>> +       .release = single_release,
>> +};
>> +
>> +static void mtk_hdmi_v2_debugfs_init(struct drm_bridge *bridge, struct dentry *root)
>> +{
>> +       struct mtk_hdmi *dpi = hdmi_ctx_from_bridge(bridge);
>> +
>> +       debugfs_create_file("hdmi_abist", 0640, root, dpi, &mtk_hdmi_debug_abist_fops);
>> +}
>> +
>>   static const struct drm_bridge_funcs mtk_v2_hdmi_bridge_funcs = {
>>          .attach = mtk_hdmi_v2_bridge_attach,
>>          .detach = mtk_hdmi_v2_bridge_detach,
>> @@ -1189,6 +1311,7 @@ static const struct drm_bridge_funcs mtk_v2_hdmi_bridge_funcs = {
>>          .hdmi_tmds_char_rate_valid = mtk_hdmi_v2_hdmi_tmds_char_rate_valid,
>>          .hdmi_clear_infoframe = mtk_hdmi_v2_hdmi_clear_infoframe,
>>          .hdmi_write_infoframe = mtk_hdmi_v2_hdmi_write_infoframe,
>> +       .debugfs_init = mtk_hdmi_v2_debugfs_init,
>>   };
>>
>>   /*
>> --
>> 2.48.1
>>
> 



