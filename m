Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FD6A31A3F
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 01:14:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B7E10E772;
	Wed, 12 Feb 2025 00:14:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IuLnpS14";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A17E10E777
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 00:14:04 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-545075ff6d5so3257602e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 16:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739319242; x=1739924042; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MoiH9kTaTXxwiGqw7nJMhKvn68BG/QNvASYw2+68Zak=;
 b=IuLnpS14SMOIMlhDDvjLfYUtA3O8S1mZZd6QM1aGHYNr0w5KQmlxfJ+upAa13itoi2
 NnUBULsTtyXusKTl2hLRWB/09O+EioIBqDHkfJb/jYGtTvQrx+9OzuYebPdCQUwpVruh
 UU7ZORIy3oO4r/NC+Le13RZtE0L5qspNv4fNHKp5JloAa+1T/4ASxPBbthC9CpH9Ydp+
 lv/gw+bZTAWQ7yjEkCxrRbwbqBpz7vmU+Ym6Oi/j2O8HTz14WL6QODzkol0fQkwJ5Fsu
 VOHo7hLdUocwC94ZanavIys33h0H7VWjSM+gCgPUxVjuL3NyuxJXZYeN0Hi+sblpL6CY
 8G4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739319242; x=1739924042;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MoiH9kTaTXxwiGqw7nJMhKvn68BG/QNvASYw2+68Zak=;
 b=N8jY04Y6LhkBFqHeQEL8KZw9nOa0lV/wmIwnXLH4kb2EocCok7TE3dskHiSjLOiZAO
 gpRhghG0rU/H4Kv9V2mEjpAFmyaxS5JSqN+ndinrOsMPSz0LUKG51G1shKWE75nlOdZM
 RTPOMFE2nP+2CKqt0vkO1nQW9K82a1dGgsW+50hR8qIP59kYSUhzOeZg9FlIpkhgOsVw
 0JddtOGSB593/1vTCAbjo/oLkhZxZKcLFn6JdvAsx/kPz/o2Gkfv5fZhr5YR3t8dZil5
 MJBrRhcPqpeba12cWI9eG86izfEhw/o8SNuCwNNxcpYzqhkuAMIWlwki09zMQ+j2AzkK
 YBGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhmdwsMKLhZOvkMp3qjjCE/t8JK8e7kourpMLXwfwjTo99uGb64VTSNMUjdFp5m31k5JBedtCJcmg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YynyH5lqdXGgbhwOaPHLz6HRXAXgQRBq92YIQRfmQWtnZsZMRdZ
 LBcynntOxhJNtsGXJYVb4UT1nh5ZUy7PBhdVNyE3dFDdFIez1aMJHih1cn4Xc+M=
X-Gm-Gg: ASbGncsgh0AXvQzvls4WWJSbDWvkX1zds3P1lWgTlGiA8ZGhtk2Ab5L+oqK0pL12fwQ
 GABuUOq6+KCzWN3mEe0XhmFhosQ+Oom1QpZrGHXEewwLtUWQjzlnLEqVfcMc0frA+FjQEebit26
 mv4XTxw6NpNK7RCbE9TPNnJ+OgylKr1Rb/rp6xlmxqqRtvo/cQlFvTcMlCCQdiDiJyhJiZ2cpsX
 wwr3KhL9sT4fenVmTCoWE9s1qk3ZIReZURqCtbAdzc2ewPjKP8ZpltYzQ0/RbSmOOfqGxaSim0B
 TDLpGVuDSlSuIMfZ9x4VVUmERvpllM0Alo1Uwjzpoxaa+qZ1vbJphauLjDdYKtlxe1o7BjQ=
X-Google-Smtp-Source: AGHT+IH4K/97rcyNCdtxvfzfnC07ftBx9dEMBnJK66j+zVmsXTMBTzg8TyBPDt/3qMe65yIbgIUqGQ==
X-Received: by 2002:a05:6512:3e07:b0:545:76e:319 with SMTP id
 2adb3069b0e04-545180e5dc7mr263463e87.4.1739319242534; 
 Tue, 11 Feb 2025 16:14:02 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5450cf9b64bsm742565e87.9.2025.02.11.16.14.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 16:14:01 -0800 (PST)
