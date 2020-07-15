Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D4A221096
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 17:12:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F2516EB7F;
	Wed, 15 Jul 2020 15:12:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E3366EB7F
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 15:12:37 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06FF38MP145934;
 Wed, 15 Jul 2020 15:12:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=0JkdM7OaeZKo/wNUM2SyUi9gk7ZssmR/pU76UHP9/Xc=;
 b=HSR188X/Hvk1zLPBJUb3Cd8Tr9EvT8gzYNdB5JVap9w0llK7ChDwTWd9GTbydK5PdEaj
 xnxOud9i8FHXezvhiFuWLUwJWzJOvWVzkaSR06zmfxsAylJnayEgQayKc0jqldoeW8Uy
 h4+/JxUbHlciV5waMwe3uMv6XcmPXMyC7eyIl79SKtkV4Jcxfn5nbsygYWv3JNY7ETHj
 NMVYgO6EtrYsM63+i+0ubS9JEdPQB8aKUzXKUm6eIQ+0fYuWNTJv1Ex0s/PfRgLr0kGF
 u3wM0pZkfvkLUtMBaj3dQQVXN0DHpRJm0gbgDISho8UwH5Lhp7p7+L8MqJOQbyD9X/Dm DA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 3275cmc051-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 15 Jul 2020 15:12:31 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06FF3eFq126116;
 Wed, 15 Jul 2020 15:12:30 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 327q6up5jp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jul 2020 15:12:30 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 06FFCSA3023623;
 Wed, 15 Jul 2020 15:12:28 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 15 Jul 2020 08:12:28 -0700
Date: Wed, 15 Jul 2020 18:12:20 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Subject: Re: [PATCH v2] fbdev: Detect integer underflow at "struct
 fbcon_ops"->clear_margins.
Message-ID: <20200715151220.GE2571@kadam>
References: <adff5d10-fe35-62d4-74c5-182958c5ada7@i-love.sakura.ne.jp>
 <20200715015102.3814-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <20200715094836.GD2571@kadam>
 <9e6eac10-c5c3-f518-36cc-9ea32fb5d7fe@i-love.sakura.ne.jp>
 <b50f85c7-80e5-89c5-0aca-31d8e9892665@i-love.sakura.ne.jp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b50f85c7-80e5-89c5-0aca-31d8e9892665@i-love.sakura.ne.jp>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9683
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007150124
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9683
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 priorityscore=1501
 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007150124
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
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 syzbot <syzbot+e5fd3e65515b48c02a30@syzkaller.appspotmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 George Kennedy <george.kennedy@oracle.com>, Jiri Slaby <jslaby@suse.com>,
 Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 15, 2020 at 11:02:58PM +0900, Tetsuo Handa wrote:
