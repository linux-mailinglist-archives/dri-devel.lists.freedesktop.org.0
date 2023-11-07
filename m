Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3557E55C2
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 12:48:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78C4A10E54E;
	Wed,  8 Nov 2023 11:48:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 833D310E0B8
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 22:31:08 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-586940ee5a5so3164827eaf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Nov 2023 14:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699396268; x=1700001068; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=07mUkTACcacQx1csTQpigEjOKef28cbSE2Jgd3BWbfk=;
 b=QFggWJ7PxS8DU/WiyYQ+EVzwKoCzLdY4bn2/I8VAHuvsKKxcqGnXSCWoVF3u00j8/O
 Y+gealWladuQ69ttXa2TVBZbINQ28FWvR9NIY7KU0HvMJ6uUjMod50ApHU8TSG8BRoer
 waLLEYIZ/bV/SJY4EzVon6tK+5i6fb/qazAhnobjK0RP+DBjrDSX+C/KyQ9AF6VJV0wq
 zXogqR6LToKdL5s8SYepbVsie0KDc7ukOR7yzOVfjmcpnSVF8e4HrpxIuG8g4r6zs0Wq
 5Z8n9j6nHRTLOFNCXom4/VoLTkePzI2SG+7rzKFGCQtXgxV5llV/oQ4/xYBz8xVa8uOb
 4EPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699396268; x=1700001068;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=07mUkTACcacQx1csTQpigEjOKef28cbSE2Jgd3BWbfk=;
 b=Rs9dHMlx4eI7H/6SNAYUzi8P8/h5shNXAXGpviykPbyDrLMv1uxMjD0CnfuXjUFwo3
 oApIiRdqMKZaRxuvT0IrNU3cQgh9lPrGURw22+Ysa7H0EMAN1s8lVTnmpc+UCYKuFA17
 YS90t7qhWd97zC8rsZLexFeh9xSyR2fugdQue82AfRwOc/CmwRB4AfFu4THA5dJSKOeF
 gQr+kCyMsUVihQXSH6lNxFe7dmcLwCdogKsadLZ5Otl7+63OoTZeuZBntOcbPPIL+d5/
 Q0oonc6h4YaDBJ3U23pLKYyiF0afKLgaDF7BvuXvvT/F4xnToGIQGHgb+NfGS0e1f0lI
 82Pw==
X-Gm-Message-State: AOJu0YyP1OnYrFWoxbImDzxzyNCMgz+0lTRZvkJUrfZ+hp6mF+raLUX+
 X9rxvsSzpJdW2mO7J9FB7IH8NzoJSiLw0GAkvAttcYIrUwk=
X-Google-Smtp-Source: AGHT+IEDrOVbp2A30N1dWYn7HVfQxIfBe1MDLXus62ycfI2U1Ar1w9JoYMDs6wT5Mw7A6LJOhwbKZDf4a2bphYyYRiI=
X-Received: by 2002:a4a:7614:0:b0:56c:cd0c:1d67 with SMTP id
 t20-20020a4a7614000000b0056ccd0c1d67mr142275ooc.7.1699396267634; Tue, 07 Nov
 2023 14:31:07 -0800 (PST)
MIME-Version: 1.0
References: <20231031-kms-hdmi-connector-state-v3-0-328b0fae43a7@kernel.org>
 <20231031-kms-hdmi-connector-state-v3-12-328b0fae43a7@kernel.org>
 <806f2ad3-c80b-41e5-9388-f1af7bace8e3@xs4all.nl>
In-Reply-To: <806f2ad3-c80b-41e5-9388-f1af7bace8e3@xs4all.nl>
From: Jeff Hennessey <jhennessey558@gmail.com>
Date: Tue, 7 Nov 2023 17:30:56 -0500
Message-ID: <CA+jgL+b9oUNbJK4DB9f0Ci9B=V7y_rEuxTrczCE9Tytwrob+rQ@mail.gmail.com>
Subject: Re: [PATCH RFC v3 12/37] drm/connector: hdmi: Create Infoframe
 DebugFS entries
To: Hans Verkuil <hverkuil@xs4all.nl>
Content-Type: multipart/alternative; boundary="000000000000dd745306099786b8"
X-Mailman-Approved-At: Wed, 08 Nov 2023 11:48:14 +0000
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Samuel Holland <samuel@sholland.org>,
 Sandy Huang <hjc@rock-chips.com>, Maxime Ripard <mripard@kernel.org>,
 linux-doc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-media@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000dd745306099786b8
Content-Type: text/plain; charset="UTF-8"

The flux capacitor stopped fluxing...

On Fri, Nov 3, 2023, 5:06 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:

> Hi Maxime,
>
> Thank you for posting v3, this time it runs fine on my RPi 4, thank you for
> fixing that.
>
> I'll start working on a conformity checker for this.
>
> I have a few remarks:
>
> On 31/10/2023 17:48, Maxime Ripard wrote:
> > There has been some discussions recently about the infoframes sent by
> > drivers and if they were properly generated.
> >
> > In parallel, there's been some interest in creating an infoframe-decode
> > tool similar to edid-decode.
> >
> > Both would be much easier if we were to expose the infoframes programmed
> > in the hardware. It won't be perfect since we have no guarantee that
> > it's actually what goes through the wire, but it's the best we can do.
> >
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >  drivers/gpu/drm/drm_debugfs.c | 110
> ++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 110 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_debugfs.c
> b/drivers/gpu/drm/drm_debugfs.c
> > index 2de43ff3ce0a..3c65b1d3f926 100644
> > --- a/drivers/gpu/drm/drm_debugfs.c
> > +++ b/drivers/gpu/drm/drm_debugfs.c
> > @@ -538,6 +538,114 @@ static const struct file_operations
> drm_connector_fops = {
> >       .write = connector_write
> >  };
> >
> > +struct debugfs_wrapper {
> > +     struct drm_connector *connector;
> > +     struct drm_connector_hdmi_infoframe *frame;
> > +};
> > +
> > +#define HDMI_MAX_INFOFRAME_SIZE              29
> > +
> > +static ssize_t
> > +infoframe_read(struct file *filp, char __user *ubuf, size_t count,
> loff_t *ppos)
> > +{
> > +     const struct debugfs_wrapper *wrapper = filp->private_data;
> > +     struct drm_connector *connector = wrapper->connector;
> > +     struct drm_connector_hdmi_infoframe *infoframe = wrapper->frame;
> > +     union hdmi_infoframe *frame = &infoframe->data;
> > +     u8 buf[HDMI_MAX_INFOFRAME_SIZE];
> > +     ssize_t len = 0;
> > +
> > +     mutex_lock(&connector->hdmi.infoframes.lock);
> > +
> > +     if (!infoframe->set)
> > +             goto out;
> > +
> > +     len = hdmi_infoframe_pack(frame, buf, sizeof(buf));
> > +     if (len < 0)
> > +             goto out;
> > +
> > +     len = simple_read_from_buffer(ubuf, count, ppos, buf, len);
> > +
> > +out:
> > +     mutex_unlock(&connector->hdmi.infoframes.lock);
> > +     return len;
> > +}
> > +
> > +static const struct file_operations infoframe_fops = {
> > +     .owner   = THIS_MODULE,
> > +     .open    = simple_open,
> > +     .read    = infoframe_read,
> > +};
> > +
> > +static int create_hdmi_infoframe_file(struct drm_connector *connector,
> > +                                   struct dentry *parent,
> > +                                   const char *filename,
> > +                                   struct drm_connector_hdmi_infoframe
> *frame)
> > +{
> > +     struct drm_device *dev = connector->dev;
> > +     struct debugfs_wrapper *wrapper;
> > +     struct dentry *file;
> > +
> > +     wrapper = drmm_kzalloc(dev, sizeof(*wrapper), GFP_KERNEL);
> > +     if (!wrapper)
> > +             return -ENOMEM;
> > +
> > +     wrapper->connector = connector;
> > +     wrapper->frame = frame;
> > +
> > +     file = debugfs_create_file(filename, 0400, parent, wrapper,
> &infoframe_fops);
> > +     if (IS_ERR(file))
> > +             return PTR_ERR(file);
> > +
> > +     return 0;
> > +}
> > +
> > +#define CREATE_HDMI_INFOFRAME_FILE(c, p, i)          \
> > +     create_hdmi_infoframe_file(c, p, #i, &(c)->hdmi.infoframes.i)
> > +
> > +static int create_hdmi_infoframe_files(struct drm_connector *connector,
> > +                                    struct dentry *parent)
> > +{
> > +     int ret;
> > +
> > +     ret = CREATE_HDMI_INFOFRAME_FILE(connector, parent, audio);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret = CREATE_HDMI_INFOFRAME_FILE(connector, parent, avi);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret = CREATE_HDMI_INFOFRAME_FILE(connector, parent, drm);
>
> Hmm, I had to look into the code to figure out that 'drm' stands for
> Dynamic Range and Mastering InfoFrame. While entirely correct, it is
> also very confusing in the context of the 'drm' subsystem.
>
> I am not quite certain what the best approach is here.
>
> Internally in the drm code it is talking about 'hdr' or 'hdr metadata',
> but that's a bit confusing as well since there is also an HDR Dynamic
> Metadata Extended InfoFrame defined in CTA-861, even though support for
> that is not (yet) implemented in drm.
>
> At minimum there should be a comment in the code explaining what drm
> stands for in this context.
>
> One option to consider is renaming this file to hdr_drm, thus indicating
> that this is HDR related.
>
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret = CREATE_HDMI_INFOFRAME_FILE(connector, parent, spd);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret = CREATE_HDMI_INFOFRAME_FILE(connector, parent, vendor);
>
> There may be multiple vendor specific InfoFrames in the future, so how
> would that be handled? Perhaps add a comment here that currently only one
> vendor specific InfoFrame is supported, but suggest how to handle multiple
> VSIFs in the future.
>
> What would actually be nice (although probably not that easy to fix) is if
> the name of the file would be "vendor-XXXXXX' where 'XXXXXX' is the IEEE
> OUI
> number.
>
> Regards,
>
>         Hans
>
> > +     if (ret)
> > +             return ret;
> > +
> > +     return 0;
> > +}
> > +
> > +static void hdmi_debugfs_add(struct drm_connector *connector)
> > +{
> > +     struct dentry *dir;
> > +
> > +     if (!(connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
> > +           connector->connector_type == DRM_MODE_CONNECTOR_HDMIB))
> > +             return;
> > +
> > +     dir = debugfs_create_dir("infoframes", connector->debugfs_entry);
> > +     if (IS_ERR(dir))
> > +             return;
> > +
> > +     create_hdmi_infoframe_files(connector, dir);
> > +}
> > +
> >  void drm_debugfs_connector_add(struct drm_connector *connector)
> >  {
> >       struct drm_minor *minor = connector->dev->primary;
> > @@ -565,6 +673,8 @@ void drm_debugfs_connector_add(struct drm_connector
> *connector)
> >       debugfs_create_file("output_bpc", 0444, root, connector,
> >                           &output_bpc_fops);
> >
> > +     hdmi_debugfs_add(connector);
> > +
> >       if (connector->funcs->debugfs_init)
> >               connector->funcs->debugfs_init(connector, root);
> >  }
> >
>
>

--000000000000dd745306099786b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">The flux capacitor stopped fluxing...</div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 3, 2023,=
 5:06 AM Hans Verkuil &lt;<a href=3D"mailto:hverkuil@xs4all.nl">hverkuil@xs=
4all.nl</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Maxime,<b=
r>
<br>
Thank you for posting v3, this time it runs fine on my RPi 4, thank you for=
<br>
fixing that.<br>
<br>
I&#39;ll start working on a conformity checker for this.<br>
<br>
I have a few remarks:<br>
<br>
On 31/10/2023 17:48, Maxime Ripard wrote:<br>
&gt; There has been some discussions recently about the infoframes sent by<=
br>
&gt; drivers and if they were properly generated.<br>
&gt; <br>
&gt; In parallel, there&#39;s been some interest in creating an infoframe-d=
ecode<br>
&gt; tool similar to edid-decode.<br>
&gt; <br>
&gt; Both would be much easier if we were to expose the infoframes programm=
ed<br>
&gt; in the hardware. It won&#39;t be perfect since we have no guarantee th=
at<br>
&gt; it&#39;s actually what goes through the wire, but it&#39;s the best we=
 can do.<br>
&gt; <br>
&gt; Signed-off-by: Maxime Ripard &lt;<a href=3D"mailto:mripard@kernel.org"=
 target=3D"_blank" rel=3D"noreferrer">mripard@kernel.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/drm_debugfs.c | 110 ++++++++++++++++++++++++++++=
++++++++++++++<br>
&gt;=C2=A0 1 file changed, 110 insertions(+)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debug=
fs.c<br>
&gt; index 2de43ff3ce0a..3c65b1d3f926 100644<br>
&gt; --- a/drivers/gpu/drm/drm_debugfs.c<br>
&gt; +++ b/drivers/gpu/drm/drm_debugfs.c<br>
&gt; @@ -538,6 +538,114 @@ static const struct file_operations drm_connecto=
r_fops =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.write =3D connector_write<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; +struct debugfs_wrapper {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_connector *connector;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_connector_hdmi_infoframe *frame;<br>
&gt; +};<br>
&gt; +<br>
&gt; +#define HDMI_MAX_INFOFRAME_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 29<br>
&gt; +<br>
&gt; +static ssize_t<br>
&gt; +infoframe_read(struct file *filp, char __user *ubuf, size_t count, lo=
ff_t *ppos)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const struct debugfs_wrapper *wrapper =3D filp-&g=
t;private_data;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_connector *connector =3D wrapper-&gt;c=
onnector;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_connector_hdmi_infoframe *infoframe =
=3D wrapper-&gt;frame;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union hdmi_infoframe *frame =3D &amp;infoframe-&g=
t;data;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 buf[HDMI_MAX_INFOFRAME_SIZE];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ssize_t len =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;connector-&gt;hdmi.infoframes.loc=
k);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!infoframe-&gt;set)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0len =3D hdmi_infoframe_pack(frame, buf, sizeof(bu=
f));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (len &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0len =3D simple_read_from_buffer(ubuf, count, ppos=
, buf, len);<br>
&gt; +<br>
&gt; +out:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;connector-&gt;hdmi.infoframes.l=
ock);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return len;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct file_operations infoframe_fops =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.owner=C2=A0 =C2=A0=3D THIS_MODULE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.open=C2=A0 =C2=A0 =3D simple_open,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.read=C2=A0 =C2=A0 =3D infoframe_read,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int create_hdmi_infoframe_file(struct drm_connector *connector=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct dentry *pare=
nt,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *filenam=
e,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_connecto=
r_hdmi_infoframe *frame)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D connector-&gt;dev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct debugfs_wrapper *wrapper;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dentry *file;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0wrapper =3D drmm_kzalloc(dev, sizeof(*wrapper), G=
FP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!wrapper)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0wrapper-&gt;connector =3D connector;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0wrapper-&gt;frame =3D frame;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0file =3D debugfs_create_file(filename, 0400, pare=
nt, wrapper, &amp;infoframe_fops);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(file))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(file);=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +#define CREATE_HDMI_INFOFRAME_FILE(c, p, i)=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0create_hdmi_infoframe_file(c, p, #i, &amp;(c)-&gt=
;hdmi.infoframes.i)<br>
&gt; +<br>
&gt; +static int create_hdmi_infoframe_files(struct drm_connector *connecto=
r,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct dentry *par=
ent)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D CREATE_HDMI_INFOFRAME_FILE(connector, par=
ent, audio);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D CREATE_HDMI_INFOFRAME_FILE(connector, par=
ent, avi);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D CREATE_HDMI_INFOFRAME_FILE(connector, par=
ent, drm);<br>
<br>
Hmm, I had to look into the code to figure out that &#39;drm&#39; stands fo=
r<br>
Dynamic Range and Mastering InfoFrame. While entirely correct, it is<br>
also very confusing in the context of the &#39;drm&#39; subsystem.<br>
<br>
I am not quite certain what the best approach is here.<br>
<br>
Internally in the drm code it is talking about &#39;hdr&#39; or &#39;hdr me=
tadata&#39;,<br>
but that&#39;s a bit confusing as well since there is also an HDR Dynamic<b=
r>
Metadata Extended InfoFrame defined in CTA-861, even though support for<br>
that is not (yet) implemented in drm.<br>
<br>
At minimum there should be a comment in the code explaining what drm<br>
stands for in this context.<br>
<br>
One option to consider is renaming this file to hdr_drm, thus indicating<br=
>
that this is HDR related.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D CREATE_HDMI_INFOFRAME_FILE(connector, par=
ent, spd);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D CREATE_HDMI_INFOFRAME_FILE(connector, par=
ent, vendor);<br>
<br>
There may be multiple vendor specific InfoFrames in the future, so how<br>
would that be handled? Perhaps add a comment here that currently only one<b=
r>
vendor specific InfoFrame is supported, but suggest how to handle multiple<=
br>
VSIFs in the future.<br>
<br>
What would actually be nice (although probably not that easy to fix) is if<=
br>
the name of the file would be &quot;vendor-XXXXXX&#39; where &#39;XXXXXX&#3=
9; is the IEEE OUI<br>
number.<br>
<br>
Regards,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Hans<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void hdmi_debugfs_add(struct drm_connector *connector)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct dentry *dir;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!(connector-&gt;connector_type =3D=3D DRM_MOD=
E_CONNECTOR_HDMIA ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0connector-&gt;connector_type=
 =3D=3D DRM_MODE_CONNECTOR_HDMIB))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dir =3D debugfs_create_dir(&quot;infoframes&quot;=
, connector-&gt;debugfs_entry);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(dir))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0create_hdmi_infoframe_files(connector, dir);<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 void drm_debugfs_connector_add(struct drm_connector *connector)<=
br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_minor *minor =3D connector-&gt;de=
v-&gt;primary;<br>
&gt; @@ -565,6 +673,8 @@ void drm_debugfs_connector_add(struct drm_connecto=
r *connector)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0debugfs_create_file(&quot;output_bpc&quot;, =
0444, root, connector,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;output_bpc_fops);<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0hdmi_debugfs_add(connector);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (connector-&gt;funcs-&gt;debugfs_init)<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0connector-&gt;fu=
ncs-&gt;debugfs_init(connector, root);<br>
&gt;=C2=A0 }<br>
&gt; <br>
<br>
</blockquote></div>

--000000000000dd745306099786b8--