Date: Wed, 12 Feb 2025 02:13:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Ethan Carter Edwards <ethan@ethancedwards.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: Fix uninitialized variable
Message-ID: <nllxmdfk4wwm2bbrg5jc4tt7la65rwqdtt4tqjp36j6dr4hgmx@ukszi5llldup>
References: <20250209-dpu-v2-1-114dfd4ebefd@ethancedwards.com>
 <8e40c1bf-6da7-46b1-925c-53d1fa25f3ce@quicinc.com>
 <zj7sqsg3ruev4akl5paedsg65qyh53iddqvssrye2pjtfofs3q@u4g3kevpl2jn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zj7sqsg3ruev4akl5paedsg65qyh53iddqvssrye2pjtfofs3q@u4g3kevpl2jn>
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

On Tue, Feb 11, 2025 at 10:23:54AM +0100, Marijn Suijten wrote:
> On 2025-02-10 14:14:14, Abhinav Kumar wrote:
> > 
> > 
> > On 2/9/2025 7:51 PM, Ethan Carter Edwards wrote:
> > > There is a possibility for an uninitialized *ret* variable to be
> > > returned in some code paths.
> > > 
> > > Fix this by initializing *ret* to 0.
> > > 
> > > Addresses-Coverity-ID: 1642546 ("Uninitialized scalar variable")
> > > Fixes: 774bcfb731765d ("drm/msm/dpu: add support for virtual planes")
> > > Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
> > > ---
> > > Changes in v2:
> > > - Return explicit 0 when no error occurs
> > > - Add hardening mailing lists
> > > - Link to v1: https://lore.kernel.org/r/20250209-dpu-v1-1-0db666884f70@ethancedwards.com
> > > ---
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 7 +++----
> > >   1 file changed, 3 insertions(+), 4 deletions(-)
> > > 
> > 
> > Thanks for your patch, this was addressed with
> > 
> > https://patchwork.freedesktop.org/patch/631567/ but since this is better 
> > I am fine with this, will pick this one up
> 
> The `return 0;` in this patch should certainly fix this issue entirely and we
> don't need to inline the `int ret` for that, which I think is against mixed
> declaration rules anyway?
> 
> As far as I understand that's what Dmitry suggested in v1, but he r-b'd it in
> this form.  Dmitry, was that intended?

I think it should be fine, if the gcc doesn't warn against it.

> 
> - Marijn
> 
> > Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > 
> > 
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > index 098abc2c0003cde90ce6219c97ee18fa055a92a5..af3e541f60c303eb5212524e877129359b5ca98c 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > @@ -1164,7 +1164,6 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
> > >   			       unsigned int num_planes)
> > >   {
> > >   	unsigned int i;
> > > -	int ret;
> > >   
> > >   	for (i = 0; i < num_planes; i++) {
> > >   		struct drm_plane_state *plane_state = states[i];
> > > @@ -1173,13 +1172,13 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
> > >   		    !plane_state->visible)
> > >   			continue;
> > >   
> > > -		ret = dpu_plane_virtual_assign_resources(crtc, global_state,
> > > +		int ret = dpu_plane_virtual_assign_resources(crtc, global_state,
> > >   							 state, plane_state);
> > >   		if (ret)
> > > -			break;
> > > +			return ret;
> > >   	}
> > >   
> > > -	return ret;
> > > +	return 0;
> > >   }
> > >   
> > >   static void dpu_plane_flush_csc(struct dpu_plane *pdpu, struct dpu_sw_pipe *pipe)
> > > 
> > > ---
> > > base-commit: a64dcfb451e254085a7daee5fe51bf22959d52d3
> > > change-id: 20250209-dpu-c3fac78fc617
> > > 
> > > Best regards,
> > 

-- 
With best wishes
Dmitry