> On 2020/07/15 20:17, Tetsuo Handa wrote:
> > On 2020/07/15 18:48, Dan Carpenter wrote:
> >>> @@ -216,7 +216,7 @@ static void bit_clear_margins(struct vc_data *vc, struct fb_info *info,
> >>>  	region.color = color;
> >>>  	region.rop = ROP_COPY;
> >>>  
> >>> -	if (rw && !bottom_only) {
> >>> +	if ((int) rw > 0 && !bottom_only) {
> >>>  		region.dx = info->var.xoffset + rs;
> >>                             ^^^^^^^^^^^^^^^^^^^^^^
> >>
> >> If you choose a very high positive "rw" then this addition can overflow.
> >> info->var.xoffset comes from the user and I don't think it's checked...
> > 
> > Well, I think it would be checked by "struct fb_ops"->check_var hook.
> > For example, vmw_fb_check_var() has
> > 
> > 	if ((var->xoffset + var->xres) > par->max_width ||
> > 	    (var->yoffset + var->yres) > par->max_height) {
> > 		DRM_ERROR("Requested geom can not fit in framebuffer\n");
> > 		return -EINVAL;
> > 	}
> > 
> > check. Of course, there might be integer overflow in that check...
> > Having sanity check at caller of "struct fb_ops"->check_var might be nice.
> > 
> 
> Well, while
> 
>         const int fd = open("/dev/fb0", O_ACCMODE);
>         struct fb_var_screeninfo var = { };
>         ioctl(fd, FBIOGET_VSCREENINFO, &var);
>         var.xres = var.yres = 4;
>         var.xoffset = 4294967292U;
>         ioctl(fd, FBIOPUT_VSCREENINFO, &var);
> 
> bypassed
> 
>   (var->xoffset + var->xres) > par->max_width
> 
> check in vmw_fb_check_var(),
> 
> ----------
> --- a/drivers/video/fbdev/core/bitblit.c
> +++ b/drivers/video/fbdev/core/bitblit.c
> @@ -216,6 +216,7 @@ static void bit_clear_margins(struct vc_data *vc, struct fb_info *info,
>         region.color = color;
>         region.rop = ROP_COPY;
> 
> +       printk(KERN_INFO "%s info->var.xoffset=%u rs=%u info->var.yoffset=%u bs=%u\n", __func__, info->var.xoffset, rs, info->var.yoffset, bs);
>         if ((int) rw > 0 && !bottom_only) {
>                 region.dx = info->var.xoffset + rs;
>                 region.dy = 0;
> ----------
> 
> says that info->var.xoffset does not come from the user.
> 
> ----------
>  bit_clear_margins info->var.xoffset=0 rs=1024 info->var.yoffset=0 bs=800
> ----------

In fb_set_var() we do:

drivers/video/fbdev/core/fbmem.c
  1055          ret = info->fbops->fb_check_var(var, info);
  1056  
  1057          if (ret)
  1058                  return ret;
  1059  
  1060          if ((var->activate & FB_ACTIVATE_MASK) != FB_ACTIVATE_NOW)
  1061                  return 0;
  1062  
  1063          if (!basic_checks(var))
  1064                  return -EINVAL;
  1065  
  1066          if (info->fbops->fb_get_caps) {
  1067                  ret = fb_check_caps(info, var, var->activate);
  1068  
  1069                  if (ret)
  1070                          return ret;
  1071          }
  1072  
  1073          old_var = info->var;
  1074          info->var = *var;
                ^^^^^^^^^^^^^^^^
This should set "info->var.offset".

  1075  
  1076          if (info->fbops->fb_set_par) {
  1077                  ret = info->fbops->fb_set_par(info);
  1078  
  1079                  if (ret) {
  1080                          info->var = old_var;
  1081                          printk(KERN_WARNING "detected "

I've complained about integer overflows in fbdev for a long time...

What I'd like to see is something like the following maybe.  I don't
know how to get the vc_data in fbmem.c so it doesn't include your checks
for negative.

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index caf817bcb05c..5c74181fea5d 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -934,6 +934,54 @@ fb_pan_display(struct fb_info *info, struct fb_var_screeninfo *var)
 }
 EXPORT_SYMBOL(fb_pan_display);
 
+static bool basic_checks(struct fb_var_screeninfo *var)
+{
+	unsigned int v_margins, h_margins;
+
+	/* I think var->height and var->width == UINT_MAX means something. */
+
+	if (var->xres > INT_MAX ||
+	    var->yres > INT_MAX ||
+	    var->xres_virtual > INT_MAX ||
+	    var->yres_virtual > INT_MAX ||
+	    var->xoffset > INT_MAX ||
+	    var->yoffset > INT_MAX ||
+	    var->left_margin > INT_MAX ||
+	    var->right_margin > INT_MAX ||
+	    var->upper_margin > INT_MAX ||
+	    var->lower_margin > INT_MAX ||
+	    var->hsync_len > INT_MAX ||
+	    var->vsync_len > INT_MAX)
+		return false;
+
+	if (var->bits_per_pixel > 128)
+		return false;
+	if (var->rotate > FB_ROTATE_CCW)
+		return false;
+
+	if (var->xoffset > INT_MAX - var->xres)
+		return false;
+	if (var->yoffset > INT_MAX - var->yres)
+		return false;
+
+	if (var->left_margin > INT_MAX - var->right_margin ||
+	    var->upper_margin > INT_MAX - var->lower_margin)
+		return false;
+
+	v_margins = var->left_margin + var->right_margin;
+	h_margins = var->upper_margin + var->lower_margin;
+
+	if (var->xres > INT_MAX - var->hsync_len ||
+	    var->yres > INT_MAX - var->vsync_len)
+		return false;
+
+	if (v_margins > INT_MAX - var->hsync_len - var->xres ||
+	    h_margins > INT_MAX - var->vsync_len - var->yres)
+		return false;
+
+	return true;
+}
+
 static int fb_check_caps(struct fb_info *info, struct fb_var_screeninfo *var,
 			 u32 activate)
 {
@@ -1012,6 +1060,9 @@ fb_set_var(struct fb_info *info, struct fb_var_screeninfo *var)
 	if ((var->activate & FB_ACTIVATE_MASK) != FB_ACTIVATE_NOW)
 		return 0;
 
+	if (!basic_checks(var))
+		return -EINVAL;
+
 	if (info->fbops->fb_get_caps) {
 		ret = fb_check_caps(info, var, var->activate);
 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
